import std.mem;

// Seems to just be for debug commands
// LoadWwiseIDs WwiseIDs
// DebugDoesWwiseIDExist <id>
// DebugDoesWwiseNameExist <name>

struct WwiseIDs {
    // Sorted in ascending order for binary search
    u32 ids[while (!std::mem::eof())];
};

WwiseIDs wwise_ids @ 0x0;
