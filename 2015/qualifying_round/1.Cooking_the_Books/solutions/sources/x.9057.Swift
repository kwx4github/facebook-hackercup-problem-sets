#include <stdio.h>
#include <string.h>
int main() {
    FILE *fpuser;
    FILE *fpout;
    int i,j,mi,ma,T;
    char file[100],fileout[100];
    char t[20],t1[20];
    sprintf(fileout,"output.txt");
    fpout=fopen(fileout,"w");
    sprintf(file,"input.txt");
    fpuser=fopen(file,"r");
    fgets(t1, 50, fpuser);
    T=atoi(t1);
    for(i=1;i<=T;i++)
    {
        
        fgets(t1, 50, fpuser);
        sprintf(t,t1);
        ma=0;
        mi=0;
        for(j=1;j<strlen(t1)-1;j++)
        {
          if(t[1]!='0')
          {
            if(t1[ma]<=t1[j])
            {
                ma=j;
            }
            if(t1[mi]>=t1[j])
            {
                mi=j;
            }
          }
        }
        t[0]=t1[mi];
        t[mi]=t1[0];
        printf("%d ",atoi(t));
        fprintf(fpout,"Case #%d: %d ",i,atoi(t));
        sprintf(t,t1);
        t[0]=t1[ma];
        t[ma]=t1[0];
        printf("%d\n",atoi(t));
        fprintf(fpout,"%d\n",atoi(t));
        
    }
    puts(t1);
    fclose(fpuser);
    fclose(fpout);
    return 0;
}
