#include <stdio.h>
#include <string>
#include <string.h>
#include <iostream>
#include <algorithm>
#include <vector>
#include <set>
#include <map>
#include <vector>
#include <queue>
#include <stack>
#include <limits.h>
#include <math.h>
#include <iomanip>
using namespace std;

#pragma comment(linker, "/STACK:102400000,102400000")

typedef long long LL;
typedef pair<int,int> pii;

#define CLR(x,y) memset(x,y,sizeof(x));
#define PB push_back
#define MP make_pair
#define FOR(i,x,y) for(LL i = (x) ; i < (y) ; ++i)
#define ROF(i,x,y) for(LL i = (y)-1 ; i >= (x); --i)
#define INF 0x3f3f3f3f

inline LL getint() {
    LL c;
    while(c=getchar(),(c<'0'||c>'9')&&(c!='-')&&(c!=EOF));
    if(c==EOF)return -1;
    bool flag=(c=='-');
    if(flag)
        c=getchar();
    LL x=0;
    while(c>='0'&&c<='9') {
        x = (x<<3)+x+x+c-'0';
        c=getchar();
    }
    return flag?-x:x;
}

inline void output(long long x) {
    if(x<0) {
        putchar('-');
        x=-x;
    }
    LL len=0,buf[20];
    while(x) {
        buf[len++]=x%10;
        x/=10;
    }
    if(!len)
        buf[len++]=0;
    while(len--)
        putchar(buf[len]+'0');
}

char buf[100];

LL getValue(char *s) {
    LL res = 0;
    for(;*s;++s) {
        res = res * 10 + (*s)-'0';
    }
    return res;
}
LL minAnswer,maxAnswer;

void solve() {
    int length = strlen(buf);
    FOR(i,0,length) {
        FOR(j,i+1,length) {
            swap(buf[i],buf[j]);
            if(buf[0] != '0') {
                LL tmp = getValue(buf);
                minAnswer = min(minAnswer,tmp);
                maxAnswer = max(maxAnswer,tmp);
            }
            swap(buf[i],buf[j]);
        }
    }
}
int main() {
    freopen("/Users/lizhen/Documents/Project/Cpp/cpp/cpp/input.txt","r",stdin);
    freopen("/Users/lizhen/Documents/Project/Cpp/cpp/cpp/output.txt","w",stdout);
    int T = getint();
    int cas = 0;
    while(T--) {
        scanf("%s",buf);
        printf("Case #%d: ", ++cas);
        if(getValue(buf) == 0) {
            printf("0 0\n");
            continue;
        }
        minAnswer = maxAnswer = getValue(buf);
        solve();
        output(minAnswer);
        printf(" ");
        output(maxAnswer);
        printf("\n");
    }
}



/*

 
 
*/