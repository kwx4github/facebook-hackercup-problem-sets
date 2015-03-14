#include<cstdio>
using namespace std;
int ar[10003];
int main()
{
	int ntc,n; scanf("%d",&ntc);
	while(ntc--)
	{
		scanf("%d",&n);
		int sum=0,c=0;
		for(int i=0;i<n;i++) 
		{
			scanf("%d",&ar[i]);
			sum+=ar[i];
			if(ar[i]) c++;
		}
		int d=sum-100;
		if(d<0 || d>=c) printf("NO\n");
		else printf("YES\n");
	}
}
