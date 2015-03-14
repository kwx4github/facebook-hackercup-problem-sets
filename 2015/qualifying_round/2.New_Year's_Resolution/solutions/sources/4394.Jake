package com.jake.hackercup.qual;


import java.util.ArrayList;
import java.util.List;

import com.jake.hackercup.JUtil;

public class NewYearsResolution {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<String> list = JUtil.readFile("input/new_years_resolution.txt");
		
		List<String> output = new ArrayList<String>();
		
		int caseNo = 0;
		for(int i = 1 ; i < list.size();i++){
			
			final int pcf[] = convert2Array(list.get(i));
			
			int foodCount = Integer.parseInt(list.get(++i));
			
			List<int[]> foods = new ArrayList<int[]>();
			
			for(int j = 0; j < foodCount;j++){
				
				foods.add(convert2Array(list.get(++i)));
			}
			
			String caseLine = null;
			boolean re = search(pcf,foods,new ArrayList<Integer>());
			
			if(re){
				caseLine = "Case #" + Integer.toString(++caseNo) + ": yes";
				
			}else{
				caseLine = "Case #" + Integer.toString(++caseNo) + ": no";
			}
			
			output.add(caseLine);
			JUtil.print(caseLine);
		}
		JUtil.writeFile("output/new_years_resolution_output.txt", output);
	}
	private static boolean search(final int [] pcf, List<int[]> foods, List<Integer> selections){
		
		int sum[] = getSum(foods,selections);
		
		for(int i = 0 ; i < foods.size();i++){
			if(sum[0] + foods.get(i)[0] == pcf[0]
				&& sum[1] + foods.get(i)[1] == pcf[1]
				&& sum[2] + foods.get(i)[2] == pcf[2]){
				
				return true;
			}else if(sum[0] + foods.get(i)[0] < pcf[0]
						&& sum[1] + foods.get(i)[1] < pcf[1]
						&& sum[2] + foods.get(i)[2] < pcf[2]){
				
				selections.add(i);
				
				boolean found = search(pcf,foods,selections);
				
				if(found){
					return true;
				}else{
					selections.remove(selections.size()-1);
				}
			}
			
		}
		
		return false;
	}
	private static int[] getSum(List<int[]> foods, List<Integer> selections){
		int sum[] = new int[]{0,0,0};
		
		if(selections.size()==0){
			return sum;
		}
		
		for(int i = 0 ; i < selections.size();i++){
			
			sum[0] = sum[0] + foods.get(selections.get(i))[0];
			sum[1] = sum[1] + foods.get(selections.get(i))[1];
			sum[2] = sum[2] + foods.get(selections.get(i))[2];
		}
		return sum;
	}
	private static int [] convert2Array(String str){
		String strs[] = str.split("\\ ");
		
		int target[] = new int[strs.length];
		
		for(int i = 0 ; i < strs.length;i++){
			target[i] = Integer.parseInt(strs[i]);
		}
		return target;
	}

}
