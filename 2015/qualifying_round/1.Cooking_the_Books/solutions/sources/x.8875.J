import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class Main1 {

	public static void main(String args[]) throws IOException {

		// initialise reader
		Reader.init(System.in);
		int testCases = Reader.nextInt();

		final int[] smallNums = new int[testCases];
		final int[] bigNums = new int[testCases];

		for (int i = 0; i < testCases; ++i) {
			int N = Reader.nextInt();
			int temp = N;

			ArrayList<Integer> num = new ArrayList<Integer>();

			do {
				num.add(temp % 10);
				temp /= 10;
			} while (temp > 0);

			
			int size = num.size() - 1;
			int k = size - 1;
			int smallIndx = size, bigIndx = size;

			for (; k >= 0; --k) {

				if (num.get(k) != 0) {
					if (num.get(smallIndx) >= num.get(k))
						smallIndx = k;
					else if (num.get(bigIndx) <= num.get(k))
						bigIndx = k;

				}
			}
			

			ArrayList<Integer> tmp = new ArrayList<Integer> ();
			tmp = (ArrayList<Integer>) num.clone();
			
			smallNums[i] = swap(num, smallIndx, size);
			bigNums[i] = swap(tmp, bigIndx, size);
			

		}

		for (int i = 0; i < testCases; ++i) {
			
			
			System.out.println("Case #" + Integer.toString(i + 1) + ": " + smallNums[i] + " "
					+ bigNums[i]);
		}

	}

	private static int swap(ArrayList<Integer> num, int index, int size) {

		
//		System.out.println("index =  "+ index +
//				" size = "  + size +
//				" num.get(size) = " + num.get(size)
//				+ " num.get( index ) " + num.get( index) + " num = " +num.toString() );
		
		
		int temp = num.get(size);
		num.set(size, num.get( index ));
		num.set( index, temp);
		
		int n = num.get(size);
		
		for (int k = size - 1; k >= 0; k--) {
			n = num.get(k) + n * 10;
		}
		return n;
	}
}

class Reader {
	static BufferedReader reader;
	static StringTokenizer tokenizer;

	/** call this method to initialize reader for InputStream */
	static void init(InputStream input) {
		reader = new BufferedReader(new InputStreamReader(input));
		tokenizer = new StringTokenizer("");
	}

	/** get next word */
	static String next() throws IOException {
		while (!tokenizer.hasMoreTokens()) {
			tokenizer = new StringTokenizer(reader.readLine());
		}
		return tokenizer.nextToken();
	}

	static int nextInt() throws IOException {
		return Integer.parseInt(next());
	}

}
