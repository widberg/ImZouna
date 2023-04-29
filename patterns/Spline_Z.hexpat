#pragma MIME application/x-spline-z

#include <fuel.hexpat>

Spline_Z spline_z @ 0x0;
std::assert(spline_z.type == ObjectType::Spline_Z, "type != ObjectType::Spline_Z");
std::assert(spline_z.vec.data[0] == 1, "spline_z.vec[0] != 1");
std::assert(spline_z.vec.data[1] == 0, "spline_z.vec[1] != 0");
std::assert(spline_z.vec.data[2] == 0, "spline_z.vec[2] != 0");
std::assert(spline_z.vec.data[3] == 1, "spline_z.vec[3] != 1");

std::assert(std::mem::eof(), "Whole input not consumed");
