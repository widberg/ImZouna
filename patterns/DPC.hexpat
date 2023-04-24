#pragma MIME application/x-dpc

#include <fuel.hexpat>

struct BlockDescription {
    u32 block_type;
    u32 object_count;
    u32 padded_size;
    u32 data_size;
    u32 working_buffer_offset;
    u32 first_object_name;
};

struct Header {
    char version[256];
    u32 is_not_rtc;
    u32 block_count;
    u32 block_working_buffer_capacity_even;
    u32 block_working_buffer_capacity_odd;
    u32 padded_size;
    u32 version_patch;
    u32 version_minor;
    BlockDescription block_descriptions[block_count];
    BlockDescription empty_block_descriptions[64 - block_count];
    u32 zero;
    u32 pool_manifest_padded_size;
    u32 pool_manifest_offset;
    u32 pool_manifest_unused0;
    u32 pool_manifest_unused1;
    u32 pool_object_decompression_buffer_capacity;
    u32 block_sector_padding_size;
    u32 pool_sector_padding_size;
    u32 file_size;
    char incredi_builder_string[128];
    u8 pad[64];
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

struct PoolManifestHeader {
    u32 equals524288;
    u32 equals2048;
    u32 object_names_count_sum;
};

struct ReferenceRecord {
    u32 start_chunk_index;
    u32 end_chunk_index;
    u32 object_names_starting_index;
    u16 placeholder_dpc_index;
    u16 object_names_count;
    u32 placeholder_times_referenced;
    u32 placeholder_current_references_shared;
    u32 placeholder_current_references_weak;
};

struct PoolManifest {
    PoolManifestHeader pool_manifest_header;
    DynArray_Z<u32> object_names_indices;
    DynArray_Z<Name_Z> object_names;
    DynArray_Z<u32> reference_counts;
    DynArray_Z<u32> object_padded_size;
    DynArray_Z<u32> reference_records_indices;
    DynArray_Z<ReferenceRecord> reference_records;
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

struct DPC {
    Header header;
    Block blocks[header.block_count];
    if (header.pool_manifest_padded_size != 0) {
        Pool pool;
    }
};

DPC dpc @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
