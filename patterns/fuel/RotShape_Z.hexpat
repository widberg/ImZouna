#pragma MIME application/x-rot-shape-z

#include <zouna.hexpat>

enum BillboardMode : u16 {
    /// The sprite's Y rotation will be adjusted so that it faces the camera. Viewing the sprite from the top or bottom will break the illusion.
    Y_BILLBOARD = 0,
    /// The sprite will rotate on all axis so that it faces the camera.
    COMPLETE_BILLBOARD = 1,
};

struct RotShape_Z : Points_Z {
    std::assert(type == ObjectType::RotShape_Z, "type != ObjectType::RotShape_Z");
    /// Translation for each rotshape
    DynArray_Z<Vec3f> origins;
    f32 zero;
    std::assert(zero == 0, "zero != 0");
    /// Index in material_anim_names for each rotshape
    /// 1 per origin
    DynArray_Z<u32> material_anim_names_indices;
    std::assert(origins.size == material_anim_names_indices.size, "origins.size != material_anim_names_indices.size");
    /// The top left and bottom right corners offset from the translation
    /// 2 per origin
    DynArray_Z<Vec3f> sizes;
    std::assert(sizes.size == origins.size * 2, "sizes.size != material_anim_names_indices.size * 2");
    /// Texcoords of corners of each rotshape
    /// Clockwise with 4 per origin
    DynArray_Z<Vec2f> texcoords;
    std::assert(texcoords.size == origins.size * 4, "texcoords.size != origins.size * 4");
    DynArray_Z<Name_Z> material_anim_names;
    f32 scale;
    std::assert(scale == 0 || scale == 200 || scale == 300, "scale != 0,200,300");
    BillboardMode billboard_mode;
    std::assert(std::core::is_valid_enum(billboard_mode), "!std::core::is_valid_enum(billboard_mode)");
};

RotShape_Z rot_shape_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
