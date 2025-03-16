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

    property File.fileName() as string
        return m_filename
    end property

    function File.getBytesRW() as ulongint
        return m_bytes
    end function

    

    function File.toBuffer( byref dest as ubyte ptr ) as SizeType

        dim as SizeType flen = lof()

        dest = new ubyte[flen]

        if dest = null then return 0

        this.get(, dest, flen)

        return flen

    end function

    '' :::::
    constructor File ( byref filename_ as const string, byval acc as ACCESS_TYPE = R )

        m_filename = filename_
        m_filehandle = 0
        m_access = acc
        m_lasterror = 0
        m_fsd = NULL
        m_bytes = 0ull

        #if __FB_MT__

        m_mutex = mutexcreate()

        #endif

    end constructor

    operator File.Let ( byref fn as string )
        this = File(fn)
        this.m_fsd = NULL
    end operator

    '' :::::
    constructor File ( byval fsd as FileSystemDriver ptr )
        m_fsd = fsd
    end constructor

    '' :::::
    constructor File ( )

        m_filename = ""
        m_filehandle = 0
        m_access = -1
        m_lasterror = 0
        m_fsd = NULL
        m_bytes = 0ull

        #if __FB_MT__
        m_mutex = mutexcreate()
        #endif

    end constructor

    '' :::::
    function File.eof( ) as boolean

        #if __FB_MT__
        mutexlock(m_mutex)
        #endif

        var x = false

        if m_fsd <> null then
            x = m_fsd->fseof(m_fsd)
        else
            x = iif(..eof(m_filehandle), true, false)
        end if

        #if __FB_MT__
        mutexunlock(m_mutex)
        #endif

        return x

    end function

    '' :::::
    property File.handle() as integer
        return m_filehandle
    end property

    '' :::::
    function File.lof() as longint

        #if __FB_MT__
        mutexlock(m_mutex)
        #endif

        dim x as longint

        if m_fsd <> null then
            x = m_fsd->fslof(m_fsd)
        else
            x = ..lof(m_filehandle)
        end if

        #if __FB_MT__
        mutexunlock(m_mutex)
        #endif

        return x

    end function

    '' :::::
    function File.loc() as longint

        #if __FB_MT__
        mutexlock(m_mutex)
        #endif

        dim x as longint

        if m_fsd <> null then
            x = m_fsd->fsloc(m_fsd)
        else
            x = ..loc(m_filehandle)
        end if

        #if __FB_MT__
        mutexunlock(m_mutex)
        #endif

        return x

    end function

    '' :::::
    property File.seek( byval poz as longint )

        #if __FB_MT__
        mutexlock(m_mutex)
        #endif

        if m_fsd <> null then
            m_fsd->fsseek(m_fsd,poz)
        else
            ..seek #m_filehandle, poz
        end if

        #if __FB_MT__
        mutexunlock(m_mutex)
        #endif

    end property

    '' :::::
    property File.seek( ) as longint

        #if __FB_MT__
        mutexlock(m_mutex)
        #endif

        dim x as longint

        if m_fsd <> null then
            x = m_fsd->fsloc(m_fsd)
        else
            x = ..seek(m_filehandle)
        end if

        #if __FB_MT__
        mutexunlock(m_mutex)
        #endif

        return x

    end property

    '' :::::
    function File.open( byref filename_ as const string, byval acc as ACCESS_TYPE = R ) as boolean

        #if __FB_MT__
        mutexlock(m_mutex)
        #endif

        m_filename = filename_
        m_access = acc

        #if __FB_MT__
        mutexunlock(m_mutex)
        #endif

        return open()

    end function

    '' :::::
    property File.LastError() as integer
        return m_lasterror
    end property

    '' :::::
    function File.open(byval acc as ACCESS_TYPE = R) as boolean

        #if __FB_MT__
        mutexlock(m_mutex)
        #endif

        if(m_access <> acc ANDALSO m_access = ACCESS_TYPE.R) then
          m_access = acc
        end if

        if m_fsd <> null then
            #if __FB_MT__
            mutexunlock(m_mutex)
            #endif
            return m_fsd->fsopen(m_fsd)
        else

            m_filehandle = freefile

            if (m_filename <> "" ANDALSO m_filehandle <> 0) then

                var ret = 0

                select case m_access
                    case ACCESS_TYPE.R
                    ret = ..open(m_filename, for binary, ACCESS READ, as m_filehandle)

                    case ACCESS_TYPE.W
                    ret = ..open(m_filename, for binary, ACCESS WRITE, as m_filehandle)

                    case ACCESS_TYPE.RW
                    ret = ..open(m_filename, for binary, ACCESS READ WRITE, as m_filehandle)

                    case ACCESS_TYPE.A
                    ret = ..open(m_filename, for binary, ACCESS WRITE, as m_filehandle)
                    seek =-1

                end select

                if ret <> 0 then
                    m_lasterror = ret

                    #if __FB_MT__
                    mutexunlock(m_mutex)
                    #endif

                    m_filehandle = 0

                    return false

                else
                    #if __FB_MT__
                    mutexunlock(m_mutex)
                    #endif

                    return true

                end if

            else

                m_lasterror = -1

                #if __FB_MT__
                mutexunlock(m_mutex)
                #endif

                m_filehandle = 0

                return false

            end if

        end if

    end function

    private function generic_readline ( byval fsd as FileSystemDriver ptr ) as string

        var ret = ""

        dim as ubyte x

        while not fsd->fseof(fsd)

            var res = fsd->fsget(fsd,0,@x,1)
            if res = 0 orelse x = 0 orelse x = 255 then exit while

            if x <> 13 then
                if x <> 10 then
                    ret &= chr(x)
                else
                    exit while
                end if
            else
                res = fsd->fsget(fsd,0,@x,1)
                if res = 0 orelse x = 0 then exit while
                if x <> 10 then
                    var cloc = fsd->fsloc(fsd)
                    fsd->fsseek(fsd,cloc-1)
                    continue while
                end if
                exit while
            end if
        wend

        return ret

    end function

    '' :::::
    function File.readLine() as string

        #if __FB_MT__
        mutexlock(m_mutex)
        #endif

        var x = ""

        if m_fsd <> 0 then
            x = generic_readline(m_fsd)
        else
            line input #m_filehandle, x
        end if

        #if __FB_MT__
        mutexunlock(m_mutex)
        #endif

        return x

    end function

    '' :::::
    sub File.close()

        #if __FB_MT__
        mutexlock(m_mutex)
        #endif

        if m_fsd <> 0 then
            m_fsd->fsclose(m_fsd)
        else
            if m_filehandle <> 0 then 
                m_lasterror = ..close (#m_filehandle)
            end if
        end if

        #if __FB_MT__
        mutexunlock(m_mutex)
        #endif

    end sub

    '' :::::
    destructor File ( )

        this.close

        #if __FB_MT__
        mutexdestroy(m_mutex)
        #endif

        if m_fsd <> 0 then delete m_fsd

    end destructor

end namespace 
