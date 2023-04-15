#pragma MIME application/x-gen-world-z

#include <fuel.hexpat>

struct Category {
    /// Always 1
    /// Means enabled?
    /// Stored into the category object
    u32 one;
    std::assert(one == 1, "one != 1");
    DynArray_Z<Name_Z> node_name_arrays;
};

struct cA_FlatSurface {
    u32 zero0;
    std::assert(zero0 == 0, "zero0 != 0");
    Mat4f mat;
    f32 a;
    f32 b;
    f32 c;
    f32 reciprocal;
    Vec3f vec;
    f32 unknown1;
    f32 unknown3;
    u32 zero1;
    std::assert(zero1 == 0, "zero1 != 0");
    u32 zero2;
    std::assert(zero2 == 0, "zero2 != 0");
    u32 zero3;
    std::assert(zero3 == 0, "zero3 != 0");
    u32 zero4;
    std::assert(zero4 == 0, "zero4 != 0");
    i32 unknown9;
    std::assert(unknown9 == -1, "unknown9 != -1");
    /// gets clamped to be less than or equal to 6
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

struct RegionEdge {
    u32 region_vertices_index_a;
    u32 region_vertices_index_b;
};

struct Region {
    u8 unknown;
    /// Indices into the region_edges array
    DynArray_Z<u32> region_edges_indices;
};

struct GenWorld_Z : Object_Z {
    std::assert(type == ObjectType::GenWorld_Z, "type != ObjectType::GenWorld_Z");
    Name_Z node_name;
    Name_Z user_define_name;
    Name_Z gw_road_name;
    /// Describe how the world is generated
    /// Type of terrain/grass/stuff
    /// Helipad vertices
    DynArray_Z<Name_Z> binary_names;
    DynArray_Z<Name_Z> bitmap_names;
    DynArray_Z<Name_Z> material_names;
    u32 equals41;
    std::assert(equals41 == 41, "equals41 != 41");
    /// Valid id values:
    ///   * TREES
    ///   * BUSHES
    ///   * ROCKS - Appears in an object but empty and the game ignores it
    Map_Z<PascalStringNULL, Category> categories;
    /// Override terrain generation with a flat area
    /// Used around camps, races, and landmarks
    DynArray_Z<cA_FlatSurface> cA_FlatSurfaces;
    /// Doesn't generate tress, rocks, and stuff in the mat volumes
    /// Used around the bridges at big cauldrons edge to keep trees from poking through them
    /// Same with some areas around the start of races
    /// Roads already cancel object placement so its not necessary if roads are used over that area
    DynArray_Z<Mat4f> cancel_object_placement;
    DynArray_Z<Unused10> unused10s;
    std::assert(unused10s.size == 0, "unused10s.size != 0");
    DynArray_Z<Vec2f> region_vertices;
    DynArray_Z<RegionEdge> region_edges;
    Map_Z<FixedStringNULL<31>, Region> regions;
};

GenWorld_Z gen_world_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
