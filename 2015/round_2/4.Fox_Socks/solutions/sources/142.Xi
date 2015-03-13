/*
 *  Author: Xi Lin <zimpha@gmail.com>
 *  Date  : 01/25/15
 */
#include <bits/stdc++.h>
#define lson (rt<<1)
#define rson (rt<<1|1)
using namespace std;
typedef long long LL;
typedef pair<int, int> PII;
const int MAXN = 1000000 + 10, P = 1e9;

int S[MAXN], Xs, Ys, Zs;
int O[MAXN], Xo, Yo, Zo;
int A[MAXN], Xa, Ya, Za;
int B[MAXN], Xb, Yb, Zb;
int C[MAXN], Xc, Yc, Zc;
int D[MAXN], Xd, Yd, Zd;
int N, M;

struct Node {
  LL l, r, a, d, c, val;
  LL s[2];
  int setc;
  void mark_c(LL v) {
    c = v; setc = 1;
    a = d = 0;
    LL n = r - l + 1;
    val = n * v % P;
    if (v & 1) s[0] = (n + 1) / 2, s[1] = n / 2;
    else s[0] = s[1] = 0;
  }
  void mark_d(LL x, LL y) {   //x + y * i
    a = (a + x) % P;
    d = (d + y) % P;
    LL n = r - l + 1;
    val = (val + x * n % P + n * (n - 1) / 2 % P * y % P) % P;
    if (x % 2 == 1 && y % 2 == 0) {
      s[0] = (n + 1) / 2 - s[0];
      s[1] = n / 2 - s[1];
    }
    else if (x % 2 == 1 && y % 2 == 1) {
      s[0] = (n + 1) / 2 - s[0];
    }
    else if (x % 2 == 0 && y % 2 == 1) {
      s[1] = n / 2 - s[1];
    }
  }
} pt[MAXN << 2];

void update(int rt) {
  pt[rt].val = (pt[lson].val + pt[rson].val) % P;
  int len = pt[lson].r - pt[lson].l + 1;
  if (len & 1) {
    pt[rt].s[0] = (pt[lson].s[0] + pt[rson].s[1]) % P;
    pt[rt].s[1] = (pt[lson].s[1] + pt[rson].s[0]) % P;
  }
  else {
    pt[rt].s[0] = (pt[lson].s[0] + pt[rson].s[0]) % P;
    pt[rt].s[1] = (pt[lson].s[1] + pt[rson].s[1]) % P;
  }
}

void pushdown(int rt) {
  if (pt[rt].setc) {
    pt[lson].mark_c(pt[rt].c);
    pt[rson].mark_c(pt[rt].c);
    pt[rt].setc = 0;
  }
  pt[lson].mark_d(pt[rt].a, pt[rt].d);
  LL l = pt[rt].l, r = pt[rt].r, mid = (l + r) >> 1;
  LL am = (pt[rt].a + pt[rt].d * (mid - l + 1) % P) % P;
  pt[rson].mark_d(am, pt[rt].d);
  pt[rt].a = pt[rt].d = 0;
}

void build(int rt, int l, int r) {
  pt[rt].l = l, pt[rt].r = r;
  pt[rt].a = pt[rt].d = pt[rt].c = 0;
  pt[rt].setc = 0;
  if (l == r) {
    pt[rt].val = S[l];
    pt[rt].s[0] = pt[rt].s[1] = 0;
    if (S[l] & 1) pt[rt].s[0] = 1;
    return;
  }
  int mid = (l + r) >> 1;
  build(lson, l, mid);
  build(rson, mid + 1, r);
  update(rt);
}

void add(int rt, int l, int r, int L, int R, int a, int d) {
  if (L <= l && R >= r) {
    LL am = (a + (LL)d * (l - L) % P) % P;
    pt[rt].mark_d(am, d);
    return;
  }
  pushdown(rt);
  int mid = (l + r) >> 1;
  if (L <= mid) add(lson, l, mid, L, R, a, d);
  if (R > mid) add(rson, mid + 1, r, L, R, a, d);
  update(rt);
}

void cover(int rt, int l, int r, int L, int R, int c) {
  if (L <= l && R >= r) {
    pt[rt].mark_c(c);
    return;
  }
  pushdown(rt);
  int mid = (l + r) >> 1;
  if (L <= mid) cover(lson, l, mid, L, R, c);
  if (R > mid) cover(rson, mid + 1, r, L, R, c);
  update(rt);
}

LL sum(int rt, int l, int r, int L, int R) {
  if (L <= l && R >= r) {
    return pt[rt].val;
  }
  pushdown(rt);
  LL ret = 0;
  int mid = (l + r) >> 1;
  if (L <= mid) ret += sum(lson, l, mid, L, R);
  if (R > mid) ret += sum(rson, mid + 1, r, L, R);
  return ret % P;
}

int odd(int rt, int l, int r, int L, int R) {
  if (L <= l && R >= r) {
    return pt[rt].s[0] + pt[rt].s[1];
  }
  pushdown(rt);
  int ret = 0;
  int mid = (l + r) >> 1;
  if (L <= mid) ret += odd(lson, l, mid, L, R);
  if (R > mid) ret += odd(rson, mid + 1, r, L, R);
  return ret % P;
}

int main() {
  int T; scanf("%d", &T);
  for (int cas = 1; cas <= T; ++ cas) {
    printf("Case #%d: ", cas);
    scanf("%d%d", &N, &M);
    scanf("%d%d%d%d%d", &S[1], &S[2], &Xs, &Ys, &Zs);
    scanf("%d%d%d%d%d", &O[1], &O[2], &Xo, &Yo, &Zo);
    scanf("%d%d%d%d%d", &A[1], &A[2], &Xa, &Ya, &Za);
    scanf("%d%d%d%d%d", &B[1], &B[2], &Xb, &Yb, &Zb);
    scanf("%d%d%d%d%d", &C[1], &C[2], &Xc, &Yc, &Zc);
    scanf("%d%d%d%d%d", &D[1], &D[2], &Xd, &Yd, &Zd);
    for (int i = 3; i <= N; ++ i) S[i] = ((LL)Xs * S[i - 2] + (LL)Ys * S[i - 1] + Zs) % P;
    for (int i = 3; i <= M; ++ i) O[i] = ((LL)Xo * O[i - 2] + (LL)Yo * O[i - 1] + Zo) % 4 + 1;
    for (int i = 3; i <= M; ++ i) A[i] = ((LL)Xa * A[i - 2] + (LL)Ya * A[i - 1] + Za) % N + 1;
    for (int i = 3; i <= M; ++ i) B[i] = ((LL)Xb * B[i - 2] + (LL)Yb * B[i - 1] + Zb) % N + 1;
    for (int i = 3; i <= M; ++ i) C[i] = ((LL)Xc * C[i - 2] + (LL)Yc * C[i - 1] + Zc) % P;
    for (int i = 3; i <= M; ++ i) D[i] = ((LL)Xd * D[i - 2] + (LL)Yd * D[i - 1] + Zd) % P;
    build(1, 1, N);
    /*for (int i = 1; i <= N; ++ i) cout << S[i] << " "; cout << endl;
    for (int i = 1; i <= M; ++ i) cout << O[i] << " "; cout << endl;
    for (int i = 1; i <= M; ++ i) cout << A[i] << " "; cout << endl;
    for (int i = 1; i <= M; ++ i) cout << B[i] << " "; cout << endl;
    for (int i = 1; i <= M; ++ i) cout << C[i] << " "; cout << endl;
    for (int i = 1; i <= M; ++ i) cout << D[i] << " "; cout << endl;*/
    LL ret = 0;
    for (int i = 1; i <= M; ++ i) {
      //cout << O[i] << " " << A[i] << " " << B[i] << " " << C[i] << " " << D[i] << endl;
      B[i] = A[i] + B[i] - 1;
      if (B[i] > N) B[i] -= N;
      if (O[i] == 1) {
        LL n = 0;
        if (A[i] <= B[i]) {
          n = B[i] - A[i] + 1;
          add(1, 1, N, A[i], B[i], C[i], D[i]);
        }
        else {
          n = N - A[i] + 1 + B[i];
          add(1, 1, N, A[i], N, C[i], D[i]);
          LL now = (C[i] + LL(N - A[i] + 1) * D[i]) % P;
          add(1, 1, N, 1, B[i], now, D[i]);
        }
        ret += ((LL)C[i] * n % P + n * (n - 1) / 2 % P * D[i] % P);
      }
      else if (O[i] == 2) {
        LL n = 0;
        if (A[i] <= B[i]) {
          n = B[i] - A[i] + 1;
          ret += sum(1, 1, N, A[i], B[i]);
          cover(1, 1, N, A[i], B[i], C[i]);
        }
        else {
          n = N - A[i] + 1 + B[i];
          ret += sum(1, 1, N, A[i], N);
          ret += sum(1, 1, N, 1, B[i]);
          cover(1, 1, N, A[i], N, C[i]);
          cover(1, 1, N, 1, B[i], C[i]);
        }
        ret += n * C[i] % P;
      }
      else if (O[i] == 3) {
        if (A[i] <= B[i]) {
          ret += sum(1, 1, N, A[i], B[i]);
        }
        else {
          ret += sum(1, 1, N, A[i], N);
          ret += sum(1, 1, N, 1, B[i]);
        }
      }
      else if (O[i] == 4) {
        if (A[i] <= B[i]) {
          ret += odd(1, 1, N, A[i], B[i]);
        }
        else {
          ret += odd(1, 1, N, A[i], N);
          ret += odd(1, 1, N, 1, B[i]);
        }
      }
      ret %= P;
    }
    printf("%lld\n", ret);
  }
  return 0;
}
