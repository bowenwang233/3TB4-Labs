#include "system.h"
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int i;
//-------------------------------------char test--------------------------------//
char read_char[5];
char write_char[5] = {'a', 'b', 'c', 'd', 'e'};
char *shart = (char *)SRAM_CONTROLLER_0_BASE;
void test_char(){
for (i=0; i<5; i++){
    *shart = write_char[i];
    printf("writing char: %c \n", *shart);
    shart++;
}
return;
}
//-------------------------------------short test--------------------------------//
short read_short[5];
short write_short[5] = {'100', '200', '300', '400', '500'};
short *shart = (char *)SRAM_CONTROLLER_0_BASE;
void test_short(){
for (i=0; i<5; i++){
    *shart = write_short[i];
    printf("writing short: %c \n", *shart);
    shart++;
}
return;
}
//-------------------------------------int test--------------------------------//
int read_int[5];
int write_int[5] = {'1', '2', '3', '4', '5'};
int *shart = (char *)SRAM_CONTROLLER_0_BASE;
void test_int(){
for (i=0; i<5; i++){
    *shart = write_int[i];
    printf("writing int: %c \n", *shart);
    shart++;
}
return;
}
