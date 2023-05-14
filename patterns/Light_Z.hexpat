#pragma MIME application/x-light-z

#include <fuel.hexpat>

struct Light_Z : Object_Z {
    Quat rotation;
    Vec3f direction;
    Vec4f color;
    Vec3f ambient;
    Vec3f position;
};

Light_Z light_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
