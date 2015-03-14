import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Q30 {
	
	Scanner scanner = null;
		
	boolean debug = false;
	String inputFile = "new_years_resolution.txt";
	int N;
	int Gp;
	int Gc;
	int Gf;
	int P[];
	int C[];
	int F[];
	
	void read() {
		Gp = scanner.nextInt();
		Gc = scanner.nextInt();
		Gf = scanner.nextInt();
		N = scanner.nextInt();
		P = new int[N];
		C = new int[N];
		F = new int[N];
		for(int i=0; i<N; i++){
			P[i] = scanner.nextInt();
			C[i] = scanner.nextInt();
			F[i] = scanner.nextInt();
		}
	}
	
	void solve() {
			
		if (isAnyGoodCombination()){
			System.out.println("yes");
		}else{
			System.out.println("no");
		}

	}
	
	boolean isAnyGoodCombination(){
		List<Integer> choice = new ArrayList<Integer>();
		choice.add(0);
		int balance = isBalance(choice);
		while(balance != 1){
			
			if(choice.size() == 1 && choice.get(0) == N-1){
				return false;
			}
			
			int last = choice.get(choice.size()-1);
			if(last == N-1){
				choice.remove(choice.size()-1);			
				last = choice.remove(choice.size()-1);
			}else if(balance > 1){
				last = choice.remove(choice.size()-1);
			}
			choice.add(last+1);
			debugln("choice:"+choice);
						
			balance = isBalance(choice);
		}
		return true;
	}
		
	int isBalance(List<Integer> choice){
		int Tp = 0;
		int Tc = 0;
		int Tf = 0;
		for(int i:choice){
			Tp += P[i];
			Tc += C[i];
			Tf += F[i];
		}
		if(Tp == Gp && Tc == Gc && Tf == Gf){
			return 1;
		}else if(Tp > Gp && Tc > Gc && Tf > Gf){
			return 2;
		}else{
			return -1;
		}
	}
	
	
	void run() {
		long stime = System.currentTimeMillis();
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

	public Q30(){
		try {
			System.setIn(new BufferedInputStream(new FileInputStream(inputFile)));			
		} catch (Exception e) {
			e.printStackTrace();
		}
		scanner = new Scanner(System.in);
	}
	
	public static void main(String[] args) {
		Q30 a = new Q30();
		a.run();
	}
}
