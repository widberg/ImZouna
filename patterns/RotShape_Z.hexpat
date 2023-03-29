#include <fuel.hexpat>

struct RotShape_Z : Object_Z {
    /// verticies.size = ints.size
    PascalArray<Vec3f> verticies;
    /// Always 0?
    f32 u1;
    /// ints.size = verticies.size
    /// Always full of 0s?
    PascalArray<u32> ints;
    /// sizes.size = 2 * ints.size
    PascalArray<Vec3f> sizes;
    /// texcoords.size = 2 * sizes.size
    PascalArray<Vec2f> texcoords;
    /// Typically only 1
    PascalArray<Name_Z> material_names;
    f32 scale;
    u16 billboard_mode;
};

RotShape_Z rot_shape_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
