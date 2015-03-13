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

const int N = 2010;
const int mod = 1000000007;
int dp[N][N];

void MOD(int &x,int y) {
    x += y;
    if(x >= mod) x -= mod;
}

int main()
{
    freopen("winning_at_sports.txt","r",stdin);
    freopen("winning_at_sports.out","w",stdout);
    int t;
    scanf("%d",&t);
    for(int cas = 1; cas <= t; cas ++) {
        int n,m;
        scanf("%d-%d",&n,&m);
        memset(dp,0,sizeof(dp));
        dp[1][0] = 1;
        for(int i = 1; i <= n; i ++) {
            for(int j = 0; j < i && j <= m; j ++) {
                if(i + 1 <= n) MOD(dp[i + 1][j],dp[i][j]);
                if(j + 1 < i && j != m) MOD(dp[i][j + 1],dp[i][j]);
            }
        }
        int ans1 = dp[n][m];
        memset(dp,0,sizeof(dp));
        dp[0][1] = 1;
        n = m;
        for(int i = 0; i <= n; i ++)
            for(int j = i; j <= m; j ++) {
                if(j < m) MOD(dp[i][j + 1],dp[i][j]);
                if(i + 1 <= j) MOD(dp[i + 1][j],dp[i][j]);
            }
        int ans2 = dp[n][m];
        printf("Case #%d: %d %d\n",cas,ans1,ans2);
    }
    return 0;
}
                
