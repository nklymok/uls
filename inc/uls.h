#pragma once

#include "libmx.h"

#include <stdlib.h>

#define __USE_MISC
#define __USE_XOPEN

#define NTIME_LEN 25
#define PATH_MAX 255

#define FLAG_l 0x1
#define FLAG_a 0x2
#define FLAG_r 0x4
#define FLAG_1 0x8
#define FLAG_A 0x10
#define FLAG_d 0x20
#define FLAG_h 0x30
#define FLAG_at 040

#include <dirent.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <pwd.h>
#include <unistd.h>
#include <grp.h>
#include <time.h>

typedef struct dirent s_dirent;

typedef struct stat s_stat;

typedef struct t_ls {
    char flags;
    bool (*cmp_p)(void *, void *);
} s_ls;

// File stats
char *permissions(struct stat *p_stat);

__nlink_t nlink(s_stat *p_stat);

char *get_pw_name(s_stat *p_stat);

char *get_gr_name(s_stat *p_stat);

char *mtime(s_stat *p_stat);

char get_filetype_char(s_stat *p_stat);

int get_block_size(char* directory, s_ls *ls);
