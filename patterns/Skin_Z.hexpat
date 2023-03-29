#include <fuel.hexpat>

struct SkinSubsection {
    Name_Z animation_node_name0;
    Name_Z animation_node_name1;
    Name_Z animation_node_name2;
    Name_Z animation_node_name3;
    /// names.size == data_count
    Name_Z names[21];
};

struct SkinSection {
    PascalArray<SkinSubsection> skin_subsections;
};

struct Skin_Z : Object_Z {
    /// equals skinSections.size
    PascalArray<Name_Z> mesh_names;
    /// always 0
    u32 zero0;
    /// always 0
    u32 zero1;
    /// always 0
    u32 zero2;
    /// always 0
    u32 zero3;
    /// always 1.5
    f32 one_and_a_half;
    /// always 21
    u32 data_count;
    std::assert(data_count == 21, "data_count != 21");
    /// skinSections.size = meshCRC32s.size
    PascalArray<SkinSection> skin_sections;
};

Skin_Z skin_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
