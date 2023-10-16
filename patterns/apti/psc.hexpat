struct Psc {
    u32 decompressed_size;
    u32 compressed_size;
    if (compressed_size != 0) {
        u8 data[compressed_size]; // Some bullshit compression algorithm
        // I ripped it from the executable and I'll write it up soon
    } else {
        u8 data[decompressed_size];
    }
};

Psc psc @ 0x0;
