/* 
 * 打印程序对象的字节表示 这段代码使用强制类型转换来规避类型系统。
 * 很容易定义针对其他数据类型的类似函数
 */
#include <stdio.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer start, int len) {
	int i;
	for (i = 0; i < len; i++) {
		printf("%.2x", start[i]);
	}
	printf("\n");
}

void show_int(int x) {
	show_bytes((byte_pointer)&x, sizeof(int));
}

void show_float(float x) {
	show_bytes((byte_pointer)&x, sizeof(float));
}

void show_pointer(void *x) {
	show_bytes((byte_pointer)&x, sizeof(void *));
}

/* 
 * 2-5 
 * 字节表示的示例。这段代码打印示例数据对象的字节表示 
 */
void test_show_bytes(int val) {
	int ival = val;
	float fval = (float) ival;
	int *pval = &ival;
	show_int(ival);
	show_float(fval);
	show_pointer(pval);
}

int main(int argc, char *argv[]) {
	int x = 12345; /* 0x00003039 */
	if (argc > 1) {
		x = (int) argv[1];
	}	
	test_show_bytes(x);
	return 0;
}
