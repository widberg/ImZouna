#include <fuel.hexpat>

struct Omni_Z : Object_Z {
    Mat4f scale_matrix;
    Mat4f translation_matrix;
    Mat4f trs_mat;
    Name_Z material_anim_name0;
    Name_Z material_anim_name1;
} [[static]];

Omni_Z omni_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
