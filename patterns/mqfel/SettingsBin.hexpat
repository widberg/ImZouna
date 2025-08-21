// used for these files
// The Mighty Quest For Epic Loot\GameData\Data\GameplaySettings\settings.bin
// The Mighty Quest For Epic Loot\GameData\Data\GameplaySettings\settings2.bin
// First you need to "decrypt" the file. Reference algorithm at
// https://gist.github.com/SamuraiOndo/fc5fb60aac64d0d1bc7e629e98bb155b#file-mqfelsettingsbindecrypt-py
// Then you need to strip the last 4 bytes off the decrypted file, it's the decompressed size.
// Run it through `bff unlz -a lzo` to decompress it. Then you can use this pattern.

import std.sys;

struct SettingsBinFile {
    char name[];
    char data[];
};

struct SettingsBinDirectory {
    char name[];
    u32 number_of_files;
    SettingsBinFile files[number_of_files];
    u32 number_of_directories;
    SettingsBinDirectory directories[number_of_directories];
};

struct SettingsBin {
    SettingsBinDirectory root_directory;
    u32 checksum; // mqfel32/racenet32/freebsd crc32, whatever you want to call it
};

SettingsBin settings_bin @ 0x0;
