#pragma MIME application/x-sound-z

#include <fuel.hexpat>

struct Sound_Z_LinkHeader : ResourceObject_Z {
    u32 sample_rate;
    /// Size of the data
    u32 sound_data_size;
    /// Potentially flags
    /// Values used in FUEL:
    ///   * 1
    ///   * 3
    ///   * 5
    ///   * 7
    u16 sound_type;
};

struct Sound_Z : Sound_Z_LinkHeader {
    /// Raw signed 16-bit PCM, little-endian, 1 channel audio data
    u8 data[sound_data_size];
};

Sound_Z sound_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
