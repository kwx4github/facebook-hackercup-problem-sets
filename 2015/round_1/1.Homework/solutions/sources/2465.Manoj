/*
 * @Author: Manoj Khanna
 */

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <iostream>
#include <string>
#include <iterator>
#include <vector>
#include <list>
#include <map>
#include <set>
#include <stack>
#include <queue>
#include <algorithm>
#include <utility>

using namespace std;

#define MAX 10000010

int factors[MAX];

int main()
{
	for (int i = 0; i < MAX; ++i)
	{
		factors[i] = 0;
	}

	for (int i = 2; i < MAX; ++i)
	{
		if (factors[i] == 0)
		{
			for (int j = i; j < MAX; j += i)
			{
				++factors[j];
			}
		}
	}

	int t;
	scanf("%d\n", &t);

	for (int i = 1; i <= t; ++i)
	{
		long int a, b, k;
		scanf("%ld %ld %ld\n", &a, &b, &k);

		int n = 0;
		for (int j = a; j <= b; ++j)
		{
			if (factors[j] == k)
			{
				++n;
			}
		}

		printf("Case #%d: %d\n", i, n);
	}

	return 0;
}
