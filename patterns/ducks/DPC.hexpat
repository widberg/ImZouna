// Adapted from
// https://github.com/Jellonator/chum-world/wiki/BigFile
// https://github.com/chebureki/DuckHax-CLI/blob/main/filetemplates/DPC.bt

#include <std/sys.pat>
#include <std/mem.pat>

// BigFile file/DPCFile
struct Resource {
    u32 data_size; // No separate sizes for link header and body
    u32 class_name;
    u32 resource_name;
    char data[data_size - 12]; // Link header and body
    // What chum-world calls subtype_id is likely the ResourceObject_Z link header i.e. a single link name.
};

// BigFile chunk/DPCFolder
struct Block {
    u32 start = $; // Record the offset of the start of the block
    u32 resource_count;
    Resource resources[resource_count];
    u32 block_size = $ - start; // Calculate the actual size of the block
    padding[parent.header.block_size - block_size]; // Pad to the allocated block size
};

struct VersionTriple {
    u32 _0;
    u32 _1;
    u32 _2;
};

// BigFile header
struct Header {
    char version[256];
    u32 block_size;
    // This isn't in the BigSky BigFiles
    VersionTriple version_triple;
    std::mem::AlignTo<2048>;
};

// Overall structure/DPC
struct DuckBigFile {
    Header header;
    Block blocks[while(!std::mem::eof())];
};

DuckBigFile duck_big_file @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
