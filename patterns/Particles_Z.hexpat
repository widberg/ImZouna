#pragma MIME application/x-particles-z

#include <fuel.hexpat>

struct ParticlesElement {
        u16 unknown00;
        u16 unknown01;
        f32 unknown1;
        f32 unknown2;
        f32 unknown3;
        f32 unknown4;
        f32 unknown5;
        f32 unknown6;
        f32 unknown7;
        f32 unknown8;
        f32 unknown9;
        f32 unknown10;
        f32 unknown11;
        f32 unknown12;
        f32 unknown13;
        f32 unknown14;
        f32 unknown15;
        f32 unknown16;
        f32 unknown17;
        u32 flags;
        KeyframerVec2fLinear_Z unknown60;
        KeyframerVec4fLinear_Z unknown61;
        KeyframerVec4fLinear_Z unknown62;
        KeyframerFloatLinear_Z unknown63;
        KeyframerVec3fLinear_Z unknown64;
        KeyframerVec3fLinear_Z unknown65;
        KeyframerFloatLinear_Z unknown66;
        Name_Z material_anim_name;
};

struct Particles_Z : Object_Z {
    PascalArray<ParticlesElement> elements;
    PascalArray<Mat4f> mats;
    f32 unknown2;
    u16 unknown3;
};

Particles_Z particles_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
