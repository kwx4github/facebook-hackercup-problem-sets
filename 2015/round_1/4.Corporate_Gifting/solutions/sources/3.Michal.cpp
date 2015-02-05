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

const int MAX = 200007, MAX2 = 100;
int N;
vector<int> children[MAX];

struct Score
{
	Score(int _val, int _score): val(_val), score(_score) {}
	int val, score;
};

int dp[MAX][MAX2];

pair<Score, Score> go(int node)
{
	int result = 0;
	REP(i, children[node].size())
	{
		int next = children[node][i];
		pair<Score, Score> r = go(next);
		result += r.first.score;
		dp[node][r.first.val] += r.second.score - r.first.score;
	}

	Score score1(-1, INF), score2(-1, INF);
	FOR(i, 1, MAX2-1)
	{
		Score score(i, result+dp[node][i]+i);
		if (score.score < score1.score)
			swap(score, score1);
		if (score.score < score2.score)
			swap(score, score2);
	}
	return make_pair(score1, score2);
}

void Solve(int tc)
{
	scanf("%d", &N);
	REP(i, N) children[i].clear();
	REP(i, N)
	{
		int j;
		scanf("%d", &j);
		if (j)
		{
			--j;
			children[j].push_back(i);
		}
	}
	
	memset(dp, 0, sizeof(dp));
	int result = go(0).first.score;
	printf("Case #%d: %d\n", tc, result);
}

int main()
{
	int T;
	scanf("%d\n", &T);
	FOR(tc,1,T) Solve(tc);

	return 0;
}