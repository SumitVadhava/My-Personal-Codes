package Lab5;
import java.util.Scanner;
class Area{
    double areaofCircle(int r){
       double area= (Math.PI)*(r)*(r);
       return area;                 
    }
}
public class L51{
public static void main(String[] args) {
    Scanner sc= new Scanner(System.in);
    Area a1= new Area();
    System.out.println("Enter radius=");
    int r1=sc.nextInt();
    sc.close();
   double a= a1.areaofCircle(r1);
   System.out.println("Area"+a);
 } 
}

