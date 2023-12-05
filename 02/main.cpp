#include <iostream>
#include <cstddef>
#include <fstream>
#include <string>
#include <regex>
using namespace std;

int getGameID(string line) {
    regex gameNumberRegex("Game (\\d+)");
    smatch match;
    int id;

    regex_search(line, match, gameNumberRegex);
    id = stoi(match[1]);

    return id;
}

int getMaxColoredBallsInGame(string line, string color) {
    regex colorRegex("(\\d+) " + color);
    smatch match;
    int number;
    int max = 0;

    string::const_iterator searchStart(line.cbegin());
    while (regex_search(searchStart, line.cend(), match, colorRegex)) {
        searchStart = match.suffix().first;
        number = stoi(match[1]);

        if (number > max) {
            max = number;
        }
    }

    return max;
}

int getSumOfPossible(string fileName, int totalRed, int totalGreen, int totalBlue) {
    ifstream input (fileName);
    int sumIDs = 0;
    int sumPower = 0;

    if (input.is_open()) {
        string line;
        vector <string> splitString;
        int id;
        int red, green, blue;

        while (getline(input, line)) {
            id = getGameID(line);
            red = getMaxColoredBallsInGame(line, "red");
            green = getMaxColoredBallsInGame(line, "green");
            blue = getMaxColoredBallsInGame(line, "blue");

            sumPower += red * green * blue;

            if ((red <= totalRed) && (green <= totalGreen) && (blue <= totalBlue)) {
                sumIDs += id;
            }
        }
    }
    return sumPower;
}

int main() {
    cout << "Result: " << getSumOfPossible("input", 12, 13, 14) << endl;
}
