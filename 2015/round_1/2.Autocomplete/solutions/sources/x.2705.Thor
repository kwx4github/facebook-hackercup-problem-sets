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
int T,cas;
string s;
int n;

const int CHAR = 26;


class node {
public:
    int next[CHAR];
    node() {
        init();
    }
    void init() {
        CLR(next,-1);
    }
};
const int L = 1e6+10;
node pool[L];
int root;
int tot;
void init() {
    root = 0;
    tot = 1;
    pool[root].init();
}

int solve(string & s) {
    int tmp = root;
    int res = 0;
    bool flag = 0;
    for(int i = 0 ; i < s.size() ; ++i) {
        if(!flag)res = i+1;
        if(pool[tmp].next[s[i]-'a'] == -1) {
            pool[tmp].next[s[i]-'a'] = tot++;
            flag = 1;
        }
        tmp = pool[tmp].next[s[i]-'a'];
    }
    res = max(1,res);
    return res;
}
int answer;
int main() {
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);
    T = getint();
    while(T--) {
        n = getint();
        answer = 0;
        init();
        while(n--) {
            cin >> s;
            answer += solve(s);
        }
        printf("Case #%d: ",++cas);
        printf("%d\n",answer);
    }
}
