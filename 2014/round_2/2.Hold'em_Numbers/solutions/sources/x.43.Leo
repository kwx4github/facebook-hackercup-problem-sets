/*
* Problem: Facebook Hacker Cup 2014 Round 2 - Hold'em Numbers - 35 points
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

LL N, H;
LL f[105][4][4];

inline LL	work()
{
	LL l = read(), r = read();
	if (l > r)	swap(l, r);
	LL M = r - l - 1, K = N - r;
	memset(f, 0, sizeof(f));
	f[l][0][0] = 1;
	for (LL i = l - 1; i >= 1; -- i)
	for (LL j = 0; j <= 3; ++ j)
	for (LL k = 0; k <= j && k <= M; ++ k)	if (f[i + 1][j][k])
	{
		f[i][j][k] += f[i + 1][j][k];
		if (j < 3)
		{
			LL can = min(l + r - i - 1, N) - r + (l - i - 1) - (2 * j - k);
			if (can > 0)	f[i][j + 1][k] += f[i + 1][j][k] * can;
			if (k + 1 <= M)	f[i][j + 1][k + 1] += f[i + 1][j][k] * (M - k);
		}
	}
	LL	ans = 0;
	for (LL j = 0; j <= 3; ++ j)
	for (LL k = 0; k <= j && k <= M; ++ k)	if (f[1][j][k])
	{
		LL rest = 3 - j;
		if (M - k >= rest * 2)
		{
			LL	tot = 1;
			for (LL i = 0; i < rest; ++ i)
				tot *= (M - k - i * 2) * (M - k - i * 2 - 1) / 2;
			for (LL i = 1; i <= rest; ++ i)
				tot /= i;
			ans += tot * f[1][j][k];
		}
	}
	return ans;
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
		
		N = read(), H = read();
		LL	tot = (N - 2) * (N - 3) * (N - 4) * (N - 5) * (N - 6) * (N - 7) / 2 / 2 / 2 / 6;
		while (H --)
		{
			LL	ans = work();
			if (ans * 4 > tot)	printf("B");
			else	printf("F");
			//printf("%.10lf\n", ans * 1. / tot);
		}
		printf("\n");
	}

	return 0;
}

