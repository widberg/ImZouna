#pragma MIME application/x-sound-z

#include <fuel.hexpat>

bitfield SoundFlags {
    /// The sound is not playing when this is 1
    PAUSED : 1;
    /// dwFlags, DSBPLAY_LOOPING is passed to IDirectSoundBuffer8::Play if 1
    LOOPING : 1;
    /// Mono when 0, Stereo when 1
    /// Calls IDirectSoundBuffer8::SetPan when updating the sound if this is 0
    STEREO : 1;
    padding : 13;
};

struct Sound_Z_LinkHeader : ResourceObject_Z {
    u32 sample_rate;
    u32 sound_data_size;
    SoundFlags flags;
    std::assert(flags.PAUSED == 1, "flags.PAUSED != 1");
};

struct Sound_Z : Sound_Z_LinkHeader {
    /// Raw signed 16-bit PCM, little-endian audio data
    u8 data[sound_data_size];
};

Sound_Z sound_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
