#pragma MIME application/x-skin-z

#include <fuel.hexpat>

struct SkinSubsection {
    Name_Z animation_node_name0;
    Name_Z animation_node_name1;
    Name_Z animation_node_name2;
    Name_Z animation_node_name3;
    Name_Z names[21];
};

struct SkinSection {
    DynArray_Z<SkinSubsection> skin_subsections;
};

struct Skin_Z : Object_Z {
    DynArray_Z<Name_Z> mesh_names;
    u32 zero0;
    std::assert(zero0 == 0, "zero0 != 0");
    u32 zero1;
    std::assert(zero1 == 0, "zero1 != 0");
    u32 zero2;
    std::assert(zero2 == 0, "zero2 != 0");
    u32 zero3;
    std::assert(zero3 == 0, "zero3 != 0");
    f32 one_and_a_half;
    std::assert(one_and_a_half == 1.5, "one_and_a_half != 1.5");
    u32 data_count;
    std::assert(data_count == 21, "data_count != 21");
    DynArray_Z<SkinSection> skin_sections;
    std::assert(skin_sections.size == mesh_names.size, "skin_sections.size != mesh_names.size");
};

Skin_Z skin_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
