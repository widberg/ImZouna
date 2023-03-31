#pragma MIME application/x-warp-z

#include <fuel.hexpat>

struct Warp_Z : ResourceObject_Z {
    Name_Z material_name;
    Vec3f vertices[8];
    f32 one;
    std::assert(one == 1, "one != 1");
    f32 zero;
    std::assert(zero == 0, "zero != 0");
    f32 radius;
    std::assert(radius == 50, "radius != 50");
    Vec2f texcoords[4];
} [[static]];

Warp_Z warp_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
