#include <bits/stdc++.h>
using namespace std;
const int MAXN = 200000 + 10, S = 30;

vector<int> G[MAXN];
int g[MAXN][S], f[MAXN][S], dp[MAXN][S], N;

void solve(int u) {
  for (int i = 0; i < S; ++ i) dp[u][i] = i;
  for (auto &v : G[u]) {
    solve(v);
    for (int i = 1; i < S; ++ i) {
      int rt = 1e9;
      if (i > 1) rt = min(rt, g[v][i - 1]);
      if (i + 1 < S) rt = min(rt, f[v][i + 1]);
      dp[u][i] += rt;
    }
  }
  g[u][1] = dp[u][1]; f[u][S - 1] = dp[u][S - 1];
  for (int i = 2; i < S; ++ i) g[u][i] = min(dp[u][i], g[u][i - 1]);
  for (int i = S - 2; i >= 1; -- i) f[u][i] = min(dp[u][i], f[u][i + 1]);
}

int main() {
  int T; scanf("%d", &T);
  for (int cas = 1; cas <= T; ++ cas) {
    scanf("%d", &N);
    for (int i = 0; i < N; ++ i) G[i].clear();
    for (int i = 0; i < N; ++ i) {
      int x; scanf("%d", &x);
      if (x) G[x - 1].push_back(i);
    }
    solve(0);
    int ret = 1e9;
    for (int i = 1; i < S; ++ i) ret = min(ret, dp[0][i]);
    printf("Case #%d: %d\n", cas, ret);
  }
  return 0;
}
