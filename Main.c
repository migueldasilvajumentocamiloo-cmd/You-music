#include <stdio.h>
#include <psl1ght/lv2.h>
#include <sysutil/sysutil.h>

int main() {
    printf("Yoi Music iniciado!\n");
    while(1) {
        sysUtilCheckCallback();
    }
    return 0;
}
