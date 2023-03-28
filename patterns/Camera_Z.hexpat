#include <fuel.hexpat>

struct Camera_Z : Object_Z {
    /// radians
    /// always 0.8726646
    f32 angle_of_view;
    /// Near plane?
    f32 zero;
    /// Target?
    Name_Z node_name;
};

Camera_Z camera_z @ 0x0;
