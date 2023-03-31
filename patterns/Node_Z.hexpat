#pragma MIME application/x-node-z

#include <fuel.hexpat>

struct Rect {
    i32 x1;
    i32 y1;
    i32 x2;
    i32 y2;
} [[static]];

struct Node_Z : ResourceObject_Z {
    /// Name of the parent Node_Z
    /// 0 if root Node_Z
    Name_Z parent_name;
    /// Name of the head child Node_Z
    /// 0 if leaf Node_Z
    Name_Z head_child_name;
    /// Name of the previous sibling
    /// 0 if head child Node_Z
    Name_Z prev_sibling;
    /// Name of the next sibling
    /// 0 if tail child Node_Z
    Name_Z next_sibling;
    Name_Z lod_or_particles_name;
    Name_Z lod_data_or_particles_data_name;
    /// Can be 0
    /// Valid contents:
    ///   * FITTOGROUND
    ///      Adjusts the Y component of the position to match the ground height
    ///   * GROUNDNORMAL
    ///      Adjusts the rotation to match the ground normal
    ///      Requires FITTOGROUND
    Name_Z user_define_name;
    Name_Z light_data_name;
    /// Always? 0
    Name_Z unused_name1;
    /// Always? 0
    Name_Z unused_name2;
    /// Normalized
    Quat rotation;
    Vec3f translation;
    /// OR'd with 0x80 on load
    u32 flags;
    /// Normalized
    Quat rotation2;
    f32 scale;
    f32 scale2;
    /// The reciprocal of scale2
    f32 reciprocal_scale2;
    /// 0
    f32 unknown10;
    /// { 1, 1, 1, 1 }
    RGBA color;
    Sphere_Z sphere;   
    /// { -1, -1, -1, -1 }
    Rect display_seads_rect;
    /// { -1, -1, 0, 0 }
    Rect collide_seads_rect;
    /// -1 in the file
    /// Set to -4 on load
    i16 negative_four;
    Mat4f worldTransformMat4;
} [[static]];

Node_Z node_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
