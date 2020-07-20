SRC_DIR := ./src
INC_DIR := ./include
OBJ_DIR := ./obj
SRC_FILES := $(wildcard ./main.cpp)
SRC_FILES += $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES))
LDFLAGS := -I$(INC_DIR)
CPPFLAGS := -std=c++11 -I$(INC_DIR) 
CXXFLAGS := -MMD

test: all
	./MedicalTestRequestApplication.out

all: $(OBJ_DIR) MedicalTestRequestApplication.out

MedicalTestRequestApplication.out: $(OBJ_FILES)
	g++ -o $@ $^ $(LDFLAGS)

$(OBJ_DIR)/rsdl.o: $(RSDL_DIR)/rsdl.cpp $(RSDL_DIR)/rsdl.hpp
	g++ $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $<

clean: 
	rm -fr $(OBJ_DIR)/*.o $(OBJ_DIR)/*/*.o

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp $(INC_DIR)/%.hpp
	g++ $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $<

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)