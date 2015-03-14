#include <iostream>

using namespace std;

string maximum(string N) {
    for (int i = 0; i < N.length(); ++i) {
        char max = N[i];
        int maxInd = i;
        for (int j = i + 1; j < N.length(); ++j) {
            if (N[j] > max) {max = N[j]; maxInd = j;}
        }
        if (max > N[i]) {
            char tmp = N[i];
            N[i] = max;
            N[maxInd] = tmp;
            return N;
        }
    }
    return N;
}

string minimum(string N) {
    for (int i = 0; i < N.length(); ++i) {
        char min = N[i];
        int minInd = i;
        for (int j = i + 1; j < N.length(); ++j) {
            if (N[j] < min) {
                if ((i == 0) && (N[j] == '0')) continue;
                min = N[j]; minInd = j;
            }
        }
        if (min < N[i]) {
            char tmp = N[i];
            N[i] = min;
            N[minInd] = tmp;
            return N;
        }
    }
    return N;
}

int main() {
    int T; cin >> T;
    for (int i = 1; i <= T; ++i) {
        cout << "Case #" << i << ": ";
        string N; cin >> N;
        cout << minimum(N) << " " << maximum(N) << endl;
    }
    return 0;
}
