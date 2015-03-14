
#include <string>
#include <vector>
#include <iostream>
#include <cstring> 
#include <algorithm>
#include <map>
#include <iomanip>
#include <bitset>
using namespace std;


long long mod =  1000000007;
long long pow2[5000];
vector< vector<int> > M(5000, vector<int>(5000));
vector< vector<int> > NB(5000, vector<int>(5000));

bitset<5000> BB[5000];

void intit_pow2() {
  pow2[0] = 1;
  for(int i = 1; i < 5000; i++) pow2[i] = (pow2[i-1]*2) % mod;
}

long long compute_nb_path(vector<int> &P) {
  long long count = pow2[P.size()];

  bitset<5000> B;
  for(int i = 0; i < P.size(); i++) B[P[i]] = true;

  for(int i = 0; i < P.size(); i++) {
    int nb1 = (B & BB[P[i]]).count() - 1;
    int nb2 = P.size() - i - nb1 - 1;
    long long c = (pow2[nb1] * (pow2[nb2] + mod -1))%mod;
    count = (count + c)%mod;
  }
  return count;
}



int main() {
  intit_pow2();
  int T;
  cin >> T;
  for(int t = 1; t <= T; t++) {
    int N;
    cin >> N;
    vector<int> A(N);
    for(int i = 1; i < N; i++) cin >> A[i];

    M[0][0] = 1;
    for(int i = 1; i < N; i++) {
      M[i] = M[A[i]];
      M[i][i] = 1;
    }

    for(int i = 0; i < N; i++) {
      BB[i].reset();
      for(int j = 0; j < N; j++) 
        BB[i][j] = M[j][i];
    }



    long long count = 1;
    for(int i = 0; i < N; i++) {
      vector<int> P;
      for(int j = A[i]+1; j < i; j++) if(M[j][A[i]]) P.push_back(j);
      count = (count * compute_nb_path(P))%mod;
    }

    cout << "Case #" << t << ": " << count << endl;
  }
}
