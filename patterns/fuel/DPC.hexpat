#pragma MIME application/x-dpc

#include <zouna.hexpat>

struct BlockDescription {
    u32 object_count;
    u32 padded_size;
    u32 data_size;
    u32 working_buffer_offset;
    u32 first_object_name;
    u32 zero;
    std::assert(zero == 0, "zero != 0");
};

struct VersionTriple {
    u32 _0;
    u32 _1;
    u32 _2;
};

struct Header {
    char version[256];
    u32 is_not_rtc;
    u32 block_count;
    u32 block_working_buffer_capacity_even;
    u32 block_working_buffer_capacity_odd;
    u32 padded_size;
    VersionTriple version_triple;
    BlockDescription block_descriptions[block_count];
    BlockDescription empty_block_descriptions[64 - block_count];
    u32 pool_manifest_padded_size;
    u32 pool_manifest_offset;
    u32 pool_manifest_unused0;
    u32 pool_manifest_unused1;
    std::assert(pool_manifest_unused0 == pool_manifest_unused1, "pool_manifest_unused0 != pool_manifest_unused1");
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
    std::assert(compressed_size == 0 || compressed_size <= float(decompressed_size) * 0.80, "20% minimum compression expectation violated");
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
    u32 placeholder_times_referenced;
    u32 placeholder_current_references_shared;
    u32 placeholder_current_references_weak;
};

struct PoolManifest {
    u32 equals0x80000;
    std::assert(equals0x80000 == 0x80000, "equals0x80000 != 0x80000");
    u32 equals0x800;
    std::assert(equals0x800 == 0x800, "equals0x800 != 0x800");
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

fn calculate_padded_size(u32 unpadded_size) {
    return (unpadded_size + 0x7ff) & 0xfffff800;
};

fn calculate_padding_size(u32 unpadded_size) {
    return calculate_padded_size(unpadded_size) - unpadded_size;
};

fn block_assert(ref auto header, ref auto block, u32 block_index) {
    u32 object_count = header.block_descriptions[block_index].object_count;
    u32 block_address = addressof(block);
    u32 calculated_offset = 0;

    for (u32 i = 0, i < object_count, i += 1) {
        // if (block.objects[i].header.compressed_size != 0) {
        //     u32 required_size = block.objects[i].header.decompressed_size;
        //     u32 available_size = addressof(block.objects[i].data) - block_address;
        //     if (required_size > available_size) {
        //       calculated_offset = std::math::max(calculated_offset, calculate_padded_size(required_size - available_size));
        //     }
        // }
        calculated_offset = std::math::max(calculated_offset, calculate_padded_size(block.objects[i].header.decompressed_size));
    }

    std::print("{} / 2048 = {}", calculated_offset, calculated_offset / 2048);

    return true;
};

fn blocks_assert(ref auto header, ref auto blocks) {
    for (u32 i = 0, i < std::core::member_count(blocks), i += 1) {
        if (!block_assert(header, blocks[i], i)) {
            return false;
        }
    }

    return true;
};

struct DPC {
    Header header;
    Block blocks[header.block_count];
    // std::assert(blocks_assert(header, blocks), "!blocks_assert(header, blocks)");
    if (header.pool_manifest_padded_size != 0) {
        Pool pool;
    }
};

DPC dpc @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
