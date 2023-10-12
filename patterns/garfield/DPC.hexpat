// Adapted from
// https://github.com/widberg/ImFUEL/blob/master/patterns/DPC.hexpat
// https://github.com/SamuraiOndo/ratprotoext/blob/main/dgc.py
// https://github.com/Jellonator/chum-world/wiki/BigFile
// https://github.com/chebureki/DuckHax-CLI/blob/main/filetemplates/DPC.bt

#include <std/core.pat>
#include <std/sys.pat>
#include <std/mem.pat>

// BigFile file/DPCFile
struct Resource {
    u32 decompressed_size; // No separate sizes for link header and body
    u32 compressed_size;
    u32 class_name;
    u32 resource_name;
    if (compressed_size != 0) {
        char compressed[compressed_size]; // Compressed link header and body
    } else {
        char data[decompressed_size]; // Link header and body
    }
    // What chum-world calls subtype_id is likely the ResourceObject_Z link header i.e. a single link name.
};

// BigFile chunk/DPCFolder
struct Block {
    Resource resources[parent.header.block_descriptions[std::core::array_index()].object_count];
    std::mem::AlignTo<2048>;
};

struct BlockDescription {
    u32 object_count;
    u32 padded_size;
    u32 data_size;
    u32 working_buffer_offset;
    u32 first_object_name;
    // This field is usually zero in the new version of the format
    // But here it has a value that does not appear anywhere else
    // I'll call it a checksum but thats just a hunch
    u32 checksum;
};

struct VersionTriple {
    u32 _0;
    u32 _1;
    u32 _2;
};

// BigFile header
struct Header {
    char version[256];
    u32 block_count;
    u32 block_working_buffer_capacity_even;
    u32 block_working_buffer_capacity_odd;
    u32 total_padded_block_size;
    VersionTriple version_triple;
    BlockDescription block_descriptions[block_count];
    BlockDescription empty_block_descriptions[64 - block_count];
    std::mem::AlignTo<2048>;
};

// Overall structure/DPC
struct GarfieldBigFile {
    Header header;
    Block blocks[while(!std::mem::eof())];
};

GarfieldBigFile garfield_big_file @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
