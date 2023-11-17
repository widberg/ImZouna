// Adapted from
// https://github.com/amrshaheen61/APT_DPC_Tool/blob/master/APT%20DPC%20Tool/Core/DpcHelper.cs

#include <zouna.hexpat>
#include <std/io.pat>

enum CompressionType : u8 {
    NONE = 0,
    Zlib = 4,
};

struct DataResource {
    u64 class_name;
    u64 name;
    u64 link_name;
    u32 size;
    u32 link_header_size;
    u32 decompressed_body_size;
    u32 compressed_body_size;
    u16 padding_size;
    CompressionType compression_type;
    std::assert(std::core::is_valid_enum(compression_type), "!std::core::is_valid_enum(compression_type)");
    u8 link_header[link_header_size];
    u8 pad[padding_size];
    if (compressed_body_size != 0) {
        u8 compressed_data[compressed_body_size];
    } else {
        u8 decompressed_data[decompressed_body_size];
    }
};

struct Resource {
    u64 name;
    u64 class_name;
    u32 offset;
    u32 compressed_size;
    u32;
    u32 decompressed_size;
    u16;
    u16;
    if (parent.parent.parent.parent.header.resources_block_size != 0 &&
        parent.parent.parent.parent.header.resources_block_offset != 0 &&
        parent.parent.parent.parent.header.map_size == 0 &&
        parent.parent.parent.parent.header.map_offset == 0) {
        DataResource data_resource @ offset * 16;
    }
};

struct DataDescription {
    u32 resource_count;
    u64 padded_size;
    u64 size;
    u64 working_buffer_offset;
};

struct Data {
    DataResource datas[parent.data_descriptions[std::core::array_index()].resource_count];
    std::mem::AlignTo<16>;  
};

struct Unknown {
    u8 data[16];
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
    u32 num;
    Unknown unknown[num];
    u32 num2;
    u32 unknown2[num2];
    u32 resource_count2;
    Resource resources2[resource_count2];
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

enum BigFileType : u8 {
    RTC = 0,
    NORMAL = 1,
    COMMON = 2,

    UPDATED1 = 4,
};

struct Header {
    char version[256];
    BigFileType big_file_type;
    u32;
    u32 block_description_offset;
    u32 resources_block_size;
    u32 resources_block_offset;
    u32 map_size;
    u32 map_offset;
    std::mem::AlignTo<4096>;
};

struct MapResource {
    Name_Z64 class_name;
    Name_Z64 name;
    Name_Z64 link_name;
    u32 offset;
    u32 compressed_size;
    u64;
    u32 decompressed_size;
    u64;
    u64;
};

struct MapEntry {
};

struct Map {
    DynArray_Z<MapResource> map_resources;
    DynArray_Z<MapEntry> map_entries;
};

struct AptrBigFile {
    Header header;
    if (header.block_description_offset != 0) {
        BlockDescriptions block_descriptions @ header.block_description_offset * 16;
    }
    
    if (header.map_offset != 0) {
        Map map @ header.map_offset * 16;
    }
};

AptrBigFile aptr_big_file @ 0x0;
