#pragma MIME application/x-lod-z

#include <zouna.hexpat>

// There is a separate occlusion test for shadows and mesh itself
// The mesh will stop being rendered then the shadows
// The shadows can be rendered when the mesh is not
// This allows larger meshes to still have shadows when behind the camera
// Smaller meshes cast shorter shadows so the difference between when shadows
// are rendered and the mesh is will be smaller
// Maybe there is a test between some bounding box/sphere and the view frustum
// Keeping the camera in the same position and rotating it still triggers
// the different behavior so it is not distance based
// My assumption is that this is related to Lod_Z and not Mesh_Z directly but
// I may be wrong

struct Lod_Z : Object_Z {
    std::assert(type == ObjectType::Lod_Z, "type != ObjectType::Lod_Z");
    DynArray_Z<DynSphere> collision_spheres;
    DynArray_Z<DynBox> collision_boxes;
    FadeDistances fade;
    std::assert(fade.y == 0, "fade.y != 0");
    DynArray_Z<Name_Z> skin_or_mesh_or_particles_names;
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
