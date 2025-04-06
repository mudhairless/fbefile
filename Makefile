COMPILER = fbc
COMPILE_OPTS = -i inc -g -w all -exx
LINK_OPTS = -lib
TEST_COMPILE_OPTS = -i inc -p lib -g -w all -exx

all: lib/libfbefile.a lib/libfbefilemt.a

%.o: %.bas 
	$(COMPILER) $(COMPILE_OPTS) -c $< -o $@

%.mt.o: %.bas
	$(COMPILER) $(COMPILE_OPTS) -mt -c $< -o $@

lib/libfbefile.a: src/file.o src/file-get.o src/file-put.o src/file-print.o src/memory-fs-driver.o src/file-iter.o
	$(COMPILER) $(LINK_OPTS) -x lib/libfbestrings.a src/file.o src/file-get.o src/file-put.o src/file-print.o src/memory-fs-driver.o src/file-iter.o

lib/libfbefilemt.a: src/file.mt.o src/file-get.mt.o src/file-put.mt.o src/file-print.mt.o src/memory-fs-driver.mt.o src/file-iter.mt.o
	$(COMPILER) $(LINK_OPTS) -x lib/libfbestrings.a src/file.mt.o src/file-get.mt.o src/file-put.mt.o src/file-print.mt.o src/memory-fs-driver.mt.o src/file-iter.mt.o

clean:
	rm src/*.o lib/*.a 

.PHONY: clean
