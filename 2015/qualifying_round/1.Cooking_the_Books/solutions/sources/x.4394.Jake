package com.jake.hackercup.qual;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

public class CookingtheBooks {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		List<String> list = readFile("input/cooking_the_books.txt");
		
		int caseNo = 0;
		List<String> output = new ArrayList<String>();
		
		int totalCount = 0;
		for(String line : list){
			
			if(++totalCount>20){
				break;
			}
			String caseLine = "Case #" + Integer.toString(++caseNo) 
								+ ": " + getSmallest(line)
								+ " " + getLargest(line);
			output.add(caseLine);
			print(caseLine);
			
		}
		writeFile("output/cooking_the_books_output.txt",output);
	}
	
	private static String getSmallest(String numStr){
		
		int nums[] = getNums(numStr);
		
		for(int i = 0; i < nums.length-1; i++){
			
			int swapIndex = i;
			int min = nums[i];
			for(int j = i+1; j <nums.length; j++){
				
				if(min >= nums[j] 
				               && !(i==0 && nums[j] == 0)
				               && nums[i] != nums[j]){
					swapIndex = j;
					min = nums[j];
				}
			}
			if(swapIndex>i){
				
				int srcValue = nums[swapIndex];
				int trgValue = nums[i];
				
				nums[swapIndex] = trgValue;
				nums[i] = srcValue;
				
				return getNumStr(nums);
			}
		}
		return numStr;
		
	}
	private static String getLargest(String numStr){
		
		int nums[] = getNums(numStr);
		
		
		for(int i = 0; i < nums.length-1; i++){
			
			int swapIndex = i;
			int max = nums[i];
			for(int j = i+1; j <nums.length; j++){
				
				if(max <= nums[j] 
				               && nums[j] > 0
				               && nums[i] != nums[j]){
					swapIndex = j;
					max = nums[j];
				}
			}
			if(swapIndex>i){
				
				int srcValue = nums[swapIndex];
				int trgValue = nums[i];
				
				nums[swapIndex] = trgValue;
				nums[i] = srcValue;
				
				return getNumStr(nums);
			}
		}
		return numStr;
	}
	private static int [] getNums(String numStr){
		int nums[] = new int[numStr.length()];
		for(int i = 0 ; i < nums.length;i++){
			
			nums[i] = Integer.parseInt(numStr.substring(i,i+1));
		}
		return nums;
	}
	private static String getNumStr(int[] nums){
		String numStr = "";
		for(int i = 0 ; i < nums.length; i++){
			
			numStr = numStr + Integer.toString(nums[i]);
		}
		return numStr;
	}
	public static void print(String str){
		
		System.out.println(str);
	}
	public static List<String> readFile(String filePath){
		
		List<String> contents = new ArrayList<String>();
		InputStream  input = null;
		BufferedReader br =null;
  	      
		try{ 
			
			input  = new FileInputStream(filePath);
			
			br = new  BufferedReader( new InputStreamReader(input));
			String line =null;
			while( (line = br.readLine()) != null){
				
				if(line!=null){
					contents.add(line);
				}
			}
		}catch(FileNotFoundException e){
			System.out.println(e);
			
		}catch(IOException ie){
			System.out.println(ie);
		}finally{
			try{
				if(br!=null){
					br.close();
				}
				if(input!=null){
					input.close();
				}
			}catch(IOException ioe){
				System.out.println(ioe);
			}
		}
		return contents;
	}
	public static void writeFile(String filePath,List<String> contents){
		
		FileOutputStream output=null;
		BufferedWriter bw=null;
		try{
			
			output  = new FileOutputStream(filePath);
			bw = new BufferedWriter(new OutputStreamWriter(output));
			
			for(String sb : contents){
				bw.write(sb.toString()+"\n");
			}
			
		}catch(FileNotFoundException fe){
			System.out.println(fe);
		}catch(IOException ie){
			System.out.println(ie);
		}finally{
			try{
				if(bw!=null){
					bw.flush();
					bw.close();
				}
				if(output!=null){
					output.close();
			    }
				
			}catch(IOException ioe){
				System.out.println(ioe);
			}
		}
	
	}
}
