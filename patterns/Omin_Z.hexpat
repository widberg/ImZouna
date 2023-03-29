#include <fuel.hexpat>

struct Omni_Z : Object_Z {
    Mat4f scaleMat;
    Mat4f translation_,at;
    Mat4f trsMat;
    /// Observed to contain a MaterialAnim_Z name
    Name_Z material_anim_name0;
    /// Observed to contain zero
    Name_Z material_anim_name1;
} [[static]];

Omni_Z omni_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
