#include <zouna.hexpat>

struct Block {
    u8 data[parent.header.block_sizes.data[std::core::array_index()] + 2];
    std::mem::AlignTo<2048>;
};

// LZO https://github.com/yuhaoth/minilzo lzo1x_1_compress lzo1x_decompress
enum CompressionType : u32 {
    BF_COMP_NONE = 0, ///< Bifile is not compressed
    BF_COMP_LZO  = 1, ///< Bigfiles will be compressed using LZO in-place fast compressor-decompressor
    BF_COMP_ZLIB = 2, ///< UNSUPPORTED: Bigfiles will be compressed using ZLIB compressor-decompressor
    // BF_COMP_FORCEDWORD = 0xFFFFFFFF, ///< Forces the enum to 32 bits
};

struct Header {
    char version[256];
    u32 decompressed_block_size;
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
