#pragma MIME application/x-rtc-z

#include <zouna.hexpat>

struct RtcAnimationNode {
    Name_Z unknown_node_name;
    u16 rtc_animation_node_flag;
    KeyframerRot_Z unknown0;
    KeyframerVec3f_Z unknown1;
    KeyframerVec3f_Z unknown2;
    KeyframerMessage_Z unknown3;
};

struct AnimationCamera {
    Name_Z unknown_node_name;
    u16 animation_camera_flag;
    KeyframerFloatComp_Z unknown0;
    KeyframerFloatComp_Z unknown1;
    KeyframerFloat_Z unknown2;
    KeyframerFloatComp_Z unknown3;
};

struct AnimationOmni {
    Name_Z unknownNode_nameName;
    u16 animation_omni_flag;
    KeyframerVec3fComp_Z unknown0;
    KeyframerFloatComp_Z unknown1;
    KeyframerFloatComp_Z unknown2;
};

struct Unknown8 {
    Name_Z unknownName_name0;
    Name_Z unknownName_name1;
    Name_Z unknownName_name2;
    u32 unknown3;
    u8 unknown4;
    Name_Z unknown_name0;
    Name_Z unknown_name1;
};

struct Unknown9 {
    u32 unknown0;
    Name_Z unknownName_name0;
    Name_Z unknownName_name1;
    Name_Z unknownName_name2;
    Name_Z unknown_name0;
    Name_Z unknown_name1;
};

struct Rtc_Z : ResourceObject_Z {
    /// duration of the cinematic?
    float duration;
    DynArray_Z<RtcAnimationNode> unknown1s;
    DynArray_Z<AnimationCamera> unknown2s;
    DynArray_Z<Name_Z> unknown_names;
    DynArray_Z<AnimationOmni> animationOmnis;
    DynArray_Z<Unknown8> unknown8s;
    DynArray_Z<Unknown9> unknown9s;
    DynArray_Z<Name_Z> unknown_names1;
    DynArray_Z<Name_Z> unknown_names2;
    KeyframerMessage_Z unknown30;
};

Rtc_Z rtc_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
