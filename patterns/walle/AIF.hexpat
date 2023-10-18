// Adapted from
// https://github.com/vgmstream/vgmstream/blob/master/src/meta/aif_asobo.c

#include <zouna.hexpat>

struct AifHeader {
    u16 codec; // Should be 0x69 = Xbox codec
    u16 channels; // Should be 2
    u32 sample_rate;
    u32 bitrate;
    u16 xbox_block_align; // Should be 0x24 * channels
    u16 xbox_bps; // Should be 0x04
    u16;
    u16;
};

struct Aif {
    AifHeader header;
    u8 data[while (!std::mem::eof())];
};

Aif aif @ 0x0;
