TARGET ?= build

.PHONY: run build setup clean generate_ast build_tool

run: build
	java -cp $(TARGET) com.craftinginterpreters.lox.Lox

build: setup generate_ast
	javac -d $(TARGET) src/com/craftinginterpreters/lox/*.java

setup:
	mkdir -p $(TARGET)

clean:
	rm -rf $(TARGET)

generate_ast: build_tool
	java -cp $(TARGET) com.craftinginterpreters.tool.GenerateAst src/com/craftinginterpreters/lox

build_tool: setup
	javac -d $(TARGET) src/com/craftinginterpreters/tool/*.java
