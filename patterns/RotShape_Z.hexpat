#pragma MIME application/x-rot-shape-z

#include <fuel.hexpat>

struct RotShape_Z : Points_Z {
    std::assert(type == ObjectType::RotShape_Z, "type != ObjectType::RotShape_Z");
    DynArray_Z<Vec3f> verticies;
    /// Always 0?
    f32 one;
    std::assert(one == 0, "one != 0");
    /// Always full of 0s except for USA1.DPC 3753153500.RotShape_Z
    DynArray_Z<u32> material_names_indices;
    std::assert(verticies.size == material_names_indices.size, "verticies.size != material_names_indices.size");
    DynArray_Z<Vec3f> sizes;
    std::assert(sizes.size == material_names_indices.size * 2, "sizes.size != material_names_indices.size * 2");
    DynArray_Z<Vec2f> texcoords;
    std::assert(texcoords.size == sizes.size * 2, "texcoords.size != sizes.size * 2");
    DynArray_Z<Name_Z> material_names;
    f32 scale;
    std::assert(scale == 0 || scale == 200 || scale == 300, "scale != 0,200,300");
    u16 billboard_mode;
    std::assert(billboard_mode == 0 || billboard_mode == 1, "billboard_mode != 0,1");
};

RotShape_Z rot_shape_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
