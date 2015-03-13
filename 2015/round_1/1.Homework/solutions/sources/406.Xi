#include <bits/stdc++.h>
using namespace std;
const int MAXN = 1e7+10;

int f[MAXN];

int main() {
  int T; scanf("%d", &T);
  for (int i = 2; i < MAXN; ++ i) if (!f[i]) {
    for (int j = i; j < MAXN; j += i) f[j] ++;
  }
  for (int cas = 1; cas <= T; ++ cas) {
    int A, B, K; scanf("%d%d%d", &A, &B, &K);
    int ret = 0;
    for (int i = A; i <= B; ++ i) ret += f[i] == K;
    printf("Case #%d: %d\n", cas, ret);
  }
}
