#include <iostream>
#include <vector>
#include <sstream>
#include <fstream>
#include <string>
#include <cstdlib> 

using namespace std;


bool isSafe(const vector<int>& report) {
    bool increasing = true;
    bool decreasing = true;

    
    for (size_t i = 0; i < report.size() - 1; ++i) {
        int diff = abs(report[i + 1] - report[i]);

        
        if (diff < 1 || diff > 3) {
            return false;
        }

        
        if (report[i + 1] > report[i]) {
            decreasing = false;
        }
        else if (report[i + 1] < report[i]) {
            increasing = false;
        }
    }

    
    return increasing || decreasing;
}


bool canBeSafeByRemovingOne(const vector<int>& report) {
    
    for (size_t i = 0; i < report.size(); ++i) {
        vector<int> modifiedReport = report;
        modifiedReport.erase(modifiedReport.begin() + i);  

        
        if (isSafe(modifiedReport)) {
            return true;
        }
    }

    
    return false;
}

int main() {
    std::ifstream inputFile("F:/souce/AdventOfCode/2024/Day 2 Red-Nosed Reports/Red-Nosed Reports Input.txt"); 
    std::vector<std::string> inputData;        
    std::string line;

    
    if (!inputFile.is_open()) {
        std::cerr << "Error opening file!" << std::endl;
        return 1;  
    }

    
    while (std::getline(inputFile, line)) {
        inputData.push_back(line);  
    }

    
    inputFile.close();


    int safeCount = 0;

    
    for (const string& line : inputData) {
        stringstream ss(line);
        vector<int> report;
        int num;

        
        while (ss >> num) {
            report.push_back(num);
        }

        
        if (isSafe(report)) {
            safeCount++;
        }
        
        else if (canBeSafeByRemovingOne(report)) {
            safeCount++;
        }
    }

    
    cout << "Safe reports: " << safeCount << endl;

    return 0;
}
