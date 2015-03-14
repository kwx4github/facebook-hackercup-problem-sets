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
#define ll long long
using namespace std;
typedef pair<int,int> pii;
typedef vector<int> vi;
typedef vector<int>::iterator vit;

void solve()
{
    char s[110];
    scanf("%s",s);
    int mi,mx;
    sscanf(s,"%d",&mi);
    mx = mi;
    int n = strlen(s);
    for(int i = 0; i < n; i ++) {
        for(int j = i + 1; j < n; j ++) {
            if(i == 0 && s[j] == '0') continue;
            swap(s[i],s[j]);
            int tmp;
            sscanf(s,"%d",&tmp);
            mi = min(tmp,mi);
            mx = max(tmp,mx);
            swap(s[i],s[j]);
        }
    }
    printf("%d %d\n",mi,mx);
}

int main()
{
    freopen("cooking_the_books.txt","r",stdin);
    freopen("cooking_the_books.out","w",stdout);
    int t;
    scanf("%d",&t);
    cerr << t << endl;
    for(int cas = 1; cas <= t; cas ++) {
        printf("Case #%d: ",cas);
        solve();
    }
    return 0;
}
