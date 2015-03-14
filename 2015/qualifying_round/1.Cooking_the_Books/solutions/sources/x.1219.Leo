import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.util.Scanner;

public class Q15 {
	
	Scanner scanner = null;
		
	boolean debug = false;
	String inputFile = "cooking_the_books.txt";
	String AllN;
	int[] N;
	StringBuilder s;
	StringBuilder b;
			
	void read() {		 				
		AllN = scanner.next();
		debug("AllN:"+AllN);
		N = new int[AllN.length()];
		for(int j=0; j<AllN.length();j++){
			N[j] = Character.getNumericValue(AllN.charAt(j));
		}
		s = new StringBuilder("");
		b = new StringBuilder("");
	}
	
	void solve() {
				
		int min = 9;
		int max = 1;
		for(int i=0; i<N.length; i++){
			int num = N[i];
			if (num == 0){
				continue;
			}
			max = Math.max(max, num);
			min = Math.min(min, num); 
		}
		debug("max:"+max);
		debug("min:"+min);
		int swapS = -1;
		int swapB = -1;
		for(int i=N.length-1; i>=0; i--){
			if (N[i] == max){
				swapB = i;
				b.append(N[i]);
			}
			
			if (N[i] == min){
				swapS = i;
				s.append(N[i]);
			}
			
			if(swapS > 0 && swapB > 0){
				break;
			}
		}
		
		for(int i=0;i<N.length;i++){
			if(i!=swapB){
				b.append(N[i]);
			}
			
			if(i!=swapS){
				s.append(N[i]);
			}
		}
		System.out.print(s.toString());
		System.out.print(" ");
		System.out.print(b.toString());
	}
	
	
	void print(){

	}
	
	void run() {
		long stime = System.currentTimeMillis();
		int caseN = scanner.nextInt();		
		for (int caseID = 1; caseID <= caseN; caseID++) {			
			System.out.printf("Case #%d: ", caseID);
			read();
			print();
			solve();
			System.out.println();
			debugln("==================================");
			System.out.flush();
		}
		long ctime = System.currentTimeMillis();
		debugln(String.format("--- Done: %3.0fs",(ctime-stime)*0.001));
	}
	
	private void debug(String message){
		if(debug){
			System.err.print(message);
		}
	}
	
	private void debugln(String message){
		if(debug){
			System.err.println(message);
		}
	}

	public Q15(){
		try {
			System.setIn(new BufferedInputStream(new FileInputStream(inputFile)));			
		} catch (Exception e) {
			e.printStackTrace();
		}
		scanner = new Scanner(System.in);
	}
	
	public static void main(String[] args) {
		Q15 a = new Q15();
		a.run();
	}
}
