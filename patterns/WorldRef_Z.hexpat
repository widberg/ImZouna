#pragma MIME application/x-world-ref-z

#include <fuel.hexpat>

struct UUIDPair {
    /// some number that looks like a crc32 but isn't
    /// these values are generally close to each other
    u32 uuid0;
    u32 uuid1;
};

struct WorldRef_Z : Object_Z {
    Name_Z node_name0;
    Name_Z warp_name;
    Name_Z gameObj_name;
    Name_Z unused14;
    Name_Z gen_world_name;
    Name_Z node_name1;
    DynArray_Z<u32> unused17s;
    DynArray_Z<u8> unuseds;
    DynArray_Z<Mat4f> mats;
    Vec3f pointA;
    Vec3f pointB;
    DynArray_Z<UUIDPair> uuid_pairs;
    /// comma-separated list of TSC commands
    /// EX: "OpenBF WORLD\USA1_REGION_HUB_SALTLAKE_37923066;LoadWorldRef DB:>LEVELS>HUBS>QUARTIER_1>3DNODEGEOMETRY>HUB_SALTLAKE.TWORLDREF;CloseBF"
    PascalStringNULL init_script;
    DynArray_Z<Name_Z> node_name2;
    /// Always 0
    /// Never read by the game
    u32 zero;
};

WorldRef_Z world_ref_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
