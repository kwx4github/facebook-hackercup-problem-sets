#include <bits/stdc++.h>

using namespace std;
int main()
{
	int T;
	cin>>T;
	for(int m=1;m<=T;m++)
	{
		int F,C,P;
		cin>>P>>C>>F;
		int N;
		cin>>N;
		int A[N][3];
		bool flag=false;
		for(int i=0;i<N;i++)
		{
			cin>>A[i][0]>>A[i][1]>>A[i][2];
		}
		for(int i=0;i<pow(2,N);i++)
		{
			int p=0,c=0,f=0;
			for(int j=0;j<N;j++)
			{
				if(i&(1<<j))
				{
					p+=A[j][0];
					c+=A[j][1];
					f+=A[j][2];
				}
			}	
			if(p==P&&c==C&&f==F)
			{
				cout<<"Case #"<<m<<": "<<"yes"<<endl;
				flag=true;
				break;
			}

		}
		if(!flag)cout<<"Case #"<<m<<": "<<"no"<<endl;
				
	}
	return 0;
}