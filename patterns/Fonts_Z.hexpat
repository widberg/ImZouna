#pragma MIME application/x-fonts-z

#include <fuel.hexpat>

struct Character {
    /// Index in the material_names table of the material with this character
    u32 material_index;
    f32 point;
    f32 height;
    f32 y;
    f32 x;
    f32 width;
};

struct Fonts_Z : ResourceObject_Z {
    /// id may be ASCII or Unicode?
    Map<u32, Character> characters;
    DynArray_Z<Name_Z> material_names;
};

Fonts_Z fonts_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
