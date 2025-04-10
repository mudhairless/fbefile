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

#include once "fbefile/file_iter.bi"
#include once "dir.bi"

namespace fbe

constructor FILE_ITER( byref path as string )

    p_pathname = path
    attrib = &h21

end constructor

constructor FILE_ITER( byref path as string, byval attrib_ as integer )

    p_pathname = path
    attrib = attrib_

end constructor

operator FILE_ITER.for( )

    p_latest = dir(p_pathname, attrib, @p_attrib)

end operator

operator FILE_ITER.step( )

    p_latest = dir( @p_attrib )

end operator

operator FILE_ITER.next( byref end_cond as FILE_ITER ) as integer

    return p_latest <> end_cond.p_pathname

end operator

function FILE_ITER.filename( ) as string

    return p_latest

end function

function FILE_ITER.attributes( ) as integer
    return p_attrib
end function

function FILE_ITER.readOnly() as boolean
    return p_attrib AND fbReadOnly
end function

function FILE_ITER.directory() as boolean
    return p_attrib AND fbDirectory
end function

function FILE_ITER.hidden() as boolean
    return p_attrib AND fbHidden
end function

function FILE_ITER.system() as boolean
    return p_attrib AND fbSystem
end function

function FILE_ITER.archive() as boolean
    return p_attrib AND fbArchive
end function

end namespace