#include <iostream>
#include <sstream>
#include <cstdio>
#include <cmath>
#include <cstring>
#include <cctype>
#include <string>
#include <vector>
#include <list>
#include <set>
#include <map>
#include <queue>
#include <stack>
#include <algorithm>
using namespace std; 

#define DEBUG(x) cerr << '>' << #x << ':' << x << endl;
#define REP(i,n) for(int i=0;i<(n);i++)
#define FOR(i,a,b) for(int i=(a);i<=(b);i++)
#define FORD(i,a,b) for(int i=(a);i>=(b);i--)
inline bool EQ(double a, double b) { return fabs(a-b) < 1e-9; }

const int INF = 1<<29;
typedef long long ll;

inline int two(int n) { return 1 << n; }
inline int test(int n, int b) { return n & two(b); }
inline void set_bit(int & n, int b) { n |= two(b); }
inline void unset_bit(int & n, int b) { n &= ~two(b); }
inline int last_bit(int n) { return n & (-n); }
inline int ones(int n) { int res = 0; while(n && ++res) n-=n&(-n); return res; }

template<class T> void chmax(T & a, const T & b) { a = max(a, b); }
template<class T> void chmin(T & a, const T & b) { a = min(a, b); }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

const int MOD = 1000000007;
const int MAX = 2007;

int A, B, dp[MAX][MAX];

inline int add(int & a, int b)
{
	a += b;
	if (a >= MOD) a -= MOD;
	return a;
}

// stress-free
int go1(int a, int b)
{
	int & res = dp[a][b];
	if (res != -1) return res;
	if (a == A && b == B) return res = 1;

	res = 0;
	if (a < A) add(res, go1(a+1, b));
	if (b < B && b+1 < a) add(res, go1(a, b+1));
	return res;
}

// stressful 
int go2(int a, int b)
{
	int & res = dp[a][b];
	if (res != -1) return res;
	if (a == A && b == B) return res = 1;
	
	res = 0;
	if (a < A && (a+1 <= b || b == B)) add(res, go2(a+1, b));
	if (b < B) add(res, go2(a, b+1));
	return res;
}

void Solve(int tc)
{
	scanf("%d-%d", &A, &B);
	memset(dp, -1, sizeof(dp));
	int res1 = go1(0, 0);
	memset(dp, -1, sizeof(dp));
	int res2 = go2(0, 0);

	printf("Case #%d: %d %d\n", tc, res1, res2);
}

int main()
{
	int T;
	scanf("%d\n", &T);
	FOR(tc,1,T) Solve(tc);

	return 0;
}