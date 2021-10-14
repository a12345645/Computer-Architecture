#include <stdio.h>
#define max(a,b) ((a>b)?a:b)
int main()
{
    int gain[] = {-5,1,5,0,-7, -5, 10, 9, -4, 8, -4, 2, -4, 4, 3, -2}, len = 16;
    
    int altitude = 0, highest = 0;
    for(int i = 0 ;i < len;i++)
    {
        altitude += gain[i];
        highest = max(highest, altitude);
    }
    printf("%d", highest);

    return 0;
}
