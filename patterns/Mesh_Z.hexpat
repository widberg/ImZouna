#pragma MIME application/x-mesh-z

#include <fuel.hexpat>

struct DynPoint {
    /// point.radius unused?
    Sphere_Z point;
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
    Name_Z dyn_point_name;
};

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

struct Mesh_Z_LinkHeader : Object_Z {
    /// all the material names followed by the mesh data crc32
    DynArray_Z<Name_Z> names;
    FadeDistances fade;
    /// May be referenced in UserDefines
    /// LOCAL_LOOKAT is required on vehicle chassis
    DynArray_Z<DynPoint> dyn_points;
    /// read only when spawning model into the world
    DynArray_Z<DynBox> dyn_boxes;
};

struct Unused0 {
    u32 unknown0;
    u32 unknown1;
    u32 unknown2;
    u32 unknown3;
};

struct Strip {
    DynArray_Z<u16> strip_vertices_indices;
    Name_Z material_name;
    /// 1/2
    u32 tri_order;
};

struct Unused00 {
    u32 unused0;
    u32 unused1;
};

struct Unused4 {
    DynArray_Z<Unused00> unused0s;
};

struct CollisionAABB {
    Vec3f min;
    /// range of AABBs contained directly by this one
    RangeBeginEnd collision_aabb_range;
    Vec3f max;
    /// 0 if this AABB only contains other AABB and no faces
    /// range of CollisionFaces contained directly by this AABB
    RangeBeginSize collision_faces_range;
};

struct CollisionFace {
    /// Indices that make up the tri face
    u16 short_vec_weirds_indices[3];
    /// 0/1
    /// not winding order
    /// double sided?
    u16 option;
};

struct Unused8 {
    u32 unused0;
    u32 unused1;
    u32 unused2;
    u32 unused3;
    u32 unused4;
    u32 unused5;
    u32 unused6;
    u32 unused7;
};

using VertexVecComponent = u8 [[format("format_vertex_vec_component"), transform("format_vertex_vec_component")]];

fn format_vertex_vec_component(ref auto vvc) {
    return (vvc / 255.0) * 2 - 1;
};

using VertexVec3u8 = Vec<VertexVecComponent, 3>;

struct VertexLayout12 {
    Vec3f position;
};

struct VertexLayout36 {
    Vec3f position;
    VertexVec3u8 tangent;
    std::assert(is_normalized_or_zero(tangent), "VertexLayout36 !is_normalized_or_zero(tangent)");
    u8 pad0;
    std::assert(pad0 == 1 || pad0 == 255, "VertexLayout36 pad0 != 1,255");
    VertexVec3u8 normal;
    std::assert(is_normalized_or_zero(normal), "VertexLayout36 !is_normalized_or_zero(normal)");
    u8 pad1;
    std::assert(pad1 == 0 || pad1 == 1 || pad1 == 255, "VertexLayout36 pad1 != 0,1,255");
    Vec2f uv;
    Vec2f luv;
};

struct VertexLayout48 {
    Vec3f position;
    VertexVec3u8 tangent;
    std::assert(is_normalized_or_zero(tangent), "VertexLayout48 !is_normalized_or_zero(tangent)");
    u8 pad0;
    std::assert(pad0 == 1 || pad0 == 255, "VertexLayout48 pad0 != 1,255");
    VertexVec3u8 normal;
    std::assert(is_normalized_or_zero(normal), "VertexLayout48 !is_normalized_or_zero(normal)");
    u8 pad1;
    std::assert(pad1 == 1 || pad1 == 255, "VertexLayout48 pad1 != 1,255");
    Vec2f uv;
    f32 unk[5];
};

using VertexBlendIndex = f32 [[format("format_vertex_blend_index"), transform("format_vertex_blend_index")]];

fn format_vertex_blend_index(ref auto vbi) {
    return u32(vbi / 6.0);
};

struct VertexLayout60 {
    Vec3f position;
    VertexVec3u8 tangent;
    std::assert(is_normalized_or_zero(tangent), "VertexLayout60 !is_normalized_or_zero(tangent)");
    u8 pad0;
    std::assert(pad0 == 1 || pad0 == 255, "VertexLayout60 pad0 != 1,255");
    VertexVec3u8 normal;
    std::assert(is_normalized_or_zero(normal), "VertexLayout60 !is_normalized_or_zero(normal)");
    u8 pad1;
    std::assert(pad1 == 1 || pad1 == 255, "VertexLayout60 pad1 != 1,255");
    Vec2f uv;
    /// divide by 6 and truncate
    VertexBlendIndex blend_indices[4];
    f32 blend_weights[4];
};

struct VertexBufferExt {
    u32 vertex_count;
    u32 vertex_size;
    std::assert(vertex_size == 12 || vertex_size == 36 || vertex_size == 48 || vertex_size == 60, "vertex_size != 12,32,48,60");
    u32 sub_mesh_id;
    match (vertex_size) {
        (12): VertexLayout12 vertices[vertex_count];
        (36): VertexLayout36 vertices[vertex_count];
        (48): VertexLayout48 vertices[vertex_count];
        (60): VertexLayout60 vertices[vertex_count];
    }
};

struct IndexBufferExt {
    u32 index_count;
    u32 sub_mesh_id;
    u16 data[index_count];
};

struct WeirdQuad {
    /// Vertices that make up the quad face
    /// duplicated in short_vec_weirds for some reason
    Vec3f vertices[4];
    Vec3f normal;
};

struct Unused1 {
    u32 unused0;
    u32 unused1;
    u32 unused2;
    u32 unused3;
    u32 unused4;
    u32 unused5;
    u32 unused6;
};

struct VertexGroup {
    u32 vertex_buffer_index;
    u32 index_buffer_index;
    u32 zero;
    std::assert(zero == 0, "zero != 0");
    u32 unknown0;
    /// 0x00000004 - visible
    /// 0x00080000 - has morph
    u32 flags;
    RangeBeginEnd vertex_buffer_range;
    u32 vertex_count;
    u32 index_buffer_index_begin;
    u32 face_count;
    u32 zero2;
    std::assert(zero2 == 0, "zero2 != 0");
    u32 unknown1;
    u16 vertex_size;
    u16 material_index;
    DynArray_Z<Unused1> unused1s;
};

struct AABBMorphTrigger {
    Vec3f min;
    /// range of AABBMorphTriggers contained directly by this one
    RangeBeginEnd aabb_morph_triggers_range;
    Vec3f max;
    /// 0 if this AABBMorphTrigger only contains other AABBMorphTriggers and no maps
    /// range of map contained by this AABBMorphTrigger
    RangeBeginSize map_index_range;
};

struct DisplacementVector {
        Vec<NumeratorFloat<i16, 1024>, 3> displacement;
        /// current struct's displacement_vectors index
        u16 displacement_vectors_self_index;
};

struct MorphTargetDesc {
    PascalString name;
    /// The vertexBufferId of the vertex buffer containing the visible mesh vertices
    u32 base_vertex_buffer_id;
    /// The index of the vertex buffer containing the displacement vectors
    /// Must be the same size as the base vertex buffer
    /// Editing this buffer doesnt seem to do anything
    u16 displacement_vertex_buffer_index;
    /// Must be the same size as the base vertex buffer
    /// maps vertices in the base vertex buffer to displacement vectors
    DynArray_Z<u16> displacement_vectors_indicies;
    /// much larger than any of the vertex buffers
    /// zeroing this array will make it so the deformation never happens
    /// This array contains displacements
    DynArray_Z<DisplacementVector> displacement_vectors;
};

struct Morpher {
    /// removing this has no effect
    /// relatively small
    DynArray_Z<AABBMorphTrigger> aabb_morph_triggers;
    /// Mapping from short_vec_weirds_index to displacement_vectors_indices_index
    /// removing this causes the game to crash when a collision with a static body occurs while MorphTargetDesc exists
    /// one element smaller than short_vec_weirds
    Map_Z<u16, u16> map;
    /// smaller than displacement_vectors but much larger than any vertex buffer or map
    DynArray_Z<u16> displacement_vectors_indices;
    /// always 0 or 1 but a loop is used to load it so it is a DynArray_Z and not an Option
    /// the game will run as normal when removed
    /// some pieces, as defined in VertexGroup, will be missing
    DynArray_Z<MorphTargetDesc> morphs;
};

struct MeshBuffers {
    /// If one of the buffers is required by the morpher and it is removed then the game will crash while loading
    DynArray_Z<VertexBufferExt> sub_meshes;
    DynArray_Z<IndexBufferExt> indices;
    /// Occlusion test quad?
    DynArray_Z<WeirdQuad> weird_quads;
    /// composes vertex and index buffer
    /// when removed the mesh disapears but the game still runs as expected
    /// in wireframe debug view the mesh is not there but that could be a result of no material
    /// does NOT contain collision data
    DynArray_Z<VertexGroup> vertex_groups;
    Morpher morpher;
};

struct ShortVecWeird {
    Vec<NumeratorFloat<i16, 1024>, 3> weird;
};

struct Mesh_Z : Mesh_Z_LinkHeader {
    std::assert(type == ObjectType::Mesh_Z, "type != ObjectType::Mesh_Z");
    DynArray_Z<Vec3f> strip_vertices;
    std::assert(strip_vertices.size == 0, "strip_vertices.size != 0");
    DynArray_Z<Unused0> unused0s;
    std::assert(unused0s.size == 0, "unused0s.size != 0");
    DynArray_Z<Vec2f> texcoords;
    std::assert(texcoords.size == 0, "texcoords.size != 0");
    DynArray_Z<Vec3f> normals;
    std::assert(normals.size == 0, "normals.size != 0");
    DynArray_Z<Strip> strips;
    std::assert(strips.size == 0, "strips.size != 0");
    // if (objectHeader.unknown0 & 2 != 0)
    // {
    //     DynArray_Z<u32> unknown3s;
    // }
    // This condition is never true
    DynArray_Z<Unused4> unused4s;
    std::assert(unused4s.size == 0, "unused4s.size != 0");
    DynArray_Z<Name_Z> material_names;
    DynArray_Z<CollisionAABB> collision_aabbs;
    DynArray_Z<CollisionFace> collision_faces;
    DynArray_Z<Unused8> unused8s;
    std::assert(unused8s.size == 0, "unused8s.size != 0");
    MeshBuffers mesh_buffers;
    /// 0x007b3800
    /// related to the Col structs
    /// game crashes on collision with static body if empty while MorphTargetDesc exists
    /// no effect if same size but 0ed out data
    /// all overlap with various vertices in the last vertex buffer
    DynArray_Z<ShortVecWeird> short_vec_weirds;
};

Mesh_Z mesh_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
