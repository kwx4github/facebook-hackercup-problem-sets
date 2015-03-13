#include <iostream>
#include <cstdio>
#include <vector>
#include <algorithm>
#include <cstring>
#include <string>
#include <queue>
#include <set>
#include <map>
#include <bitset>
#include <cmath>
#include <ctime>
#pragma comment (linker, "/STACK:256000000")

using namespace std;

const int maxN = 11000000;
int p[maxN], cnt[maxN];

void precalc() {
	for (int i = 2; i < maxN; ++i) {
		if (p[i]) {
			continue;
		}
		for (int j = i; j < maxN; j += i) {
			++cnt[j];
			p[j] = true;
		}
	}
}

void solve(int test) {
	int a, b, k;
	cin >> a >> b >> k;
	int res = 0;
	for (int i = a; i <= b; ++i) {
		if (cnt[i] == k) {
			++res;
		}
	}
	printf("Case #%d: %d\n", test, res);
}

int main() {
	freopen("input.txt", "r", stdin);
	freopen("output.txt", "w", stdout);

	precalc();

	int t;
	cin >> t;
	for (int i = 1; i <= t; ++i) {
		solve(i);
		cerr << i << ": " << clock() << endl;
	}

	return 0;
}