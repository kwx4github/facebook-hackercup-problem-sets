/*
* Problem: Facebook Hacker Cup 2014 Round 3 - Secret Santa - 20 points
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

const int MOD = 1000000007;
int K, N, a[105];
LL	f[105][5][105][5][5];

inline void	update(LL &x, LL y)
{
	x += y;
	x %= MOD;
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
		
		K = read();
		N = 0;
		a[0] = 0;
		for (int i = 1; i <= K; ++ i)	a[i] = read();
		memset(f, 0, sizeof(f));
		//f[0][0][0][0][0] = 1;
		f[1][0][0][0][0] = 1;
		for (int i = 1; i <= K; ++ i)
		{
			//memcpy(f[i][0], f[i - 1][a[i - 1]], sizeof(f[i][0]));
			//N += a[i];
			for (int j = 1; j <= a[i]; ++ j)
			for (int in0 = 0; in0 <= N; ++ in0)
			for (int in1 = 0; in1 <= 4; ++ in1)
			for (int ou1 = 0; ou1 <= 4; ++ ou1)	if (f[i][j - 1][in0][in1][ou1])
			{
				int ou0 = in0 + in1 - ou1;
				update(f[i][j][in0][in1 + 1][ou1 + 1], f[i][j - 1][in0][in1][ou1]);
				if (ou0)	update(f[i][j][in0][in1][ou1 + 1], f[i][j - 1][in0][in1][ou1] * (LL)ou0);
				if (in0)	update(f[i][j][in0 - 1][in1 + 1][ou1], f[i][j - 1][in0][in1][ou1] * (LL)in0);
				if (in0 && ou0)	update(f[i][j][in0 - 1][in1][ou1], f[i][j - 1][in0][in1][ou1] * (LL)in0 % MOD * (LL)ou0);
			}
			for (int in0 = 0; in0 <= N; ++ in0)
			for (int in1 = 0; in1 <= 4; ++ in1)
			for (int ou1 = 0; ou1 <= 4; ++ ou1)
				update(f[i + 1][0][in0 + in1][0][0], f[i][a[i]][in0][in1][ou1]);
			N += a[i];
		}
		cout << f[K + 1][0][0][0][0] << endl;
	}

	return 0;
}

