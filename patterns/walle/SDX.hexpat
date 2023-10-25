// Adapted from https://gist.githubusercontent.com/widberg/
// 2d1ef750dd43a20c1e3c8ba2ae0ef2c0/raw/473ddd97620f20c6c6e61df15bfdc89e2f06fd6b/
// .vgmstream.txth

// SDX/SGC/SPS/Whatever the fuck else extensions they use

#include <zouna.hexpat>

struct SoundData {
    u8 header[parent.header_size];
    // codec=MS_IMA https://wiki.multimedia.cx/index.php/IMA_ADPCM
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
    u32 flags; // 1002 when theres 1 sound and 1003 when theres more than 1? 66539 in rat gc
    u32 sound_count;
    u32 zero0;
    u32 zero1;
    Sound sounds[sound_count];
};

Sdx sdx @ 0x0;
