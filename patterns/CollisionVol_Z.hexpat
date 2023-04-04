#pragma MIME application/x-collision-vol-z

#include <fuel.hexpat>

struct CollisionVol_Z : Object_Z {
    std::assert(type == ObjectType::CollisionVol_Z, "type != ObjectType::CollisionVol_Z");
    u32 one;
    std::assert(one == 1, "one != 1");
    Mat4f local_transform;
    Mat4f local_transform_inverse;
    u32 zeros[28];
    std::assert(all_eq(zeros, 0x0), "!all_eq(zeros, 0x0)");
    Name_Z volume_type;
    u32 zero;
    std::assert(zero == 0, "zero != 0");
};

CollisionVol_Z collision_vol_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
