#include <string.h>
#include <dlfcn.h>
#include <mach-o/dyld.h>
#import "fishhook.h"  


static const char* (*original_dyld_get_image_name)(uint32_t image_index);

const char* hook_dyld_get_image_name(uint32_t image_index) {
    const char* name = original_dyld_get_image_name(image_index);
    if (strstr(name, "NexoraFF")) {
        return "";
    }
    return name;
}

__attribute__((constructor))
static void init() {
    original_dyld_get_image_name = (const char* (*)(uint32_t))dlsym(RTLD_DEFAULT, "dyld_get_image_name");

    rebind_symbols((struct rebinding[1]){
        {"dyld_get_image_name", (void*)hook_dyld_get_image_name, (void**)&original_dyld_get_image_name}
    }, 1);
}