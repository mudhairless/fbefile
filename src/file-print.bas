''Copyright (c) 2025, Ebben Feagan
''Copyright (c) 2007-2024, FreeBASIC Extended Library Development Group
''
'' All rights reserved.
''
'' Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
''
''  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
''  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
''  * Neither the name of the copyright holders nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
''
'' THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
'' "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
'' LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
'' A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
'' CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
'' EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
'' PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
'' PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
'' LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
'' NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
'' SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# include once "fbefile/detail/common.bi"
# include once "fbefile/file.bi"

#define min(lhs, rhs) iif((lhs) < (rhs), lhs, rhs)
#define max(lhs, rhs) iif((lhs) > (rhs), lhs, rhs)

namespace fbe

private sub generic_print( byval t as FileSystemDriver ptr, byval d as ubyte ptr, byval n as SizeType )

        #ifdef __FB_PCOS__
            var lineending = !"\r\n"
        #else
            var lineending = !"\n"
        #endif

        t->fsput(t, 0, d, n)
        t->fsput(t, 0, @lineending[0], len(lineending))

    end sub

'' :::::
sub File.print( byref data_ as byte )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then

        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))
        
    else
    if m_filehandle <> null then

        ..print #m_filehandle, data_

    end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as byte, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n


    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as ubyte )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then
        
        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))
        
    else
        if m_filehandle <> null then
            ..print #m_filehandle, data_
        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as ubyte, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n


    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as short )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then
        
        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))
 
    else
        if m_filehandle <> null then

            ..print #m_filehandle, data_

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as short, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif
    
    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n


    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as ushort )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then
        
        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))

    else
        if m_filehandle <> null then

            ..print #m_filehandle, data_

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as ushort, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n


    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as long )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then
 
        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))

    else
        if m_filehandle <> null then

            ..print #m_filehandle, data_

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as long, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif
    
    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n


    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as ulong )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then

        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))
    else
        if m_filehandle <> null then

            ..print #m_filehandle, data_

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as ulong, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n


    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as integer )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then

        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))

    else
        if m_filehandle <> null then

            ..print #m_filehandle, data_

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as integer, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n


    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as uinteger )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then

        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))

    else
        if m_filehandle <> null then

            ..print #m_filehandle, data_

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as uinteger, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif
    
    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n


    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as longint )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then

        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))

    else
        if m_filehandle <> null then

            ..print #m_filehandle, data_

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as longint, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n


    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as ulongint )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then

        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))

    else
        if m_filehandle <> null then

            ..print #m_filehandle, data_

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as ulongint, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as single )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then

        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))
        
    else
        if m_filehandle <> null then

            ..print #m_filehandle, data_

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as single, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif
    
    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n


    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as double )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then

        generic_print(m_fsd,cast(ubyte ptr,@data_),sizeof(data_))

    else
        if m_filehandle <> null then

            ..print #m_filehandle, data_

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as double, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif
    
    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as string )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if m_fsd <> null then
        
        generic_print(m_fsd,cast(ubyte ptr,@data_[0]),len(data_))
        
    else
        if m_filehandle <> null then

            ..print #m_filehandle, data_

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as string, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif
    
    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper

        if m_fsd <> null then
            this.print(_data(n))
        else
            if m_filehandle <> null then
            ..print #m_filehandle, _data(n)
            end if
        end if

    next n


    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( byref data_ as boolean )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    dim as ubyte rd = iif(data_, 1, 0)

    if m_fsd <> null then

        generic_print(m_fsd,cast(ubyte ptr,@rd),sizeof(rd))
        
    else
        if m_filehandle <> null then

            ..print #m_filehandle, rd

        end if
    end if

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.print( _data() as boolean, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif
    
    var lower = max(start, lbound(_data))
    var upper = min(finish, ubound(_data))

    for n as integer = lower to upper
        dim as ubyte rd = iif(_data(n), 1, 0)
        if m_fsd <> null then
            this.print(rd)
        else
            if m_filehandle <> null then
            ..print #m_filehandle, rd
            end if
        end if

    next n

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

end namespace