#pragma MIME application/x-surface-datas-z

#include <fuel.hexpat>

struct SurfaceDatas_Z : ResourceObject_Z {
    /// Always 1
    u32 one;
};

SurfaceDatas_Z surface_datas_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
