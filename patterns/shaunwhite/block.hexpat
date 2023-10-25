#include <zouna.hexpat>

u32 resource_count in; // Comes from DPC.hexpat

struct ResourceHeader {
    u32 size;
    u32 class_name;
    u32 name;
};

struct Resource {
    ResourceHeader header;
    u8 data[header.size - sizeof(header)];
};

Resource resources[resource_count] @ 0x0;
