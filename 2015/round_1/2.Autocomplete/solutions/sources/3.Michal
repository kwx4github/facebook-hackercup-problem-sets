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

const int ALPHA = 26;

int to_int(char c)
{
	return c-'a';
}

struct Node
{
	Node(): sz(0) { memset(next, 0, sizeof(next)); }
	int sz;
	Node * next[ALPHA];
};

void del(Node * node)
{
	REP(i, ALPHA)
		if (node->next[i])
			del(node->next[i]);
	delete node;
}

char in[1000007];

void Solve(int tc)
{
	Node * root = new Node();
	int N, result = 0;
	scanf("%d", &N);
	REP(step, N)
	{
		scanf("%s ", in);
		int len = strlen(in);
		Node * node = root;
		REP(i, len)
		{
			int c = to_int(in[i]);
			if (!node->next[c])
				node->next[c] = new Node();
			node = node->next[c];
			++node->sz;
		}
		node = root;
		REP(i, len)
		{
			node = node->next[to_int(in[i])];
			++result;
			if (node->sz == 1) break;
		}
	}

	printf("Case #%d: %d\n", tc, result);
	del(root);
}

int main()
{
	int T;
	scanf("%d\n", &T);
	FOR(tc,1,T) Solve(tc);

	return 0;
}