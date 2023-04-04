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
    std::assert(type == ObjectType::Lod_Z, "type != ObjectType::Lod_Z");
    DynArray_Z<SphereColNode> sphereColNodes;
    DynArray_Z<BoxCol> boxCols;
    FadeDistances fade;
    std::assert(fade.y == 0, "fade.y != 0");
    DynArray_Z<Name_Z> skin_or_mesh_names;
    u32 zero;
    std::assert(zero == 0, "zero != 0");
    OptionalU32<Map_Z<u32, Name_Z>> animation_entries;
    OptionalU32<Map_Z<u32, Name_Z>> sound_entries;
    Name_Z user_define_name;
};

Lod_Z lod_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
