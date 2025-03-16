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

namespace fbe

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as byte ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as ubyte ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, data_, amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, data_, amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as short ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as ushort ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as long ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as ulong ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as integer ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as uinteger ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as longint ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as ulongint ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as single ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as double ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, , *data_, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), amount*sizeof(*data_))
        else
            ..get #m_filehandle, filepos, *data_, amount
        end if

    end if
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as string ptr, byval amount as uinteger = 0 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    
    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, cast(ubyte ptr, data_), iif(amount = 0, len(*data_), amount))
        else
            ..get #m_filehandle, , *(cast(ubyte ptr, data_)), iif(amount = 0, len(*data_), amount)
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, cast(ubyte ptr, data_), iif(amount = 0, len(*data_), amount))
        else
            ..get #m_filehandle, filepos, *(cast(ubyte ptr, data_)), iif(amount = 0, len(*data_), amount)
        end if

    end if
   

    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

'' :::::
sub File.get( byval filepos as longint = -1, byval data_ as boolean ptr, byval amount as uinteger = 1 )

    #if __FB_MT__
    mutexlock(m_mutex)
    #endif

    var buffer = new ubyte[amount]

    if filepos = -1 then
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, 0, buffer, amount)
        else
            ..get #m_filehandle, , *buffer, amount
        end if

    else
        if m_fsd <> null then
            m_bytes = m_fsd->fsget(m_fsd, filepos, buffer, amount)
        else
            ..get #m_filehandle, filepos, *buffer, amount
        end if

    end if

    for n as uinteger = 0 to amount - 1
        if (buffer[n] = 0) then
            data_[n] = false
        else 
            data_[n] = true
        end if
    next n

    delete[] buffer
    
    #if __FB_MT__
    mutexunlock(m_mutex)
    #endif

end sub

end namespace