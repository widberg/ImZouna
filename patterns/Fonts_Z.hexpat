#pragma MIME application/x-fonts-z

#include <fuel.hexpat>

struct Character {
    /// Index in the material_names table of the material with this character
    u32 material_index;
    ///  Distance below the baseline to place this character
    /// The higher the value the lower the character
    f32 descent;
    Vec2f top_left_corner;
    Vec2f bottom_right_corner;
};

struct Fonts_Z : ResourceObject_Z {
    /// ID is the UTF-8 representation of the character stored in reverse order with null bytes as padding
    /// See https://gist.github.com/widberg/64a19a2708aefd8861a0b268df54c3ed#file-zouna_utf8-py to convert between ids and UTF-8
    Map_Z<u32, Character> characters;
    DynArray_Z<Name_Z> material_names;
};

Fonts_Z fonts_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
