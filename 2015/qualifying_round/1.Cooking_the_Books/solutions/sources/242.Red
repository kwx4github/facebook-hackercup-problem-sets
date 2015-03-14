#include <bits/stdc++.h>
using namespace std;

char st[55];

long long to(string a) {
	stringstream ss(a);
	long long b;
	ss >> b;
	return b;
}

int main(void) {
	freopen("in.txt", "r", stdin);
	freopen("o.txt", "w", stdout);
	int tc, cs = 1;
	for (scanf("%d", &tc); tc--; cs++) {
		scanf("%s", st);
		int n = (int)strlen(st), f = 0;
		printf("Case #%d: ", cs);
		if (!strcmp(st, "0")) {
			printf("0 0\n");
			continue;
		}
		long long mi = (long long)1e15;
		long long ma = -1;
		string a(st);
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				swap(a[i], a[j]);
				if (a[0] == '0') {
					swap(a[i], a[j]);
					continue;
				}
				mi = min(mi, to(a));
				ma = max(ma, to(a));
				swap(a[i], a[j]);
			}
		}
		printf("%lld %lld\n", mi, ma);
	}
	return 0;
}