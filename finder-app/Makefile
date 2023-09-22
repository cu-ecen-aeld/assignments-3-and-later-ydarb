#!/usr/bin/env make

TARGET = writer
HEADERS = 
OBJECTS = $(TARGET).o
CC = $(CROSS_COMPILE)gcc
CFLAGS = -g -Wall
BUILD_DIR = build
CFG_OUT_FILE = "../assignments/assignment2/cross-compile.txt"

default: $(TARGET)

ifdef CROSS_COMPILE
	@$(CC) --version 2> $(CFG_OUT_FILE)
	@$(CC) -v 2>> $(CFG_OUT_FILE)
	@$(CC) -print-sysroot >> $(CFG_OUT_FILE)
endif

%.o: %.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $(BUILD_DIR)/$(OBJECTS) -o $@

clean:
	rm -f $(TARGET)
	rm -rf $(BUILD_DIR)
