#include <fuel.hexpat>

struct ParticlesData_Z : ResourceObject_Z {
    /// Always 257
    u32 equals257;
    Vec3f position;
    Vec3f velocity;
    PascalArray<u16> shorts;
    /// Always 0
    u32 zero;
};

ParticlesData_Z particles_data_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
