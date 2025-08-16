# Define the compiler
CXX := g++

# Define the SystemC installation path
SYSTEMC_HOME := /home/amirh/systemc-2.3.3

# Define the include directory
INCLUDE_DIR := $(SYSTEMC_HOME)/include

# Define the library directory
LIB_DIR := $(SYSTEMC_HOME)/lib-linux64

# Define the flags for the compiler
CXXFLAGS := -I$(INCLUDE_DIR) -std=c++11

# Define the flags for the linker
LDFLAGS := -L$(LIB_DIR) -lsystemc -lm

# Define the source files
SRCS := $(wildcard *.cpp)

# Define the object files
OBJS := $(SRCS:.cpp=.o)

# Define the executable file
EXEC := output_file

# Default target
all: $(EXEC)

# Rule to create the executable
$(EXEC): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS)

# Rule to create object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean target
clean:
	rm -f $(OBJS) $(EXEC)

# Phony targets
.PHONY: all clean
