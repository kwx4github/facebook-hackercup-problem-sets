import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Q55 {
	
	class Node{
		public int x;
		public int y;
		public int d;
		public int t;
		public Node p = null;
		public String v;
		public int tl;
	}
	
	Scanner scanner = null;
		
	boolean debug = false;
	String inputFile = "laser_maze.txt";
	int M;
	int N;
	int Sx;
	int Sy;
	int Gx;
	int Gy;
	List<Node> Q;
	Node[][][] nodeCache;
	
	void read() {		
		M = scanner.nextInt();
		N = scanner.nextInt();
		Q = new ArrayList<Node>();
		nodeCache = new Node[4][M][N];
		for(int y=0; y<M; y++){
			String line = scanner.next();
			for(int x=0; x<N; x++){					
				String vertex = line.substring(x, x+1);
				if(vertex.equals("S")){
					Sx = x;
					Sy = y;
				}
				for(int t=0; t<4; t++){
					Node node = new Node();
					node.x = x;
					node.y = y;					
					node.d = -1;
					node.t = t;
					nodeCache[t][y][x]=node;
					if(vertex.equals("S")){
						node.v = "S";
						if(t == 0){
							node.d = 0;
						}
					}
					if(isTurret(vertex)){
						node.v = rotateTurret(vertex, t);
					}else{
						node.v = vertex;
					}					
					Q.add(node);
				}
			}
		}
	}
	
	void solve() {		
		int round = 0;
		while(Q.size() > 0){
			debugln("round:"+round);
			round+=1;			
			Node node = getShortest();	
			if(node == null){
				break;
			}
			Q.remove(node);			
			if (node.v.equals("G")){
				node.v = "*";
				debugln("WIN!!!!!");
				System.out.println(node.d);
				printMatrix();
				return;
			}
			node.v=""+node.d;
			List<Node> nList = getNeighbour(node);
			for(Node n:nList){
				int alt = node.d + n.tl;
				if(alt < n.d || n.d == -1){
					n.p = node;
					n.d = alt;
				}
			}
			printMatrix();
		}
		System.out.println("impossible");
	}
	
	int addTime(int time, int add){
		int nt = time + add;
		while(nt > 3){
			nt = nt - 4;
		}
		return nt;
	}
	
	List<Node> getNeighbour(Node node){
		List<Node> nList = new ArrayList<Node>();
		int t = node.t;
		int x=node.x;
		int y=node.y;
		Node nL = getPath(t,y,x-1);		
		if(nL!=null){
			nList.add(nL);
		}
		Node nR = getPath(t,y,x+1);
		if(nR!=null){
			nList.add(nR);
		}
		Node nU = getPath(t,y-1,x);
		if(nU!=null){
			nList.add(nU);
		}
		Node nd = getPath(t,y+1,x);
		if(nd!=null){
			nList.add(nd);
		}
		return nList;
	}
	
	Node getPath(int t, int y, int x){
		Node n = getNode(addTime(t,1),y,x);
		if(n==null){
			return null;
		}else{
			n.tl=1;
		}	
		if(isPath(n)){
			return n;
		}
		else return null;
	}
	
	boolean isPath(Node node){
		if(node == null){
			return false;
		}
		String v = node.v;
		if(v.equals("S") || v.equals("G") || v.equals(".")){
			return true;
		}
		return false;
	}
	
	Node getShortest(){
		int minD = Integer.MAX_VALUE;
		Node minNode = null;
		for(Node node:Q){
			if(node.d < minD && node.d!=-1){
				minNode = node;
				minD = node.d;
			}			
		}
		return minNode;
	}
	
	Node getNode(int t, int y, int x){
		if(y>=M || y<0){
			return null;
		}else if(x>=N || x<0){
			return null;
		}
		Node node = nodeCache[t][y][x];		
		return node;
	}
	
	void removeBlocker(){
		for(int i=0; i<Q.size(); i++){
			Node n = Q.get(i);
			if(!isPath(n)){
				Q.remove(n);
				i-=1;
			}			
		}
	}
	
	void fireLaser(){
		debugln("w:"+N+"h:"+M);
		for(int t=0; t<4; t++){
			for(int y=0; y<M; y++){
				for(int x=0; x<N; x++){
					Node node = getNode(t,y,x);
					if(isTurret(node.v)){	
						if(node.v.equals(">")){
							//>
							if(x<N-1){
								for(int r=x+1; r<N;r++){
									Node lp = getNode(t,y,r);
									if(!canStopLaser(lp.v)){
										if(!isStart(lp)){
											lp.v="l";
										}
									}else{
										break;
									}
								}
							}
						}else if(node.v.equals("<")){
							//<
							if(x>0){
								for(int l=x-1; l>=0;l--){
									Node lp = getNode(t,y,l);
									if(!canStopLaser(lp.v)){
										if(!isStart(lp)){
											lp.v="l";
										}
									}else{
										break;
									}
								}
							}
						}else if(node.v.equals("^")){
							//^
							if(y>0){
								for(int u=y-1; u>=0;u--){
									Node lp = getNode(t,u,x);
									if(!canStopLaser(lp.v)){
										if(!isStart(lp)){
											lp.v="l";
										}
									}else{
										break;
									}
								}
							}
						}else if(node.v.equals("v")){
							//v
							if(y<M-1){
								for(int d=y+1; d<M; d++){
									Node lp = getNode(t,d,x);
									if(!canStopLaser(lp.v)){
										if(!isStart(lp)){
											lp.v="l";
										}
									}else{
										break;
									}
								}
							}
						}						
					}
				}
			}
		}
		debugln("");
		printMatrix();
	}
	
	boolean isStart(Node node){
		if(node.v.equals("S") && node.t==0){
			return true;
		}else{
			return false;
		}
	}
	void printMatrix(){
		for(int y=0; y<M; y++){
			for(int t=0; t<4; t++){
				for(int x=0; x<N; x++){
					Node node = getNode(t,y,x);
					if(node == null){
						debug("n");
					}else{
						debug(node.v);
					}
				}
				debug(" ");
			}			
			debugln("");
		}
	}
	
	String rotateTurret(String l, int time){
		String n = l;
		while (time>0){
			n = rotateTurret(n);
			time-=1;
		}
		return n;
	}
	
	boolean canStopLaser(String v){
		if(isTurret(v)){
			return true;
		}
		if(v.equals("#")){
			return true;
		}
		return false;				
	}
	
	boolean isTurret(String v){
		if(v.equals("^") || v.equals(">") || v.equals("v") || v.equals("<")){
			return true;
		}else{
			return false;
		}		
	}
	String rotateTurret(String l){
		if(l.equals("^")){
			return ">";
		}else if(l.equals(">")){
			return "v";
		}else if(l.equals("v")){
			return "<";			
		}else if(l.equals("<")){
			return "^";
		}
		return null;
	}
	
	void run() {
		long stime = System.currentTimeMillis();
		int caseN = scanner.nextInt();		
		for (int caseID = 1; caseID <= caseN; caseID++) {			
			System.out.printf("Case #%d: ", caseID);
			read();
			fireLaser();		
			removeBlocker();
			solve();
			debugln("==================================");
			System.out.flush();
		}
		long ctime = System.currentTimeMillis();
		debugln(String.format("--- Done: %3.0fs",(ctime-stime)*0.001));
	}
	
	private void debug(String message){
		if(debug){
			System.out.print(message);
		}
	}
	
	private void debugln(String message){
		if(debug){
			System.out.println(message);
		}
	}

	public Q55(){
		try {
			System.setIn(new BufferedInputStream(new FileInputStream(inputFile)));			
		} catch (Exception e) {
			e.printStackTrace();
		}
		scanner = new Scanner(System.in);
	}
	
	public static void main(String[] args) {
		Q55 a = new Q55();
		a.run();
	}
}
