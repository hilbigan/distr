compile:
	mkdir -p bin/
	ghc distr.hs -O2 -o bin/distr

install: compile
	cp bin/distr /usr/local/bin/
