/*
* Problem: Facebook Hacker Cup 2014 Round 2 - Magic Pairs - 25 points
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

int N, M;
LL	board1[1000006], board2[1000006], cnt[1000006];
set<int>	S1, S2;

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
		LL	x1 = read(), a1 = read(), b1 = read(), c1 = read(), r1 = read();
		LL	x2 = read(), a2 = read(), b2 = read(), c2 = read(), r2 = read();
		board1[0] = x1;
		board2[0] = x2;
		for (int i = 1; i < max(N, M); ++ i)
		{
			if (i < N)	board1[i] = (a1 * board1[(i - 1) % N] + b1 * board2[(i - 1) % M] + c1) % r1;
			if (i < M)	board2[i] = (a2 * board1[(i - 1) % N] + b2 * board2[(i - 1) % M] + c2) % r2;
		}
		S1.clear(), S2.clear();
		memset(cnt, 0, sizeof(cnt));
		LL	ans = 0;
		for (int i = 0, j = 0; i < N; ++ i)
		{
			S1.insert(board1[i]);
			while (j < M && S1.count(board2[j]))
			{
				S2.insert(board2[j]);
				cnt[S2.size()] ++;
				++ j;
			}
			ans += cnt[S1.size()];
		}
		cout << ans << endl;
	}

	return 0;
}

