#include <bits/stdc++.h>
using namespace std;

int dp[1<<20][3];
int inp[20][3];
int main()
{
	int t,n,i,j,k,G,C,P,msb;
	bool flag;
	scanf("%d",&t);
	for(i=1;i<=t;i++)
	{
		scanf("%d %d %d",&G,&C,&P);
		scanf("%d",&n);
		for(j=0;j<n;j++)
			scanf("%d %d %d",&inp[j][0],&inp[j][1],&inp[j][2]);
		dp[0][0]=dp[0][1]=dp[0][2]=0;
		msb=0;
		flag = (dp[0][0]==G && dp[0][1]==C && dp[0][2]==P);
		for(j=1;j<(int)(1<<n);j++)
		{
			if(j>1 && (int)(j&-j) == j)
				msb++;
			k = j-(1<<msb);
			//printf("%d msb:%d prev:%d %d\n",j,msb,k,j&-j );
			dp[j][0] = dp[k][0]+ inp[msb][0];
			dp[j][1] = dp[k][1]+ inp[msb][1];
			dp[j][2] = dp[k][2]+ inp[msb][2];
			// printf("%d %d %d\n",dp[j][0],dp[j][1],dp[j][2] );
			if(dp[j][0]==G && dp[j][1]==C && dp[j][2]==P)
			{
				flag= 1;
				break;
			}
		}
		if(flag)
			printf("Case #%d: yes\n",i);
		else
			printf("Case #%d: no\n",i);
	}
	return 0;
}