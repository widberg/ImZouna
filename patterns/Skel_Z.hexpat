#pragma MIME application/x-skel-z

#include <fuel.hexpat>

struct Bone {
    Name_Z user_define_name;
    Quat transform_rotation_inverse0;
    Vec3f transform_scale;
    u32 bone_flags;
    /// not exactly equal but definitely related
    Vec3f transform_row3;
    u32 child_bone_begin;
    Vec3f transform_row0;
    /// placeholder junk value from the exporter
    u16 some_placeholder0;
    /// placeholder junk value from the exporter
    u16 some_placeholder1;
    Vec3f transform_row1;
    /// placeholder junk pointer from the exporter
    u32 some_mat_ptr1_placeholder;
    Vec3f transform_row2;
    /// placeholder junk pointer from the exporter
    u32 some_mat_ptr2_placeholder;
    Quat transform_rotation_inverse1;
    /// (-1, -1, -1) on latest
    /// (0, 0, 0) on p_moto and traffic_tm
    Vec3i32 placeholder_vec0;
    /// placeholder junk pointer from the exporter
    u32 parent_bone_ptr_placeholder;
    /// (-1, -1, -1) on latest
    /// (0, 0, 0) on p_moto and traffic_tm
    Vec3i32 placeholder_vec1;
    /// placeholder junk pointer from the exporter
    u32 some_bone_ptr_placeholder;
    /// (-1, -1, -1) on latest
    /// (0, 0, 0) on p_moto and traffic_tm
    Vec3i32 placeholder_vec2;
    /// placeholder junk pointer from the exporter
    u32 child_bone_ptr_placeholder;
    Mat4f transformation;
    i32 parent_index;
    i32 child_bones_index0;
    i32 child_bones_index1;
    i32 some_bone_index;
    Name_Z bone_name;
};

struct SphereColBone {
    Sphere_Z sphere;
    Name_Z names[3];
};

struct BoxColBone {
    Mat4f mat;
    Name_Z names[3];
};

struct Skel_Z : ResourceObject_Z {
    /// ObjectDatas_Z
    /// same flags as LodData_Z
    u32 flags;
    Sphere_Z bounding_sphere_center;
    PascalArray<Bone> bones;
    PascalArray<Name_Z> material_names;
    PascalArray<Name_Z> mesh_data_names;
    PascalArray<PascalArray<Name_Z> > animation_node_names_arrays;  // ImHex needs a space between >>
    PascalArray<Name_Z> some_names;
    PascalArray<SphereColBone> sphere_col_bones0;
    PascalArray<SphereColBone> sphere_col_bones1;
    PascalArray<BoxColBone> box_col_bones;
};

Skel_Z skel_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
