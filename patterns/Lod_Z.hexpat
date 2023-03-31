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
    PascalArray<SphereColNode> sphereColNodes;
    PascalArray<BoxCol> boxCols;
    /// gets fed to the same close function as in mesh
    /// close.y always 0
    Vec3f close;
    /// Pascal array of skin and/or mesh crc32s
    PascalArray<Name_Z> skin_or_mesh_names;
    /// Always 0
    u32 zero;
    /// Optional map of ids to animation crc32s
    OptionalU32<Map<u32, Name_Z> > animation_entries; // ImHex needs a space between >>
    /// Optional map of ids to sound crc32s
    OptionalU32<Map<u32, Name_Z> > sound_entries; // ImHex needs a space between >>
    Name_Z user_define_name;
};

Lod_Z lod_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
