#pragma MIME application/x-material-obj-z

#include <fuel.hexpat>

struct MaterialObj_Z : ResourceObject_Z {
    /// Map from array name crc32s to arrays of MaterialAnim_Zs
    /// MaterialAnim_Zs are accessed by array name and index in that array
    Map<Name_Z, DynArray_Z<Name_Z>> entries;
};

MaterialObj_Z material_obj_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
