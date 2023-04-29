#pragma MIME application/x-collision-vol-z

#include <fuel.hexpat>

struct CollisionVolInfo {
    Mat4f local_transform;
    Mat4f local_transform_inverse;
};

struct CollisionVol_Z : Object_Z {
    std::assert(type == ObjectType::CollisionVol_Z, "type != ObjectType::CollisionVol_Z");
    DynArray_Z<CollisionVolInfo> collision_vol_info;
    std::assert(collision_vol_info.size == 1, "collision_vol_info.size != 1");
    Name_Z in_message_id;
    std::assert(in_message_id == 0, "in_message_id != 0");
    Name_Z out_message_id;
    std::assert(out_message_id == 0, "out_message_id != 0");
    Name_Z node_name_params[12];
    std::assert(all_eq(node_name_params, 0), "!all_eq(node_name_params, 0)");
    f32 float_params[12];
    std::assert(all_eq(float_params, 0), "!all_eq(float_params, 0)");
    DynArray_Z<Name_Z> anim_frame_names;
    std::assert(anim_frame_names.size == 0, "anim_frame_names.size != 0");
    DynArray_Z<Name_Z> material_anim_names;
    std::assert(material_anim_names.size == 0, "material_anim_names.size != 0");
    Name_Z volume_type;
    /// Delay between when StartNodeAnims is called and the animFrames actually start playing
    f32 delay;
    std::assert(delay == 0, "delay != 0");
};

CollisionVol_Z collision_vol_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
