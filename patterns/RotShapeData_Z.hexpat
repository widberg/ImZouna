#pragma MIME application/x-rot-shape-data-z

#include <fuel.hexpat>

struct RotShapeData_Z : ResourceObject_Z {
    u32 one;
    std::assert(one == 1, "one != 1");
    PascalArray<u16> shorts;
    u8 pad[shorts.size * 28];
    std::assert(all_eq(pad, 0xFF), "!all_eq(pad, 0xFF)");
};

RotShapeData_Z rot_shape_data_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
