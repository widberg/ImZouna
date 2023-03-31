#pragma MIME application/x-animation-z

#include <fuel.hexpat>

struct AnimationNode {
    KeyframerRot_Z unknown0;
    KeyframerBezierRot_Z unknown1;
    KeyframerVec3fComp_Z unknown2;
    KeyframerVec3fComp_Z unknown3;
    KeyframerMessage_Z unknown4;
};

struct AnimationMaterial {
    KeyframerFloatComp_Z unknown0;
    KeyframerFloatComp_Z unknown1;
    KeyframerVec3fComp_Z unknown2;
    KeyframerVec3fComp_Z unknown3;
    KeyframerFloatComp_Z unknown4;
};

struct AnimationMesh {
    KeyframerFloatComp_Z unknown;
};

struct AnimationMorph {
    KeyframerFloatComp_Z unknown;
};

struct Unknown12 {
    u32 unknown0;
    u32 unknown1;
    u32 unknown2;
    u32 unknown3;
    u32 unknown4;
    u32 unknown5;
    u32 unknown6;
};

struct Unknown13 {
    u32 unknown0;
    u32 unknown1;
    u32 unknown2;
    u32 unknown3;
    u32 unknown4;
    u32 unknown5;
    u32 unknown6;
};

struct Unknown14 {
    u32 unknown0;
    u32 unknown1;
    u32 unknown2;
};

struct Animation_Z : ResourceObject_Z {
    f32 a;
    f32 b;
    u16 c;
    u16 d;
    AnimationNode animationNode;
    AnimationMaterial animationMaterial;
    AnimationMesh animationMesh;
    AnimationMorph animationMorph;
    PascalArray<Unknown12> unknown12s;
    PascalArray<Unknown13> unknown13s;
    PascalArray<Unknown14> unknown14s;
    PascalArray<Unknown14> unknown15s;
};

Animation_Z animation_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
