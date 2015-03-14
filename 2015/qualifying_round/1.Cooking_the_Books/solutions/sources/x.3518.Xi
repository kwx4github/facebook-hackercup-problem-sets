/*
 *  Author: Xi Lin <zimpha@gmail.com>
 *  Date  : 01/09/15
 */
#include <bits/stdc++.h>
using namespace std;
typedef long long LL;
typedef pair<int, int> PII;

int main() {
  int T; scanf("%d", &T);
  for (int cas = 1; cas <= T; ++ cas) {
    char s[20]; scanf("%s", s);
    int n = strlen(s);
    sort(s, s + n);
    for (int i = 0; i < n; ++ i) {
      if (s[i] != '0') {
        swap(s[0], s[i]);
        break;
      }
    }
    printf("Case #%d: %s ", cas, s);
    sort(s, s + n, greater<char>());
    printf("%s\n", s);
  }
  return 0;
}
