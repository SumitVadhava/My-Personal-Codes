#include<stdio.h>
void main(){
     int n;
     printf("Enter Number=");
     scanf("%d",&n);
     int i,r,sum;
     while(n!=0){
     	r=n%10;
     	n=n/10;
     	sum=sum*10+r;
	 }
	 printf("Ans=%d",sum);
}

