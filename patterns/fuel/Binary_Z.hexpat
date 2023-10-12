#pragma MIME application/x-binary-z

#include <zouna.hexpat>

bitfield LookupDescription {
    horizon : 12;
    altitudes_index : 20;
};

bitfield AltitudePack {
    odd : 4;
    even : 4;
};

struct AltitudesPacked {
    AltitudePack altitudes[8];
};

struct AltitudesUnpacked {
    u8 altitudes[16];
};

struct Internal {
    u32 width;
    u32 height;
    std::assert(width == height, "width != height");
    u32 lookup_width = width / 4;
    f32 two;
    std::assert(two == 2, "two != 2");
    i32 negative_one;
    std::assert(negative_one == -1, "negative_one != -1");
    f32 denominator;
    u32 altitudes_packed_size;
    u32 altitudes_total_size;
    AltitudesPacked altitudes_packed[altitudes_packed_size];
    AltitudesUnpacked altitudes_unpacked[((altitudes_total_size - 1) * 4 - sizeof(altitudes_packed)) / 16];
    LookupDescription lookup[lookup_width * lookup_width];
};

struct Binary_Z : ResourceObject_Z {
    u32 data_size;
    Internal data;
    std::assert(sizeof(data) == data_size, "sizeof(data) != data_size");
};

Binary_Z binary_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
