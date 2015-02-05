#include <algorithm>
#include <cassert>
#include <cstring>
#include <iostream>
#include <map>

using namespace std;

#define FOR(i, a, b) for (int i = (a); i < (b); ++i)
#define REP(i, n) FOR(i, 0, n)
#define TRACE(x) cout << #x << " = " << x << endl
#define _ << " _ " <<

typedef long long llint;

const int MAXMEM = 2000100;

struct Node {
  map<char, Node*> t;
  bool has;
} mem[MAXMEM];
Node *alloc = mem;


int insert(Node *x, char *s) {
  int ans = 0;
  bool done = false;
  while (true) {
    bool had = x->has;
    x->has = true;
    
    if (*s == '\0') break;
    if (!x->t.count(*s)) x->t[*s] = alloc++;
    x = x->t[*s];
    s++;
    
    if (!had) done = true;
    if (!done) ans++;
  }

  return ans;
}

char s[MAXMEM];

int main(void) {
  int TC;
  scanf("%d", &TC);
  for (int tp = 1; tp <= TC; ++tp) {
    while (alloc > mem) {
      --alloc;
      alloc->has = false;
      alloc->t.clear();
    }

    Node *root = alloc++;

    int n;
    scanf("%d", &n);
    int ans = 0;
    REP(i, n) {
      scanf("%s", s);
      int ri = insert(root, s);
      if (ri == 0) ri = 1;
      ans += ri;
    }
    
    printf("Case #%d: ", tp);
    printf("%d\n", ans);
    fprintf(stderr, "Case #%d: ", tp);
    fprintf(stderr, "%d\n", ans);

  }
  return 0;
}
