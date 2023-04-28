#pragma MIME application/x-spline-graph-z

#include <fuel.hexpat>

struct SplineGraph_Z : Spline_Z {
    std::assert(type == ObjectType::SplineGraph_Z, "type != ObjectType::SplineGraph_Z");
    std::assert(vec.data[0] >= 0.0 && vec.data[0] <= 1.0, "vec[0] < 0.0 || vec[0] > 1.0");
    std::assert(vec.data[1] >= 0.0 && vec.data[1] <= 1.0, "vec[1] < 0.0 || vec[1] > 1.0");
    std::assert(vec.data[2] >= 0.0 && vec.data[2] <= 1.0, "vec[2] < 0.0 || vec[2] > 1.0");
    std::assert(vec.data[3] >= 0.0 && vec.data[3] <= 1.0, "vec[3] < 0.0 || vec[3] > 1.0");
    std::assert(length == 0.0, "length == 0.0");
    DynArray_Z<u32> unknown7s;
    std::assert(unknown7s.size == points.size, "unknown7s.size != points.size");
    std::assert(all_eq(unknown7s.data, 0), "!all_eq(unknown7s.data, 0)");
    DynArray_Z<DynArray_Z<u8>> unknown8s;
    std::assert(unknown8s.size == unknown7s.size, "unknown8s.size != unknown7s.size");
    std::assert(all_empty(unknown8s.data), "!all_empty(unknown8s.data)");
    DynArray_Z<DynArray_Z<u8>> unknown9s;
    std::assert(unknown9s.size == spline_segments.size, "unknown9s.size != spline_segments.size");
    std::assert(all_empty(unknown9s.data), "!all_empty(unknown9s.data)");
};

SplineGraph_Z spline_graph_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
