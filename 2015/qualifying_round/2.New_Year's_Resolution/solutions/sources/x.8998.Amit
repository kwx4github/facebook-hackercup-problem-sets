#include <cstdio>
bool isSubsetSum(int g[],int c[],int f[], int n, int gp,int gc,int gf)
{
   if (gc==0&&gp==0&&gf==0)
     return true;
   if (n==0&&(gp != 0||gc!=0||gf!=0))
     return false;
   if (g[n-1]>gp||c[n-1]>gc||f[n-1]>gf)
     return isSubsetSum(g,c,f, n-1,gp,gc,gf);

   return isSubsetSum(g,c,f, n-1,gp,gc,gf)||isSubsetSum(g,c,f, n-1,gp-g[n-1],gc-c[n-1],gf-f[n-1]);
}
int main()
{
	int g[21],c[21],f[21];
	int gp,gc,gf,i,t,n,n1;
	t=1;
	scanf("%d",&n1);
	while(t<=n1)
	{
		scanf("%d%d%d",&gp,&gc,&gf);
		scanf("%d",&n);
		for(i=0;i<n;i++)
		{
			scanf("%d%d%d",&g[i],&c[i],&f[i]);
		}
		if (isSubsetSum(g,c,f,n,gp,gc,gf) == true)
     			printf("Case #%d: yes\n",t);
  		else
     			printf("Case #%d: no\n",t);
		t++;
	}
	return 0;
}
