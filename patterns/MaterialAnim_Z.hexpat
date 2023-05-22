#pragma MIME application/x-material-anim-z

#include <fuel.hexpat>

bitfield MaterialAnimFlags {
    FLAG_0 : 1;
    FLAG_1 : 1;
    FLAG_2 : 1;
    FLAG_3 : 1;
    FLAG_4 : 1;
    FLAG_5 : 1;
    FLAG_6 : 1;
    FLAG_7 : 1;
};

struct MaterialAnim_Z : ResourceObject_Z {
    KeyframerHdl_Z bitmap_name_keyframer;
    KeyframerVec2fLinear_Z scroll_keyframer;
    KeyframerVec2fLinear_Z scale_keyframer;
    KeyframerFloatLinearComp_Z rotation_keyframer;
    KeyframerVec3fLinear_Z diffuse_keyframer;
    KeyframerVec3fLinear_Z emission_keyframer;
    KeyframerFloatLinearComp_Z alpha_keyframer;
    KeyframerVec4fLinear_Z vec4f_keyframer0;
    KeyframerVec4fLinear_Z vec4f_keyframer1;
    KeyframerFlag_Z flag_keyframer0;
    KeyframerFlag_Z flag_keyframer1;
    Name_Z base_material_name;
    f32 duration;
    MaterialAnimFlags flags;
};

MaterialAnim_Z material_anim_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
