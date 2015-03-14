
#include <string>
#include <vector>
#include <iostream>
#include <cstring> 
#include <algorithm>
#include <map>
#include <iomanip>
using namespace std;


int main() {
  int T;
  cin >> T;
  for(int t = 1; t <= T; t++) {
    long long int N, M;
    cin >> N >> M;
    long long int x1, a1, b1, c1, r1, x2, a2, b2, c2, r2;
    cin >> x1 >> a1 >> b1 >> c1 >> r1 >> x2 >> a2 >> b2 >> c2 >> r2;


    vector<long long> B1(N), N1(N);
    vector<long long> B2(M), N2(M);
    B1[0] = x1;
    B2[0] = x2;

    map<long long, int> F1, F2;

    F1[x1] = 0;
    F2[x2] = 0;
    int new1 = 0;
    int new2 = 0;
    N1[0] = 1;
    N2[0] = 1;

    for(int i = 1; i < max(N, M); i++) {
      if(i < N) {
        B1[i] = (a1 * B1[(i-1) % N] + b1 * B2[(i-1) % M] + c1) % r1;
        if(F1.count(B1[i]) == 0) {
          F1[B1[i]] = i;
          new1 = i;
        }
        N1[new1]++;
      }
      if(i < M) {
        B2[i] = (a2 * B1[(i-1) % N] + b2 * B2[(i-1) % M] + c2) % r2;
        if(F2.count(B2[i]) == 0) {
          F2[B2[i]] = i;
          new2 = i;
        }
        N2[new2]++;
      }
    }
/*
    for(int i = 0; i < N; i++) cerr << B1[i] << " ";
    cerr << endl;
    for(int i = 0; i < N; i++) cerr << N1[i] << " ";
    cerr << endl;
    for(int i = 0; i < M; i++) cerr << B2[i] << " ";
    cerr << endl;
    for(int i = 0; i < M; i++) cerr << N2[i] << " ";
    cerr << endl;
*/

    vector<int> M1(N, -1), M2(M, -1);

    for(int i = 0, i2 = 0; i < N; i++) {
      if(F2.count(B1[i]) == 0) break;
      i2 = max(i2, F2[B1[i]]);
      M1[i] = i2;
    }
    for(int i = 0, i2 = 0; i < M; i++) {
      if(F1.count(B2[i]) == 0) break;
      i2 = max(i2, F1[B2[i]]);
      M2[i] = i2;
    }

    long long count = 0;
    for(int i = 0; i < N; i++) if(N1[i] > 0) {
      if(M1[i] == -1) break;
      if(M2[M1[i]] == i) count += N1[i] * N2[M1[i]];
    }

    cout << "Case #" << t << ": " << count << endl;
  }
}
