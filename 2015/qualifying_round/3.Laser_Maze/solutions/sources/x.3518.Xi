/*
 *  Author: Xi Lin <zimpha@gmail.com>
 *  Date  : 01/09/15
 */
#include <bits/stdc++.h>
using namespace std;
typedef long long LL;
typedef pair<int, int> PII;
const int SIZE = 100 + 10;
// ^>v<
const int dx[] = {-1, 0, 1, 0};
const int dy[] = {0, 1, 0, -1};

PII cv[SIZE][SIZE][4];
char mp[SIZE][SIZE];
int dis[SIZE][SIZE][4];
int n, m, sx, sy, ex, ey;

int getdir(char c) {
  const char* s = "^>v<";
  for (int i = 0; i < 4; ++ i)
    if (s[i] == c) return i;
  return -1;
}

bool fit(int x, int y) {
  if (x < 0 || x >= n || y < 0 || y >= m) return false;
  return mp[x][y] == '.';
}

void setRange(int x, int y, int d, int k) {
  int tx = x, ty = y;
  while (1) {
    tx += dx[d], ty += dy[d];
    if (!fit(tx, ty)) break;
  }
  tx -= dx[d], ty -= dy[d];
  if (tx == x) {
    int l = y, r = ty;
    if (l > r) swap(l, r);
    cv[x][y][k] = PII(l, r);
  }
  else {
    int l = x, r = tx;
    if (l > r) swap(l, r);
    cv[x][y][k] = PII(l, r);
  }
}

void prep() {
  for (int i = 0; i < n; ++ i) {
    for (int j = 0; j < m; ++ j) {
      if (mp[i][j] == 'S') sx = i, sy = j, mp[i][j] = '.';
      else if (mp[i][j] == 'G') ex = i, ey = j, mp[i][j] = '.';
      else if (getdir(mp[i][j]) != -1) {
        int d = getdir(mp[i][j]);
        for (int k = 0; k < 4; ++ k) {
          setRange(i, j, d, k);
          d = (d + 1) % 4;
        }
      }
    }
  }
}

bool ok(int x, int y, int k) {
  if (!fit(x, y)) return false;
  for (int i = 0; i < n; ++ i) if (getdir(mp[i][y]) != -1) {
    int d = (k + getdir(mp[i][y])) % 4; if (dx[d] == 0) continue;
    if (x >= cv[i][y][k].first && x <= cv[i][y][k].second) return false;
  }
  for (int j = 0; j < m; ++ j) if (getdir(mp[x][j]) != -1) {
    int d = (k + getdir(mp[x][j])) % 4; if (dy[d] == 0) continue;
    if (y >= cv[x][j][k].first && y <= cv[x][j][k].second) return false;
  }
  return true;
}
typedef tuple<int, int, int> status;

int solve() {
  queue<status> Q;
  memset(dis, -1, sizeof(dis));
  Q.push(status(sx, sy, 0)); dis[sx][sy][0] = 0;
  while (!Q.empty()) {
    int x = get<0>(Q.front()), y = get<1>(Q.front()), d = get<2>(Q.front()); Q.pop();
    for (int i = 0; i < 4; ++ i) {
      int xx = x + dx[i], yy = y + dy[i], dd = (d + 1) % 4;
      if (!ok(xx, yy, dd) || dis[xx][yy][dd] != -1) continue;
      dis[xx][yy][dd] = dis[x][y][d] + 1;
      Q.push(status(xx, yy, dd));
    }
  }
  int ret = -1;
  for (int i = 0; i < 4; ++ i) {
    if (dis[ex][ey][i] == -1) continue;
    if (ret == -1) ret = dis[ex][ey][i];
    ret = min(ret, dis[ex][ey][i]);
  }
  return ret;
}

int main() {
  int T; scanf("%d", &T);
  for (int cas = 1; cas <= T; ++ cas) {
    scanf("%d%d", &n, &m);
    for (int i = 0; i < n; ++ i) scanf("%s", mp[i]);
    prep();
    int ret = solve();
    printf("Case #%d: ", cas);
    if (ret == -1) puts("impossible");
    else printf("%d\n", ret);
  }
  return 0;
}
