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

sub fill_data( byval x as ubyte ptr )
    for n as ubyte = 1 to 128
        x[n-1] = n
    next
end sub

function verify( byval lhs as ubyte ptr, byval rhs as ubyte ptr ) as boolean

    for n as ubyte = 0 to 127
        if lhs[n] <> rhs[n] then
            return false
        end if
    next

    return true
end function

sub test_memory_driver

    var dat = new ubyte[128]
    var dat_len = 128u
    fill_data(dat)

    var x = new fbe.File(fbe.newMemoryFileDriver(dat,dat_len))

    assert_TRUE( x->open() )
    assert_TRUE( x->lof() = dat_len )
    assert_TRUE( x->loc() = 0 )

    var dat2 = new ubyte[dat_len]

    x->get(, dat2, dat_len)

    assert_TRUE( x->loc() = dat_len )

    var dat2_ret = x->getBytesRW

    assert_TRUE( dat2_ret = dat_len )

    assert_TRUE( verify(dat,dat2) )

    delete[] dat
    delete[] dat2
    delete x

end sub

sub test_memory_driver_put

    var dat = new ubyte[128]
    var dat2 = new ubyte[128]

    var x = new fbe.File(fbe.newMemoryFileDriver(dat,128))

    for n as ubyte = 0 to 127
        x->put(,@n)
    next

    for n as integer = 0 to 127
        dat2[n] = n
    next

    assert_TRUE( verify(dat, dat2) )

    delete[] dat
    delete[] dat2
    delete x
end sub

sub test_memory_driver_string

    var test_string = "The fast fox runs through the forest."

    var dat = new ubyte[64]
    var x = new fbe.file(fbe.newMemoryFileDriver(dat,64))
    x->print(test_string)
    x->seek = 0
    assert_TRUE( x->loc = 0 )
    var ts = x->readLine()
    
    assert_true( stringcompare(test_string, ts))
    
    delete x
    delete dat

end sub

sub test_string_as_file

    var test_string = "This is a test string and needs to be longish."
    var x = new fbe.File(fbe.newMemoryFileDriver(cast(ubyte ptr,@test_string[0]),len(test_string)))

    assert_TRUE( x->lof = len(test_string) )

    dim as ubyte p
    for n as integer = 0 to 10
        x->get(,@p)
        assert_TRUE( p = test_string[n] )
    next

    delete x

end sub



test_memory_driver()
test_memory_driver_string()
test_memory_driver_put()
test_string_as_file()
