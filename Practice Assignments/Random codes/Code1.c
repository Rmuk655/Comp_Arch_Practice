#include <stdio.h>

int main()
{
    float x = 0.1f;
    double y = x + x - x, z = x * x / x;
    printf("y = %.20f\n", y);
    printf("z = %.20f\n", z);
}