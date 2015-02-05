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

const int MAXN = 55000;

int a[MAXN];

int main(void) {
  int TC;
  scanf("%d", &TC);
  for (int tp = 1; tp <= TC; ++tp) {
    int n;
    scanf("%d", &n);
    REP(i, n) scanf("%d", a+i);
    
    bool can = false;
    for (int first: {0, n-1}) {
      int lo = 0, hi = n-1;
      if (first == 0) lo++; else
        hi--;
      
      int l = a[first], r = a[first];
      REP(i, n-1)
        if (a[lo] == l-1) lo++, l--; else
          if (a[lo] == r+1) lo++, r++; else
            if (a[hi] == l-1) hi--, l--; else
              if (a[hi] == r+1) hi--, r++; else
                break;
      
      if (l == 1 && r == n) can = true;
    }
      
    printf("Case #%d: ", tp);
    puts(can ? "yes" : "no");
  }
  return 0;
}
