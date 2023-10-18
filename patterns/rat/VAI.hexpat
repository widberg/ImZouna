// Adapted from
// https://github.com/vgmstream/vgmstream/blob/master/src/meta/vai.c

#include <zouna.hexpat>

struct VaiHeader {
    u32 sample_rate;
    u32 data_size;
    // codec = NGC_DSP
    // channels = 2
    // interleave = 0x4000
};

struct Vai {
    VaiHeader header;
    padding[0x4060 - sizeof(header)]; // garbage
    u8 data[header.data_size];
};

Vai vai @ 0x0;
