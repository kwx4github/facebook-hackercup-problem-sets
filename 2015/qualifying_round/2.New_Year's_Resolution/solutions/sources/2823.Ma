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
int Gp,Gc,Gf;
int P[25],C[25],F[25];
int n;

bool search(int index,int gp,int gc,int gf)
{
    if(gp == Gp && gc == Gc && gf == Gf) return true;
    if(index == n) return false;
    if(search(index + 1,gp,gc,gf)) return true;
    if(search(index + 1,gp + P[index],gc + C[index],gf + F[index])) return true;
    return false;
}

void solve() {
    scanf("%d%d%d",&Gp,&Gc,&Gf);
    scanf("%d",&n);
    for(int i = 0; i < n; i ++) {
        scanf("%d%d%d",&P[i],&C[i],&F[i]);
    }
    if(search(0,0,0,0)) printf("yes\n");
    else printf("no\n");
}

int main() {
    freopen("new_years_resolution.txt","r",stdin);
    freopen("new_years_resolution.out","w",stdout);
    int t;
    scanf("%d",&t);
    for(int cas = 1; cas <= t; cas ++) {
        printf("Case #%d: ",cas);
        solve();
    }
    return 0;
}

