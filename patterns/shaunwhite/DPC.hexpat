#include <zouna.hexpat>

struct Block {
    u8 data[parent.header.block_sizes.data[std::core::array_index()]];
    std::mem::AlignTo<2048>;
};

struct Header {
    char version[256];
    u32 block_size;
    u32 a;
    DynArray_Z<u32> block_sizes;
    std::mem::AlignTo<2048>;
};

struct ShaunBigFile {
    Header header;
    Block blocks[header.block_sizes.size];
};

ShaunBigFile shaun_big_file @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
