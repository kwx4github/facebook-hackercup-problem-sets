#include<iostream>
#include<fstream>
#include<vector>
#include<string>
#include<sstream>



struct digitInfo
{
	long long begRange;
	long long endRange;

	long long lastSeen;
};

int charToInt(char c)
{
	std::stringstream ss;
	int returnValue;

	ss << c;
	ss >> returnValue;
	return returnValue;
}

void swap(int& lhs, int& rhs)
{
	int temp = lhs;
	lhs = rhs;
	rhs = temp;
}

void findExtremes(std::vector<int>& original, std::vector<int>& smallest, std::vector<int>& largest)
{
	std::vector<digitInfo> info;
	info.resize(10);
	for (int i = 0; i < info.size(); ++i)
	{
		info[i].begRange = -1;
		info[i].endRange = -1;
		info[i].lastSeen = -1;
	}

	int currentDigit;
	for (int i = 0; i < original.size(); ++i)
	{
		currentDigit = original[i];
		if (info[currentDigit].begRange == -1)
		{
			info[currentDigit].begRange = i;
		}
		else if (info[currentDigit].endRange == -1)
		{
			if (original[i - 1] != currentDigit) //i-1 should always be in bounds
			{
				info[currentDigit].endRange = info[currentDigit].lastSeen;
			}
		}

		info[currentDigit].lastSeen = i;
	}

	for (int i = 0; i < info.size(); ++i)
	{
		if (info[i].begRange != -1 && info[i].endRange == -1)
		{
			info[i].endRange = info[i].lastSeen;
		}
	}



	//find smallest
	int checkedSoFarIndex = 0;
	int zeroIndexSkipper = 0;
	for (int i = 0; i < info.size(); ++i)
	{
		if (info[i].begRange != -1 && info[i].begRange != checkedSoFarIndex)
		{
			//std::cout << smallest[info[i].begRange] << std::endl;
			//std::cout << smallest[checkedSoFarIndex] << std::endl;
			if (i == 0)
			{
				if (smallest[1] == 0 && info[0].endRange + 1 == smallest.size())
				{
					break;
				}
				else if (smallest[1] == 0 && info[0].endRange == info[0].lastSeen)
				{
					original.erase(original.begin() + info[0].begRange, original.begin() + info[0].endRange + 1);
					smallest.erase(smallest.begin() + info[0].begRange, smallest.begin() + info[0].endRange + 1);
					std::vector<int> meh;
					meh.resize(0);
					findExtremes(original, smallest, meh);
					for (int j = info[0].begRange; j <= info[0].endRange; ++j)
					{
						original.insert(original.begin() + j, 0);
						smallest.insert(smallest.begin() + j, 0);
					}
					break;
					

					//swap(smallest[info[0].endRange + 1], smallest[info[0].lastSeen]);
					/*zeroIndexSkipper = info[0].endRange - info[0].begRange;
					for (int j = 0; j < info.size(); ++j)
					{
						if (info[j].begRange < info[0].begRange)
						{
							info[j].begRange -= zeroIndexSkipper;
							info[j].endRange -= zeroIndexSkipper;
							info[j].lastSeen -= zeroIndexSkipper;
						}
					}*/
				}
				else if (smallest[1] == 0 && info[0].endRange != info[0].lastSeen)
				{
					swap(smallest[info[0].endRange + 1], smallest[info[0].lastSeen]);
				}
				else
				{
					swap(smallest[1], smallest[info[0].lastSeen]);
				}
				//if (info[0].endRange != info[0].lastSeen)
				//	swap(smallest[info[0].endRange+1], smallest[info[0].lastSeen]);
			}
			else
			{
				swap(smallest[info[i].endRange], smallest[checkedSoFarIndex]);
			}
			
			break;

		}


		if (info[i].begRange != -1 && info[i].endRange != info[i].lastSeen)
		{
			swap(smallest[info[i].endRange + 1], smallest[info[i].lastSeen]);

			break;
		}
		if (info[i].begRange != -1)
			checkedSoFarIndex = info[i].lastSeen + 1;
	}

	if (largest.size() == 0)
		return;
	//findBiggest
	checkedSoFarIndex = 0;
	for (int i = info.size()-1; i >=0; --i)
	{
		if (info[i].begRange != -1 && info[i].begRange != checkedSoFarIndex)
		{

			swap(largest[info[i].endRange], largest[checkedSoFarIndex]);

			break;

		}


		if (info[i].begRange != -1 && info[i].endRange != info[i].lastSeen)
		{
			swap(largest[info[i].endRange + 1], largest[info[i].lastSeen]);

			break;
		}
		if (info[i].begRange != -1)
			checkedSoFarIndex = info[i].lastSeen + 1;
	}



}







int main()
{
	std::ifstream fin;
	fin.open("input.txt");
	
	std::ofstream fout;
	fout.open("output.txt");

	if (!fin)
	{
		std::cout << "file not found";
		return 0;
	}

	int numOfCases;



	fin >> numOfCases;

	std::string inputNumberString;
	std::vector<int> digits;

	std::vector<int> smallest;
	std::vector<int> largest;

	for (int i = 0; i < numOfCases; ++i)
	{
		//TODO: clear info vector!!!!!
		fin >> inputNumberString;
		for (int j = 0; j < inputNumberString.size(); ++j)
		{
			digits.push_back(charToInt(inputNumberString[j]));
		}
		smallest = digits;
		largest = digits;

		/*std::cout << "before: ";
		for (int j = 0; j < digits.size(); ++j)
		{
			std::cout << digits[j];
		}
		std::cout << "\t";*/

		findExtremes(digits, smallest, largest);

		std::cout << "Case #" << i + 1 << ": ";
		fout << "Case #" << i + 1 << ": ";
		for (int j = 0; j < smallest.size(); ++j)
		{
			std::cout << smallest[j];
			fout << smallest[j];
		}

		std::cout << " ";
		fout << " ";

		for (int j = 0; j < largest.size(); ++j)
		{
			std::cout << largest[j];
			fout << largest[j];
		}
		std::cout << std::endl;
		fout << std::endl;

		//Case #1: 13524 51324

		digits.clear();
	}

	return 0;
}