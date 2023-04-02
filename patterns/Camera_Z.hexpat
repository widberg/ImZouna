#pragma MIME application/x-camera-z

#include <fuel.hexpat>

struct Camera_Z : Object_Z {
    std::assert(type == 7, "type != 7");
    /// radians
    f32 angle_of_view;
    std::assert(angle_of_view == 0.8726646304130554, "angle_of_view != 0.8726646304130554");
    /// Near plane?
    f32 zero;
    std::assert(zero == 0, "zero != 0");
    /// Target?
    Name_Z node_name;
};

Camera_Z camera_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
