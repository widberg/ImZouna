#include <fuel.hexpat>

struct Extended {
    /// 0xFF
    u8 pad[24];
    /// 0x009FFC70
    /// 0x009FFE70
    u32 flags1;
    /// always 0
    u32 zero1;
    /// always 0x00400000
    u32 equals0x004000000;
    /// always 0
    u32 zero2;
    /// always 0
    u32 zero3;
    /// always 0
    u32 zero4;
    /// always 1.0
    f32 scaleX;
    /// always 1.0
    f32 scaleY;
    /// always 1.0
    f32 scaleZ;
    /// always 0
    u32 zero5;
    /// always 0
    u32 zero6;
    /// always 0
    u32 zero7;
    /// always 0x00400000
    u32 equals0x004000001;
    /// always 0
    u32 zero8;
    /// always 0
    u32 zero9;
    /// always 0
    u32 zero10;
    /// always 0
    u32 zero11;
};

struct LodData_Z : ResourceObject_Z {
    /// 0x01000000 - 
    /// 0x00000002 - 
    /// 0x00004000 - 
    /// 0x00003FFF - 
    /// 0xFFFFFFFE - 
    /// 0x000000FF - 
    /// 0xFF000000 - 
    /// 0x00001000 - 
    u32 flags;
    PascalArray<Name_Z> meshDataCRC32s;
    /// always 0
    u32 zero;
    Optional<Extended> extended;
};

LodData_Z lod_data_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
