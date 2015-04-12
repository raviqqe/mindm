#ifndef _PAM_H
#define _PAM_H

#include <stdbool.h>

bool login(const char *username, const char *password, pid_t *child_pid);
bool logout(void);

#endif
