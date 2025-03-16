# include once "fbefile/file.bi"

var myfile = fbe.File("test.txt")

if myfile.open() then

    do while not myfile.eof

        print myfile.readLine

    loop

else

    print "Error Code: " & myfile.LastError

end if
