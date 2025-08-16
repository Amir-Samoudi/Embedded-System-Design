#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <bitset>

int main() {

    std::ifstream infile("main.txt");	// std::ifstream infile("C:\\... project directory ...\\main.txt");

    if (!infile.is_open()) {
        std::cerr << "Error opening input file!" << std::endl;
        return 1;
    }


    std::ofstream outfile("output.txt");
    if (!outfile.is_open()) {
        std::cerr << "Error opening output file!" << std::endl;
        return 1;
    }

    std::string line;
    while (std::getline(infile, line)) {
        if (line.empty()) continue;  

       
        std::stringstream ss(line);
        std::string address_str, content_str;
        if (!std::getline(ss, address_str, '_') || !std::getline(ss, content_str, '_')) {
            std::cerr << "Error parsing line: " << line << std::endl;
            continue;
        }

        
        unsigned int address = std::stoul(address_str, nullptr, 16);
        unsigned int content = std::stoul(content_str, nullptr, 16);

       
        for (int i = 0; i < 4; ++i) {
            unsigned char byte = (content >> (i * 8)) & 0xFF;
            std::bitset<8> binary_byte(byte);
            std::cout << "@" << address + i << " " << binary_byte << std::endl;
            outfile << "@" << address + i << " " << binary_byte << std::endl;
        }
    }

    infile.close();
    outfile.close();
    return 0;
}


