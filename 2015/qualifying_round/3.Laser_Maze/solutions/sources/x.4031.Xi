#include <bits/stdc++.h>
#define  RD(x)      scanf("%d", &x)
#define  REP(i, n)  for (int i=0; i<int(n); ++i)
#define  FOR(i, n)  for (int i=1; i<=int(n); ++i)
#define  pii        pair<int, int>
#define  piL        pair<int, long long>
#define  mp         make_pair
#define  pb         push_back
#define  whatis(x) cout << #x << ": " << x << endl;
int dx[4] = {0, -1, 0, 1};
int dy[4] = {1, 0, -1, 0};

using namespace std;
#define  N   123
#define  eps 1e-8
#define  pi  acos(-1.0)
#define  inf 0XFFFFFFFll
#define  mod 1000000007ll
#define  LL  long long
#define  ULL unsigned long long

char maze[N][N];
int n, m;
int danger[4][N][N];

int dist[4][N][N];

bool in(int x, int y) {
	return x > 0 && x <= n && y > 0 && y <= m;
}

int dir(char c) {
	if (c == '>')
		return 0;
	if (c == '^')
		return 1;
	if (c == '<')
		return 2;
	if (c == 'v')
		return 3;
	return -1;
}

bool empty(char c) {
	return c == '.' || c == 'S' || c == 'G';
}

void spfa() {
	static bool inq[4][N][N];
	memset(inq, false, sizeof inq);
	memset(dist, -1, sizeof dist);

	int sx, sy;
	FOR(i, n) FOR(j, m) if (maze[i][j] == 'S')
		sx = i, sy = j;


	dist[0][sx][sy] = 0;
	queue<pair<int, pii>> que;
	que.push({0, {sx, sy}});
	inq[0][sx][sy] = true;

	while (!que.empty()) {
		int t = que.front().first;
		int x = que.front().second.first;
		int y = que.front().second.second;
		que.pop();
		inq[t][x][y] = false;

		int cost = dist[t][x][y] + 1;
		int nt = cost % 4;

		REP(d, 4) {
			int nx = x + dx[d];
			int ny = y + dy[d];
			if (!in(nx, ny) || danger[nt][nx][ny])
				continue;
			if (dist[nt][nx][ny] == -1 || dist[nt][nx][ny] > cost) {
				dist[nt][nx][ny] = cost;
				if (!inq[nt][nx][ny]) {
					que.push({nt, {nx, ny}});
					inq[nt][nx][ny] = true;
				}
			}
		}

	}
}

int Main() {
    freopen("laser_maze.txt", "r", stdin);
    freopen("out.txt", "w", stdout);
    ios_base::sync_with_stdio(0);

    int T;
    cin >> T;

    FOR(_T, T) {
    	cin >> n >> m;
    	FOR(i, n)
    		cin >> (maze[i] + 1);

    	memset(danger, 0, sizeof danger);

    	REP(t, 4) {
    		FOR(i, n) FOR(j, m) if (dir(maze[i][j]) >= 0) {
    			int d = (dir(maze[i][j]) + t) % 4;
    			int x = i + dx[d], y = j + dy[d];
    			while (in(x, y) && empty(maze[x][y])) {
    				danger[t][x][y] = true;
    				x += dx[d];
    				y += dy[d];
    			}
    		}
    	}

    	FOR(i, n) FOR(j, m) {
    		if (!empty(maze[i][j])) {
    			REP(t, 4)
    				danger[t][i][j] = true;
    		}
    	}


    	spfa();
    	int gx, gy;
    	FOR(i, n) FOR(j, m) if (maze[i][j] == 'G')
    		gx = i, gy = j;

    	int ans = -1;
    	REP(t, 4) if (dist[t][gx][gy] != -1)
    		ans = ans == -1 ? dist[t][gx][gy] : min(ans, dist[t][gx][gy]);


    	printf("Case #%d: ", _T);
    	if (ans == -1)
    		puts("impossible");
    	else
    		printf("%d\n", ans);
    }


    return 0;
}


int main() {
    return Main();
}
