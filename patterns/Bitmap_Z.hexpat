#include <fuel.hexpat>

struct Bitmap_Z_LinkHeader : ResourceObject_Z {
    /// 0 for one image
    /// 2 for 6 image cubemap
    /// Always 0 except for 1 image in SHARED where it's 2
    /// used as a loop count
    /// 0, 1, 2
    /// 2 - 6
    /// !2 - 1
    /// only 0 and 2 dont lead to a fail return
    u16 multiple_images;
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
    u8 render_flags;
    /// Unused?
    /// Whether a bitmap is a diffuse, normal, specular, etc...
    u8 bitmap_type;
    /// Padding?
    /// Always 0
    u16 zero;
    /// lower is higher layer
    /// > 0 doesnt get drawn
    /// so transparent textures show up on top
    /// gets added to something in the renderer
    /// usually 0
    /// sometimes -1 or -2
    /// x + y + u7
    /// result of addition is often -1.0
    f32 layer;
    /// Unused?
    /// 14 - DXT1
    /// 16 - DXT5
    /// 0 - multiple input files
    /// always matchs dxtVersion1 except for the cube map
    u8 input_dxt_version;
    u8 mip_map_count;
    /// Unused?
    /// Always 4
    u8 four;
    /// Unused?
    /// 3 - normal
    /// 0 - multiple input images
    /// Always 3 except for the SHARED cubmap where it is 0
    u8 input_unused3;
    /// 14 - DXT1
    /// 16 - DXT5
    /// used as a loop count
    u8 dxt_version;
    /// material related
    /// 0, 1, 2
    /// If 1 material RdrFlag is ORed with 0x40
    /// If 2 material RdrFlag is ORed with 0x20
    /// Else nothing
    /// material RdrFlag Masked with 0x1f
    /// 0xFF for the cube map texture
    u8 rdr_related;
};

struct Bitmap_Z : Bitmap_Z_LinkHeader {
    /// DXT1 or DXT5 compressed image data based on dxtVersion0
    u8 data[data_size - class_object_size];
};

Bitmap_Z bitmap_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
