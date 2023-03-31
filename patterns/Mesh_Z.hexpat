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
    /// all the material crc32s followed by the mesh data crc32
    PascalArray<Name_Z> crc32s;
    /// how close the camera is allowed to get to the mesh on each axis before it pops out
    /// if close.x or close.z are 0 then the mesh will never pop out
    /// close.y = Usually 1.5
    /// the close.y value is never used, instead the allowable close.y is calculated from close.x and close.z
    Vec3f closeX;
    /// May be referenced in UserDefines
    /// LOCAL_LOOKAT is required on vehicle chassis
    PascalArray<DynPoint> dyn_points;
    /// read only when spawning model into the world
    PascalArray<DynBox> dyn_boxes;
};

struct Unused0 {
    u32 unknown0;
    u32 unknown1;
    u32 unknown2;
    u32 unknown3;
};

struct Strip {
    PascalArray<u16> strip_vertices_indices;
    Name_Z material_name;
    /// 1/2
    u32 tri_order;
};

struct Unused00 {
    u32 unused0;
    u32 unused1;
};

struct Unused4 {
    PascalArray<Unused00> unused0s;
};

struct AABBCol {
    Vec3f min;
    u16 cylindre_cols_index_begin;
    /// range of AABBs contained directly by this one
    u16 cylindre_cols_index_end;
    Vec3f max;
    u16 unknown7s_index;
    /// 0 if this AABB only contains other AABB and no faces
    /// range of CollisionFaces contained directly by this AABB
    u16 unknown7s_indices_count;
};

struct CollisionFace {
    u16 unknown12_index0;
    u16 unknown12_index1;
    /// Indices that make up the tri face
    u16 unknown12_index2;
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

struct VertexBufferExt {
    u32 vertex_count;
    u32 vertex_size;
    u32 sub_mesh_id;
    u8 data[vertex_count * vertex_size];
};

struct IndexBufferExt {
    u32 index_count;
    u32 subMeshID;
    u16 data[index_count];
};

struct WeirdQuad {
    Vec3f vertex0;
    Vec3f vertex1;
    Vec3f vertex2;
    /// Vertices that make up the quad face
    /// duplicated in unknown12s for some reason
    Vec3f vertex3;
    Vec3f facing;
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
    u32 zero1;
    /// 0x00000004 - visible
    /// 0x00080000 - has morph
    u32 flags;
    u16 vertex_buffer_index_begin;
    u16 vertex_buffer_index_end;
    u32 vertex_count;
    u32 index_buffer_index_begin;
    u32 face_count;
    u32 zero2;
    u32 zero3;
    u16 vertex_size;
    u16 material_index;
    PascalArray<Unused1> unused1s;
};

struct AABBMorphTrigger {
    Vec3f min;
    u16 unknown16_index_begin;
    /// range of AABBMorphTriggers contained directly by this one
    u16 unknown16_index_end;
    Vec3f max;
    u16 pair_index;
    /// 0 if this AABBMorphTrigger only contains other AABBMorphTriggers and no pairs
    /// range of pairs contained by this AABBMorphTrigger
    u16 pairs_indices_count;
};

struct DisplacementVector {
        Vec<NumeratorFloat<i16, 1024>, 3> displacement;
        /// current struct's Unknown15 index
        u16 unknown15_self_index;
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
    PascalArray<u16> unknown15_indicies;
    /// much larger than any of the vertex buffers
    /// zeroing this array will make it so the deformation never happens
    /// This array contains displacements
    PascalArray<DisplacementVector> unknown15s;
};

struct Morpher {
    /// removing this has no effect
    /// relatively small
    PascalArray<AABBMorphTrigger> unknown16s;
    /// Mapping from unknown12sIndex to unknown15sIndicesIndex
    /// removing this causes the game to crash when a collision with a static body occurs while MorphTargetDesc exists
    /// one element smaller than unknown12s
    Map<u16, u16> map;
    /// smaller than unknown15s but much larger than any vertex buffer or pairs
    PascalArray<u16> unknown15sIndices;
    /// always 0 or 1 but a loop is used to load it so it is a PascalArray and not an Option
    /// the game will run as normal when removed
    /// some pieces, as defined in VertexGroup, will be missing
    PascalArray<MorphTargetDesc> morphs;
};

struct MeshBuffers {
    /// If one of the buffers is required by the morpher and it is removed then the game will crash while loading
    PascalArray<VertexBufferExt> subMeshes;
    PascalArray<IndexBufferExt> indices;
    /// Occlusion test quad?
    PascalArray<WeirdQuad> unknown11s;
    /// composes vertex and index buffer
    /// when removed the mesh disapears but the game still runs as expected
    /// in wireframe debug view the mesh is not there but that could be a result of no material
    /// does NOT contain collision data
    PascalArray<VertexGroup> vertexGroups;
    Morpher morpher;
};

struct ShortVecWeird {
    Vec<NumeratorFloat<i16, 1024>, 3> weird;
};

struct Mesh_Z : Mesh_Z_LinkHeader {
    /// always empty
    PascalArray<Vec3f> strip_vertices;
    /// always empty
    PascalArray<Unused0> unused0s;
    /// always empty
    PascalArray<Vec2f> texcoords;
    /// always empty
    PascalArray<Vec3f> normals;
    /// always empty
    PascalArray<Strip> strips;
    // if (objectHeader.unknown0 & 2 != 0)
    // {
    //     PascalArray<u32> unknown3s;
    // }
    // This condition is never true
    /// always empty
    PascalArray<Unused4> unused4s;
    PascalArray<Name_Z> material_names;
    PascalArray<AABBCol> cylindre_cols;
    PascalArray<CollisionFace> unknown7s;
    /// always empty
    PascalArray<Unused8> unused8s;
    MeshBuffers mesh_buffers;
    /// 0x007b3800
    /// related to the Col structs
    /// game crashes on collision with static body if empty while MorphTargetDesc exists
    /// no effect if same size but 0ed out data
    /// all overlap with various vertices in the last vertex buffer
    PascalArray<ShortVecWeird> unknown12s;
};

Mesh_Z mesh_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
