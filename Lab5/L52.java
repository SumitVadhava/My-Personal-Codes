package Lab5;
import java.util.Scanner;
class Time{
    int h,m;
  Time(){
       h=12;
       m=30;

  }
  Time(int hr,int min){
    h=hr;
    m=min;
  }
  void addtion(int t1h,int t2h,int t1m,int t2m){
    int hours = t1h+t2h;
    int minutes= t1m+t2m;
    if(minutes>60){
        hours+=minutes/60;
        minutes%=60;
    }
    System.out.println(+hours+"hr:"+minutes+"min");

  }

}
public class L52 {
    public static void main(String[] args) {
        Scanner sc= new Scanner(System.in);
          
            Time t1= new Time();
            Time t2 =new Time(10,45);
        t2.addtion(t1.h,t2.h,t1.m,t2.m);
       

       
     
    }
}
