#pragma MIME application/x-lod-z

#include <fuel.hexpat>

struct Lod_Z : Object_Z {
    std::assert(type == ObjectType::Lod_Z, "type != ObjectType::Lod_Z");
    DynArray_Z<DynSphere> dyn_spheres;
    DynArray_Z<DynBox> dyn_boxes;
    FadeDistances fade;
    std::assert(fade.y == 0, "fade.y != 0");
    DynArray_Z<Name_Z> skin_or_mesh_names;
    u32 zero;
    std::assert(zero == 0, "zero != 0");
    OptionalU32<Map_Z<u32, Name_Z>> animation_entries;
    OptionalU32<Map_Z<u32, Name_Z>> sound_entries;
    /// SPEEDFACTOR
    /// MASSEVOLUMIQUE
    /// HRDEPTH
    /// HIMMOBILE
    /// DISAPPEAREXPLO
    /// EXPLODAMAGE
    /// MINPOWER
    /// NOMAGNET
    /// DAMAGE
    /// EXPLOTOUCH
    /// EXPLOFX
    /// HIDESONS
    /// NUMBER
    /// DELAY
    /// REPLACE
    /// LIFETIME
    /// OBJECT
    Name_Z user_define_name;
};

Lod_Z lod_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
