#include <fuel.hexpat>

struct CollisionVol_Z : Object_Z {
    /// Always 1
    u32 one;
    Mat4f local_transform;
    Mat4f local_transform_inverse;
    u32 zeros[28];
    Name_Z volume_type;
    /// Always 0
    u32 zero;
} [[static]];

CollisionVol_Z collision_vol_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
