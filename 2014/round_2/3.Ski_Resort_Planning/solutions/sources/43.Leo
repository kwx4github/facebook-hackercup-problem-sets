/*
* Problem: Facebook Hacker Cup 2014 Round 2 - Ski Resort Planning - 40 points
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

int N, size[5005], f[5005];
vector<int>	son[5005];
LL	power[5005];

int main()
{
#ifndef ONLINE_JUDGE
	freopen("a.in", "r", stdin);
	freopen("a.out", "w", stdout);
#endif

	power[0] = 1;
	for (int i = 1; i <= 5000; ++ i)	power[i] = power[i - 1] * 2 % MOD;
	int _ = read();
	for (int __ = 1; __ <= _; ++ __)
	{
		printf("Case #%d: ", __);
		N = read();
		son[0].clear(), size[0] = 1;
		LL	ans = 1;
		for (int i = 1; i < N; ++ i)
		{
			f[i] = read();
			LL	now = power[size[f[i]]] - 1;
			int tmp = son[f[i]].size();
			for (int t = 0; t < tmp; ++ t)
				now = (now - power[size[son[f[i]][t]]] + 1) % MOD;
			now += MOD;
			now %= MOD;
			ans = ans * now % MOD;
			son[f[i]].push_back(i);
			
			son[i].clear();
			size[i] = 0;
			
			tmp = i;
			while (1)
			{
				size[tmp] ++;
				if (!tmp)	break;
				tmp = f[tmp];
			}
		}
		ans += MOD;
		ans %= MOD;
		cout << ans << endl;
	}

	return 0;
}

