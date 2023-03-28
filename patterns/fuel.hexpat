#pragma once
#pragma endian little
#pragma bitfield_order right_to_left

#include <type/types/rust.pat>

struct PascalString {
    u32 size;
    char data[size];
} [[sealed, format("format_wrapped_string"), transform("format_wrapped_string")]];

struct PascalStringNULL {
    u32 size;
    char data[size - 1];
    char null;
} [[sealed, format("format_wrapped_string"), transform("format_wrapped_string")]];

struct FixedStringNULL<auto Size> {
    char string[Size];
};

fn format_wrapped_string(ref auto string) {
    return string.data;
};

struct PascalArray<T> {
    u32 size [[hidden]];
    T data[size] [[inline]];
};

struct AssociativeArray<T, U, V> {
    PascalArray<T> values;
    PascalArray<U> indices;
    PascalArray<V> associated_values;
};

struct Pair<T, U> {
    T key;
    U value;
};

using Map = PascalArray<Pair<T, U>>;

struct Optional<T, U> {
    U is_some [[hidden]];
    if (is_some != 0) {
        T data [[inline]];
    }
};

using OptionalU8 = Optional<T, u8>;

struct Vec<T, Components> {
    T components[Components] [[inline]];
};

using Vec2f = Vec<f32, 2>;
using Vec2i16 = Vec<i16, 2>;

using Vec3f = Vec<f32, 3>;
using Vec3i16 = Vec<i16, 3>;
using Vec3i32 = Vec<i32, 3>;
using Vec3u32 = Vec<u32, 3>;

using Vec4f = Vec<f32, 4>;

using Quat = Vec<f32, 4>;
using Quati16 = Vec<i16, 4>;

struct Mat3f {
    /// left to right top to bottom. Row major.
    f32 data[9] [[inline]];
};

struct Mat4f {
    /// left to right top to bottom. Row major.
    f32 data[16] [[inline]];
};

struct Sphere_Z {
    Vec3f center;
    f32 radius;
};

using Name_Z = u32;

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
    Name_Z message_name;
};

struct DPCObjectHeader {
    u32 data_size;
    u32 class_object_size;
    u32 decompressed_size;
    u32 compressed_size;
    Name_Z class_name;
    Name_Z name;
};

struct BaseObject_Z : DPCObjectHeader {};

struct ResourceObject_Z : BaseObject_Z {
    Name_Z link_name;
};

struct Object_Z : ResourceObject_Z {
    /// The associated data object for this object or 0 if there is none
    Name_Z data_name;
    Quat rot;
    Mat4f32 transform;
    /// radius of the object
    /// meshes use this in the close calculations
    ///   if 0 then the object will never pop out
    ///   how close the camera is allowed to get to the object before it pops out
    /// particles also use this
    f32 radius;
    /// 0x2 - mesh load additional field
    /// 0x4 - set in a mesh but never checked
    u32 flags;
    /// Possible values:
    ///   * 6 - Mesh_Z
    ///   * 12
    ///   * 13
    ///   * 16
    ///   * 26
    u16 type;
};

struct Key_Z {
    f32 time;
};

struct KeyTgtTpl_Z<T> : Key_Z {
    T value;
    T tangent_in;
    T tangent_out;
};

struct KeyLinearTpl_Z<T> : Key_Z {
    T value;
};

struct Keyframer_Z {};

struct KeyframerTpl_Z<TKey> : Keyframer_Z {
    // Keyframer flags
    /// FL_KEYFRAMER_SMOOTH        0x01  ///< Keyframer flag : Smooth interpolation.
    /// FL_KEYFRAMER_LINEAR        0x02  ///< Keyframer flag : Linear interpolation.
    /// FL_KEYFRAMER_SQUARE 0x03  ///< Keyframer flag : Square interpolation (square signal)
    u16 flags;
    PascalArray<TKey> keyframes;
};

struct KeyframerNoFlagsTpl_Z<TKey> : Keyframer_Z {
    PascalArray<TKey> keyframes;
};

using KeyFlag_Z = KeyLinearTpl_Z<u32>;
using KeyHdl_Z = KeyLinearTpl_Z<Name_Z>;
using KeyMessage_Z = KeyLinearTpl_Z<PascalArray<Message_Z>>;
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
using KeyVec3fComp_Z = KeyTgtTpl_Z<Vec3i16>;
using KeyVec3fLinear_Z = KeyLinearTpl_Z<Vec3f>;
using KeyVec3fLinearComp_Z = KeyLinearTpl_Z<Vec3i16>;
using KeyVec4f_Z = KeyTgtTpl_Z<Vec4f42>;
using KeyVec4fComp_Z = KeyTgtTpl_Z<Vec4i16>;
using KeyVec4fLinear_Z = KeyLinearTpl_Z<Vec4f42>;
using KeyVec4fLinearComp_Z = KeyLinearTpl_Z<Vec4i16>;
using KeyRot_Z = KeyLinearTpl_Z<Quati16>;
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
