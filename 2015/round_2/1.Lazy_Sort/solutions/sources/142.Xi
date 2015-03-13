/*
 *  Author: Xi Lin <zimpha@gmail.com>
 *  Date  : 01/25/15
 */
#include <bits/stdc++.h>
using namespace std;
typedef long long LL;
typedef pair<int, int> PII;
const int MAXN = 50000 + 10;

int a[MAXN],  n;

bool check() {
  deque<int> s;
  int l = 2, r = n;
  s.push_front(a[1]);
  for (int i = 2; i <= n; ++ i) {
    bool flag = false;
    if (a[l] + 1 == s.front()) {
      s.push_front(a[l]);
      ++ l; flag = true;
    }
    else if (a[l] - 1 == s.back()) {
      s.push_back(a[l]);
      ++ l; flag = true;
    }
    else if (a[r] + 1 == s.front()) {
      s.push_front(a[r]);
      -- r; flag = true;
    }
    else if (a[r] - 1 == s.back()) {
      s.push_back(a[r]);
      -- r; flag = true;
    }
    if (!flag) return false;
  }
  return true;
}

bool check2() {
  deque<int> s;
  int l = 1, r = n - 1;
  s.push_front(a[n]);
  for (int i = 2; i <= n; ++ i) {
    bool flag = false;
    if (a[l] + 1 == s.front()) {
      s.push_front(a[l]);
      ++ l; flag = true;
    }
    else if (a[l] - 1 == s.back()) {
      s.push_back(a[l]);
      ++ l; flag = true;
    }
    else if (a[r] + 1 == s.front()) {
      s.push_front(a[r]);
      -- r; flag = true;
    }
    else if (a[r] - 1 == s.back()) {
      s.push_back(a[r]);
      -- r; flag = true;
    }
    if (!flag) return false;
  }
  return true;
}

int main() {
  int T; scanf("%d", &T);
  for (int cas = 1; cas <= T; ++ cas) {
    printf("Case #%d: ", cas);
    scanf("%d", &n);
    for (int i = 1; i <= n; ++ i) scanf("%d", a + i);
    if (check() || check2()) puts("yes");
    else puts("no");
  }
  return 0;
}
