// Adapted from
// https://github.com/vgmstream/vgmstream/blob/master/src/meta/ps2_joe.c
// Old version from NYR which isn't Zouna that I made first for some reason
// https://gist.github.com/widberg/8c349f25ef4f8363314890180748a6af#file-nyr_joe-hexpat

#include <zouna.hexpat>

struct JoeHeader {
    u32 sample_rate;
    u32 data_size;
    u32 zero;
    // codec = PSX
    // channels = 2
    // interleave = 0x10
};

struct Joe {
    JoeHeader header;
    u8 data[header.data_size] @ 0x4020;
};

Joe joe @ 0x0;
