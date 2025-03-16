#include once "fbefile/file.bi"

#macro assert_false(x)
    if ((x) = false) then
        print __FUNCTION__ & " " & #x & " is working"
    else 
        print __FUNCTION__ & " " & #x & " is NOT working"
    end if
#endmacro

#macro assert_true(x)
    if ((x) = true) then
        print __FUNCTION__ & " " & #x & " is working"
    else 
        print __FUNCTION__ & " " & #x & " is NOT working"
    end if
#endmacro

#macro assert_true_error(x)
    if ((x) = true) then
        print __FUNCTION__ & " " & #x & " is an error"
    else 
        print __FUNCTION__ & " " & #x & " is working"
    end if
#endmacro

function stringcompare( byref rhs as const string, byref lhs as const string ) as boolean

    var len_r = len(rhs) - 1
    var len_l = len(lhs) - 1

    var len_u = len_r
    if len_l < len_r then len_u = len_l

    for n as integer = 0 to len_u
        if rhs[n] <> lhs[n] then return false
    next

    return true

end function

const as string test_filename = "fbetest.tst"

sub create_file
    var x = new fbe.File(test_filename, fbe.ACCESS_TYPE.W)
    assert_true_error(null = x)
    var didOpen = x->open()
    
    assert_TRUE( didOpen )
    if (didOpen = true) then
        for n as integer = 0 to 9
            x->print("Line " & n)
            assert_true(x->LastError = 0)
        next
        x->close()
        assert_true(x->LastError = 0)
    end if
    delete x
end sub

sub test_readline
    var x = new fbe.File(test_filename)
    assert_TRUE_ERROR( null = x )
    var didOpen = x->open()
    assert_true( didOpen )
    if (didOpen) then
        for n as integer = 0 to 9
            assert_true( stringcompare("Line " & n, x->readLine()) )
        next
        x->close()
        assert_true(x->LastError = 0)
    end if

    delete x
end sub

sub kill_file
    kill test_filename
end sub

create_file()
test_readline()
kill_file()


