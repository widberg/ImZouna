#include <zouna.hexpat>

#pragma pattern_limit 0

#include <std/core.pat>
#include <std/sys.pat>
#include <std/mem.pat>

struct BlockDescription {
    u32 object_count;
    u32 padded_size;
    u32 data_size;
    u32 working_buffer_offset;
    u32 first_object_name;
    u32 checksum;
};

struct Header {
    char version[256];
    u32 version_oneple; // Like the version triple but theres only one
    u32 is_not_rtc;
    u32 block_count;
    u32 block_working_buffer_capacity_even;
    u32 block_working_buffer_capacity_odd;
    u32 total_padded_block_size;
    BlockDescription block_descriptions[block_count];
    std::mem::AlignTo<0x0000072C>;
    u32 block_sector_padding_size;
    u32 pool_sector_padding_size;
    u32 file_size;
    u32 total_decompressed_size;
    u32 total_resource_count;
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

struct ReferenceRecord {
    u32 start_chunk_index;
    u32 end_chunk_index;
    u32 object_names_starting_index;
    u16 placeholder_dpc_index;
    u16 object_names_count;
};

struct PoolManifest {
    u32 equals0x400000;
    u32 equals0x20;
    u32 object_names_count_sum;
    DynArray_Z<u32> object_names_indices;
    DynArray_Z<Name_Z> object_names;
    DynArray_Z<u32> reference_counts;
    DynArray_Z<u32> object_padded_size;
    DynArray_Z<u32> reference_records_indices;
    DynArray_Z<ReferenceRecord> reference_records;
    std::assert(object_names.size == reference_counts.size, "object_names.size != reference_counts.size");
    std::assert(reference_counts.size == object_padded_size.size, "reference_counts.size != object_padded_size.size");
    std::assert(object_padded_size.size == reference_records_indices.size, "object_padded_size.size != reference_records_indices.size");
    std::assert(reference_records_indices.size == reference_records.size, "reference_records_indices.size != reference_records.size");
    ReferenceRecord terminal;
};

struct PoolObject : BlockObject {
    std::mem::AlignTo<2048>;
};

struct Pool {
    PoolManifest pool_manifest;
    std::mem::AlignTo<2048>;
    PoolObject pool_objects[pool_manifest.object_names_indices.size];
};

struct MonopolyBigFile {
    Header header;
    Block blocks[header.block_count];
    Pool pool;
};

MonopolyBigFile monopoly_big_file @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
