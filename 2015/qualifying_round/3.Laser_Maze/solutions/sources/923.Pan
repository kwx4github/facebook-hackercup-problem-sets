#include <iostream>
#include <queue>
#include <cstring>
#include <cstdio>
using namespace std;

char maze[110][110];
int a[110][110][5];
int visited[110][110][5];
int dx[4] = {0, 1, 0, -1};
int dy[4] = {1, 0, -1, 0};

int get(char c) {
	switch(c) {
		case '>': return 0;
		case 'v': return 1;
		case '<': return 2;
		case '^': return 3;
		default: return -1;
	}
}

bool wall(char c) {
	return c == '#' or c == '>' or c == 'v' or c == '<' or c== '^';
}

bool check(int i, int j, int n, int m) {
	return i >= 0 && i < n && j >= 0 && j < m;
}

struct state {
	state(int x_, int y_, int d_) : x(x_), y(y_), d(d_) {}
	int x;
	int y;
	int d;
};

int main() {
	int T;
	cin >> T;
	int i, j, k;
	for (int cs = 1; cs <= T; cs++) {
		int n, m;
		int sx, sy;
		int gx, gy;
		cin >> n >> m;
		memset(maze, 0, sizeof maze);
		memset(a, 0, sizeof a);
		memset(visited, 0, sizeof visited);
		for (i = 0; i < n; i++) {
			cin >> maze[i];
			for (j = 0; j < m; j++) {
				if (wall(maze[i][j]))
					a[i][j][0] = a[i][j][1] = a[i][j][2] = a[i][j][3] = 1;
				if (maze[i][j] == 'S') {
					sx = i;
					sy = j;
				}
				if (maze[i][j] == 'G') {
					gx = i;
					gy = j;
				}
			}
		}
		for (i = 0; i < n; i++)
			for (j = 0; j < m; j++) {
				int t = get(maze[i][j]);
				if(t >= 0) {
					for (k = 0; k < 4; k++) {
						int p = (t + k) % 4;
						int tx = i + dx[p], ty = j + dy[p];
						while(check(tx, ty, n, m) && !wall(maze[tx][ty])) {
							a[tx][ty][k] = 1;
							tx += dx[p];
							ty += dy[p];
						}	
						
					}
				
				}
			}
		queue<state> q;
		int ans = -1;
		q.push(state(sx, sy, 0));
		visited[sx][sy][0] = 1;
		while(!q.empty()) {
			state now = q.front();
			q.pop();
			if (now.x == gx && now.y == gy) {
				ans = now.d;
				break;
			}
			for (k = 0; k < 4; k++) {
				int tx = now.x + dx[k];
				int ty = now.y + dy[k];
				int tr = (now.d + 1) % 4;
				if (check(tx, ty, n, m) && !a[tx][ty][tr] && !visited[tx][ty][tr]) {
					visited[tx][ty][tr] = 1;
					q.push(state(tx, ty, now.d + 1));
				}
			}
		}
		printf("Case #%d: ", cs);
		if (ans >= 0) cout << ans << endl;
		else cout << "impossible" << endl;
	}
	return 0;
}
