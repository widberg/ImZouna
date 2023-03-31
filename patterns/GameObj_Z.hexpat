#pragma MIME application/x-game-obj-z

#include <fuel.hexpat>

struct Prefab {
    /// String contents of the child
    /// NULL terminated
    PascalStringNULL string;
    /// 0 when the str is PIPO or empty or other values
    /// 1 when its a vehicle name or something
    /// 2 when its spawned in by automesh
    /// maybe related to when the object is physical?
    u32 in_world;
    std::assert(in_world == 0 || in_world == 1 || in_world == 2, "in_world != 0,1,2");
    /// Child objects in the hierarchy
    PascalArray<Name_Z> names;
};

struct GameObj_Z : ResourceObject_Z {
    PascalArray<Prefab> prefabs;
};

GameObj_Z game_obj_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
