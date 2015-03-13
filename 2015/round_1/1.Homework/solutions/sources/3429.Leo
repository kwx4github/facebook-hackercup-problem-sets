import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class Q10 {
	
	Scanner scanner = null;
		
	boolean debug = false;
	String inputFile = "homework.txt";
	int A;
	int B;
	int K;
	
	void read() {
		A = scanner.nextInt();
		B = scanner.nextInt();
		K = scanner.nextInt();
	}
	
	void solve() {
			
		int pc = 0;
		for(int n = A; n<=B; n++){
			if (primeSize[n]==K){
				pc += 1;
			}
		}
		
		System.out.println(pc);
	}
	
	int[] primeSize = new int[10000001];
	
	void calPrimeSize(){
		for(int i=2; i<=10000000; i++){
			int s = primeFactors(i).size();			
			primeSize[i]=s;			
		}
	}
	
	Set<Integer> primeFactors(int numbers) {
		int n = numbers;
		Set<Integer> f = new HashSet<Integer>();
		for (int i = 2; i <= n / i; i++) {
			while (n % i == 0) {
				f.add(i);
				n /= i;
			}
		}
		if (n > 1) {
			f.add(n);
		}
		return f;
	}
	
	void run() {
		long stime = System.currentTimeMillis();
		calPrimeSize();
		int caseN = scanner.nextInt();
		for (int caseID = 1; caseID <= caseN; caseID++) {			
			System.out.printf("Case #%d: ", caseID);			
			read();
			solve();
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
			System.out.println("[DEBUG] "+message);
		}
	}

	
	public Q10(){
		try {
			System.setIn(new BufferedInputStream(new FileInputStream(inputFile)));			
		} catch (Exception e) {
			e.printStackTrace();
		}
		scanner = new Scanner(System.in);
	}
	
	public static void main(String[] args) {
		Q10 a = new Q10();
		a.run();
	}
}
