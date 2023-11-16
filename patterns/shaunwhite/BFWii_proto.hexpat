#include <zouna.hexpat>

// LZO https://github.com/yuhaoth/minilzo lzo1x_1_compress lzo1x_decompress
enum CompressionType : u32 {
    BF_COMP_NONE = 0, ///< Bifile is not compressed
    BF_COMP_LZO  = 1, ///< Bigfiles will be compressed using LZO in-place fast compressor-decompressor
    BF_COMP_ZLIB = 2, ///< UNSUPPORTED: Bigfiles will be compressed using ZLIB compressor-decompressor
    // BF_COMP_FORCEDWORD = 0xFFFFFFFF, ///< Forces the enum to 32 bits
};

struct BlockHeader {
    u32 resource_count;
};

struct Block {
    BlockHeader header;
    u32 block_size = parent.header.block_sizes.data[std::core::array_index()];
    // See the block.hexpat pattern for what the decompressed
    if (parent.header.compression_type == CompressionType::BF_COMP_LZO &&
        block_size != parent.header.decompressed_block_size) {
        // lzo1x_decompress_safe(compressed_buffer, compressed_size, decompressed_buffer, &l_DecrompressedLength, 0)
        // decompressed_buffer should be minimum decompressed_block_size
        u8 compressed[block_size]; // Compressed
    } else {
        u8 uncompressed[block_size - 4]; // Uncompressed
    }
    std::mem::AlignTo<2048>;
};

struct Header {
    char version[256];
    u32 decompressed_block_size; // Minimum size of the decompressed block buffer
    CompressionType compression_type;
    DynArray_Z<u32> block_sizes; // De/compressed sizes depending on compression_type
    std::mem::AlignTo<2048>;
};

struct ShaunBigFile {
    Header header;
    Block blocks[header.block_sizes.size];
};

ShaunBigFile shaun_big_file @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
