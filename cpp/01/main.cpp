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
        string digits = "0123456789";

        while (getline(input, line)) {
            size_t firstDigitPos = line.find_first_of(digits);
            size_t lastDigitPos = line.find_last_of(digits);
            int first = line[firstDigitPos] - '0';
            int last = line[lastDigitPos] - '0';
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
