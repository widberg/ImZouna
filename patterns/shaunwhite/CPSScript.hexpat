#include <zouna.hexpat>

enum CPSScriptLineParamType : u8 {
    String = 0,
    Float = 1,
};

struct CPSScriptLineParam {
    CPSScriptLineParamType type;
    match (type) {
        (CPSScriptLineParamType::Float): f32 f;
        (CPSScriptLineParamType::String): char s[];
    }
};

struct CPSScriptLine {
    u8 nb_params;
    if (nb_params != 0) {
        i32 command_name;
        CPSScriptLineParam params[nb_params - 1];
    }
};

struct CPSScript {
    u32 num_lines;
    CPSScriptLine lines[num_lines];
};

CPSScript cps_script @ 0x0;
