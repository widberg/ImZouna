#pragma MIME application/x-bitmap-z

#include <fuel.hexpat>

enum BitmapClass : u16 {
    SINGLE = 0,
    CUBEMAP = 2,
};

enum BmFormat_Z : u8 {
    BM_MULTIPLE_BITMAPS = 0,
    BM_A8L8 = 7,
    BM_DXT1 = 14,
    BM_DXT5 = 16,
};

enum BitmapClass2 : u8 {
    CUBEMAP2 = 0,
    SINGLE2 = 3,
};

enum BmTransp : u8 {
    BM_NO_TRANSP = 0,
    BM_TRANSP_ONE = 1,
    BM_TRANSP = 2,
    BM_CUBEMAP = 255,
};

struct Bitmap_Z_LinkHeader : ResourceObject_Z {
    BitmapClass bitmap_class;
    std::assert(std::core::is_valid_enum(bitmap_class), "!std::core::is_valid_enum(bitmap_class)");
    u32 width;
    u32 height;
    /// 0 in LWYOMING.DPC
    /// 1429334513.Bitmap_Z
    /// 0 in MENU.DPC
    /// 1429334513.Bitmap_Z
    /// Strange behavior
    u32 bitmap_data_size;
    /// 0, 53, 60, 181
    /// Flag masks:
    ///   * 0x80 unused
    ///   * 0x20 unused
    ///   * 0x10 unused
    ///   * 0x8 unused
    ///   * 0x4 something
    ///   * 0x1 unused
    /// If u1 & 0x4 == 0, then some bools are set in the renderer
    u8 flags;
    /// Unused?
    /// Whether a bitmap is a diffuse, normal, specular, etc...
    u8 bitmap_type;
    u16 pad;
    std::assert(pad == 0, "pad != 0");
    /// lower is higher layer
    /// > 0 doesnt get drawn
    /// so transparent textures show up on top
    /// gets added to something in the renderer
    /// usually 0
    /// sometimes -1 or -2
    /// x + y + layer
    /// result of addition is often -1.0
    f32 layer;
    BmFormat_Z format0;
    std::assert(std::core::is_valid_enum(format0), "!std::core::is_valid_enum(format0)"+std::string::to_string(u8(format0)));
    u8 mip_map_count;
    u8 four;
    std::assert(four == 4, "four != 4");
    BitmapClass2 bitmap_class2;
    std::assert(std::core::is_valid_enum(bitmap_class2), "!std::core::is_valid_enum(bitmap_class2)");
    BmFormat_Z format1;
    std::assert(std::core::is_valid_enum(format1), "!std::core::is_valid_enum(format1)");
    std::assert(format1 == format0 || bitmap_class == BitmapClass::CUBEMAP, "format1 != format0 || bitmap_class != BitmapClass::CUBEMAP");
    BmTransp transparency;
    std::assert(std::core::is_valid_enum(transparency), "!std::core::is_valid_enum(transparency)");
};

struct Bitmap_Z : Bitmap_Z_LinkHeader {
    u8 data[data_size - class_object_size];
};

Bitmap_Z bitmap_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
