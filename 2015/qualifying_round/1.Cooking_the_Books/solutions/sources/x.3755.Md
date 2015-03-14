


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
//int months[13] = {0, ,31,28,31,30,31,30,31,31,30,31,30,31};

using namespace std;


int main()
{
#ifdef MANSUR
        in;
        out;
#endif

    int T,indxMn,indxMx;
    string s,a,b;
    char mn,mx;

    scanf("%d", &T);
    for(int cs=1; cs<=T; cs++)
    {
        mn='9';
        mx='0';
        cin>>s;
        if(s=="0")
        {
            printf("Case #%d: 0 0\n",cs);
            continue;
        }
        for(int i=0; i<s.size(); i++)
        {
            if(s[i]<=mn && s[i]!='0')
            {
                mn=s[i];
                indxMn=i;
            }
            if(s[i]>=mx)
            {
                mx=s[i];
                indxMx=i;
            }
        }
        a=b=s;
//        cout<<a<<" "<<b<<" "<<indxMn<<" "<<indxMx<<endl;
        swap(a[0],a[indxMn]);
        swap(b[0],b[indxMx]);
        printf("Case #%d: ",cs);
        cout<<a<<" "<<b<<endl;
    }
    return 0;
}


/*
input:


output:

*/
