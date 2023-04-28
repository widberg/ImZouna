#pragma MIME application/x-surface-z

#include <fuel.hexpat>

struct Unused2 {
    u8 data[32];
};

struct Unused3 {
    u8 data[32];
};

struct Patch_Z {
    u16 flag;
    u16 index_in_unk_short_da;
    u16 edge_indices[4];
    u32 material_anim_index;
    u32 data[12];
    Mat4f mat;
    u16 vec4fs_indices[4];
    u16 unknown3s[17];
    u16 surface_indices_index;
    Name_Z material_anim_name;
};

struct Edge_Z {
    u16 P[2];
    u16 T[2];
};

bitfield ShouldDrawBitfield { // 16 bits
    index_in_draw_info_array : 3;
    shift_amount_for_bit : 5;
    other : 8;
};

struct Unused12 {
    u8 data[32];
};

struct SeadVoxel_Z {
    RangeBeginSize patches_indices_range;
};

struct Unknown15 {
    u32 data[48];
    u32 sead_voxel_count;
    u32 patch_count_related;
    u32 unknown0s[2];
};

struct SeadIndex_Z {
    DynArray_Z<SeadVoxel_Z> sead_voxels;
    DynArray_Z<u16> patches_indices;
    Unknown15 unknown15;
    u32 patch_count;
};

struct Surface_Z : Points_Z {
    std::assert(type == ObjectType::Surface_Z, "type != ObjectType::Surface_Z");
    DynArray_Z<Vec3f> points;
    DynArray_Z<Vec4f> vec4fs;
    DynArray_Z<Unused2> unused2s;
    std::assert(unused2s.size == 0, "unused2s.size != 0");
    DynArray_Z<Unused3> unused3s;
    std::assert(unused3s.size == 0, "unused3s.size != 0");
    DynArray_Z<Patch_Z> patches;
    DynArray_Z<Edge_Z> edges;
    DynArray_Z<Vec3f> normals;
    DynArray_Z<Vec3f> vertex9s;
    DynArray_Z<Vec2f> vertex10s;
    DynArray_Z<ShouldDrawBitfield> should_draw_relateds;
    DynArray_Z<Unused12> unused12s;
    std::assert(unused12s.size == 0, "unused12s.size != 0");
    Optional<SeadIndex_Z> sead_index;
};

Surface_Z surface_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
