

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
//#include<bits/stdc++.h>

#define in freopen("input.txt", "r", stdin);
#define out freopen("output.txt", "w", stdout);
#define clr(arr, key) memset(arr, key, sizeof arr)
#define pb push_back
#define mp(a, b) make_pair(a, b)
#define PI acos(-1)
#define CF ios_base::sync_with_stdio(0);
#define all(v) v.begin(), v.end()
#define no_of_ones __builtin_popcount // count 1's in a numbers binary representation
#define SZ(v) (int)(v.size())
#define eps 10e-7
#define oo (1LL<<60)
#define N 10000010
#define mod 1000000007
#define re(i,a) for(int i=0; i<a; i++)
#define ll long long
#define llu unsigned long long int
#define VI  vector <int>
#define VVI  vector <VI>
#define PI  pair <ll, int>
#define VPI  vector <PI>
#define VVPI  vector <VPI>
#define VL  vector <ll>
#define VVL  vector <VL>
#define VS  vector <string>
#define VB  vector <bool>
#define VD  vector <long double>
#define VVD  vector <VD>

//int col[8] = {0, 1, 1, 1, 0, -1, -1, -1};
//int row[8] = {1, 1, 0, -1, -1, -1, 0, 1};
//int col[4] = {1, 0, -1, 0};
//int row[4] = {0, 1, 0, -1};
//int months[13] = {31,28,31,30,31,30,31,31,30,31,30,31};

using namespace std;

int hit[N],sum[10][N];

void sel(int a)
{
    for(int i=2*a; i<N; i+=a) hit[i]++;
}
void seive()
{
    sel(2);
    for(int i=3; i*i<N; i+=2)
        if(!hit[i]) sel(i);
}
int main()
{
freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);

    clr(hit,0);
    seive();

    for(int i=2; i<N; i++) if(hit[i]==0) hit[i]=1;
    for(int i=0; i<N; i++) sum[hit[i]][i]=1;
    for(int k=0; k<10; k++)
        for(int j=1; j<N; j++)
            sum[k][j]=sum[k][j]+sum[k][j-1];

    int T,A,B,k,ans;
    scanf("%d", &T);
    for(int cs=1; cs<=T; cs++)
    {
        scanf("%d %d %d",&A,&B,&k);
        if(k<10) ans=sum[k][B]-sum[k][A-1];
        else ans=0;
        printf("Case #%d: %d\n", cs, ans);
    }
    return 0;
}


/*
input:


output:

*/
