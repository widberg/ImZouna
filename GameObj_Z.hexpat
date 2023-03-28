#include <fuel.hexpat>

struct Prefab {
    /// String contents of the child
    /// NULL terminated
    PascalStringNULL str;
    /// bool 0/1
    /// 0 when the str is PIPO or empty or other values
    /// 1 when its a vehicle name or something
    /// maybe related to when the object is physical?
    u32 in_world;
    /// Child objects in the hierarchy
    PascalArray<Name_Z> names;
}

struct GameObj_Z : ResourceObject_Z {
    PascalArray<Prefab> prefabs;
};

GameObj_Z game_obj_z @ 0x0;
