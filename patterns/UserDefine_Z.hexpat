#include <fuel.hexpat>

struct UserDefine_Z : ResourceObject_Z {
    /// String contents of the UserDefine_Z
    /// Not NULL terminated
    PascalString string;
};

UserDefine_Z user_define_z @ 0x0;

std::assert(std::mem::eof(), "Whole input not consumed");
