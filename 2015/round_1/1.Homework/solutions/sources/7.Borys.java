import java.io.*;
import java.util.*;

public class A {
	FastScanner in;
	PrintWriter out;

	void solve() {
		int tc = in.nextInt();
		final int MAX = (int) 1e7 + 10;
		int[] pr = new int[MAX];
		Arrays.fill(pr, 1);
		for (int i = 2; i < MAX; i++)
			if (pr[i] == 1) {
				for (int j = i + i; j < MAX; j += i) {
					pr[j]++;
				}
			} else {
				pr[i]--;
			}
		for (int t = 0; t < tc; t++) {
			out.print("Case #" + (t + 1) + ": ");
			int A = in.nextInt(), B = in.nextInt(), k = in.nextInt();
			int result = 0;
			for (int i = A; i <= B; i++) {
				if (pr[i] == k) {
					result++;
				}
			}
			out.println(result);
			System.err.println((t + 1) + "/" + tc + " done");
		}
	}

	void run() {
		try {
			in = new FastScanner(new File("A.in"));
			out = new PrintWriter(new File("A.out"));

			solve();

			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	void runIO() {

		in = new FastScanner(System.in);
		out = new PrintWriter(System.out);

		solve();

		out.close();
	}

	class FastScanner {
		BufferedReader br;
		StringTokenizer st;

		public FastScanner(File f) {
			try {
				br = new BufferedReader(new FileReader(f));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		}

		public FastScanner(InputStream f) {
			br = new BufferedReader(new InputStreamReader(f));
		}

		String next() {
			while (st == null || !st.hasMoreTokens()) {
				String s = null;
				try {
					s = br.readLine();
				} catch (IOException e) {
					e.printStackTrace();
				}
				if (s == null)
					return null;
				st = new StringTokenizer(s);
			}
			return st.nextToken();
		}

		boolean hasMoreTokens() {
			while (st == null || !st.hasMoreTokens()) {
				String s = null;
				try {
					s = br.readLine();
				} catch (IOException e) {
					e.printStackTrace();
				}
				if (s == null)
					return false;
				st = new StringTokenizer(s);
			}
			return true;
		}

		int nextInt() {
			return Integer.parseInt(next());
		}

		long nextLong() {
			return Long.parseLong(next());
		}

		double nextDouble() {
			return Double.parseDouble(next());
		}
	}

	public static void main(String[] args) {
		new A().run();
	}
}