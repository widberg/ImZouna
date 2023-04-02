#pragma MIME application/x-surface-z

#include <fuel.hexpat>

struct Unknown2 {
    u8 data[32];
};

struct Unknown3 {
    u8 data[32];
};

struct Patch_Z {
    u16 flag;
    u16 index_in_unk_short_da;
    u16 edge_indices[4];
    u32 material_anim_index;
    f32 data[12];
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

struct Unknown12 {
    u8 data[32];
};

struct SeadVoxel_Z {
    u16 element_entry;
    u16 num_element;
};

struct Unknown15 {
    f32 data[48];
    u32 unknown0s[4];
};

struct SeadIndex_Z {
    DynArray_Z<SeadVoxel_Z> sead_voxels;
    DynArray_Z<u16> elements;
    Unknown15 unknown15;
    u32 repeated_patch_count;
};

struct Surface_Z : Object_Z {
    std::assert(type == 1, "type != 1");
    DynArray_Z<Vec3f> vertices;
    DynArray_Z<Vec4f> vec4fs;
    DynArray_Z<Unknown2> unknown2s;
    DynArray_Z<Unknown3> unknown3s;
    DynArray_Z<Patch_Z> patches;
    DynArray_Z<Edge_Z> edges;
    DynArray_Z<Vec3f> normals;
    DynArray_Z<Vec3f> vertex9s;
    DynArray_Z<Vec2f> vertex10s;
    DynArray_Z<ShouldDrawBitfield> should_draw_relateds;
    DynArray_Z<Unknown12> unknown12s;
    Optional<SeadIndex_Z> sead_index;
};

Surface_Z surface_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
