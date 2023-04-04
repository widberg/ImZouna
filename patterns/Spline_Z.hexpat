#pragma MIME application/x-spline-z

#include <fuel.hexpat>

struct SplineSubsection {
    Vec3f point1;
    Vec3f point2;
    f32 length;
};

struct SplineSection {
    u16 P[2];
    u16 T[2];
    u32 flags;
    f32 length;
    SplineSubsection spline_subsections[8];
};

struct Spline_Z : Object_Z {
    std::assert(type == ObjectType::Spline_Z, "type != ObjectType::Spline_Z");
    DynArray_Z<Vec3f> vertices;
    DynArray_Z<SplineSection> spline_sections;
    /// (1, 0, 0, 1)
    Vec4f vec;
    f32 length;
};

Spline_Z spline_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
