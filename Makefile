SRC := main.cpp lex.cpp structure.cpp syntax.cpp symtable.cpp gencode.cpp
compile.o:
	g++ -g -o $@ $(SRC)


clean:
	rm compile.o