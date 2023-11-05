#pragma MIME application/x-dpc

#pragma pattern_limit 0

#include <std/core.pat>
#include <std/sys.pat>
#include <std/mem.pat>

struct BlockDescription {
    u32 object_count;
    u64 padded_size;
    u64 data_size;
    u64 working_buffer_offset;
};

struct Header {
    char version[256];
    u32 version_oneple; // Like the version triple but theres only one
    u32 is_not_rtc;
    u32 block_count;
    u64 block_working_buffer_capacity_even;
    u64 block_working_buffer_capacity_odd;
    u64 total_padded_block_size;
    BlockDescription block_descriptions[block_count];
    std::mem::AlignTo<0x6E8>;
    u64 block_sector_padding_size;
    u64 pool_sector_padding_size;
    std::assert(pool_sector_padding_size == 0, "pool_sector_padding_size != 0");
    u64 file_size;
    u64 total_decompressed_size;
    u64 zero;
    std::assert(zero == 0, "zero != 0");
    u32 total_resource_count;
    char time[0x14];
    std::mem::AlignTo<2048>;
};

struct ObjectHeader {
    u32 data_size;
    u32 link_header_size;
    u32 decompressed_size;
    u32 compressed_size;
    u32 class_name;
    u32 object_name;
};

struct BlockObject {
    ObjectHeader header;
    u8 data[header.data_size];
};

struct Block {
    BlockObject objects[parent.header.block_descriptions[std::core::array_index()].object_count];
    std::mem::AlignTo<2048>;
};

struct RushBigFile {
    Header header;
    Block blocks[header.block_count];
};

RushBigFile rush_big_file @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
