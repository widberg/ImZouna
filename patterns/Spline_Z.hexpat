#pragma MIME application/x-spline-z

#include <fuel.hexpat>

struct SplineSegmentSubdivision {
    /// Endpoints of the line segment
    Vec3f P[2];
    /// Length of the line segment
    /// Distance between P[0] and P[1]
    f32 length;
};

struct SplineSegment {
    /// P and T contain indices into points
    /// Control points { P[0], T[0], T[1], P[1] }
    u16 P[2];
    u16 T[2];
    /// 0x10000000
    /// 0x30000000
    u32 flags;
    std::assert(flags == 0x10000000 || flags == 0x30000000, "flags != 0x10000000,0x30000000");
    /// Length of the spline segment
    f32 length;
    /// Approximation of the spline segment divided into 8 line segments
    /// P[0] of a subdivision will always be equal to P[1] of the previous subdivision if one exists
    SplineSegmentSubdivision spline_segment_subdivisions[8];
};

struct Spline_Z : Object_Z {
    std::assert(type == ObjectType::Spline_Z, "type != ObjectType::Spline_Z");
    DynArray_Z<Vec3f> points;
    DynArray_Z<SplineSegment> spline_segments;
    /// (1, 0, 0, 1)
    Vec4f vec;
    /// Length of the spline
    f32 length;
};

Spline_Z spline_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
