#pragma MIME application/x-binary-z

#include <fuel.hexpat>

// field_14 = 162E02B4
// v8 = 1636B4B0

// struct BFloat {
//     u16 numerator;
//     f32 denominator = parent.denominator;
//     u8 mode = parent.a3 & 3;
// } [[format("format_bfloat"), transform("format_bfloat")]];

// fn format_bfloat(ref auto nf) {
//     return float(nf.numerator) / nf.denominator;
// };

// bitfield God {
//     something : 12;
//     less_than_field_14 : 4;
//     padding : 16;
// };

// struct Internal {
//     u32 mult;
//     u32 field_4;
//     f32 fl;
//     u32 type = 6;
//     u32 pre_num = fl * mult;
//     u32 a1 = 0x160 / 4;
//     u32 a3 = 0x1E9 / 4;
//     u32 v9 = 4 * (a1 & 3);
//     u32 num = mult / 4;
//     u32 field_C;
//     f32 denominator;
//     u32 field_14;
//     u32 a;
//     u32 data[a-1];
//     God gods[4];
//     //u32 data[a+a3+num*a1-1];
//     //u32 other_data[4 * num];
// };

// Internal i @ 0x0;

struct Binary_Z : ResourceObject_Z {
    DynArray_Z<u8> data;
};

Binary_Z binary_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
