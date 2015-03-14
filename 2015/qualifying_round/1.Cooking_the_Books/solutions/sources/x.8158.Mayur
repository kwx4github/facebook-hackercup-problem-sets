#include<cstdio>
int main()
{
	int t,i,min,max,max1,min1,s,n;
	char a[12],tmp;
	scanf("%d",&n);
	t=1;
	while(t<=n)
	{
		min=11;
		max=0;
		scanf("%s",a);
		for(i=0;a[i]!='\0';i++)
		{
			s=a[i]-'0';
			if(max<s)
			{
				max=s;
				max1=i;
			}
			if(min>s&&s!=0)
			{
				min=s;
				min1=i;
			}
		}
		tmp=a[0];
		a[0]=a[min1];
		a[min1]=tmp;
		printf("Case #%d: %s ",t,a);
		tmp=a[min1];
		a[min1]=a[0];
		a[0]=tmp;
		tmp=a[0];
		a[0]=a[max1];
		a[max1]=tmp;
		printf("%s\n",a);
		t++;
		
	}
	return 0;
}
