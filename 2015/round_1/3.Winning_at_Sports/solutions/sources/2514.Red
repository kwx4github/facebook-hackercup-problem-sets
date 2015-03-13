#include <bits/stdc++.h>
using namespace std;

const int N = 2222, md = 1000000007;

int mem[N][N], a, b;

char st[111];

int f(int x, int y) {
	if (x == a && y == b)
		return 1;
	int &ret = mem[x][y];
	if (~ret)
		return ret;
	ret = 0;
	if (x + 1 <= a)
		ret += f(x + 1, y), ret %= md;
	if (y + 1 <= b && y + 1 < x)
		ret += f(x, y + 1), ret %= md;
	return ret;
}

int s(int x, int y) {
	if (x == a && y == b)
		return 1;
	int &ret = mem[x][y];
	if (~ret)
		return ret;
	ret = 0;
	if ((x + 1 <= a && x + 1 <= y) || y == b)
		ret += s(x + 1, y), ret %= md;
	if (y + 1 <= b)
		ret += s(x, y + 1), ret %= md;
	return ret;
}

int main(void) {
	freopen("in.txt", "r", stdin);
	freopen("o.txt", "w", stdout);
	int tc, cs = 1;
	for (scanf("%d", &tc); tc--; cs++) {
		scanf("%s", st);
		sscanf(st, "%d-%d", &a, &b);
		assert(a > b);
		memset(mem, -1, sizeof mem);
		int fre = f(1, 0);
		memset(mem, -1, sizeof mem);
		int ful = s(0, 0);
		printf("Case #%d: %d %d\n", cs, fre, ful);
	}
	return 0;
}