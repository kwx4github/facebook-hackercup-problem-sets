#include<iostream>
#include<fstream>
#include<vector>


struct threeFood
{
	int f1;
	int f2;
	int f3;
};

bool notDone(std::vector<int> foodsUsed)
{
	for (int i = 0; i < foodsUsed.size(); ++i)
	{
		if (foodsUsed[i] != 1)
			return true;
	}

	return false;
}

bool foodComboIsRight(threeFood desired, std::vector<threeFood> listOfFoods, std::vector<int> foodsUsed)
{
	threeFood currentValue;
	currentValue.f1 = 0;
	currentValue.f2 = 0;
	currentValue.f3 = 0;

	for (int i = 0; i < foodsUsed.size(); ++i)
	{
		if (foodsUsed[i] == 1)
		{
			currentValue.f1 += listOfFoods[i].f1;
			currentValue.f2 += listOfFoods[i].f2;
			currentValue.f3 += listOfFoods[i].f3;
		}
	}

	if (currentValue.f1 == desired.f1 && currentValue.f2 == desired.f2 && currentValue.f3 == desired.f3)
		return true;
	else
		return false;
}

bool canEatRight(threeFood desired, std::vector<threeFood> listOfFoods)
{
	std::vector<int> foodsUsed;
	foodsUsed.resize(listOfFoods.size());
	for (int i = 0; i < foodsUsed.size(); ++i)
	{
		foodsUsed[i] = 0;
	}

	if (foodComboIsRight(desired, listOfFoods, foodsUsed))
		return true;

	while (notDone(foodsUsed))
	{
		for (int i = foodsUsed.size()-1; i >= 0; --i)
		{
			if (foodsUsed[i] == 0)
			{
				foodsUsed[i] = 1;
				for (int j = i+1; j < foodsUsed.size(); ++j)
				{
					foodsUsed[j] = 0;
				}

				break;
			}
		}


		if (foodComboIsRight(desired, listOfFoods, foodsUsed))
			return true;
	}

	return false;


}


int main()
{
	std::ifstream fin;
	std::ofstream fout;
	fin.open("input.txt");
	fout.open("output.txt");

	if (!fin)
	{
		std::cout << "error in opening the file";
		return 0;
	}

	int numOfCases;
	fin >> numOfCases;

	threeFood desired;
	int foodsListSize;
	std::vector<threeFood> foodsList;
	threeFood aFood;

	for (int i = 0; i < numOfCases; ++i)
	{
		fin >> desired.f1;
		fin >> desired.f2;
		fin >> desired.f3;

		fin >> foodsListSize;

		for (int j = 0; j < foodsListSize; ++j)
		{
			fin >> aFood.f1;
			fin >> aFood.f2;
			fin >> aFood.f3;

			foodsList.push_back(aFood);
		}

		if (canEatRight(desired, foodsList))
		{
			std::cout << "Case #" << i + 1 << ": yes";
			fout << "Case #" << i + 1 << ": yes";
		}
		else
		{
			std::cout << "Case #" << i + 1 << ": no";
			fout << "Case #" << i + 1 << ": no";
		}

		//if (i != numOfCases - 1)
		//{
			std::cout << std::endl;
			fout << std::endl;
		//}


		foodsList.clear();
	}
	

	return 0;
}