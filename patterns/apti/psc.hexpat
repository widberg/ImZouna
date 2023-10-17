struct Psc {
    u32 decompressed_size;
    u32 compressed_size;
    if (compressed_size != 0) {
        // https://gist.github.com/widberg/585a953791bc122eba1ad0c465c83b3d#file-unlzx-c
        u8 data[compressed_size];
    } else {
        u8 data[decompressed_size];
    }
};

Psc psc @ 0x0;
