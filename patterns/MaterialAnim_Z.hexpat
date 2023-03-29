#include <fuel.hexpat>

struct MaterialAnim_Z : ResourceObject_Z {
    KeyframerHdl_Z unknown0;
    KeyframerVec2fLinear_Z unknown1;
    KeyframerVec2fLinear_Z unknown2;
    KeyframerFloatLinearComp_Z unknown3;
    KeyframerVec3fLinear_Z unknown4;
    KeyframerVec3fLinear_Z unknown5;
    KeyframerFloatLinearComp_Z unknown6;
    KeyframerVec4fLinear_Z unknown7;
    KeyframerVec4fLinear_Z unknown8;
    KeyframerFlag_Z unknown9;
    KeyframerFlag_Z unknown10;
    Name_Z materialCRC32;
    f32 unknownFloat;
    u8 unknown15;
};

MaterialAnim_Z material_anim_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
