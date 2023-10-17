// Adapted from https://gist.githubusercontent.com/widberg/
// 2d1ef750dd43a20c1e3c8ba2ae0ef2c0/raw/473ddd97620f20c6c6e61df15bfdc89e2f06fd6b/
// .vgmstream.txth

#include <zouna.hexpat>

struct SoundData {
    u8 header[parent.header_size];
    // codec=MS_IMA
    // interleave=0x24
    // channels=1
    u8 data[parent.size - parent.header_size];
};

struct Sound {
    Name_Z name;
    u16 sample_rate;
    u16 header_size;
    u32 header_offset;
    u32 size;
    SoundData data @ header_offset;
};

struct Sdx {
    u32;
    u32 sound_count;
    u32 zero0;
    u32 zero1;
    Sound sounds[sound_count];
};

Sdx sdx @ 0x0;
