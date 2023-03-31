#pragma MIME application/x-lod-z

#include <fuel.hexpat>

struct SphereColNode {
    Sphere_Z sphere;
    u32 flags;
    Name_Z link_name;
};

struct BoxCol {
    Mat4f transformation;
    u32 flags;
    Name_Z link_name;
};

struct Lod_Z : Object_Z {
    DynArray_Z<SphereColNode> sphereColNodes;
    DynArray_Z<BoxCol> boxCols;
    /// gets fed to the same close function as in mesh
    Vec3f close;
    std::assert(close.data[1] == 0, "close[1] != 0");
    /// Pascal array of skin and/or mesh crc32s
    DynArray_Z<Name_Z> skin_or_mesh_names;
    u32 zero;
    std::assert(zero == 0, "zero != 0");
    /// Optional map of ids to animation crc32s
    OptionalU32<Map<u32, Name_Z>> animation_entries;
    /// Optional map of ids to sound crc32s
    OptionalU32<Map<u32, Name_Z>> sound_entries;
    Name_Z user_define_name;
};

Lod_Z lod_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
