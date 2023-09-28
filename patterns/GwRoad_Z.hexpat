#pragma MIME application/x-gw-road-z

#include <fuel.hexpat>

struct Point {
    be i32 a;
    u8 b;
} [[sealed, format("format_point"), transform("format_point")]];

fn format_point(ref auto p) {
    i32 c = (p.b | (p.a << 8)) << 12;
    i32 x = p.a >> 12;
    i32 y = c >> 12;
    Vec2f vec2f;
    vec2f.data[0] = x / 4.0;
    vec2f.data[1] = y / 4.0;
    return vec2f;
};

bitfield Road {
    unsigned sub_type : 7;
    bool short_cut : 1;
    DynArray_ZU16<Point> points;
};

struct Unused5 {
    u32 unused0;
    u32 unused1;
    u32 unused2;
    u32 unused3;
    u32 unused4;
    u32 unused5;
    u32 unused6;
    u32 unused7;
    u32 unused8s[unused0 & 0xFFFF];
};

struct GwRoad_Z : ResourceObject_Z {
    u32 road_count;
    Vec2f gen_road_min;
    Vec2f gen_road_max;
    Road roads[road_count];
    u32 unused5_count;
    /// (-1, -1)
    Vec2f unused5_min;
    /// (1, 1)
    Vec2f unused5_max;
    Unused5 unused5s[unused5_count];
    Name_Z gen_world_name;
};

GwRoad_Z gw_road_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
