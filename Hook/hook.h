#ifndef hook_h
#define hook_h

#include <stdbool.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

bool satoo(void *address[], void *function[], int count);
bool Unsatoo(void *address);

#ifdef __cplusplus
}
#endif

#endif /* hook_h */
