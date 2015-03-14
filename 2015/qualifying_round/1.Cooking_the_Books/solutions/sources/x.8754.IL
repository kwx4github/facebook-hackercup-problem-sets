
import java.util.ArrayList;
import java.util.Scanner;


public class Main {
	
	private static int getMinPosition (String str){
		int minIndex = 0;
		
		for (int i = 1; i < str.length(); i++){
		   int newnumber = Character.getNumericValue(str.charAt(i));
		 
		   if(newnumber != 0 ){
			  
		   
		   if ((newnumber < Character.getNumericValue(str.charAt(minIndex)))){
			   minIndex = i;
		   }
		}
		}
		return minIndex ;
	}
	
	private static int getMaxPosition(String str){
		int maxIndex = 0;
		for (int i = 1; i < str.length(); i++){
		   int newnumber = Integer.valueOf(str.charAt(i));
		   if ((newnumber > Integer.valueOf(str.charAt(maxIndex))) ){
			   maxIndex = i;
		   }
		}
		return maxIndex ;
	}

	public static void main(String[] args) {
		ArrayList output = new ArrayList();
		Scanner sc = new Scanner (System.in);
		int T = sc.nextInt();
		if (T>=1 && T<=100){
			for(int i=0;i<T;i++){
				Integer N = sc.nextInt();
				if(N>=0 && N<=999999999){
				switch(N.toString().length()){
				case 1 :
					output.add(N);
					output.add(N);
					break;
				
				default :
					
				if(getMinPosition(N.toString())!=0){
					char a = N.toString().charAt(getMinPosition(N.toString()));
					char b = N.toString().charAt(0);
					
					char c [] = N.toString().toCharArray();
					c[0]=a;
					c[getMinPosition(N.toString())]=b;
					
					 output.add(new String (c)) ;
				}else{
					output.add(N);
				}
				if(getMaxPosition(N.toString())!=0){
					char a = N.toString().charAt(getMaxPosition(N.toString()));
					char b = N.toString().charAt(0);
					
					char c [] = N.toString().toCharArray();
					c[0]=a;
					c[getMaxPosition(N.toString())]=b;
					 output.add(new String (c)) ;
				}else{
					output.add(N);
				}
				
				break;	
				}
				}
			}
		
		}
		sc.close();
		int a = 1;
		for(int i =0;i<output.size();i=i+2){
			
			System.out.println("Case #"+(a)+":  "+output.get(i)+"\t"+output.get(i+1));
			a++;
		}

	}

}
