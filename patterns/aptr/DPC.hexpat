// Adapted from
// https://github.com/amrshaheen61/APT_DPC_Tool/blob/master/APT%20DPC%20Tool/Core/DpcHelper.cs

#include <zouna.hexpat>

struct Resource {
    u64 name;
    u64 class_name;
    u32 offset;
    u32 compressed_size;
    u32;
    u32;
    u32 decompressed_size;
    if (compressed_size != 0) {
        u8 compressed_data[compressed_size] @ offset * 16;
    } else {
        u8 decompressed_data[decompressed_size] @ offset * 16;
    }
};

struct DataDescription {
    u32 resource_count;
    u64 padded_size;
    u64 size;
    u64 working_buffer_offset;
};

enum CompressionType : u32 {
    NONE = 0,
    LZ4 = 2,
};

struct DataResource {
    u64 class_name;
    u64 name;
    u64 link_name;
    u32 size;
    u32 link_header_size;
    u32 decompressed_body_size;
    CompressionType compression_type;
    std::assert(std::core::is_valid_enum(compression_type), "!std::core::is_valid_enum(compression_type)");
    u32 compressed_body_size;
    u32 zero;
    std::assert(zero == 0, "zero != 0");
    u8 link_header[link_header_size];
    if (compressed_body_size != 0) {
        u8 compressed_data[compressed_body_size];
    } else {
        u8 decompressed_data[decompressed_body_size];
    }
};

struct Data {
    DataResource datas[parent.data_descriptions[std::core::array_index()].resource_count];
    std::mem::AlignTo<2048>;
};

struct Resources {
    u32 data_count;
    u32 data_offset;
    u32 working_buffer_offset;
    u32;
    u64;
    u64 padded_size;
    u64 padding_size;
    DataDescription data_descriptions[data_count];
    DataDescription unused_data_descriptions[52 - data_count];
    u32 resource_count;
    Resource resources[resource_count];
    u64;
    u64;
    u32;
    std::mem::AlignTo<2048>;
    Data datas[data_count] @ data_offset * 16;
};

struct BlockDescription {
    u64;
    u64;
    u64;
    u32 resources_map_offset;
    u32 data_resources_map_offset;
    Resources resources @ resources_map_offset * 16;
};

struct BlockDescriptions {
    u32 block_count;
    BlockDescription block_descriptions[block_count];
};

struct Header {
    char version[256];
    u8;
    u32;
    u32 block_description_offset;
    u32 resources_block_size;
    u32 resources_block_offset;
    u32 map_size;
    u32 map_offset;
    std::mem::AlignTo<4096>;
};

struct AptrBigFile {
    Header header;
    BlockDescriptions block_descriptions @ header.block_description_offset * 16;
};

AptrBigFile aptr_big_file @ 0x0;
