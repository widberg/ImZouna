#pragma MIME application/x-particles-data-z

#include <fuel.hexpat>

struct ParticlesData_Z : ResourceObject_Z {
    u32 equals257;
    std::assert(equals257 == 257, "equals257 != 257");
    Vec3f position;
    Vec3f velocity;
    PascalArray<u16> shorts;
    u32 zero;
    std::assert(zero == 0, "zero != 0");
};

ParticlesData_Z particles_data_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
