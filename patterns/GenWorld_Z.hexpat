#include <fuel.hexpat>

struct Category {
    /// Always 1
    /// Means enabled?
    /// Stored into the category object
    u32 one;
    PascalArray<Name_Z> node_name_arrays;
};

struct Unknown8 {
    /// always zero?
    u32 zero0;
    Mat4f mat;
    Quat quat;
    Vec3f vec;
    f32 unknown1;
    f32 unknown3;
    u32 zero1;
    u32 zero2;
    u32 zero3;
    u32 zero4;
    i16 unknown9;
    i16 unknown90;
    u8 unknown4;
    u8 unknown20;
    u8 unknown21;
    u8 unknown22;
    u8 unknown23;
    u8 unknown24;
    u8 unknown2;
};

struct Unused10 {
    u32 unused0;
    u32 unused1s[8];
    u32 unused2;
    u32 unused3;
    u32 unused4;
};

struct CoordsLineSegment {
    u32 coords_index_a;
    u32 coords_index_b;
};

struct Region {
    /// Always 0xFF
    u8 always_255;
    /// Indices into the coordsLineSegments array
    PascalArray<u32> coords_line_segments_indices;
};

struct GenWorld_Z : Object_Z {
    Name_Z node_name;
    Name_Z user_define_name;
    Name_Z gw_road_name;
    PascalArray<Name_Z> binary_names;
    PascalArray<Name_Z> bitmap_names;
    PascalArray<Name_Z> material_names;
    /// always 41
    u32 equals41;
    /// Valid id values:
    ///   * TREES
    ///   * BUSHES
    ///   * ROCKS - Appears in an object but empty and the game ignores it
    Map<PascalStringNULL, Category> categories;
    PascalArray<Unknown8> unknown8s;
    PascalArray<Mat4f> mats;
    PascalArray<Unused10> unused10s;
    PascalArray<Vec2f> coords;
    PascalArray<CoordsLineSegment> coordsLineSegments;
    Map<FixedStringNULL<31>, Region> regions;
};

GenWorld_Z gen_world_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
