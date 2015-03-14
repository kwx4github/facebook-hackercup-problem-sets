#include <iostream>
#include <string>
#include <vector>

struct FOOD {
	int m_nP, m_nC, m_nF;

	typedef std::vector<FOOD> FOODS_ARRAY;

	bool HasSol(FOODS_ARRAY &roFoodsArray, int nStep) {
		if (!m_nP && !m_nC && !m_nF)
			return true;

		if (nStep >= roFoodsArray.size() || m_nP < 0 || m_nC < 0 || m_nF < 0)
			return false;

		if (HasSol(roFoodsArray, nStep + 1))
			return true;

		*this -= roFoodsArray[nStep];
		bool bRet = HasSol(roFoodsArray, nStep + 1);
		*this += roFoodsArray[nStep];

		return bRet;
	}

	FOOD& operator += (FOOD &roRHS) {
		m_nP += roRHS.m_nP;
		m_nC += roRHS.m_nC;
		m_nF += roRHS.m_nF;
		return *this;
	}

	FOOD& operator -= (FOOD &roRHS) {
		m_nP -= roRHS.m_nP;
		m_nC -= roRHS.m_nC;
		m_nF -= roRHS.m_nF;

		return *this;
	}
};

static std::istream& operator >>(std::istream &roStream, FOOD &roFood) {
	roStream >> roFood.m_nP >> roFood.m_nC >> roFood.m_nF;
	return roStream;
}

int main() {
	int nNoTestCases;
	std::cin >> nNoTestCases;

	for (int nCaseLoop = 1; nCaseLoop <= nNoTestCases; nCaseLoop++) {
		FOOD oDesired;
		std::cin >> oDesired;

		int nN;
		FOOD::FOODS_ARRAY oFoods;
		std::cin >> nN;
		for (int nFoodIndex = 0; nFoodIndex < nN; nFoodIndex++) {
			FOOD oFood;
			std::cin >> oFood;
			oFoods.push_back(oFood);
		}

		std::cout << "Case #" << nCaseLoop << ": " << (oDesired.HasSol(oFoods, 0) ? "yes" : "no") << std::endl;
	}

	return 0;
}