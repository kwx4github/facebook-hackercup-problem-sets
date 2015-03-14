#include <iostream>
#define MAX 20
#define CAL_TYPE 3
using namespace std;

int want[CAL_TYPE];
int food[MAX][CAL_TYPE];

bool eat(int foodnumb, int n) {
	if(want[0] == 0 && want[1] == 0 && want[2] == 0) {
		return true;
	}
	if(want[0] < 0 || want[1] < 0 || want[2] < 0) {
		return false;
	}
	if(foodnumb > n) {
		return false;
	}
	if(eat(foodnumb + 1, n)) {
		return true;
	}
	want[0] = want[0] - food[foodnumb][0];
	want[1] = want[1] - food[foodnumb][1];
	want[2] = want[2] - food[foodnumb][2];
	bool result = eat(foodnumb+1, n);
	want[0] = want[0] + food[foodnumb][0];
	want[1] = want[1] + food[foodnumb][1];
	want[2] = want[2] + food[foodnumb][2];
	return result;
}

int main () {
	int T = 0;
	int N = 0;
	cin>>T;
	for(int i = 0; i < T; i++) {
		cin >> want[0]>> want[1]>> want[2];
		cin >> N;
		for(int j = 0; j < N; j++) {
			cin >> food[j][0] >> food[j][1] >> food[j][2];
		}
		if(eat(0,N)) {
			cout << "Case #" << i + 1 <<": yes" << endl;
		}else {
			cout << "Case #" << i + 1 <<": no" << endl;
		}
	}
}
