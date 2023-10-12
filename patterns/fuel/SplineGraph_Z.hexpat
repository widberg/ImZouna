#pragma MIME application/x-spline-graph-z

#include <zouna.hexpat>

struct SplineGraph_Z : Spline_Z {
    std::assert(type == ObjectType::SplineGraph_Z, "type != ObjectType::SplineGraph_Z");
    std::assert(vec.data[0] >= 0 && vec.data[0] <= 1, "vec[0] < 0 || vec[0] > 1");
    std::assert(vec.data[1] >= 0 && vec.data[1] <= 1, "vec[1] < 0 || vec[1] > 1");
    std::assert(vec.data[2] >= 0 && vec.data[2] <= 1, "vec[2] < 0 || vec[2] > 1");
    std::assert(vec.data[3] >= 0 && vec.data[3] <= 1, "vec[3] < 0 || vec[3] > 1");
    std::assert(length == 0, "length == 0");
    DynArray_Z<u32> point_names;
    std::assert(point_names.size == points.size, "point_names.size != points.size");
    std::assert(all_eq(point_names.data, 0), "!all_eq(point_names.data, 0)");
    DynArray_Z<DynArray_Z<u8>> point_datas;
    std::assert(point_datas.size == point_names.size, "point_datas.size != point_names.size");
    std::assert(all_empty(point_datas.data), "!all_empty(point_datas.data)");
    DynArray_Z<DynArray_Z<u8>> spline_segment_datas;
    std::assert(spline_segment_datas.size == spline_segments.size, "spline_segment_datas.size != spline_segments.size");
    std::assert(all_empty(spline_segment_datas.data), "!all_empty(spline_segment_datas.data)");
};

SplineGraph_Z spline_graph_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
