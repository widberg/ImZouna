#pragma MIME application/x-material-z

#include <zouna.hexpat>

bitfield MaterialEnabledBitmaps {
    DIFFUSE : 1;
    UNUSED0 : 1;
    SPECULAR : 1;
    ADD_NORMAL_LOCAL : 1;
    OCCLUSION : 1;
    NORMAL : 1;
    DIRT : 1;
    NORMAL_LOCAL : 1;
    UNUSED1 : 1;
    padding : 23;
};

bitfield MaterialRdrFlags {
    padding : 5;
    TRANSPARENCY : 1;
    padding : 26;
};

struct Material_Z : ResourceObject_Z {
    RGB diffuse;
    f32 opacity;
    RGB emission;
    i32 unknown0;
    /// Over written by the following when updated
    /// (t_scale.x * cos(t_rotation), t_scale.x * sin(t_rotation))
    Vec2f t_matrix_top_left;
    /// Can be -1
    i32 some_number;
    u32 flags1;
    /// Over written by the following when updated
    /// (-t_scale.y * sin(t_rotation), t_scale.y * cos(t_rotation))
    Vec2f t_matrix_bottom_right;
    MaterialEnabledBitmaps enabled_bitmaps;
    /// 0x20 is set if opacity < 1
    MaterialRdrFlags rdr_flag;
    /// Over written by the following when updated
    /// (t_translation.x - (t_matrix_top_left.x + t_matrix_top_left.y) * 0.5 + 0.5,
    ///  t_translation.y - (t_matrix_bottom_right.x + t_matrix_bottom_right.y) * 0.5 + 0.5)
    Vec2f t_matrix_offset;
    f32 t_matrix_scale;
    f32 t_rotation;
    RGB specular;
    f32 alpha_ref;
    f32 env_map_factor;
    f32 spec_map_factor;
    f32 bump_map_factor;
    f32 param4;
    Vec2f t_translation;
    Vec2f t_scale;
    Vec2f something_bitmap_related;
    std::assert(something_bitmap_related.data[0] + something_bitmap_related.data[1] == 0 || enabled_bitmaps.UNUSED1 == 1, "something_bitmap_related[0] + something_bitmap_related[1] != 0 && enabled_bitmaps.UNUSED1 != 1");
    Name_Z s_diffuse_bitmap_name;
    std::assert(s_diffuse_bitmap_name == 0 || enabled_bitmaps.DIFFUSE == 1, "s_diffuse_bitmap_name != 0 && enabled_bitmaps.DIFFUSE != 1");
    Name_Z unused_bitmap_name0;
    std::assert(unused_bitmap_name0 == 0 && enabled_bitmaps.UNUSED0 == 0, "unused_bitmap_name0 != 0 || enabled_bitmaps.UNUSED0 != 0");
    Name_Z s_specular_bitmap_name;
    std::assert(s_specular_bitmap_name == 0 || enabled_bitmaps.SPECULAR == 1, "s_specular_bitmap_name != 0 && enabled_bitmaps.SPECULAR != 1");
    /// Rarely set
    /// Very green
    Name_Z s_add_normal_local_bitmap_name1;
    std::assert(s_add_normal_local_bitmap_name1 == 0 || enabled_bitmaps.ADD_NORMAL_LOCAL == 1, "s_add_normal_local_bitmap_name1 != 0 && enabled_bitmaps.ADD_NORMAL_LOCAL != 1");
    Name_Z s_occlusion_bitmap_name;
    std::assert(s_occlusion_bitmap_name == 0 || enabled_bitmaps.OCCLUSION == 1, "s_occlusion_bitmap_name != 0 && enabled_bitmaps.OCCLUSION != 1");
    Name_Z s_normal_bitmap_name;
    std::assert(s_normal_bitmap_name == 0 || enabled_bitmaps.NORMAL == 1, "s_normal_bitmap_name != 0 && enabled_bitmaps.NORMAL != 1");
    std::assert(s_add_normal_local_bitmap_name1 == 0 || s_normal_bitmap_name == 0, "s_add_normal_local_bitmap_name1 != 0 && s_normal_bitmap_name != 0");
    Name_Z s_dirt_bitmap_name;
    std::assert(s_dirt_bitmap_name == 0 || enabled_bitmaps.DIRT == 1, "s_dirt_bitmap_name != 0 && enabled_bitmaps.DIRT != 1");
    /// Rarely set
    Name_Z s_normal_local_bitmap_name;
    std::assert(s_normal_local_bitmap_name == 0 || enabled_bitmaps.NORMAL_LOCAL == 1, "s_normal_local_bitmap_name != 0 && enabled_bitmaps.NORMAL_LOCAL != 1");
    std::assert(s_normal_local_bitmap_name == 0 || s_normal_bitmap_name == 0, "s_normal_local_bitmap_name != 0 && s_normal_bitmap_name != 0");
    std::assert(s_normal_local_bitmap_name == 0 || s_add_normal_local_bitmap_name1 == 0, "s_normal_local_bitmap_name != 0 && s_add_normal_local_bitmap_name1 != 0");
    /// Still 0 even when enabled_bitmaps.UNUSED1 is set
    Name_Z unused_bitmap_name1;
    std::assert(unused_bitmap_name1 == 0, "unused_bitmap_name1 != 0");
};

Material_Z material_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
