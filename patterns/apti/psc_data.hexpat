#include <zouna.hexpat>

struct Tsc {
    StringUntilNULL name;
    // A DOS style new-line always follows the name
    u8 cr;
    std::assert(cr == 0x0D, "cr != 0x0D");
    u8 lf;
    std::assert(lf == 0x0A, "lf != 0x0D");
    StringUntilNULL data;
};

struct Psc {
    Tsc tsc[while (!std::mem::eof())];
};

Psc psc @ 0x0;
