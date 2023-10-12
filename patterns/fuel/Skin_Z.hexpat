#pragma MIME application/x-skin-z

#include <zouna.hexpat>

struct SkinSubsection {
    Name_Z animation_node_names[4];
    Name_Z bone_names[parent.parent.parent.parent.bone_name_count];
};

struct SkinSection {
    DynArray_Z<SkinSubsection> skin_subsections;
};

struct Skin_Z : Object_Z {
    std::assert(type == ObjectType::Skin_Z, "type != ObjectType::Skin_Z");
    DynArray_Z<Name_Z> mesh_names;
    u32 zeros[4];
    std::assert(all_eq(zeros, 0), "!all_eq(zero0, 0)");
    f32 one_and_a_half;
    std::assert(one_and_a_half == 1.5, "one_and_a_half != 1.5");
    u32 bone_name_count;
    std::assert(bone_name_count == 21, "bone_name_count != 21");
    DynArray_Z<SkinSection> skin_sections;
    std::assert(skin_sections.size == mesh_names.size, "skin_sections.size != mesh_names.size");
};

Skin_Z skin_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
