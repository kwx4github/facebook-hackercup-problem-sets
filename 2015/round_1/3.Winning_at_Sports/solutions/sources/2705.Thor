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
typedef pair<LL,LL> pii;

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
pii answer;
const LL N = 2000+10;
LL n,m,cas;
LL f[N+N][N],g[N];
const LL MOD = 1000000007;
void solve() {
    CLR(f,0);
    f[0][0] = 1;
    for(LL i = 1 ; i <= n+m ; ++i) {
        for(LL j = 0 ; j <= i ; ++j) {
            if(i+j&1)continue;
            LL x = i + j>>1;
            LL y = i - j>>1;
            if(x>n)continue;
            if(y>m)continue;
            if(j==0)continue;
            if(j>0)f[i][j] += f[i-1][j-1];
            f[i][j] += f[i-1][j+1];
            f[i][j] %= MOD;
        }
    }
    answer.first = f[n+m][n-m];
    CLR(g,0);
    g[0] = g[1] = 1;
    FOR(i,2,m+1) {
        FOR(j,0,i) {
            g[i] += g[j]*g[i-j-1];
            g[i] %= MOD;
        }
    }
    answer.second = g[m];
}
int main() {
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);
    LL T = getint();
    while(T--) {
        scanf("%I64d-%I64d",&n,&m);
        printf("Case #%I64d: ",++cas);
        solve();
        printf("%I64d %I64d\n",answer.first,answer.second);
    }
}
