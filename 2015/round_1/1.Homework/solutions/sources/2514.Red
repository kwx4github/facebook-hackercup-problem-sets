#include <bits/stdc++.h>
using namespace std;

const int N = 10000010;

int cnt[N];

bitset <N> bs;

vector <int> ad[30];

void sieve(int up = N) {
	bs.set();
	bs[0] = bs[1] = 0;
	for (int i = 2; i < up; i++) 
		if (bs[i]) {
			for (int j = i; j < up; j += i) {
				cnt[j]++;
				if (j != i) 
					bs[j] = 0;
			}
		}
	for (int i = 1; i <= 25; ++i) {
		for (int j = 2; j < up; ++j) {
			if (cnt[j] == i)
				ad[i].push_back(j);
		}
	}
}

int main(void) {
	freopen("in.txt", "r", stdin);
	freopen("o.txt", "w", stdout);
	sieve();
	int tc, cs = 1;
	for (scanf("%d", &tc); tc--; cs++) {
		int a, b, k;
		scanf("%d %d %d", &a, &b, &k);
		int ans;
		if (k > 25)
			ans = 0;
		else 
		 	ans = upper_bound(ad[k].begin(), ad[k].end(), b) 
		 			- lower_bound(ad[k].begin(), ad[k].end(), a);
		printf("Case #%d: %d\n", cs, ans);
	}
	return 0;
}