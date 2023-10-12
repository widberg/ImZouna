#pragma MIME application/x-surface-datas-z

#include <zouna.hexpat>

struct SurfaceDatas_Z : ObjectDatas_Z {
    ObjectDatasFlags flags;
    std::assert(flags.FL_OBJECTDATAS_HIDE == 1, "flags.FL_OBJECTDATAS_HIDE != 1");
    std::assert(flags.FL_OBJECTDATAS_CODE_CONTROL == 0, "flags.FL_OBJECTDATAS_CODE_CONTROL != 0");
    std::assert(flags.FL_OBJECTDATAS_CLONED == 0, "flags.FL_OBJECTDATAS_CLONED != 0");
    std::assert(flags.FL_OBJECTDATAS_SKINNED == 0, "flags.FL_OBJECTDATAS_SKINNED != 0");
    std::assert(flags.FL_OBJECTDATAS_MORPHED == 0, "flags.FL_OBJECTDATAS_MORPHED != 0");
    std::assert(flags.FL_OBJECTDATAS_VREFLECT == 0, "flags.FL_OBJECTDATAS_VREFLECT != 0");
    std::assert(flags.FL_OBJECTDATAS_HIDE_SHADOW == 0, "flags.FL_OBJECTDATAS_HIDE_SHADOW != 0");
    std::assert(flags.FL_OBJECTDATAS_STATIC_SHADOW == 0, "flags.FL_OBJECTDATAS_STATIC_SHADOW != 0");
    std::assert(flags.FL_OBJECTDATAS_VP0_HIDE == 0, "flags.FL_OBJECTDATAS_VP0_HIDE != 0");
    std::assert(flags.FL_OBJECTDATAS_VP1_HIDE == 0, "flags.FL_OBJECTDATAS_VP1_HIDE != 0");
    std::assert(flags.FL_OBJECTDATAS_VP2_HIDE == 0, "flags.FL_OBJECTDATAS_VP2_HIDE != 0");
    std::assert(flags.FL_OBJECTDATAS_VP3_HIDE == 0, "flags.FL_OBJECTDATAS_VP3_HIDE != 0");
    std::assert(flags.FL_OBJECTDATAS_LAST == 0, "flags.FL_OBJECTDATAS_LAST != 0");
};

SurfaceDatas_Z surface_datas_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
