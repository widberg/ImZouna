#pragma MIME application/x-lod-data-z

#include <fuel.hexpat>

struct Extended {
    u8 pad[24];
    std::assert(all_eq(pad, 0xFF), "!all_eq(pad, 0xFF)");
    /// 0x009FFC70
    /// 0x009FFE70
    u32 flags1;
    u32 zero1;
    std::assert(zero1 == 0, "zero1 != 0");
    u32 equals0x004000000;
    std::assert(equals0x004000000 == 0x00400000, "equals0x004000000 != 0x00400000");
    u32 zero2;
    std::assert(zero2 == 0, "zero2 != 0");
    u32 zero3;
    std::assert(zero3 == 0, "zero3 != 0");
    u32 zero4;
    std::assert(zero4 == 0, "zero4 != 0");
    /// always 1.0
    Vec3f scale;
    u32 zero5;
    std::assert(zero5 == 0, "zero5 != 0");
    u32 zero6;
    std::assert(zero6 == 0, "zero6 != 0");
    u32 zero7;
    std::assert(zero7 == 0, "zero7 != 0");
    u32 equals0x004000001;
    std::assert(equals0x004000001 == 0x00400000, "equals0x004000001 != 0x00400000");
    u32 zero8;
    std::assert(zero8 == 0, "zero8 != 0");
    u32 zero9;
    std::assert(zero9 == 0, "zero9 != 0");
    u32 zero10;
    std::assert(zero10 == 0, "zero10 != 0");
    u32 zero11;
    std::assert(zero11 == 0, "zero11 != 0");
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
    PascalArray<Name_Z> mesh_data_names;
    /// always 0
    u32 zero;
    Optional<Extended> extended;
};

LodData_Z lod_data_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
