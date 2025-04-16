#pragma once
#pragma array_limit 0
#pragma pattern_limit 0
#pragma loop_limit 0

#include <type/types/rust.pat>
#include <std/math.pat>
#include <std/mem.pat>
#include <std/sys.pat>
#include <std/string.pat>
#include <std/core.pat>
#include <bff_header.hexpat>

u8 endian in;
std::core::set_endian(endian);

// ImHex feature
// Nested struct definitions

// ImHex feature
// for loops in struct

// ImHex feature
// In variables of enum type show a drop down of variants in settings

// ImHex bug
// doesn't do a great job following diagnostics into headers

// ImHex bug
// Hovering errors in the pattern editor crashes ImHex

fn all_eq(ref auto arr, auto val) {
    for (usize i = 0, i < std::core::member_count(arr), i = i + 1) {
        if (arr[i] != val) {
            return false;
        }
    }
    return true;
};

fn all_empty(ref auto arr) {
    for (usize i = 0, i < std::core::member_count(arr), i = i + 1) {
        if (arr[i].size != 0) {
            return false;
        }
    }
    return true;
};

fn magnitude(ref auto vec) {
    f32 acc = 0;
    for (usize i = 0, i < std::core::member_count(vec), i = i + 1) {
        acc = acc + vec[i] * vec[i];
    }
    return std::math::sqrt(acc);
};

fn is_normalized(ref auto vec) {
    return std::math::abs(magnitude(vec) - 1) < 0.001;
};

fn all_normalized(ref auto arr) {
    for (usize i = 0, i < std::core::member_count(arr), i = i + 1) {
        if (!is_normalized(arr[i])) {
            std::print(std::string::to_string(magnitude(arr[i].data)));
            return false;
        }
    }
    return true;
};

fn is_normalized_or_zero(ref auto vec) {
    f32 magnitude = magnitude(vec);
    return (magnitude == 0 || std::math::abs(magnitude - 1) < 0.1);
};

fn is_normalized_component_wise(ref auto vec) {
    for (usize i = 0, i < std::core::member_count(vec), i = i + 1) {
        if (vec[i] < 0 || vec[i] > 1) {
            return false;
        }
    }
    return true;
};

struct PascalString {
    u32 size;
    char data[size];
} [[sealed, format("format_data"), transform("format_data")]];

struct PascalStringNULL {
    u32 size;
    char data[size - 1];
    u8 zero;
    std::assert(zero == 0, "zero != 0");
} [[sealed, format("format_data"), transform("format_data")]];

struct FixedStringNULL<auto Size> {
    char data[while(std::mem::read_unsigned($, 1) != 0x0)];
    u8 zeros[Size - std::string::length(data)];
    std::assert(all_eq(zeros, 0x0), "!all_eq(zeros, 0x0)");
} [[sealed, format("format_data"), transform("format_data")]];

struct StringUntilNULL {
    char data[while (std::mem::read_unsigned($, 1) != 0x0)];
    u8 zero;
} [[sealed, format("format_data"), transform("format_data")]];

fn format_data(ref auto x) {
    return x.data;
};

struct DynArray_ZBase<T, U> {
    U size [[hidden]];
    T data[size] [[inline]];
} [[format("format_dyn_array"), transform("format_data")]];

fn format_dyn_array(ref auto arr) {
    return "[" + std::string::to_string(arr.size) + "]";
};

using DynArray_Z<T> = DynArray_ZBase<T, u32>;
using DynArray_ZU16<T> = DynArray_ZBase<T, u16>;

struct Pair<T, U> {
    T key;
    U value;
} [[format("format_pair")]];

fn format_pair(ref auto pair) {
    return std::string::to_string(pair.key) + " : " + std::string::to_string(pair.value);
};

using Map_Z<T, U> = DynArray_Z<Pair<T, U>>;

struct OptionalBase<T, U> {
    U is_some [[hidden]];
    if (is_some != 0) {
        T data [[inline]];
    }
} [[format("format_option")]];

fn format_option(ref auto option) {
    if (option.is_some == 0) {
        return "None";
    }
    return std::string::to_string(option.data);
};

using Optional<T> = OptionalBase<T, u8>;
using OptionalU32<T> = OptionalBase<T, u32>;

struct RangeBeginEndBase<T> {
    T begin;
    T end;
} [[format("format_range_begin_end")]];

fn format_range_begin_end(ref auto range) {
    return "[" + std::string::to_string(range.begin) + ", " + std::string::to_string(range.end) + "]";
};

struct RangeBeginSizeBase<T> {
    T begin;
    T size;
} [[format("format_range_begin_size")]];

fn format_range_begin_size(ref auto range) {
    return "[" + std::string::to_string(range.begin) + ", " + std::string::to_string(range.begin + range.size) + ")";
};

using RangeBeginEnd = RangeBeginEndBase<u16>;
using RangeBeginSize = RangeBeginSizeBase<u16>;
using RangeBeginSizeU32 = RangeBeginSizeBase<u32>;

struct NumeratorFloat<T, auto U> {
    T numerator;
    usize denominator = U;
} [[format("format_numerator_float"), transform("format_numerator_float")]];

fn format_numerator_float(ref auto nf) {
    return float(nf.numerator) / nf.denominator;
};

struct Vec<T, auto U> {
    T data[U] [[inline]];
} [[format("format_vec"), transform("format_data")]];

fn format_vec(ref auto vec) {
    str o = "(";
    for (usize i = 0, i < std::core::member_count(vec.data), i = i + 1) {
        o = o + std::string::to_string(vec.data[i]);
        if (i + 1 != std::core::member_count(vec.data)) {
            o = o + ", ";
        }
    }
    return o + ")";
};

using Vec2f = Vec<f32, 2>;
using Vec2i16 = Vec<i16, 2>;

using Vec3f = Vec<f32, 3>;
using Vec3u8 = Vec<u8, 3>;
using Vec3i16 = Vec<i16, 3>;
using Vec3i32 = Vec<i32, 3>;
using Vec3u32 = Vec<u32, 3>;

using Vec4f = Vec<f32, 4>;
using Vec4i16 = Vec<i16, 4>;

using Quat = Vec<f32, 4>;
using Quati16 = Vec<i16, 4>;

struct Mat3f {
    /// left to right top to bottom. Row major.
    Vec3f data[3] [[inline]];
};

struct Mat4f {
    /// left to right top to bottom. Row major.
    Vec4f data[4] [[inline]];
};

using RGB = Vec3f;
using RGBA = Vec4f;

struct Sphere_Z {
    Vec3f center;
    f32 radius;
};

struct Rect {
    i32 x1;
    i32 y1;
    i32 x2;
    i32 y2;
};

using Name_Z = i32;
using Name_Z64 = i64;

struct Message_Z {
    /// Observed values:
    ///   * 12
    ///   * 13
    ///   * 32
    ///   * 36 - Sound_Z related
    u32 message_class;
    /// 0
    /// Sound_Z crc32s
    Name_Z reciever_name;
    /// Observed values:
    ///   * 0
    ///   * 15
    ///   * 792146210
    ///   * 1162695237
    ///   * 10295924
    u32 c;
    f32 parameter;
    /// Rtc values:
    /// CAMERA
    /// PURSUIT
    /// NEAR
    /// FAR
    /// NEXT_DUMMY - Maybe some variation of this
    /// P0
    /// P1
    /// DUMMY
    Name_Z message_name;
};

struct DPCObjectHeader {
    u32 data_size;
    u32 link_header_size;
    u32 decompressed_size;
    u32 compressed_size;
    Name_Z class_name;
    Name_Z name;
};

struct BaseObject_Z : DPCObjectHeader {};

struct ResourceObject_Z : BaseObject_Z {
    Name_Z link_name;
};

bitfield ObjectDatasFlags {
    FL_OBJECTDATAS_HIDE : 1; // Object data is hidden
    FL_OBJECTDATAS_CODE_CONTROL : 1; // Code controlled
    FL_OBJECTDATAS_CLONED : 1; // Cloned
    FL_OBJECTDATAS_SKINNED : 1; // Skinned geometry
    FL_OBJECTDATAS_MORPHED : 1; // Morphable mesh
    FL_OBJECTDATAS_VREFLECT : 1; // Fake vertical mirror to simulate reflection on the ground
    FL_OBJECTDATAS_HIDE_SHADOW : 1; // Hide shadow at the object data level
    FL_OBJECTDATAS_STATIC_SHADOW : 1;
    // Never change the order of the following 3 flags
    FL_OBJECTDATAS_VP0_HIDE : 1; // One bit per viewport
    FL_OBJECTDATAS_VP1_HIDE : 1; // One bit per viewport
    FL_OBJECTDATAS_VP2_HIDE : 1; // One bit per viewport
    FL_OBJECTDATAS_VP3_HIDE : 1; // One bit per viewport
    FL_OBJECTDATAS_LAST : 1; // Last engine flag, first game flag
    padding : 19;
};

struct ObjectDatas_Z : ResourceObject_Z {
};

bitfield ObjectFlags {
    FL_OBJECT_INIT : 1; // ?
    FL_OBJECT_MAX_BSPHERE : 1; // ?
    FL_OBJECT_SKINNED : 1; // Skinned geometry
    FL_OBJECT_MORPHED : 1; // Morphed geometry
    FL_OBJECT_ORIENTEDBBOX : 1; // Oriented box
    FL_OBJECT_NO_SEADDISPLAY : 1; // Don't use SEADS for display
    FL_OBJECT_NO_SEADCOLLIDE : 1; // Don't use SEADS for collide
    FL_OBJECT_NO_DISPLAY : 1; // Don't display object
    FL_OBJECT_TRANSPARENT : 1; // Object has transparent components
    FL_OBJECT_OPTIMIZED_VERTEX : 1; // Object has optimized vertices
    FL_OBJECT_LINEAR_MAPPING : 1; // Object process generate UV to get linear mapping
    FL_OBJECT_SKINNED_WITH_ONE_BONE : 1; // Skinned geometry with only one bone which is not a usual skin.
    FL_OBJECT_LIGHT_BAKED : 1; //  Light baken
    FL_OBJECT_LIGHT_BAKED_WITH_MATERIAL : 1; // Light baken with material and dynamic lights
    FL_OBJECT_SHADOW_RECEIVER : 1; // Light baken with material and dynamic lights
    FL_OBJECT_NO_TESSELATE : 1; // Surface will not be tessalate
    FL_OBJECT_LAST : 1; // Last engine flag, first game flag
    padding : 15;
};

enum ObjectType : u16 {
    Points_Z = 0,
    Surface_Z = 1,
    Spline_Z = 2,
    Skin_Z = 3,
    RotShape_Z = 4,
    Lod_Z = 5,
    Mesh_Z = 6,
    Camera_Z = 7,
    SplineZone_Z = 9,
    Occluder_Z = 10,
    CameraZone_Z = 11,
    Light_Z = 12,
    HFog_Z = 13,
    CollisionVol_Z = 14,
    Emiter_Z = 15,
    Omni_Z = 16,
    Graph_Z = 17,
    Particles_Z = 18,
    Flare_Z = 19,
    HField_Z = 20,
    Tree_Z = 21,
    GenWorld_Z = 22,
    Road_Z = 23,
    GenWorldSurface_Z = 24,
    SplineGraph_Z = 25,
    WorldRef_Z = 26,
};

struct Object_Z : ResourceObject_Z {
    /// The associated data object for this object or 0 if there is none
    /// Skel_Z is the corresponding data for Skin_Zs
    Name_Z data_name;
    Quat rot;
    Mat4f transform;
    /// radius of the object
    /// meshes use this in the close calculations
    ///   if 0 then the object will never pop out
    ///   how close the camera is allowed to get to the object before it pops out
    /// particles also use this
    f32 radius;
    /// 0x2 - mesh load additional field
    /// 0x4 - set in a mesh but never checked
    /// Sometimes a valid float
    ObjectFlags flags;
    ObjectType type;
};

struct Points_Z : Object_Z {
};

/// how close the camera is allowed to get to the mesh before it pops out
/// if close.x or close.fade_close are 0 then the mesh will never pop out
/// close.y = Usually 1.5
/// the close.y value is never used, instead the allowable close.y is calculated from close.x and close.fade_close
struct FadeDistances {
    f32 x;
    f32 y;
    /// The distance at which the object will fade as the camera gets closer
    f32 fade_close;
};

struct Key_Z {
    f32 time;
};

struct KeyTgtTpl_Z<T> : Key_Z {
    T value;
    T tangent_in;
    T tangent_out;
    u8 pad[(sizeof(value) * 3) % 4] [[hidden]];
    std::assert(all_eq(pad, 0xFF), "!all_eq(pad, 0xFF)");
};

struct KeyLinearTpl_Z<T> : Key_Z {
    T value;
    u8 pad[sizeof(value) % 4] [[hidden]];
    std::assert(all_eq(pad, 0xFF), "!all_eq(pad, 0xFF)");
};

struct Keyframer_Z {};

enum KeyframerInterpolationType : u16 {
    FL_KEYFRAMER_SMOOTH = 0x01,
    FL_KEYFRAMER_LINEAR = 0x02,
    FL_KEYFRAMER_SQUARE = 0x03
};

struct KeyframerTpl_Z<TKey> : Keyframer_Z {
    KeyframerInterpolationType interpolation_type;
    DynArray_Z<TKey> keyframes;
};

struct KeyframerNoFlagsTpl_Z<TKey> : Keyframer_Z {
    DynArray_Z<TKey> keyframes;
};

using Vec3Comp = Vec<NumeratorFloat<i16, 4096>, 3>;
using QuatComp = Vec<NumeratorFloat<i16, 2000>, 4>;

using KeyFlag_Z = KeyLinearTpl_Z<u32>;
using KeyHdl_Z = KeyLinearTpl_Z<Name_Z>;
using KeyMessage_Z = KeyLinearTpl_Z<DynArray_Z<Message_Z>>;
using KeyFloat_Z = KeyTgtTpl_Z<f32>;
using KeyFloatComp_Z = KeyTgtTpl_Z<i16>;
using KeyFloatLinear_Z = KeyLinearTpl_Z<f32>;
using KeyFloatLinearComp_Z = KeyLinearTpl_Z<i16>;
using KeyU32Linear_Z = KeyLinearTpl_Z<u32>;
using KeyVec2f_Z = KeyTgtTpl_Z<Vec2f>;
using KeyVec2fComp_Z = KeyTgtTpl_Z<Vec2i16>;
using KeyVec2fLinear_Z = KeyLinearTpl_Z<Vec2f>;
using KeyVec2fLinearComp_Z = KeyLinearTpl_Z<Vec2i16>;
using KeyVec3f_Z = KeyTgtTpl_Z<Vec3f>;
using KeyVec3fComp_Z = KeyTgtTpl_Z<Vec3Comp>;
using KeyVec3fLinear_Z = KeyLinearTpl_Z<Vec3f>;
using KeyVec3fLinearComp_Z = KeyLinearTpl_Z<Vec3Comp>;
using KeyVec4f_Z = KeyTgtTpl_Z<Vec4f>;
using KeyVec4fComp_Z = KeyTgtTpl_Z<Vec4i16>;
using KeyVec4fLinear_Z = KeyLinearTpl_Z<Vec4f>;
using KeyVec4fLinearComp_Z = KeyLinearTpl_Z<Vec4i16>;
using KeyRot_Z = KeyLinearTpl_Z<QuatComp>;
using KeyBezierRot_Z = KeyTgtTpl_Z<Vec3f>;

using KeyframerFlag_Z = KeyframerNoFlagsTpl_Z<KeyFlag_Z>;
using KeyframerHdl_Z = KeyframerNoFlagsTpl_Z<KeyHdl_Z>;
using KeyframerMessage_Z = KeyframerNoFlagsTpl_Z<KeyMessage_Z>;
using KeyframerFloat_Z = KeyframerTpl_Z<KeyFloat_Z>;
using KeyframerFloatComp_Z = KeyframerTpl_Z<KeyFloatComp_Z>;
using KeyframerFloatLinear_Z = KeyframerTpl_Z<KeyFloatLinear_Z>;
using KeyframerFloatLinearComp_Z = KeyframerTpl_Z<KeyFloatLinearComp_Z>;
using KeyframerU32Linear_Z = KeyframerTpl_Z<KeyU32Linear_Z>;
using KeyframerVec2f_Z = KeyframerTpl_Z<KeyVec2f_Z>;
using KeyframerVec2fComp_Z = KeyframerTpl_Z<KeyVec2fComp_Z>;
using KeyframerVec2fLinear_Z = KeyframerTpl_Z<KeyVec2fLinear_Z>;
using KeyframerVec2fLinearComp_Z = KeyframerTpl_Z<KeyVec2fLinearComp_Z>;
using KeyframerVec3f_Z = KeyframerTpl_Z<KeyVec3f_Z>;
using KeyframerVec3fComp_Z = KeyframerTpl_Z<KeyVec3fComp_Z>;
using KeyframerVec3fLinear_Z = KeyframerTpl_Z<KeyVec3fLinear_Z>;
using KeyframerVec3fLinearComp_Z = KeyframerTpl_Z<KeyVec3fLinearComp_Z>;
using KeyframerVec4f_Z = KeyframerTpl_Z<KeyVec4f_Z>;
using KeyframerVec4fComp_Z = KeyframerTpl_Z<KeyVec4fComp_Z>;
using KeyframerVec4fLinear_Z = KeyframerTpl_Z<KeyVec4fLinear_Z>;
using KeyframerVec4fLinearComp_Z = KeyframerTpl_Z<KeyVec4fLinearComp_Z>;
using KeyframerRot_Z = KeyframerNoFlagsTpl_Z<KeyRot_Z>;
using KeyframerBezierRot_Z  = KeyframerNoFlagsTpl_Z<KeyBezierRot_Z>;

/// Used by Lod_Z and Mesh_Z
struct DynSphere {
    Sphere_Z sphere;
    /// 0x10000000 - 
    /// 0x08000000 - 
    /// 0x04000000 - 
    /// 0x01000000 - 
    /// 0x00010000 - 
    /// 0x00000007 - 
    u32 flags;
    /// Observed values:
    ///   * LOCAL_LOOKAT - 3243480878
    ///   * LOCAL_ATTACH - 3355622209
    ///   * LOCAL_LIMIT - 3448189790
    ///   * DYN_POINT1 - 1178470142
    ///   * DYN_POINT2 - 1266491431
    ///   * DYN_POINT3 - 1337736592
    ///   * DYN_POINT4 - 1375432085
    ///   * DYN_POINT5 - 1429893154
    ///   * DYN_POINT6 - 1484347131
    ///   * DYN_POINT7 - 1555581772
    ///   * DYN_POINT8 - 4092384112
    ///   * DYN_POINT9 - 1614211910
    ///   * DYN_POINT10 - 1631719061
    ///   * DYN_POINT11 - 1703088930
    ///   * DYN_POINT12 - 1757427195
    ///   * DYN_POINT13 - 1812015180
    ///   * DYN_POINT14 - 1917220937
    ///   * DYN_POINT15 - 1988584958
    ///   * DYN_POINT16 - 2076459815
    Name_Z dyn_sphere_name;
};

/// Used by Lod_Z and Mesh_Z
struct DynBox {
    Mat4f mat;
    /// 0x10000000 - 
    /// 0x08000000 - 
    /// 0x04000000 - 
    /// 0x01000000 - 
    /// 0x00010000 - 
    /// 0x00000007 - 
    u32 flags;
    /// Observed values:
    ///   * SFX_FIRE1 - 4217370453
    ///   * SFX_EXHAUST1 - 342724588
    ///   * SFX_EXHAUST2 - 422488373
    ///   * SFX_EXHAUST3 - 502248578
    ///   * SFX_EXHAUST4 - 61400199
    ///   * SFX_EXHAUST5 - 124385584
    ///   * SFX_EXHAUST6 - 170581993
    ///   * SFX_EXHAUST7 - 250331742
    ///   * SFX_EXHAUST8 - 916750307
    ///   * SFX_EXHAUST9 - 845505108
    ///   * SFX_EXHAUST10 - 612613378
    ///   * SFX_EXHAUST11 - 541237429
    ///   * SFX_EXHAUST12 - 755074668
    ///   * SFX_EXHAUST13 - 700488667
    ///   * SFX_EXHAUST14 - 931646430
    ///   * SFX_EXHAUST15 - 860280425
    ///   * SFX_EXHAUST16 - 1040576688
    ///   * DURL - 2234468230
    ///   * DYN_DAMAGE - 917337438
    ///   * DYN_XFILTER - 3491467995
    ///   * DYN_YFILTER - 1699973321
    ///   * DYN_ZFILTER - 354920422
    ///   * DYN_TENSION - 1676256635
    ///   * DYN_VCOL - 1062800321
    ///   * DYN_WINDPOW - 795155901
    ///   * DYN_EXTPOW - 318847781
    ///   * DYN_MVRATIO - 3678433905
    ///   * DYN_VISCOSITY - 3134916619
    ///   * DYN_STATICROTATION - 1081475432
    ///   * DYN_R - 320233663
    ///   * DYN_L - 1669929925
    ///   * DYN_BR - 2360085526
    ///   * DYN_FR - 2821249261
    ///   * DYN_BL - 4231231340
    ///   * DYN_FL - 3635913623
    Name_Z dyn_box_name;
};

struct SplineSegmentSubdivision {
    /// Endpoints of the line segment
    Vec3f P[2];
    /// Length of the line segment
    /// Distance between P[0] and P[1]
    f32 length;
};

struct SplineSegment {
    /// P and T contain indices into points
    /// Control points { P[0], T[0], T[1], P[1] }
    u16 P[2];
    u16 T[2];
    /// 0x10000000
    /// 0x30000000
    u32 flags;
    std::assert(flags == 0x10000000 || flags == 0x10000002 /* SplineGraph_Z */ || flags == 0x30000000, "flags != 0x10000000,0x10000002,0x30000000");
    /// Length of the spline segment
    f32 length;
    /// Approximation of the spline segment divided into 8 line segments
    /// P[0] of a subdivision will always be equal to P[1] of the previous subdivision if one exists
    SplineSegmentSubdivision spline_segment_subdivisions[8];
};

struct Spline_Z : Object_Z {
    DynArray_Z<Vec3f> points;
    DynArray_Z<SplineSegment> spline_segments;
    /// (1, 0, 0, 1)
    Vec4f vec;
    /// Length of the spline
    f32 length;
};
