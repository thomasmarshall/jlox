TARGET ?= build

.PHONY: run build setup clean

run: build
	java -cp $(TARGET) com.craftinginterpreters.lox.Lox

build: setup
	javac -d $(TARGET) src/com/craftinginterpreters/lox/*.java

setup:
	mkdir -p $(TARGET)

clean:
	rm -rf $(TARGET)
