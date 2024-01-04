#include<stdio.h>
void main(){
    int n;
    printf("Enter Number=");
    scanf("%d",&n);
    int i;
    int count=0;
    for(i=2;i<=n/2;i++){
       if(n%i!=0){
       		printf("Enter Number is prime");
       		break;
	   }
	   else{
	   	printf("Enter Number is not prime");
	   	break;
	   }
	}
}

