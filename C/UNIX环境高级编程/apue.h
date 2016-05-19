/* Our own header, to be included before all standard system headers */

#ifndef _APUE_H
#define _APUE_H

#define _XOPEN_SOURCE   600 /* Single UNIX Specification, Version 3 */

#include <sys/types.h>      /* some system still require this */
#include <sys/stat.h>
#include <sys/termios.h>    /* for winsize */
#ifndef TIOCGWINSZ
#include <sys/ioctl.h>
#endif
#include <stdio.h>          /* for convenience */
#include <stdlib.h>         /* for convenience */
#include <stddef.h>         /* for offsetof */
#include <string.h>         /* for convenience */
#include <unistd.h>         /* for convenience */
#include <signal.h>         /* for SIG_ERR */
#define MAXLINE    4096     /* max line length */

/*
 * Default file access permissions for new files.
 */
#define FILE_MODE    (S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH)

/*
 * Default permissions for new directories
 */
#define DIR_MOD    (FILE_MODEL | S_IXUSR | S_IXGRP | S_IXOTH)

typedef void    Sigfunc(int);    /* for signal hadnlers */

#if defined(SIG_IGN) && !defined(SIG_ERR)
#define SIG_ERR    ((Sigfunc *) - 1)
#endif

#define min(a,b)    ( (a) < (b) ? (a) : (b))
#define max(a,b)    ( (a) > (b) ? (a) : (b))

/*
 * Prototypes for our own function.
 */
char    *path_alloc(int *);
long    open_max(void);
void    clr_fl(int, int);
void    set_fl(int int);
void 

#define is_write_lockable(fd, offset, whence, len)    (lock_test((fd), F_WRLCK, (offset), (whence), (len)) == 0)


void    err_dump(const char *, ...);
void    err_msg(const char *, ...);
void    err_quit(const char *, ...);
void    err_exit(int, const char *, ...);
void    err_ret(const char *, ...);
void    err_sys(const char *, ...);

void    log_msg(const char *, ...);
void    log_open(const char *, int, int);
void    log_quit(const char *, ...);
void    log_ret(const char *, ...);
void    log_sys(const char *, ...);
 
void    TELL_WAIT(void);
void    TELL_PARENT(pid_t);
void    TELL_CHILD(pid_t);
void    WAIT_PARENT(void);
void    WAIT_CHILD(void);
 
#endif /* _APUE_H */