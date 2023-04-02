#pragma MIME application/x-particles-z

#include <fuel.hexpat>

bitfield ParticlesEmitter_Z_Flags {
    FL_PARTICLES_LOOP : 1;
    FL_PARTICLES_LOCK_H : 1;
    FL_PARTICLES_LOCK_V : 1;
    FL_PARTICLES_USE_TOTAL : 1;
    FL_PARTICLES_NOEMIT : 1;
    FL_PARTICLES_ORIENTED : 1;
    FL_PARTICLES_NODEREL : 1;
    FL_PARTICLES_BOUNDARY_ONLY : 1;
    FL_PARTICLES_FLIP_H : 1;
    FL_PARTICLES_FLIP_V : 1;
    FL_PARTICLES_SIZEX_ONLY : 1;
    FL_PARTICLES_LIGHT : 1;
    FL_PARTICLES_SCREEN : 1;
    FL_PARTICLES_SCREENXY : 1;
    FL_PARTICLES_ACCURATE : 1;
    FL_PARTICLES_LAST : 1;
    padding : 16;
};

struct ParticlesEmitter_Z {
        u16 max_quantity;
        u16 p_cloud_type;
        Vec3f p_cloud_size;
        Vec3f p_cloud_offset;
        f32 off_axis;
        f32 off_axis_variation;
        f32 off_plane;
        f32 off_plane_variation;
        f32 velocity;
        f32 velocity_variation;
        f32 emitter_speed;
        f32 emitter_speed_variation;
        f32 loop_period;
        f32 life;
        f32 life_variation;
        ParticlesEmitter_Z_Flags flags;
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
    std::assert(type == 18, "type != 18");
    DynArray_Z<ParticlesEmitter_Z> particles_emitters;
    DynArray_Z<Mat4f> mats;
    f32 unknown2;
    u16 unknown3;
};

Particles_Z particles_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
