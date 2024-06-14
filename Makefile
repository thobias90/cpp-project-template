# Variables
BUILD_DIR = build
SRC_DIR = $(shell pwd)


# Targets
.PHONY: dependency clean build

all: clean build

dependency:
	cd $(BUILD_DIR) && cmake $(SRC_DIR) --graphviz=graph.dot && dot -Tpng graph.dot -o graphImage.png

clean:
	@echo "Removing existing build directory..."
	rm -rf $(BUILD_DIR)

build:
	@echo "Creating build directory and running CMake for Lib and Main"
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake $(SRC_DIR) && make

test:
	@echo "Building tests"
	mkdir -p ${BUILD_DIR}
	cd ${BUILD_DIR} && cmake -DENABLE_TEST=ON ${SRC_DIR} && make