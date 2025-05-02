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
    u16 opal_version[2];
    u16 data_version[2];
    u8 cvt;
    u8 cvanim;
    u8 cvmesh;
    u8 cvshader;
};

struct VersionOther {
    u8 size;
    char string[size];
};

struct BffHeaderInternal {
    u32 magic;
    u16 size;
    Platform platform;
    VersionFormat version_format;
    match (version_format) {
        (VersionFormat::Asobo): u16 version_asobo[4];
        (VersionFormat::AsoboLegacy): u16 version_asobo_legacy[2];
        (VersionFormat::Kalisto): u16 version_kalisto[2];
        (VersionFormat::BlackSheep): u16 version_black_sheep[2];
        (VersionFormat::Ubisoft): VersionUbisoft version_ubisoft;
        (VersionFormat::Other): VersionOther version_other;
    }
    std::mem::AlignTo<0x10>;
};

using BffHeader = le BffHeaderInternal;
