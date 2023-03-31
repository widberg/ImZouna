#pragma MIME application/x-world-z

#include <fuel.hexpat>

struct Unknown2 {
    /// 0xFFFFFFFF
    u32 placeholder0;
    /// 0xFFFFFFFF
    u32 placeholder1;
    /// starting at 1
    u32 index;
    /// 0xFFFFFFFF
    u32 placeholder2;
    /// UUID?
    /// Increments by 1
    /// Starts at a very large number
    u32 unknown4;
    u32 zero;
};

struct World_Z : ResourceObject_Z {
    Name_Z node_name0;
    Name_Z warp_name;
    Name_Z gameObj_name;
    Name_Z unused14;
    Name_Z gen_world_name;
    Name_Z node_name1;
    PascalArray<u32> unused17s;
    PascalArray<u8> unuseds;
    Mat4f unknown0;
    /// can be -1
    PascalArray<i32> indices0;
    PascalArray<Unknown2> unknown2s;
    Mat4f unknown3s;
    /// can be -1
    PascalArray<i32> indices1;
    PascalArray<Unknown2> unknown5s;
    PascalArray<Name_Z> unused6s;
    PascalArray<Name_Z> unused7s;
    PascalArray<Name_Z> unused8s;
    PascalArray<Name_Z> unused9s;
    PascalArray<Name_Z> unused10s;
    PascalArray<Name_Z> spline_graph_names;
    PascalArray<Name_Z> unused12s;
    PascalArray<Name_Z> material_anim_name;
};

World_Z world_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
