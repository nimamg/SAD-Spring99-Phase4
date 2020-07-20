#include <string>

class Address {
public:
    std::string city;
    std::string street;
    std::string alley;
    std::string postal_code;
    Address(std::string _city, std::string _street, std::string _alley, std::string _postal_code);
};
