#include<stdio.h>
int main(){
	int n,y,i,a[10000],b[10000];
	scanf("%d",&n);
	for(y=0;y<n;y++){
		int j=0,r,k,min=10000,max=0,l;
		scanf("%d",&k);
		while(k!=0){
			r=k%10;
			k=k/10;
			a[j]=r;
			j=j+1;
		}
		int c=j;
		for(i=0;i<c;i++)
		b[i]=a[i];
		for(i=0;i<c;i++){
			if(a[i]==0)
			continue;
			if(min>a[i]){
			min=a[i];
			l=i;
			}
		}
		int x=a[c-1];
		a[c-1]=a[l];
		a[l]=x;
		
		for(i=0;i<c;i++){
			if(b[i]==0)
			continue;
			if(max<b[i]){
			max=b[i];
			l=i;
			}
		}
		int z=b[c-1];
		b[c-1]=b[l];
		b[l]=z;
		printf("Case #%d: ",y+1);
		for(i=c-1;i>=0;i--)
		printf("%d",a[i]);
		printf("\t");
		for(i=c-1;i>=0;i--)
		printf("%d",b[i]);
		printf("\n");
	}
	return 0;
}
