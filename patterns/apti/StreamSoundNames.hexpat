import std.mem;

// Seems to just be for debug commands
// LoadStreamSoundNames StreamSoundNames
// DebugDoesStreamSoundExist <name>

struct StreamSoundNames {
    // Sorted in ascending order for binary search
    u32 names[while (!std::mem::eof())];
};

StreamSoundNames stream_sound_names @ 0x0;
