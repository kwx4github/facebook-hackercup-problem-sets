#include <stdio.h>
#include <string.h>
#include <math.h>
#include <ctype.h>
#include <stdlib.h>
#include <time.h>
#include <vector>
#include <map>
#include <string>
#include <sstream>
#include <set>
#include <queue>
#include <list>
#include <algorithm>
#include <iostream>
typedef long long ll;
using namespace std;

char str[20],mas[20],mis[20];
int main()
{
    int t,inma,inmi,i,C=1;
    freopen("cooking_the_books.txt","r",stdin);
    freopen("cooking_the_booksout.txt","w",stdout);
    char ma,mi;
    scanf("%d",&t);
    while(t--)
    {
        scanf("%s",str);
        if(!(strcmp(str,"0")))
        {
             printf("Case #%d: 0 0\n",C++);
             continue;
        }
        strcpy(mas,str);
        strcpy(mis,str);
        mi='9';
        ma='0';
        for(i=0;str[i];i++)
        {
            if(str[i]!='0')
            {
                if(mi>=str[i])
                {
                    mi=str[i];
                    inmi=i;
                }
            }
            if(ma<=str[i])
            {
                ma=str[i];
                inma=i;
            }
        }

        for(i=0;str[i];i++)
        {
            if(mi!=str[i]&&i<inmi)
            {
                swap(mis[i],mis[inmi]);
				break;
            }
        }

        for(i=0;str[i];i++)
        {
            if(ma!=str[i]&&i<inma)
            {
                swap(mas[i],mas[inma]);
				break;
            }
        }
        printf("Case #%d: %s %s\n",C++,mis,mas);

    }
    return 0;
}
