/*#include<stdio.h>
void main(){
    int n;
    printf("Enter number=");
    scanf("%d",&n);
    int i;
    int sum=0;
    for(i=1;i<=n;i++){
    	sum=sum+i;
	}
	printf("Ans=%d",sum);
}
*/
#include<stdio.h>
void main(){
    int n;
    printf("Enter number=");
    scanf("%d",&n);
    int sum=(n*(n+1))/2;
    printf("Ans=%d",sum);
}
 
