#include <string>

class Person {
protected:
    std::string ssn;
    std::string phone_number;
    std::string name;
    std::string password;
public:
    Person(std::string _name, std::string _password, std::string _ssn, std::string _phone_number);
};
