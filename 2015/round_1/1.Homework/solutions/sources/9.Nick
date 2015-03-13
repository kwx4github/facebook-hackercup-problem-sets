#define _CRT_SECURE_NO_DEPRECATE
#pragma comment(linker,"/STACK:64000000")
#include <iostream>
#include <sstream>
#include <stdio.h>
#include <memory.h>
#include <algorithm>
#include <set>
#include <map>
#include <string>
#include <vector>
#include <cmath>
#include <queue>
#include <deque>
#include <stack>
#include <cassert>
#include <time.h>
#include <bitset>

using namespace std;

#define mp make_pair
#define pb push_back
#define _(a,b) memset( (a), b, sizeof( a ) )
#define all(a) a.begin(), a.end()
#define sz(a) (int)a.size()
#ifdef WIN32
#define dbg(...) {fprintf(stderr, __VA_ARGS__); fflush(stderr);}
#define dbgx(x) {cerr << #x << " = " << x << endl;}
#define dbgv(v) {cerr << #v << " = {"; for (typeof(v.begin()) it = v.begin(); it != v.end(); it ++) cerr << *it << ", "; cerr << "}"; cerr << endl;}
#else
#define dbg(...) { }
#define dbgx(x) { }
#define dbgv(v) { }
#endif

typedef unsigned long long ull;
typedef long long lint;
typedef pair < int , int > pii;
typedef long double ld;

const int INF = 1000 * 1000 * 1000;
const lint LINF = 1000000000000000000LL;
const double eps = 1e-9;

void prepare()
{
	freopen("input.txt", "r", stdin);
	freopen("output.txt", "w", stdout);
}

const int nmax = 10 * 1000 * 1000 + 5;
int fun[nmax], isPrime[nmax];

void precalc()
{
	_(isPrime, 1);
	for (int i = 2; i < nmax; i ++)
	{
		if (isPrime[i])
		{
			fun[i]++;
			for (int j = i + i; j < nmax; j += i)
			{
				isPrime[j] = 0;
				fun[j]++;
			}
		}
	}
}

int a, b, k;

void read()
{
	scanf("%d%d%d",&a,&b,&k);
}

bool solve()
{
	int cnt = 0;
	for (int i = a; i <= b; i ++)
	{
		if (fun[i] == k)
		{
			cnt++;
		}
	}
	printf("%d\n", cnt);
	return false;
}

int main()
{
	prepare();
	precalc();
	int t;
	scanf("%d",&t);
	for (int i = 0; i < t; i ++)
	{
		dbg("Test %d\n", i);
		printf("Case #%d: ", i + 1);
		read();
		solve();
	}
	return 0;
}
