import std.mem;

enum Platform : u8 {
    PC,
    UWP,
    Maci386,
    MacPPC,
    PS2,
    PS3,
    PS4,
    PS5,
    PSP,
    Xbox,
    Xbox360,
    XboxOne,
    GameCube,
    Wii,
    Switch,
};

enum VersionFormat : u8 {
    Asobo,
    AsoboLegacy,
    Kalisto,
    BlackSheep,
    Ubisoft,
    Other,
};

struct VersionUbisoft {
    u32 opal_version[2];
    u32 data_version[2];
    u32 cvt;
    u32 cvanim;
    u32 cvmesh;
    u32 cvshader;
};

struct BffHeaderInternal {
    u32 magic;
    Platform platform;
    VersionFormat version_format;
    match (version_format) {
        (VersionFormat::Asobo): u32 version_asobo[4];
        (VersionFormat::AsoboLegacy): u32 version_asobo_legacy[2];
        (VersionFormat::Kalisto): u32 version_kalisto[2];
        (VersionFormat::BlackSheep): u32 version_black_sheep[2];
        (VersionFormat::Ubisoft): VersionUbisoft version_ubisoft;
        (VersionFormat::Other): char version_other[];
    }
    std::mem::AlignTo<4>;
};

using BffHeader = le BffHeaderInternal;
