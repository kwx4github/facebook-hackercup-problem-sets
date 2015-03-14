import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Accounting
{
	
	public class Number
	{
		//int numOfTimes;
		List<Integer> indexLocations;
		
		
	}
	
	public List<Integer> findLargest(List<Integer> number)
	{
		if(number.size() <= 1)
			return number;
		
		List<Number> numberInfo = parseNumber(number);
		
		Integer currentMax;
		
		for(int i = 0; i < number.size(); ++i)
		{
			currentMax = getCurrentMax(numberInfo);
			
			if(currentMax == -1)
				System.out.println("??????");
			
			
			
			if(number.get(i) < currentMax)
			{
				int temp = number.get(i);
				number.set(i, currentMax);
				number.set(getLastIndexLocation(numberInfo, currentMax), temp);
				
				return number;
			}
			else
			{
				numberInfo.get(currentMax).indexLocations.remove(0);
			}
		}
		
		return number;
		
		
	}
	
	private Integer getCurrentMax(List<Number> numberInfo)
	{
		for(int i = numberInfo.size()-1; i >= 0; --i)
		{			
			if(numberInfo.get(i).indexLocations.size() > 0)
				return i;
		}
		
		return -1;
	}
	
	
	public List<Integer> findSmallest(List<Integer> number)
	{
		if(number.size() <= 1)
			return number;
		
		List<Number> numberInfo = parseNumber(number);
		
		Integer currentMin;
		
		for(int i = 0; i < number.size(); ++i)
		{
			currentMin = getCurrentMin(numberInfo, i);
			
			if(currentMin == -1)
				System.out.println("??????");
			
			
			
			if(number.get(i) > currentMin)
			{
				int temp = number.get(i);
				number.set(i, currentMin);
				number.set(getLastIndexLocation(numberInfo, currentMin), temp);
				
				return number;
			}
			else
			{
				numberInfo.get(currentMin).indexLocations.remove(0);
			}
		}
		
		return number;
		
		
	}
	
	public int getLastIndexLocation(List<Number> numberInfo, int currentMin)
	{
		int size = numberInfo.get(currentMin).indexLocations.size();
		return numberInfo.get(currentMin).indexLocations.get(size -1);
	}
	
	private Integer getCurrentMin(List<Number> numberInfo, int index)
	{
		for(int i =0; i < numberInfo.size(); ++i)
		{
			if(index == 0)
			{
				i = 1;
				index = -1;
			}
			
			if(numberInfo.get(i).indexLocations.size() > 0)
				return i;
		}
		
		return -1;
	}

	public List<Number> parseNumber(List<Integer> number)
	{
		List<Number> numberInfo = new ArrayList<Number>();
		for(int i = 0; i < 10; i++)
		{
			numberInfo.add(new Number());
			//numberInfo.get(i).numOfTimes = 0;
			numberInfo.get(i).indexLocations = new ArrayList<Integer>();
		}
		
		for(int i = 0; i < number.size(); ++i)
		{
			//numberInfo.get(number.get(i)).numOfTimes++;
			numberInfo.get(number.get(i)).indexLocations.add(i);
		}
		
		return numberInfo;
	}
	
	
	
	
	public static void main(String[] args)
	{
		Accounting myThis = new Accounting();
		
		
		int cases;
		Scanner fileInput = null;
		PrintWriter writer = null;
		try
		{
			fileInput = new Scanner(new FileReader("books.txt"));
			writer = new PrintWriter("newBooks.txt");
		}
		catch (FileNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		cases = fileInput.nextInt();
		
		List<Integer> number;
		
		
		String numberAsString;
		
		for(int i = 0; i < cases; ++i)
		{
			number = new ArrayList<Integer>();
			numberAsString = fileInput.next();
			
			for(int j = 0; j < numberAsString.length(); ++j)
			{
				number.add(Character.getNumericValue(numberAsString.charAt(j)));
			}
			
			List<Integer> smallest = new ArrayList(number);
			smallest = myThis.findSmallest(smallest);
			
			List<Integer> largest = new ArrayList(number);
			largest = myThis.findLargest(largest);
			
			System.out.print("Case #" + Integer.toString(i + 1) + ": ");
			writer.print("Case #" + Integer.toString(i + 1) + ": ");
			
			for(int j = 0; j < smallest.size(); ++j)
			{
				System.out.print(smallest.get(j));
				writer.print(smallest.get(j));
			}
			
			System.out.print(" ");
			writer.print(" ");
			
			for(int j = 0; j < largest.size(); ++j)
			{
				System.out.print(largest.get(j));
				writer.print(largest.get(j));
			}
	
			System.out.println();
			writer.println();
			
		}
		
		writer.close();
		
		
		
		
		
		System.out.println("Hello World");
	}
}
