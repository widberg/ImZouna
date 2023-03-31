#pragma MIME application/x-binary-z

#include <fuel.hexpat>

struct Binary_Z : ResourceObject_Z {
    PascalArray<u8> data;
};

Binary_Z binary_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
