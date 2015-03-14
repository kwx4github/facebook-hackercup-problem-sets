import java.awt.*;
import java.awt.geom.*;
import java.io.*;
import java.math.*;
import java.text.*;
import java.util.*;

public class B {
	private static BufferedReader br;
	private static StringTokenizer st;
	private static PrintWriter pw;

	public static void main(String[] args) throws IOException	{
		br = new BufferedReader(new InputStreamReader(System.in));
		pw = new PrintWriter(new BufferedWriter(new OutputStreamWriter(System.out)));
		final int MAX_NUM_CASE = readInt();
		for(int qq = 1; qq <= MAX_NUM_CASE; qq++)	{
			pw.print("Case #" + qq + ": ");
			State goal = new State(readInt(), readInt(), readInt());
			int n = readInt();
			State[] list = new State[n];
			for(int i = 0; i < n; i++) {
				list[i] = new State(readInt(), readInt(), readInt());
			}
			boolean can = false;
			for(int mask = 1; mask < (1<<n) && !can; mask++) {
				State now = new State(0,0,0);
				for(int i = 0; i < n; i++) {
					if((mask&(1<<i)) == 0) continue;
					now = now.add(list[i]);
				}
				can = now.equals(goal);
			}
			pw.println(can ? "yes" : "no");
		}
		pw.close();
	}

	static class State {
		public int x,y,z;
		public State add(State s) {
			return new State(x + s.x, y + s.y, z + s.z);
		}
		public State(int a, int b, int c) {
			x=a;
			y=b;
			z=c;
		}
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + x;
			result = prime * result + y;
			result = prime * result + z;
			return result;
		}
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			State other = (State) obj;
			if (x != other.x)
				return false;
			if (y != other.y)
				return false;
			if (z != other.z)
				return false;
			return true;
		}
		
	}
	
	/* NOTEBOOK CODE */

	private static long readLong() throws IOException	{
		return Long.parseLong(nextToken());
	}

	private static double readDouble() throws IOException	{
		return Double.parseDouble(nextToken());
	}

	private static int readInt() throws IOException	{
		return Integer.parseInt(nextToken());
	}

	private static String nextToken() throws IOException	{
		while(st == null || !st.hasMoreTokens())	{
			if(!br.ready())	{
				pw.close();
				System.exit(0);
			}
			st = new StringTokenizer(br.readLine().trim());
		}
		return st.nextToken();
	}
}