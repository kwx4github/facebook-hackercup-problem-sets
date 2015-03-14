#include <iostream>
#define MAX 10

using namespace std;

void swap(int* a, int* b) {
	int tmp = *a;
	*a = *b;
	*b = tmp;
}

int calint(int* a, int cnt) {
	int result = 0;
	for(int i = cnt - 1; i >= 0; i--) {
		result = result*10 + a[i];
	}
	return result;
}

void findmaxmin(int n, int casenum) {
	int a[MAX];
	int cnt = 0; int min = n; int max = n;
	while (n != 0) {
		int tmp = n%10;
		a[cnt++] = tmp;
		n = (n - tmp)/10;
	}
	for(int j = 0; j < cnt; j++) {
		for(int k = cnt - 1; k > j; k --) {
			if(a[j] == 0 && k == cnt - 1) {
				break;
			}
			//输入会不会有第一位为0的情况
			swap(&a[j],&a[k]);
			int cache = calint(a,cnt);
			if(cache >= max) {
				max = cache;
			}else if(cache <= min) {
				min = cache;
			}
			swap(&a[j],&a[k]);
		}
	}
	cout << "Case #" << casenum + 1 << ": " << min << " " << max << endl;
}
int main () {
	int T, N;
	cin >> T;
	for(int i = 0; i < T; i++) {
		cin >> N;
		findmaxmin(N, i);
	}
}
