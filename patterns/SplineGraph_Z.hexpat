#include <fuel.hexpat>

struct Unknown {
    u16 unknown0;
    u16 unknown1;
    u16 unknown2;
    u16 unknown3;
    u16 unknown4;
    u16 unknown5;
    f32 f32s[12];
} [[static]];

struct Unknown1 {
    Unknown unknowns[4];
} [[static]];

struct SplineGraph_Z : Object_Z {
    /// size equals unknown7s.size, unknown8s.size
    PascalArray<Vec3f> vecs;
    /// size equals unknown9.size
    PascalArray<Unknown1> unknown1s;
    /// [0, 1]
    f32 unknown2;
    /// [0, 1]
    f32 unknown3;
    /// [0, 1]
    f32 unknown4;
    /// [0, 1]
    f32 unknown5;
    /// [0, 1]
    f32 unknown6;
    /// size equals unknown0s.size, unknown8s.size
    /// filled with 0s
    PascalArray<u32> unknown7s;
    /// size equals unknown0s.size, unknown8s.size
    /// filled with 0s
    PascalArray<PascalArray<u8> > unknown8s; // ImHex needs a space between >>
    /// size equals unknown1Count
    /// filled with 0s
    PascalArray<PascalArray<u8> > unknown9s; // ImHex needs a space between >>
};

SplineGraph_Z spline_graph_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
