#include <zouna.hexpat>

struct Header {
    char version_info[8];       /// OPAL_1.0 
    u32 flags;                /// For now, tells if it's encrypted or not (1/0)
    u32 script_count;          /// Number of scripts in the package
};

struct Script {
    i32 name;               /// CRC of the script path, relative to System folder (..\DATA\COMMON\SCRIPT\bla.tsc)
    u32 uncompressed_size;      /// Decompressed size of the stream
    u32 compressed_size;        /// Compressed size of the stream
    u32 offset_in_bigfile;       /// Offset in the compressed data in the bigfile
    u8 compressed[compressed_size] @ offset_in_bigfile; /// LZO Compressed data (They're all compressed)
};

// Decrypt with scripts/cps.py
struct CPS {
    Header header;
    Script scripts[header.script_count];
};

CPS cps @ 0x0;
