/* #include<stdio.h>
void main(){
	int m,n;
     printf("Enter First Number=");
      scanf("%d",&m);
      printf("Enter Second Number=");
      scanf("%d",&n);
      int i;
      int sum=0;
      for(i=m;i<=n;i++){
      	 sum=sum+i;
	  }
	  printf("Ans=%d",sum);
}
*/
#include<stdio.h>
void main(){
int m,n;
     printf("Enter First Number=");
      scanf("%d",&m);
      printf("Enter Second Number=");
      scanf("%d",&n);
	  int sum1=(n*(n+1))/2;
	  int sum2=(m*(m+1))/2;
	  int sum=sum1-sum2;
	  sum =sum+m;
	  printf("Ans=%d",sum);
}
