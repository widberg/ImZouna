#include <fuel.hexpat>

struct MeshData_Z : ResourceObject_Z {
    /// bool 0/1
    /// 0 for old DPCs like TRAFFIC_TM and P_MOTO
    /// 1 for latest/newer DPCs like THE_INTRO and vehicles
    u32 not_traffic_tm_or_p_moto;
    std::assert(not_traffic_tm_or_p_moto == 1, "not_traffic_tm_or_p_moto != 1");
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
