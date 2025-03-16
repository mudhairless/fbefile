@IF "%fbc%"=="" (
    @echo Please run SET FBC=fbc32 or your preferred compiler first
    @goto :eof
)

@echo Clearing Old Build Files
del src\*.o
del lib\*.a
del tests\*.exe
del tests\*.tst
del examples\*.exe

@echo Building Components
%fbc% -c -i inc -w all -g -exx src/file.bas
%fbc% -c -i inc -w all -g -exx src/file-get.bas
%fbc% -c -i inc -w all -g -exx src/file-put.bas
%fbc% -c -i inc -w all -g -exx src/file-print.bas
%fbc% -c -i inc -w all -g -exx src/memory-fs-driver.bas

@echo Building Libraries
%fbc% -lib src/file.o src/file-get.o src/file-put.o src/file-print.o src/memory-fs-driver.o -x lib/libfbefile.a

@echo Building MT Components
@del src\*.o
%fbc% -c -i inc -w all -g -mt -exx src/file.bas
%fbc% -c -i inc -w all -g -mt -exx src/file-get.bas
%fbc% -c -i inc -w all -g -mt -exx src/file-put.bas
%fbc% -c -i inc -w all -g -mt -exx src/file-print.bas
%fbc% -c -i inc -w all -g -mt -exx src/memory-fs-driver.bas

@echo Building MT Libraries
%fbc% -mt -lib src/file.o src/file-get.o src/file-put.o src/file-print.o src/memory-fs-driver.o -x lib/libfbefilemt.a

@echo Running Tests
%fbc% -p lib -i inc -w all -g -exx tests/file.bas
tests\file.exe
%fbc% -p lib -i inc -w all -g -exx tests/memory-driver.bas
tests\memory-driver.exe

@echo Building examples
%fbc% -p lib -i inc -w all -g -exx examples/simple.bas