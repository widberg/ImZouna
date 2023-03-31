#pragma MIME application/x-material-z

#include <fuel.hexpat>

struct Material_Z : ResourceObject_Z { // 172
    /// rgba
    RGBA color;
    RGB emission;
    i32 unknown0;
    /// Over written by the following when updated
    /// (tRotation.z * cos(tAngle), tRotation.z * sin(tAngle))
    Vec2f t_matrix_top_left;
    /// Can be -1
    i32 someNumber;
    u32 flags1;
    /// Over written by the following when updated
    /// (-tRotation.w * sin(tAngle), tRotation.w * cos(tAngle))
    Vec2f t_matrix_bottom_right;
    /// Bit flags representing which bitmap fields are enabled
    /// Least significant bit (0x1) represents the first field
    /// If somethingBitmapRelated.x + somethingBitmapRelated.y != 0 then 0x100 is set
    /// Although the last bitmap is still 0 even when 0x100 is set
    u32 enabled_bitmaps;
    /// 0x20 is set if color.w < 1
    u32 rdr_flag;
    /// Over written by the following when updated
    /// (tRotation.x - (tMatrixTopLeft.x + tMatrixTopLeft.y) * 0.5 + 0.5,
    ///  tRotation.y - (tMatrixBottomRight.x + tMatrixBottomRight.y) * 0.5 + 0.5)
    Vec2f t_matrix_offset;
    f32 t_matrix_scale;
    f32 t_angle;
    /// All 3 components are equal?
    Vec3f some_vec;
    f32 param0;
    f32 param1;
    f32 param2;
    f32 param3;
    f32 param4;
    Quat t_rotation;
    Vec2f something_bitmap_related;
    Name_Z s_diffuse_bitmap_name;
    /// Always 0?
    Name_Z unknown_bitmap_name0;
    Name_Z s_specular_bitmap_name;
    /// Rarely set
    /// Very green
    /// When this is set the other normal bitmap is 0
    Name_Z s_add_normal_local_bitmap_name1;
    Name_Z s_occlusion_bitmap_name;
    Name_Z s_normal_bitmap_name;
    Name_Z s_dirt_bitmap_name;
    /// Rarely set
    /// When this is set the other normal bitmap is 0
    Name_Z s_normal_local_bitmap_name;
    /// Always 0?
    Name_Z unknown_bitmap_name1;
};

Material_Z material_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
