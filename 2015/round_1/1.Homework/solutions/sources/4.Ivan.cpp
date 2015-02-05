#include <algorithm>
#include <cassert>
#include <cstring>
#include <iostream>

using namespace std;

#define FOR(i, a, b) for (int i = (a); i < (b); ++i)
#define REP(i, n) FOR(i, 0, n)
#define TRACE(x) cout << #x << " = " << x << endl
#define _ << " _ " <<

typedef long long llint;

const int MAX = 10001000;

int f[MAX];
vector<int> v[30];

int main(void) {
  for (int i = 2; i*i < MAX; ++i)
    if (!f[i])
      for (int j = i*i; j < MAX; j += i)
        f[j] = i;

  FOR(i, 2, MAX) {
    if (!f[i]) f[i] = i;
    int cnt = 0, x = i;
    while (x > 1) {
      int p = f[x];
      while (x % p == 0) x /= p;
      cnt++;
    }

    v[cnt].push_back(i);
  }

  int TC;
  scanf("%d", &TC);
  for (int tp = 1; tp <= TC; ++tp) {
    int a, b, k;
    scanf("%d %d %d", &a, &b, &k);
    
    int ans = 0;
    if (k < 30) ans = 
                  upper_bound(v[k].begin(), v[k].end(), b) -
                  lower_bound(v[k].begin(), v[k].end(), a);
    
    printf("Case #%d: ", tp);
    printf("%d\n", ans);
  }
  return 0;
}
