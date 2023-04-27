#pragma MIME application/x-spline-graph-z

#include <fuel.hexpat>

struct SplineSegment {
    /// P and T contain indices into vertices
    /// Control points { P[0], T[0], T[1], P[1] }
    u16 P[2];
    u16 T[2];
    u16 unknown;
    std::assert(unknown == 0 || unknown == 2, "unknown != 0,2");
    u16 equals4096;
    std::assert(equals4096 == 4096, "equals4096 != 4096");
    Vec3f f32s[19];
};

struct SplineGraph_Z : Object_Z {
    std::assert(type == ObjectType::SplineGraph_Z, "type != ObjectType::SplineGraph_Z");
    DynArray_Z<Vec3f> points;
    DynArray_Z<SplineSegment> spline_segments;
    f32 unknown2;
    std::assert(unknown2 >= 0 && unknown2 <= 1, "unknown2 < 0 || unknown2 > 1");
    f32 unknown3;
    std::assert(unknown3 >= 0 && unknown3 <= 1, "unknown3 < 0 || unknown3 > 1");
    f32 unknown4;
    std::assert(unknown4 >= 0 && unknown4 <= 1, "unknown4 < 0 || unknown4 > 1");
    f32 unknown5;
    std::assert(unknown5 >= 0 && unknown5 <= 1, "unknown5 < 0 || unknown5 > 1");
    f32 unknown6;
    std::assert(unknown6 >= 0 && unknown6 <= 1, "unknown6 < 0 || unknown6 > 1");
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
