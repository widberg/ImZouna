#pragma endian little

#include <zouna.hexpat>

struct GearBigFileFile {
    u64 position = parent.fat.FatPositionTable[std::core::array_index()];
    u32 size = parent.fat.FatSizeTable[std::core::array_index()];
    match (parent.header.UIDSize) {
        (1): u8 uid = parent.fat.FatUIDTable[std::core::array_index()];
        (2): u16 uid = parent.fat.FatUIDTable[std::core::array_index()];
        (4): u32 uid = parent.fat.FatUIDTable[std::core::array_index()];
        (8): u64 uid = parent.fat.FatUIDTable[std::core::array_index()];
        (_): u8 error[-1];
    }
    u8 packing_type = parent.fat.FatPackingTypeTable[std::core::array_index()];
    // Change size to 1 if it takes too long to load
    u8 data[size] @ position [[sealed]];
};

struct GearBigFileExtraFileInfoSection {
    if (parent.header.ExtraFileInfoSize) {
        u32 ExtraFileInfoTableSize;
        u8 RawExtraFileInfoTable[ExtraFileInfoTableSize * parent.header.NbFiles];
    }
};

struct GearBigFileGatherSection {
    if (parent.header.GatherMode) {
        u32 GatherTableSize;
        u8 RawGatherTbl[GatherTableSize];
    }
};

struct GearBigFileFat {
    u64 FatPositionTable[parent.header.NbFiles];
    u32 FatSizeTable[parent.header.NbFiles];
    match (parent.header.UIDSize) {
        (1): u8 FatUIDTable[parent.header.NbFiles];
        (2): u16 FatUIDTable[parent.header.NbFiles];
        (4): u32 FatUIDTable[parent.header.NbFiles];
        (8): u64 FatUIDTable[parent.header.NbFiles];
        (_): u8 error[-1];
    }
    u8 FatPackingTypeTable[parent.header.NbFiles];
};

#define GEAR_BIGFILE_HEADER_ID_STRING_SIZE 0x10
#define HEADER_FLAG_GATHER                 0x0001
#define HEADER_FLAG_EXTRA_FAT_INFO         0x0002
#define HEADER_FLAG_CORRUPTED              0x1000

struct GearBigFileHeader {
    char IdString[GEAR_BIGFILE_HEADER_ID_STRING_SIZE];
    u16 Version;
    u16 Flags;
    u16 UIDSize;
    u8 FilePackingHandlerBitCount; ///usually 8
    u8 Reserved;
    u32 NbFiles;
    u32 TimeDate; // Seconds since epoch
    bool GatherMode = Flags & HEADER_FLAG_GATHER;
    bool ExtraFileInfoSize = Flags & HEADER_FLAG_EXTRA_FAT_INFO;
};

struct GearBigFile {
    GearBigFileHeader header;
    GearBigFileFat fat;
    GearBigFileGatherSection gather_section;
    GearBigFileExtraFileInfoSection extra_file_info_section;
    GearBigFileFile files[header.NbFiles];
};

GearBigFile gear_big_file @ 0x0;
