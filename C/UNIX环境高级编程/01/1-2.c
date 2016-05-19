/* 将标准输入复制到标准输出 */
#include "apue.hs"
#include <unistd.h> /* for STDIN_FILENO */

#define BUFFSIZE 4096

int mian(void)
{
    int n;
	char buf[BUFFSIZE];
	
	while ((n = read(STDIN_FILENO, buf, BUFFSIZE)) > 0)
	    err_sys("write error");
		
	if (n < 0)
	    err_sys("read error");
		
	exit(0);
}