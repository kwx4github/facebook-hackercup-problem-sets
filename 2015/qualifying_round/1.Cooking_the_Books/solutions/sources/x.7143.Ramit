#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int digits[15];
int numerals[10];
int main()
{
int t,n,j=1;
scanf("%d",&t);
for(;j<=t;j++)
{
  int i=0,len=0,t=0,larg=0,small=0,l=1,s=9;
  for(;i<=9;i++)numerals[i]=0;
  scanf("%d",&n);
  if(n<=11)
    printf("Case #%d: %d %d\n",j,n,n);
  else
   {
     for(i=1;n;i++)
        {
          digits[i]=n%10;
          if(numerals[n%10]==0)numerals[n%10]=i;
          n/=10;
        }
     len=i-1;
    
    //for(i=1;i<=len;i++)printf("%d",digits[i]);
    //printf("\n");

     for(i=1;i<=9;i++)
       {
          if(numerals[l]==0)l++;
          if(numerals[s]==0)s--;  
       }
     
     t=digits[len];
     digits[len]=digits[numerals[l]];
     digits[numerals[l]]=t;
   
    //for(i=1;i<=len;i++)printf("%d",digits[i]);
     //printf("\n");
    
    for(i=1;i<=len;i++)
        small=small*10+digits[len+1-i];
     
     t=digits[len];
     digits[len]=digits[numerals[l]];
     digits[numerals[l]]=t;
   
    //for(i=1;i<=len;i++)printf("%d",digits[i]);
    //printf("\n");
    
     t=digits[len];
     digits[len]=digits[numerals[s]];
     digits[numerals[s]]=t;

    //for(i=1;i<=len;i++)printf("%d",digits[i]);
    //printf("\n");

     for(i=1;i<=len;i++)
         larg=larg*10+digits[len+1-i];
   
    printf("Case #%d: %d %d\n",j,small,larg); 
     
   }

}

return 0;
}
