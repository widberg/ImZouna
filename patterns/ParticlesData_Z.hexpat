#pragma MIME application/x-particles-data-z

#include <fuel.hexpat>

struct ParticlesData_Z : ObjectDatas_Z {
    std::assert(flags.FL_OBJECTDATAS_HIDE == 1, "flags.FL_OBJECTDATAS_HIDE != 1");
    std::assert(flags.FL_OBJECTDATAS_CODE_CONTROL == 0, "flags.FL_OBJECTDATAS_CODE_CONTROL != 0");
    std::assert(flags.FL_OBJECTDATAS_CLONED == 0, "flags.FL_OBJECTDATAS_CLONED != 0");
    std::assert(flags.FL_OBJECTDATAS_SKINNED == 0, "flags.FL_OBJECTDATAS_SKINNED != 0");
    std::assert(flags.FL_OBJECTDATAS_MORPHED == 0, "flags.FL_OBJECTDATAS_MORPHED != 0");
    std::assert(flags.FL_OBJECTDATAS_VREFLECT == 0, "flags.FL_OBJECTDATAS_VREFLECT != 0");
    std::assert(flags.FL_OBJECTDATAS_HIDE_SHADOW == 0, "flags.FL_OBJECTDATAS_HIDE_SHADOW != 0");
    std::assert(flags.FL_OBJECTDATAS_STATIC_SHADOW == 0, "flags.FL_OBJECTDATAS_STATIC_SHADOW != 0");
    std::assert(flags.FL_OBJECTDATAS_VP0_HIDE == 1, "flags.FL_OBJECTDATAS_VP0_HIDE != 1"); // When 0 it doesn't show up
    std::assert(flags.FL_OBJECTDATAS_VP1_HIDE == 0, "flags.FL_OBJECTDATAS_VP1_HIDE != 0");
    std::assert(flags.FL_OBJECTDATAS_VP2_HIDE == 0, "flags.FL_OBJECTDATAS_VP2_HIDE != 0");
    std::assert(flags.FL_OBJECTDATAS_VP3_HIDE == 0, "flags.FL_OBJECTDATAS_VP3_HIDE != 0");
    std::assert(flags.FL_OBJECTDATAS_LAST == 0, "flags.FL_OBJECTDATAS_LAST != 0");
    Vec3f position;
    FadeDistances fade;
    DynArray_Z<u16> shorts;
    u32 zero;
    std::assert(zero == 0, "zero != 0");
};

ParticlesData_Z particles_data_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
