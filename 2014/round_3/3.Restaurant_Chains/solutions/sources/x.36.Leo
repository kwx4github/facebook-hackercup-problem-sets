/*
* Problem: Facebook Hacker Cup 2014 Round 3 - Restaurant Chains - 40 points
* Author: Leo Yu
* Time: 
* State: SOLVED
* Memo: 
*/
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <iostream>
#include <algorithm>
#include <ctime>
#include <vector>
#include <queue>
#include <set>
#include <map>
using namespace std;
typedef long long LL;
inline int	read()
{
	int x = 0; char ch = getchar(); bool positive = 1;
	for (; ch < '0' || ch > '9'; ch = getchar())	if (ch == '-')  positive = 0;
	for (; ch >= '0' && ch <= '9'; ch = getchar())	x = x * 10 + ch - '0';
	return positive ? x : -x;
}
#define link Link
#define next Next
#define elif else if

int N, M, T, E, link[100005], next[100005], list[100005], flag[100005];
int	dfn[100005], low[100005];
//bool	instack[100005];
set< pair<int, int> >	S;
bool	firstBlood;
int ans;

inline void	DFS(int x)
{
	dfn[x] = low[x] = ++ T;
	//instack[x] = 1;
	int tot = 0;
	for (int i = list[x]; i; i = next[i])	if (flag[i])
	{
		flag[i ^ 1] = 0;
		int y = link[i];
		if (!dfn[y])
		{
			DFS(y);
			low[x] = min(low[x], low[y]);
		}
		else
			//if (instack[y])
			low[x] = min(low[x], dfn[y]);
		if (low[y] < dfn[x])	++ tot;
		elif (low[y] > dfn[x])	++ ans;
	}
	if (tot > 1)	firstBlood = 0;
	//instack[x] = 0;
}

int main()
{
#ifndef ONLINE_JUDGE
	freopen("a.in", "r", stdin);
	freopen("a.out", "w", stdout);
#endif

	int _ = read();
	for (int __ = 1; __ <= _; ++ __)
	{
		printf("Case #%d: ", __);
		
		N = read(), M = read();
		E = 1, memset(list, 0, sizeof(list));
		S.clear();
		int m = 0;
		for (int i = 1; i <= M; ++ i)
		{
			int x = read() + 1, y = read() + 1;
			if (x > y)	swap(x, y);
			if (S.count(make_pair(x, y)))	continue;
			S.insert(make_pair(x, y)); 
			link[++ E] = y, next[E] = list[x], list[x] = E, flag[E] = 1;
			link[++ E] = x, next[E] = list[y], list[y] = E, flag[E] = 1;
			++ m;
		}
		T = 0;
		memset(dfn, 0, sizeof(dfn));
		//memset(instack, 0, sizeof(instack));
		firstBlood = 1;
		ans = 0;
		DFS(1);
		if (firstBlood)	ans += (m - ans) / 2;
		else	ans = -1;
		cout << ans << endl;
	}

	return 0;
}

