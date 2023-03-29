#include <fuel.hexpat>

struct Unknown2 {
    u8 data[32];
} [[static]];

struct Unknown3 {
    u8 data[32];
} [[static]];

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
} [[static]];

struct Edge_Z {
    u16 P[2];
    u16 T[2];
} [[static]];

bitfield ShouldDrawBitfield { // 16 bits
    index_in_draw_info_array : 3;
    shift_amount_for_bit : 5;
    other : 8;
} [[static]];

struct Unknown12 {
    u8 data[32];
} [[static]];

struct SeadVoxel_Z {
    u16 element_entry;
    u16 num_element;
} [[static]];

struct Unknown15 {
    f32 data[48];
    u32 unknown0s[4];
} [[static]];

struct SeadIndex_Z {
    PascalArray<SeadVoxel_Z> sead_voxels;
    PascalArray<u16> elements;
    Unknown15 unknown15;
    u32 repeated_patch_count;
};

struct Surface_Z : Object_Z {
    PascalArray<Vec3f> vertices;
    PascalArray<Vec4f> vec4fs;
    PascalArray<Unknown2> unknown2s;
    PascalArray<Unknown3> unknown3s;
    PascalArray<Patch_Z> patches;
    PascalArray<Edge_Z> edges;
    PascalArray<Vec3f> normals;
    PascalArray<Vec3f> vertex9s;
    PascalArray<Vec2f> vertex10s;
    PascalArray<ShouldDrawBitfield> should_draw_relateds;
    PascalArray<Unknown12> unknown12s;
    Optional<SeadIndex_Z> sead_index;
};

Surface_Z surface_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
