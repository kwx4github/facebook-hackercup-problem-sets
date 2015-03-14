#include <bits/stdc++.h>
using namespace std;
int arr[10];
int c;

void dig_swap(int i,int j)
{
	int t = arr[i];
	arr[i]=arr[j];
	arr[j]=t;
	return;
}
int find_val()
{
	int n=0;
	for(int i=0;i<c;i++)
		n = n*10 + arr[i];
	return n;
}
int main()
{
	int t,n,i,j,k,mi,mx,temp;
	scanf("%d",&t);
	for(i=1;i<=t;i++)
	{
		scanf("%d",&n);
		temp=mi=mx=n;
		c=0;
		do
		{
			arr[c++]=temp%10;
			temp/=10;
		}while(temp);
		arr[c]='\0';
		for(k=0,j=c-1;j>k;k++,j--)
			dig_swap(k,j);
		for(j=0;j<c;j++)
		{
			for(k=j+1;k<c;k++)
			{
				dig_swap(j,k);
				temp = find_val();
				dig_swap(j,k);
				mx = max(mx,temp);
				if(j>0||arr[k]>0)
					mi = min(mi,temp);
			}
		}
		printf("Case #%d: %d %d\n",i,mi,mx);
	}
	return 0;
}