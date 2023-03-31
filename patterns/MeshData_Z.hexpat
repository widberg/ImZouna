#pragma MIME application/x-mesh-data-z

#include <fuel.hexpat>

struct MeshData_Z : ObjectDatas_Z {
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
    u32 zero0;
    std::assert(zero0 == 0, "zero0 != 0");
    u32 zero1;
    std::assert(zero1 == 0, "zero1 != 0");
    u32 zero2;
    std::assert(zero2 == 0, "zero2 != 0");
    u32 zero3;
    std::assert(zero3 == 0, "zero3 != 0");
};

MeshData_Z mesh_data_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
