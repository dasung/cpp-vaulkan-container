#include <iostream>
#include <string>

void func_hello_vulkan()
{
    std::string border(50, '*');
    std::cout << "\033[95m" << border << std::endl;
    std::cout << "*" << std::string(48, ' ') << "*" << std::endl;
    std::cout << "*      🔧 C++ Dev Container Environment 🐋      *" << std::endl;
    std::cout << "*" << std::string(48, ' ') << "*" << std::endl;
    std::cout << "*       Hello from C++ with MinGW/GCC!       *" << std::endl;
    std::cout << "*    Running in a Dev Container Environment    *" << std::endl;
    std::cout << "*" << std::string(48, ' ') << "*" << std::endl;
    std::cout << border << "\033[0m" << std::endl;
}

int main()
{
    func_hello_vulkan();
    return 0;
}
