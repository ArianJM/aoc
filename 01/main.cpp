#include <iostream>
#include <fstream>
#include <string>
#include <cstddef>
using namespace std;

int main() {
    string line;
    ifstream input ("input");
    int sum = 0;

    if (input.is_open()) {
        string digits = "123456789";

        while (getline(input, line)) {
            size_t firstDigitPos = line.find_first_of(digits);
            size_t lastDigitPos = line.find_last_of(digits);
            int firstAsDigit = line[firstDigitPos] - '0';
            int lastAsDigit = line[lastDigitPos] - '0';

            size_t firstAsTextPos = string::npos;
            size_t lastAsTextPos = string::npos;
            int firstAsText = 0;
            int lastAsText = 0;
            string numberAsText [9] = { "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };
            for (int i = 0; i < 9; i++) {
                size_t firstFoundAt = line.find(numberAsText[i]);
                size_t lastFoundAt = line.rfind(numberAsText[i]);

                if (firstFoundAt != string::npos) {
                    if (firstFoundAt < firstAsTextPos) {
                        firstAsTextPos = firstFoundAt;
                        firstAsText = i + 1;
                    }
                }
                if (lastFoundAt != string::npos) {
                    if ((lastAsTextPos == string::npos) || (lastFoundAt > lastAsTextPos)) {
                        lastAsTextPos = lastFoundAt;
                        lastAsText = i + 1;
                    }
                }
            }

            int first = 0;
            int last = 0;

            if (firstDigitPos < firstAsTextPos) {
                first = firstAsDigit;
            }
            else {
                first = firstAsText;
            }

            if ((lastAsTextPos == string::npos) || ((lastDigitPos > lastAsTextPos) && (lastDigitPos != string::npos))) {
                last = lastAsDigit;
            }
            else {
                last = lastAsText;
            }

            int number = (first * 10) + last;

            sum += number;
        }
        input.close();
    }
    else {
        cout << "Unable to open file";
    }

    cout << "Result: " << sum << endl;

    return 0;
}
