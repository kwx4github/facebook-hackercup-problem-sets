#include <bits/stdc++.h>
using namespace std;

int main() {
	int tc, i, n, sz1, sz2, sz3, i1, i2,i3;
	int gp, gc, gf;
	int a, b ,m , n1, n2, n3;
	int flag = 0;
	vector<int> p;
	vector<int> c;
	vector<int> f;
	scanf ("%d", &tc);

	for (i = 1; i <= tc; i++) {
		p.clear();
		c.clear();
		f.clear();
		flag = 0;
		scanf ("%d%d%d", &gp, &gc, &gf);
		scanf ("%d", &n);
		while (n--) {
			scanf ("%d%d%d", &a, &b, &m);
//			vector<int>::iterator i1;
//			vector<int>::iterator i2;
//			vector<int>::iterator i3;
			sz1 = p.size();
			sz2 = c.size();
			sz3 = f.size();

		for (i1 = 0,i2 = 0,i3 = 0;i1 < sz1 && i2 < sz2 && i3 < sz3 ; ++i1, ++i2, ++i3) {
//				cout << p[i1] <<endl<< c[i2]<<endl << f[i3]<< endl;
				n1 = a + p[i1];
				n2 = b + c[i2]; 
				n3 = m + f[i3];
	//			cout << n1 << n2 << n3;
				if (n1 == gp && n2 == gc && n3 == gf) {
					flag = 1;
					break;
				}
				else {
					
					p.push_back(n1);
					c.push_back(n2);
					f.push_back(n3);
				}
			}
			
			if (a == gp && b == gc && m == gf) {
				flag = 1;
	//			cout << "its true";
			}

			p.push_back(a);
			c.push_back(b);
			f.push_back(m);
		}

		if (flag == 0) {
			printf ("Case #%d: no\n", i);
		}
		if (flag == 1) {
			printf ("Case #%d: yes\n", i);
		}
		
	}
	
	return 0;
}
