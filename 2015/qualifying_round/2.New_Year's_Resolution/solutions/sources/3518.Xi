/*
 *  Author: Xi Lin <zimpha@gmail.com>
 *  Date  : 01/09/15
 */
#include <bits/stdc++.h>
using namespace std;
typedef long long LL;
typedef pair<int, int> PII;

int p[20], c[20], f[20];
int gp, gc, gf, n;

bool check() {
  int s = 1 << n;
  for (int msk = 0; msk < s; ++ msk) {
    int x = 0, y = 0, z = 0;
    for (int i = 0; i < n; ++ i) if ((msk >> i) & 1) {
      x += p[i], y += c[i], z += f[i];
    }
    if (x == gp && y == gc && z == gf) return true;
  }
  return false;
}

int main() {
  int T; scanf("%d", &T);
  for (int cas = 1; cas <= T; ++ cas) {
    scanf("%d%d%d%d", &gp, &gc, &gf, &n);
    for (int i = 0; i < n; ++ i) scanf("%d%d%d", p + i, c + i, f + i);
    printf("Case #%d: %s\n", cas, check() ? "yes" : "no");
  }
  return 0;
}
