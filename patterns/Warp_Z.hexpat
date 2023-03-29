#include <fuel.hexpat>

struct Warp_Z : ResourceObject_Z {
    Name_Z material_name;
    Vec3f vertices[8];
    /// 1
    f32 one;
    /// 0
    f32 zero;
    /// 50
    f32 radius;
    Vec2f texcoords[4];
} [[static]];

Warp_Z warp_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
