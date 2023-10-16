#include <zouna.hexpat>

struct Tsc {
    StringUntilNULL name;
    StringUntilNULL data;
};

struct Psc {
    Tsc tsc[while (!std::mem::eof())];
};

Psc psc @ 0x0;
