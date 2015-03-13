#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <algorithm>
#include <string>
#include <vector>
#include <stack>
#include <queue>
#include <set>
#include <map>
#include <time.h>
#include <cctype>
#include <functional>
#include <deque>
#include <iomanip>
#include <bitset>
#include <assert.h>
#include <numeric>
#include <sstream>
#include <utility>

#define pb push_back
#define mp make_pair
#define fi first
#define se second
#define ranges(a,b) for(int i = a; i <= b; i ++)
#define ll long long
using namespace std;

const int N = 200010;
int dp[N][300];
vector<int> edges[N];
struct nodes
{
    int dep,x;
    nodes() {}
    nodes(int dep,int x):dep(dep),x(x) {}
    friend bool operator < (const nodes &a,const nodes &b) {
        return a.dep > b.dep;
    }
}node[N],b[N],c[N],d[N],e[N];

queue<int> qs;


void bfs(int n)
{
    while(!qs.empty()) qs.pop();
    qs.push(0);
    qs.push(1);
    int cnt = 0;
    while(!qs.empty()) {
        int dep = qs.front();
        qs.pop();
        int x = qs.front();
        qs.pop();
        node[++ cnt] = nodes(dep,x);
        for(int i = 0; i < edges[x].size(); i ++) {
            qs.push(dep + 1);
            qs.push(edges[x][i]);
        }
    }
}

int solve(int n)
{
    bfs(n);
    sort(node + 1,node + n + 1);
    int limits = 3 * n / 2;
    for(int i = 1; i <= n; i ++) {
        for(int j = 0; j < 300; j ++) {
            dp[i][j] = limits;
        }
    }
    for(int i = 1; i <= n; i ++) {
        int u = node[i].x;
        int tot = 0;
        for(int j = 0; j < edges[u].size(); j ++) {
            d[++ tot] = b[edges[u][j]];
            e[tot] = c[edges[u][j]];
        }
        for(int j = 1; j < 300; j ++) {
            long long sum = 0;
            for(int k = 1; k <= tot; k ++) {
                if(j != d[k].dep) sum += d[k].x;
                else sum += e[k].x;
            }
            dp[u][j] = min(dp[u][j] + 0LL,sum + j);
        }
        b[u] = nodes(1,dp[u][1]);
        c[u] = nodes(1,limits + 1);
        for(int j = 2; j < 300; j ++)
            if(dp[u][j] < b[u].x) {
                c[u] = b[u];
                b[u] = nodes(j,dp[u][j]);
            }
            else if(dp[u][j] < c[u].x) {
                c[u] = nodes(j,dp[u][j]);
            }
    }
    return b[1].x;
}
    
int main()
{
    freopen("corporate_gifting.txt","r",stdin);
    freopen("corporate_gifting.out","w",stdout);
    int t;
    scanf("%d",&t);
    for(int cas = 1; cas <= t; cas ++) {
        int n;
        scanf("%d",&n);
        for(int i = 0; i < N; i ++) edges[i].clear();
        for(int i = 1; i <= n; i ++) {
            int x;
            scanf("%d",&x);
            if(i == 1) continue;
            edges[x].push_back(i);
        }
        int ans = solve(n);
        printf("Case #%d: %d\n",cas,ans);
    }
    return 0;
}
        
        
