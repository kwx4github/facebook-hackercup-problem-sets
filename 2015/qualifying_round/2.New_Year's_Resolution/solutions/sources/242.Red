#include <bits/stdc++.h>
using namespace std;

struct ii {
	int p, c, f;
	ii() {}
	ii(int _p, int _c, int _f) : p(_p), c(_c), f(_f) {}
};

int p, c, f, n;

char mem[22];

vector <ii> ad;

char ok(int id, int P, int C, int F) {
	if (!P && !C && !F)
		return 1;
	if (P < 0 || C < 0 || F < 0)
		return 0;
	if (id == n)
		return 0;
	return 
		(
		ok(id + 1, P, C, F) ||
		ok(id + 1, P - ad[id].p, C - ad[id].c, F - ad[id].f)
		);
}

int main() {
	freopen("in.txt", "r", stdin);
	freopen("o.txt", "w", stdout);
	int tc, cs = 1;
	for (scanf("%d", &tc); tc--; ++cs) {
		scanf("%d %d %d", &p, &c, &f);
		scanf("%d", &n);
		ad.assign(n, ii(0, 0, 0));
		for (int i = 0; i < n; i++) {
			scanf("%d %d %d", &ad[i].p, &ad[i].c, &ad[i].f);
		}
		printf("Case #%d: %s\n", cs, ok(0, p, c, f) ? "yes" : "no");
	}
	return 0;
}