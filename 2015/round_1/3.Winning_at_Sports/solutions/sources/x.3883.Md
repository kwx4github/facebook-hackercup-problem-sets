

#include <cstring>
#include <vector>
#include <list>
#include <map>
#include <set>
#include <deque>
#include <stack>
#include <bitset>
#include <algorithm>
#include <functional>
#include <numeric>
#include <utility>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <memory.h>
#include <cassert>
#include <queue>

#define mod 1000000007

using namespace std;

int a,b,dp[2010][2010];

int stress_free(int pos, int point)
{
    if(pos==a+b)
    {
        if(point==a) return 1;
        else return 0;
    }
    int &ret=dp[pos][point];
    if(ret!=-1) return ret;

    ret=0;
    ret=(ret+stress_free(pos+1,point+1))%mod;
    if(pos+1-point<point) ret=(ret+stress_free(pos+1,point))%mod;

    return ret;

}
int stress_full(int pos, int point)
{
    if(pos==a+b)
    {
        if(point==b) return 1;
        else return 0;
    }

    int &ret=dp[pos][point];
    if(ret!=-1) return ret;

    ret=0;
    ret = (ret+stress_full(pos+1, point+1))%mod;
    if(point==b || pos+1-point<=point) ret = (ret+stress_full(pos+1, point))%mod;

    return ret;
}
int main()
{
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);

    int T,x,y;

    cin>>T;
    for(int cs=1; cs<=T; cs++)
    {
        scanf("%d-%d", &a,&b);

        memset(dp,-1,sizeof(dp));
        x=stress_free(1,1);
        memset(dp,-1,sizeof(dp));
        y=stress_full(1,1);

        printf("Case #%d: %d %d\n",cs, x,y);
    }
    return 0;
}
/*


*/

