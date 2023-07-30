#pragma MIME application/x-warp-z

#include <fuel.hexpat>

struct Warp_Z : ResourceObject_Z {
    u32 flags;
    Vec3f vertices[8];
    f32 one;
    std::assert(one == 1, "one != 1");
    u32 zero;
    std::assert(zero == 0, "zero != 0");
    f32 radius;
    std::assert(radius == 50, "radius != 50");
    Name_Z material_anims[6];
    Name_Z node;
    std::assert(node == 0, "node != 0");
    DynArray_Z<Name_Z> anim_frames;
    std::assert(anim_frames.size == 0, "anim_frames.size != 0");
};

Warp_Z warp_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
