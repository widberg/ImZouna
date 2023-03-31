#pragma MIME application/x-gw-road-z

#include <fuel.hexpat>

struct Point {
    be i32 encoded_vec2f_data0;
    i8 encoded_vec2f_data1;
} [[static, sealed, format("format_point"), transform("format_point")]];

fn format_point(ref auto point) {
    i32 a = point.encoded_vec2f_data0;
    i32 x = a >> 12;
    i32 y = s32((point.encoded_vec2f_data1 | (a << 8)) << 12) >> 12;
    Vec2f vec2f;
    vec2f.components[0] = float(x) / 4.0;
    vec2f.components[1] = float(y) / 4.0;
    return vec2f;
};

struct Road {
    u8 type;
    PascalArrayU16<Point> points;
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
