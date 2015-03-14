import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.lang.Exception;

public class CookingTheBooks{
	public static void main(String[] args){
		List<String> numbers;
		try{
			numbers = Files.readAllLines(Paths.get(args[0]), StandardCharsets.US_ASCII);
		}
		catch(Exception e){
			System.out.println("Cannot find file!");
			return;
		}
		int size = Integer.parseInt(numbers.get(0));
		for(int j=1;j<=size;j++){
			String s = numbers.get(j);
			char min = '9';
			char max = '0';
			int minIndex = 0;
			int maxIndex = 0;
			for(int i = 0; i<s.length(); i++){
				char currentDigit = s.charAt(i);
				if(currentDigit>max){
					max = currentDigit;
					maxIndex = i;
				}
				else if(currentDigit<min && currentDigit != '0'){
					min = currentDigit;
					minIndex = i;
				}
			}
			char[] newMin = s.toCharArray();
			char temp1 = newMin[0];
			newMin[0] = min;
			newMin[minIndex] = temp1;
			char[] newMax = s.toCharArray();
			char temp2 = newMax[0];
			newMax[0] = max;
			newMax[maxIndex] = temp2;
			System.out.println("Case #"+Integer.toString(j)+" "+new String(newMin)+" "+ new String(newMax));
		}
	}
}