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

const int MAX = 10000007;
int dp[MAX];

void Solve(int tc)
{
	int A, B, K, res = 0;
	scanf("%d%d%d", &A, &B, &K);
	for (int i = A; i <= B; ++i)
	{
		if (i >= MAX) DEBUG("AAAAAAAAAAAAAAAAAAAAA");
		if (dp[i] == K)
			++res;
	}
	printf("Case #%d: %d\n", tc, res);
}

int main()
{
	for (int i = 2; i < MAX; ++i)
		if (!dp[i])
			for (int j = i; j < MAX; j += i)
				++dp[j];

	int T;
	scanf("%d\n", &T);
	FOR(tc,1,T) Solve(tc);

	return 0;
}