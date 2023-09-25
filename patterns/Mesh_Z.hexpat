#pragma MIME application/x-mesh-z

#include <fuel.hexpat>

struct Mesh_Z_LinkHeader : Points_Z {
    /// all the material names followed by the mesh data crc32
    DynArray_Z<Name_Z> names;
    FadeDistances fade;
    /// May be referenced in UserDefines
    /// LOCAL_LOOKAT is required on vehicle chassis
    DynArray_Z<DynSphere> dyn_spheres;
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
    /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 15, 22
    u16 surface_type;
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

using VertexVectorComponent = u8 [[format("format_vertex_vector_component"), transform("format_vertex_vector_component")]];

fn format_vertex_vector_component(u8 vvc) {
    return (vvc / 255.0) * 2 - 1;
};

using VertexVector3u8 = Vec<VertexVectorComponent, 3>;

struct VertexLayoutPosition {
    Vec3f position;
};

struct VertexLayoutNoBlend {
    Vec3f position;
    VertexVector3u8 tangent;
    std::assert(is_normalized_or_zero(tangent), "VertexLayoutNoBlend !is_normalized_or_zero(tangent)");
    VertexVectorComponent tangent_w;
    std::assert(tangent_w == -1 || tangent_w == format_vertex_vector_component(1) || tangent_w == 1, "VertexLayoutNoBlend tangent_w != -1,format_vertex_vector_component(1),1");
    VertexVector3u8 normal;
    std::assert(is_normalized_or_zero(normal), "VertexLayoutNoBlend !is_normalized_or_zero(normal)");
    VertexVectorComponent normal_w;
    std::assert(normal_w == -1 || normal_w == format_vertex_vector_component(1) || normal_w == 1, "VertexLayoutNoBlend normal_w != -1,format_vertex_vector_component(1),1");
    Vec2f uv;
    Vec2f luv;
};

using VertexBlendIndex = f32 [[format("format_vertex_blend_index"), transform("format_vertex_blend_index")]];

fn format_vertex_blend_index(ref auto vbi) {
    return u32(vbi / 6.0);
};

struct VertexLayout1Blend {
    Vec3f position;
    VertexVector3u8 tangent;
    std::assert(is_normalized_or_zero(tangent), "VertexLayout1Blend !is_normalized_or_zero(tangent)");
    VertexVectorComponent tangent_w;
    std::assert(tangent_w == -1 || tangent_w == format_vertex_vector_component(1) || tangent_w == 1, "VertexLayout1Blend tangent_w != -1,format_vertex_vector_component(1),1");
    VertexVector3u8 normal;
    std::assert(is_normalized_or_zero(normal), "VertexLayout1Blend !is_normalized_or_zero(normal)");
    VertexVectorComponent normal_w;
    std::assert(normal_w == -1 || normal_w == format_vertex_vector_component(1) || normal_w == 1, "VertexLayout1Blend normal_w != -1,format_vertex_vector_component(1),1");
    Vec2f uv;
    VertexBlendIndex blend_index;
    i32 pad2[3] [[hidden]];
    std::assert(all_eq(pad2, -1), "VertexLayout1Blend !all_eq(pad2, -1)");
    f32 blend_weight;
    std::assert(blend_weight == 0 || blend_weight == 1, "VertexLayout1Blend blend_weight != 0,1");
};

struct VertexLayout4Blend {
    Vec3f position;
    VertexVector3u8 tangent;
    std::assert(is_normalized_or_zero(tangent), "VertexLayout4Blend !is_normalized_or_zero(tangent)");
    VertexVectorComponent tangent_w;
    std::assert(tangent_w == -1 || tangent_w == format_vertex_vector_component(1) || tangent_w == 1, "VertexLayout4Blend tangent_w != -1,format_vertex_vector_component(1),1");
    VertexVector3u8 normal;
    std::assert(is_normalized_or_zero(normal), "VertexLayout4Blend !is_normalized_or_zero(normal)");
    VertexVectorComponent normal_w;
    std::assert(normal_w == -1 || normal_w == format_vertex_vector_component(1) || normal_w == 1, "VertexLayout4Blend normal_w != -1,format_vertex_vector_component(1),1");
    Vec2f uv;
    VertexBlendIndex blend_indices[4];
    f32 blend_weights[4];
};

/// The vertex layout corresponds to the number of bytes per vertex
enum VertexLayout : u32 {
    VertexLayoutPosition = 12,
    VertexLayoutNoBlend = 36,
    VertexLayout1Blend = 48,
    VertexLayout4Blend = 60,
};

/// Only one should be set
/// Least significant bit set takes effect
/// Defaults to D3DPOOL_FORCE_DWORD if none are set
bitfield D3DPOOL {
    D3DPOOL_DEFAULT : 1;
    D3DPOOL_MANAGED : 1;
    D3DPOOL_SYSTEMMEM : 1;
    D3DPOOL_SCRATCH : 1;
};

/// Multiple can be set
bitfield D3DUSAGE {
    D3DUSAGE_DYNAMIC : 1;
    D3DUSAGE_WRITEONLY : 1;
    padding : 1;
    /// Sometimes set but never tested
    UNKNOWN : 1;
    padding : 24;
};

bitfield D3DFlags {
    D3DPOOL d3d_pool;
    D3DUSAGE d3d_usage;
    std::assert((d3d_pool.D3DPOOL_SYSTEMMEM == 1) || (d3d_pool.D3DPOOL_MANAGED == 1 && d3d_usage.D3DUSAGE_WRITEONLY == 1) || (d3d_pool.D3DPOOL_MANAGED == 1 && d3d_usage.D3DUSAGE_WRITEONLY == 1 && d3d_usage.UNKNOWN == 1), "flags != 4,34,162");
};

struct VertexBufferExt {
    u32 vertex_count;
    VertexLayout vertex_layout;
    std::assert(std::core::is_valid_enum(vertex_layout), "Invalid vertex_layout");
    D3DFlags flags;
    match (vertex_layout) {
        (VertexLayout::VertexLayoutPosition): VertexLayoutPosition vertices[vertex_count];
        (VertexLayout::VertexLayoutNoBlend): VertexLayoutNoBlend vertices[vertex_count];
        (VertexLayout::VertexLayout1Blend): VertexLayout1Blend vertices[vertex_count];
        (VertexLayout::VertexLayout4Blend): VertexLayout4Blend vertices[vertex_count];
    }
};

struct IndexBufferExt {
    u32 index_count;
    D3DFlags flags;
    u16 data[index_count];
};

struct Quad {
    /// duplicated in short_vec_weirds for some reason
    Vec3f vertices[4];
    Vec3f normal;
    std::assert(is_normalized_or_zero(normal), "Quad !is_normalized_or_zero(normal)");
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

bitfield VertexGroupFlags {
    padding : 2;
    VISIBLE : 1;
    padding : 16;
    MORPH : 1;
    padding : 12;
};

struct VertexGroup {
    u32 vertex_buffer_index;
    u32 index_buffer_index;
    std::assert(parent.parent.vertex_buffers.data[vertex_buffer_index].flags == parent.parent.index_buffers.data[index_buffer_index].flags, "vertex_buffers[vertex_buffer_index].flags != index_buffers[index_buffer_index].flags");
    RangeBeginSizeU32 quad_range;
    VertexGroupFlags flags;
    RangeBeginEnd vertex_buffer_range;
    /// Not necessarily equal to vertex_buffer_range.end - vertex_buffer_range.begin + 1
    u32 vertex_count;
    u32 index_buffer_index_begin;
    u32 face_count;
    u32 zero;
    std::assert(zero == 0, "zero != 0");
    u32 vertex_buffer_range_begin_or_zero;
    std::assert(vertex_buffer_range_begin_or_zero == 0 || vertex_buffer_range_begin_or_zero == vertex_buffer_range.begin, "vertex_buffer_range_begin_or_zero != 0 && vertex_buffer_range_begin_or_zero != vertex_buffer_range.begin");
    u16 vertex_layout;
    std::assert(vertex_layout == parent.parent.vertex_buffers.data[vertex_buffer_index].vertex_layout, "vertex_layout == vertex_buffers[vertex_buffer_index].vertex_layout");
    /// Sometimes -1
    i16 material_index;
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

using DisplacementVectorComponent = NumeratorFloat<i16, 1024>;

struct DisplacementVector {
        Vec<DisplacementVectorComponent, 3> displacement;
        u16 displacement_vectors_self_index;
        std::assert(displacement_vectors_self_index == std::core::array_index(), "displacement_vectors_self_index != std::core::array_index()");
};

struct MorphTargetDesc {
    PascalString name;
    /// The vertex_buffer_id of the vertex buffer containing the visible mesh vertices
    u32 base_vertex_buffer_id;
    std::assert(base_vertex_buffer_id == 162, "base_vertex_buffer_id != 162"+std::string::to_string(base_vertex_buffer_id));
    /// The index of the vertex buffer containing the displacement vectors
    /// Must be the same size as the base vertex buffer
    /// Editing this buffer doesn't seem to do anything
    /// Fully deformed positions? Not offsets?
    /// Could have been in the editor but not needed in the game
    /// One less than this is the visible mesh
    u16 displacement_vertex_buffer_index;
    /// Must be the same size as the base vertex buffer
    /// maps vertices in the base vertex buffer to displacement vectors
    DynArray_Z<u16> displacement_vectors_indicies;
    /// zeroing this array will make it so the deformation never happens
    /// This array contains displacements (offsets)
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
    DynArray_Z<VertexBufferExt> vertex_buffers;
    DynArray_Z<IndexBufferExt> index_buffers;
    DynArray_Z<Quad> quads;
    /// composes vertex and index buffer
    /// when removed the mesh disapears but the game still runs as expected
    /// in wireframe debug view the mesh is not there but that could be a result of no material
    /// does NOT contain collision data
    DynArray_Z<VertexGroup> vertex_groups;
    Morpher morpher;
};

using ShortVecWeird = Vec<NumeratorFloat<i16, 1024>, 3>;

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
    /// related to the Collision structs
    /// game crashes on collision with static body if empty while MorphTargetDesc exists
    /// no effect if same size but 0ed out data
    /// all overlap with various vertices in the last vertex buffer
    DynArray_Z<ShortVecWeird> short_vec_weirds;
};

Mesh_Z mesh_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
