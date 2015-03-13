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

const int N = 10000010;
int a[N];
int f[N];

void precal()
{
    memset(a,0,sizeof(a));
    a[1] = 1;
    for(int i = 2; i < N; i ++)
        if(!a[i]) {
            a[i] = i;
            for(int j = i * 2; j < N; j += i)
                a[j] = i;
        }
}

int main()
{
    freopen("homework.txt","r",stdin);
    freopen("homework.out","w",stdout);
    precal();
    for(int i = 2; i < N; i ++) {
        int x = i;
        while(x > 1) {
            int p = a[x];
            //while(p == 0) cout << "fuck" << " " << x << " " << a[x] << endl;
            while(x % p == 0) x /= p;
            f[i] ++;
        }
    }
    int t;
    scanf("%d",&t);
    for(int cas = 1; cas <= t; cas ++) {
        int a,b,k;
        scanf("%d%d%d",&a,&b,&k);
        int ans = 0;
        for(int i = a; i <= b; i ++)
            if(f[i] == k) ans ++;
        printf("Case #%d: %d\n",cas,ans);
    }
    return 0;
}
    
