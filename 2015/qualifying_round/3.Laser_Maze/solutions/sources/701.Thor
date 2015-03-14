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

const int N = 200+10;

vector< pair<pii,int> > laser;
const int xx[] = {-1,0,1,0};
const int yy[] = {0,1,0,-1};

bool block[N][N];
bool wall[N][N][4];
int dist[N][N][4];
int n,m;
pii S,G;

void init() {
    FOR(delta,0,4) {
        FOR(i,0,laser.size()) {
            int j = (laser[i].second+delta)%4;
            int x = laser[i].first.first;
            int y = laser[i].first.second;
            do {
                wall[x][y][delta] = 1;
                x += xx[j];
                y += yy[j];
            } while(!block[x][y]);
        }
    }
}

int BFS() {
    queue< pair<pii,int> > que;
    que.push(MP(S,0));
    dist[S.first][S.second][0] = 0;
    while(!que.empty()) {
        pii pos = que.front().first;
        int z = que.front().second;
        que.pop();
        int x = pos.first;
        int y = pos.second;
        if(x == G.first && y == G.second)return dist[x][y][z];
        FOR(dir,0,4) {
            int Z = (z+1)%4;
            int X = x + xx[dir];
            int Y = y + yy[dir];
            if(wall[X][Y][Z])continue;
            if(dist[X][Y][Z] == -1) {
                dist[X][Y][Z] = dist[x][y][z]+1;
                que.push(MP(MP(X,Y),Z));
            }
        }
    }
    return INF;
}
int cas;
void solve() {
    printf("Case #%d: ", ++cas);
    int answer = BFS();
    if(answer == INF) {
        printf("impossible\n");
    }
    else {
        printf("%d\n",answer);
    }
}
char buf[500];
int main() {
    freopen("/Users/lizhen/Documents/Project/Cpp/cpp/cpp/input.txt","r",stdin);
    freopen("/Users/lizhen/Documents/Project/Cpp/cpp/cpp/output.txt","w",stdout);
    int T = getint();
    while(T--) {
        n = getint();
        m = getint();
        CLR(block,1);
        CLR(wall,1);
        CLR(dist,-1);
        laser.clear();
        FOR(i,1,n+1) {
            scanf("%s",buf+1);
            FOR(j,1,m+1) {
                char c = buf[j];
                FOR(delta,0,4)wall[i][j][delta] = 0;
                block[i][j] = 0;
                if(c == '.') continue;
                if(c == 'S') { S = MP(i,j);continue; }
                if(c == 'G') { G = MP(i,j);continue; }
                FOR(delta,0,4)wall[i][j][delta] = 1;
                block[i][j] = 1;
                
                if(c == '#') { continue;}
                switch(c) {
                    case '^':laser.PB(MP(MP(i,j),0));break;
                    case '>':laser.PB(MP(MP(i,j),1));break;
                    case 'v':laser.PB(MP(MP(i,j),2));break;
                    case '<':laser.PB(MP(MP(i,j),3));break;
                }
            }
        }
        init();
        solve();
        
    }
}


