#include <bits/stdc++.h>
using namespace std;

struct ii {
	int d, x, y, r;

	ii() {}

	ii(int a, int b, int c, int rr) :
		d(a), x(b), y(c), r(rr) {}

	const bool operator< (const ii& o) const {
		return o.d < d;
	}

	friend ostream& operator<<(ostream& out, const ii& o) {
		out << o.x << ' ' << o.y << endl;
		return cout;
	}
};

const int N = 111, INF = (int)1e9;

const int dx[4] = { -1, 1, 0, 0 };
const int dy[4] = { 0, 0, -1, 1 };

int n, m, ex, ey, dist[N][N][5];

char g[N][N];

vector < pair<int, int> > laser;

char valid(int x, int y) {
	return
		(
		x >= 0 && y >= 0 && x < n && y < m &&
		(g[x][y] == 'S' || g[x][y] == 'G' || g[x][y] == '.')
		);
}

char ok(ii s) {
	if (!valid(s.x, s.y))
		return 0;
	int sz = laser.size();
	int nx = s.x, ny = s.y;
	char f = 1;
	for (int i = 0; i < sz && f; i++) {
		int X = laser[i].first, Y = laser[i].second;
		int dr = g[X][Y];
		int nr = (dr + s.r + 1) % 4;
		int j;
		if (nx == X) {
			if (ny < Y) {
				if (nr != 2)
					continue;
				for (j = Y; j >= ny; j--) {
					if (g[nx][j] == '#')
						break;
					if (j == ny)
						f = 0;
				}
			} else {
				if (nr != 0)
					continue;
				for (j = Y; j <= ny; j++) {
					if (g[nx][j] == '#')
						break;
					if (j == ny)
						f = 0;
				}
			}
		} else if (ny == Y) {
			if (nx < X) {
				if (nr != 3)
					continue;
				for (j = X; j >= nx; j--) {
					if (g[j][ny] == '#')
						break;
					if (j == nx)
						f = 0;
				}
			} else {
				if (nr != 1)
					continue;
				for (j = X; j <= nx; j++) {
					if (g[j][ny] == '#')
						break;
					if (j == nx)
						f = 0;
				}
			}
		}

	}
	return f;
}

int dij(int x, int y) {
	priority_queue <ii> pq;
	pq.emplace(0, x, y, 0);
	dist[x][y][0] = 0;
	while (!pq.empty()) {
		ii top = pq.top(); pq.pop();
		int d = top.d, X = top.x, Y = top.y;
		int ro = top.r;
		if (X == ex && Y == ey)
			return d;
		for (int i = 0; i < 4; i++) {
			int nx = X + dx[i], ny = Y + dy[i];
			int nr = (ro + 1) % 4;
			if (ok({ d, nx, ny, ro })) {
				if (dist[nx][ny][nr] > dist[X][Y][ro] + 1) {
					dist[nx][ny][nr] = dist[X][Y][ro] + 1;
					pq.emplace(dist[nx][ny][nr], nx, ny, nr);
				}
			}
		}
	}
	return INF;
}

void clear() {
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			for (int k = 0; k < 5; k++) {
				dist[i][j][k] = INF;
			}
		}
	}
	laser.clear();
}

int main(void) {
	freopen("in.txt", "r", stdin);
	freopen("o.txt", "w", stdout);
	int tc, cs = 1;
	for (scanf("%d", &tc); tc--; cs++) {
		clear();
		scanf("%d %d", &n, &m);
		int x, y = x = 0;
		ey = ex = INF;
		for (int i = 0; i < n; i++) {
			scanf("%s", g + i);
			for (int j = 0; j < m; j++) {
				char &ch = g[i][j];
				if (ch == '>') {
					ch = 0;
					laser.emplace_back(i, j);
				} else if (ch == 'v') {
					ch = 1;
					laser.emplace_back(i, j);
				} else if (ch == '<') {
					ch = 2;
					laser.emplace_back(i, j);
				} else if (ch == '^') {
					ch = 3;
					laser.emplace_back(i, j);
				} else if (ch == 'S')
					x = i, y = j;
				else if (ch == 'G')
					ex = i, ey = j;
			}
		}
		int ans = dij(x, y);
		printf("Case #%d: ", cs);
		if (ans == INF)
			printf("impossible\n");
		else
			printf("%d\n", ans);
	}
	return 0;
}