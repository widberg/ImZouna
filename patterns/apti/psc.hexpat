struct Psc {
    u32 decompressed_size;
    u32 compressed_size;
    if (compressed_size != 0) {
        u8 data[compressed_size];
    } else {
        u8 data[decompressed_size];
    }
};

Psc psc @ 0x0;
