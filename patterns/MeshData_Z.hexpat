#include <fuel.hexpat>

struct MeshData_Z : ResourceObject_Z {
    /// bool 0/1
    /// 0 for TRAFFIC_TM and P_MOTO
    /// 1 for things like THE_INTRO and vehicles
    u32 notTRAFFIC_TMorP_MOTO;
    u32 zero0;
    u32 zero1;
    u32 zero2;
    u32 zero3;
};

MeshData_Z mesh_data_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
