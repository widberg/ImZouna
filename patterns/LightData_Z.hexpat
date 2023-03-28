#include <fuel.hexpat>

struct LightData_Z : ResourceObject_Z {
    /// 0/1
    u32 object_Datas;
    /// normalized
    Vec3f facing;
    /// not normalized
    Vec3f local_collision_sphere;
    /// (-1, -1, -1)/(0, 0, 0)
    Vec3i32 unused_vec;
    /// 0x00200000 if option = 0
    /// 0x00400000 if option = 1
    u32 flags;
    /// not normalized
    /// Slightly smaller values than local_collision_sphere
    Vec3f local_collision_sphere_facing;
};

LightData_Z light_data_z @ 0x0;
