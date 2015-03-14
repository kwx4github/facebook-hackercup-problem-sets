#include <iostream>
#include <string>

int main() {
	int nNoTestCases;
	std::cin >> nNoTestCases;

	for (int nCaseLoop = 1; nCaseLoop <= nNoTestCases; nCaseLoop++) {
		std::string oNumber;
		std::cin >> oNumber;

		std::string oMin(oNumber), oMax(oNumber);

		for (auto oIt1 = oNumber.begin(); oIt1 != oNumber.end(); oIt1++) {
			for (auto oIt2 = oIt1 + 1; oIt2 != oNumber.end(); oIt2++) {
				std::swap(*oIt1, *oIt2);

				if (oNumber[0] != '0') {
					if (oNumber < oMin)
						oMin = oNumber;
					else if (oNumber > oMax)
						oMax = oNumber;
				}

				std::swap(*oIt1, *oIt2);
			}
		}

		std::cout << "Case #" << nCaseLoop << ": " << oMin << " " << oMax << std::endl;
	}

	return 0;
}