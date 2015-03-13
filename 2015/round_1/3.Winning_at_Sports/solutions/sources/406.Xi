#include <bits/stdc++.h>
using namespace std;
const int MAXN = 2000 + 10, P = 1e9 + 7;
typedef long long LL;
LL dp[MAXN][MAXN];
int N, M;

int main() {
  int T; scanf("%d", &T);
  for (int cas = 1; cas <= T; ++ cas) {
    scanf("%d-%d", &N, &M);
    printf("Case #%d: ", cas);
    if (N <= M) {puts("0 0"); continue;}
    memset(dp, 0, sizeof(dp));
    for (int i = 0; i <= N; ++ i) {
      for (int j = 0; j <= N; ++ j) {
        if (i == 0 && j == 0) {dp[i][j] = 1; continue;}
        if ((i == 1 && j == 0) || i > j + 1) dp[i][j] += dp[i - 1][j];
        if (i > j - 1 && j >= 1) dp[i][j] += dp[i][j - 1];
        dp[i][j] %= P;
      }
    }
    LL r1 = dp[N][M];
    memset(dp, 0, sizeof(dp));
    for (int i = 0; i <= N; ++ i) {
      for (int j = 0; j <= M; ++ j) {
        if (i == 0 && j == 0) {dp[i][j] = 1; continue;}
        if ((i <= j + 1 || (i > j + 1 && j == M)) && i >= 1) dp[i][j] += dp[i - 1][j];
        if (i <= j - 1 && j >= 1) dp[i][j] += dp[i][j - 1];
        dp[i][j] %= P;
      }
    }
    LL r2 = dp[N][M];
    printf("%lld %lld\n", r1, r2);
  }
  return 0;
}
