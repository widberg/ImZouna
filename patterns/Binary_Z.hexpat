#pragma MIME application/x-binary-z

#include <fuel.hexpat>

struct Internal {
    u32 width;
    u32 height;
    std::assert(width == height, "width != height");
    u32 num = width / 4;
    f32 two;
    std::assert(two == 2, "two != 2");
    i32 negative_one;
    std::assert(negative_one == -1, "negative_one != -1");
    f32 denominator;
    u32 limit;
    u32 float_data_size;
    u32 float_data[float_data_size-1];
    u32 lookup[num * num];
};

struct Binary_Z : ResourceObject_Z {
    u32 data_size;
    Internal data;
    std::assert(sizeof(data) == data_size, "sizeof(data) != data_size");
};

Binary_Z binary_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
