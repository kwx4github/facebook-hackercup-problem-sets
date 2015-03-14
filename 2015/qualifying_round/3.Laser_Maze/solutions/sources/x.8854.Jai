#include<cstdio>
#include<vector>
using namespace std;
int ar[4][101][101];
int arr[4][101][101];
char ch[102][102];
int N,M;
vector<int> no_r_b;
vector<int> v;
void pre()
{
	for(int i=0;i<N;i++)
	for(int j=0;j<M;j++)
	{   
		if(ch[i][j]=='^') 
			{  
				for(int x=j+1;x<M && (ar[0][i][x]==10 || ar[0][i][x]==12);x++) ar[0][i][x]=12;
				for(int x=i+1;x<N && (ar[1][x][j]==10 || ar[1][x][j]==12);x++) ar[1][x][j]=11;
				for(int x=j-1;x>=0 &&  (ar[2][i][x]==10 || ar[2][i][x]==12);x--) ar[2][i][x]=11;
				for(int x=i-1;x>=0 && (ar[3][x][j]==10 || ar[3][x][j]==12);x--) ar[3][i][x]=11;
			} 
			
			
				if(ch[i][j]=='>') 
			{
				for(int x=j+1;x<M && (ar[3][i][x]==10 || ar[3][i][x]==12);x++) ar[3][i][x]=12;
				for(int x=i+1;x<N && (ar[0][x][j]==10 || ar[0][x][j]==12);x++) ar[0][x][j]=11;
				for(int x=j-1;x>=0 &&  (ar[1][i][x]==10 || ar[1][i][x]==12);x--) ar[1][i][x]=11;
				for(int x=i-1;x>=0 && (ar[2][x][j]==10 || ar[2][x][j]==12);x--) ar[2][i][x]=11;
			} 
			
				if(ch[i][j]=='v') 
			{
				for(int x=j+1;x<M && (ar[2][i][x]==10 || ar[2][i][x]==12);x++) ar[2][i][x]=12;
				for(int x=i+1;x<N && (ar[3][x][j]==10 || ar[3][x][j]==12);x++) ar[3][x][j]=11;
				for(int x=j-1;x>=0 &&  (ar[0][i][x]==10 || ar[0][i][x]==12);x--) ar[0][i][x]=11;
				for(int x=i-1;x>=0 && (ar[1][x][j]==10 || ar[1][x][j]==12);x--) ar[1][i][x]=11;
			} 
			
				if(ch[i][j]=='<') 
			{ 
				for(int x=j+1;x<M && (ar[1][i][x]==10 || ar[1][i][x]==12);x++) ar[1][i][x]=12;
				for(int x=i+1;x<N && (ar[2][x][j]==10 || ar[2][x][j]==12);x++) ar[2][x][j]=11;
				for(int x=j-1;x>=0 && (ar[3][i][x]==10 || ar[3][i][x]==12);x--) ar[3][i][x]=11; 
				for(int x=i-1;x>=0 && (ar[0][x][j]==10 || ar[0][x][j]==12);x--) ar[0][i][x]=11;
			} 
	}
	
	
}
int main()
{
	int ntc; scanf("%d",&ntc);
	int si,sj,gi,gj;
	for(int tc=1;tc<=ntc;tc++)
	{  v.clear(); no_r_b.clear(); 
	for(int i=0;i<4;i++) for(int j=0;j<100;j++) for(int k=0;k<100;k++) arr[i][j][k]=0,ar[i][j][k]=0;
	
	printf("Case #%d: ",tc);	no_r_b.clear();
	int af=0;
		scanf("%d %d",&N,&M);
		for(int i=0;i<N;i++)
		for(int j=0;j<M;j++)	
			{  
				scanf(" %c ",&ch[i][j]);
				if(ch[i][j]=='S') si=i,sj=j,ar[0][i][j]=10,ar[1][i][j]=10,ar[2][i][j]=10,ar[3][i][j]=10;;
				if(ch[i][j]=='G') gi=i,gj=j,ar[0][i][j]=10,ar[1][i][j]=10,ar[2][i][j]=10,ar[3][i][j]=10;;
				if(ch[i][j]=='.') ar[0][i][j]=10,ar[1][i][j]=10,ar[2][i][j]=10,ar[3][i][j]=10;
				if(ch[i][j]=='#' ) ar[0][i][j]=11,ar[1][i][j]=11,ar[2][i][j]=11,ar[3][i][j]=11;
				if(ch[i][j]=='^' || ch[i][j]=='v' || ch[i][j]=='<' || ch[i][j]=='>') ar[0][i][j]=13,ar[1][i][j]=13,ar[2][i][j]=13,ar[3][i][j]=13;
			}
			 
			 pre();
			 
			 int ans=1; int i=si,j=sj;
			 
			 if(i+1<N && ar[0][i+1][j]==10) 
			 	{
			 		arr[0][i+1][j]=1; no_r_b.push_back((i+1)*100+j);
			 	}
			 	if(i-1>=0  && ar[0][i-1][j]==10) 
			 	{
			 		arr[0][i-1][j]=1; no_r_b.push_back((i-1)*100+j);
			 	}
			 	
			 	 if(j+1<M && ar[0][i][j+1]==10) 
			 	{
			 		arr[0][i][j+1]=1; no_r_b.push_back(i*100+j+1);
			 	}
			 	if(j-1>=0 && ar[0][i][j-1]==10) 
			 	{
			 		arr[0][i][j-1]=1; no_r_b.push_back(i*100+j-1);
			 	}
			 	
			 	if(no_r_b.size()==0)
			 		{
			 			printf("impossible\n"); continue;
			 		}
			 		
			 		if(ar[0][gi][gj]==10 && arr[0][gi][gj]==1) af=1;
			 		if(ar[1][gi][gj]==10 && arr[1][gi][gj]==1) af=1;
			 		if(ar[2][gi][gj]==10 && arr[2][gi][gj]==1) af=1;
			 		if(ar[3][gi][gj]==10 && arr[3][gi][gj]==1) af=1;
			 		if(af)
			 			{
			 				printf("1\n"); continue;
			 			}
			 			
			 			int x=no_r_b.size();
		/*While(1)*/					while(1)
			 			{ int i,j,stt; 
			 			ans++; //printf("\nbefore start ");
			 			for(int g=0;g<no_r_b.size();g++)
			 		//	printf("%d  ",no_r_b[g]); printf("\n");
			 				for(int a=0;a<no_r_b.size();a++)
			 						{
			 							stt=no_r_b[a]/10000; if(stt==3) stt=-1;
			 						//	printf("\nhere %d %d\n",no_r_b.size(),stt);
			 							i=no_r_b[a]; i=i%10000; i=i/100;
			 							j=no_r_b[a]; j=j%100;
			 							
				if(i+1<N  && ar[stt+1][i+1][j]==10) 
			 	{ 
			 		if(arr[stt+1][i+1][j]!=1) v.push_back(10000*(stt+1)+(i+1)*100+j); arr[stt+1][i+1][j]=1; 
			 	}
			 	if(i-1>=0 && ar[stt+1][i-1][j]==10) 
			 	{ 
			 		if(arr[stt+1][i-1][j]!=1 ) v.push_back(10000*(stt+1)+(i-1)*100+j); arr[stt+1][i-1][j]=1; 
			 	}
			 //	printf("  before in   %d<%d %d  ",j+1,M,ar[stt+1][i][j+1]);
			 	 if(j+1<M  && ar[stt+1][i][j+1]==10) 
			 	{ //printf("  after  in   "); 
			//	if(arr[stt+1][i][j+1]!=1) printf("pushiiing  %d %d %d %d ",10000*(stt+1)+i*100+j+1,stt,i,j+1);
			 	if(arr[stt+1][i][j+1]!=1)	v.push_back(10000*(stt+1)+i*100+j+1);	arr[stt+1][i][j+1]=1; 
			 	}
			 	//printf("  before in   %d<%d %d  ",j+1,M,ar[stt+1][i][j+1]);
			 	if(j-1>=0 && ar[stt+1][i][j-1]==10) 
			 	{ //printf("  after  in   ");
			 //	if( arr[stt+1][i][j-1]!=1) printf("pushiiing  %d %d %d  %d ",10000*(stt+1)+i*100+j-1,stt,i,j-1);
				 	if( arr[stt+1][i][j-1]!=1) v.push_back(10000*(stt+1)+i*100+j-1); arr[stt+1][i][j-1]=1; 
			 	}
			 	
			 	
			 	  //printf("testing   %d  %d\n",no_r_b.size(),ans);	
				  		 	
			 							if(v.size()==0) af=-1;
			 							else x=no_r_b.size();
			 							
			 							if(ar[0][gi][gj]==10 && arr[0][gi][gj]==1) af=1;
			 		if(ar[1][gi][gj]==10 && arr[1][gi][gj]==1) af=1;
			 		if(ar[2][gi][gj]==10 && arr[2][gi][gj]==1) af=1;
			 		if(ar[3][gi][gj]==10 && arr[3][gi][gj]==1) af=1;
			 		if(af) break; 
			 							
			 							
			 						}
			 						
			 				//		 printf("content of aray is : "); for(int d=0;d<v.size();d++) printf("%d  ",v[d]);
			 				if(af==-1 || af==1) break;
			 				
			 				no_r_b.clear(); no_r_b=v; v.clear();
			 				
			 			}
			 		//	printf("hereee %d %d ",ans,no_r_b.size());
			 	if(af==-1) printf("impossible\n");
			 	if(af==1) printf("%d\n",ans);
			 
			 
		//if()
		/*	 for(int i=0;i<N;i++)
			 { printf("\n");
			 	 for(int j=0;j<M;j++) printf("%d  ",ar[3][i][j]);
			 }
			
			 printf("\n\n");
			 */
			 
	}
}
