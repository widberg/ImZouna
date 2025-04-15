#pragma MIME application/x-world-z

#include <zouna.hexpat>

struct SeadEntry_Z {
    /// 0xFFFFFFFF
    u32 NextObjectOfThisEntry;
    /// 0xFFFFFFFF
    u32 PrevObjectOfThisEntry;
    /// starting at 1
    u32 NextEntryOfThisObject;
    /// 0xFFFFFFFF
    u32 placeholder2;
    u32 GridId;
    Name_Z nodeCrc32;
};

struct SeadHandle_Z {
    Vec2f PMin;
    Vec2f PMax;
    Vec2f InvDiag;
    u32 sizeX;
    u32 sizeY;
    float e;
    float f;
    float a;
    float b;
    u32 c;
    u32 d;
    u32 firstFree;
    u32 freeCount;
    DynArray_Z<u32> grid;
    DynArray_Z<SeadEntry_Z> seadEntries;
};

struct World_Z : ResourceObject_Z {
    Name_Z node_name0;
    Name_Z warp_name;
    Name_Z gameObj_name;
    Name_Z unused14;
    Name_Z gen_world_name;
    Name_Z node_name1;
    DynArray_Z<u32> unused17s;
    DynArray_Z<u8> unuseds;
    SeadHandle_Z display;
    SeadHandle_Z collision;
    DynArray_Z<Name_Z> unused6s;
    DynArray_Z<Name_Z> unused7s;
    DynArray_Z<Name_Z> unused8s;
    DynArray_Z<Name_Z> unused9s;
    DynArray_Z<Name_Z> unused10s;
    DynArray_Z<Name_Z> spline_graph_names;
    DynArray_Z<Name_Z> unused12s;
    DynArray_Z<Name_Z> material_anim_name;
};

World_Z world_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
