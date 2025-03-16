# ifndef FBE_FILE_COMMON_BI__
# define FBE_FILE_COMMON_BI__ -1

#ifndef null
const null = cast(any ptr, 0)
#endif

#if __FB_MT__
    #inclib "fbefilemt"
#else
    #inclib "fbefile"
#endif

namespace fbe

    type SizeType as uinteger

    ''Enum: ACCESS_TYPE
    ''Used to specify the access to use when opening a file.
    ''
    ''R - Open the file read-only.
    ''W - Open the file for write access.
    ''RW - Open the file for reading and writing.
    ''A - Open the file with the cursor set to the end.
    ''
    enum ACCESS_TYPE

        R = 0
        W
        RW
        A

    end enum

    type FileSystemDriverF as FileSystemDriver

    type drvfsopen as function( byval t as FileSystemDriverF ptr ) as boolean
    type drvfsclose as sub( byval t as FileSystemDriverF ptr )
    type drvfslof as function( byval t as FileSystemDriverF ptr ) as ulongint
    type drvfsloc as function( byval t as FileSystemDriverF ptr ) as ulongint
    type drvfsseek as function(  byval t as FileSystemDriverF ptr, byval p as ulongint ) as boolean
    type drvfseof as function(  byval t as FileSystemDriverF ptr ) as boolean
    type drvfsget as function( byval t as FileSystemDriverF ptr, byval pos_ as ulongint, byval p as ubyte ptr, byval n as SizeType ) as SizeType
    type drvfsput as function( byval t as FileSystemDriverF ptr, byval pos_ as ulongint, byval p as ubyte ptr, byval n as SizeType ) as SizeType

    ''Type: FileSystemDriver
    ''A group of function pointers to allow access to a specific filesystem or filesystem like object.
    type FileSystemDriver
        fsopen as drvfsopen
        fsclose as drvfsclose
        fslof as drvfslof
        fsloc as drvfsloc
        fsseek as drvfsseek
        fseof as drvfseof
        fsget as drvfsget
        fsput as drvfsput
        driverdata as any ptr
    end type

    ''Function: newMemoryFileDriver
    ''Creates a driver allowing one to access a region of memory as if it were a file.
    ''
    ''Params:
    ''d - ubyte ptr to a region of memory that is already allocated and managed by the user.
    ''dlen - the length (in bytes) of the memory pointed to by d
    ''
    ''Returns:
    ''A fully functioning driver representing a memory region as a file.
    ''
    declare function newMemoryFileDriver( byval d as ubyte ptr, byval dlen as SizeType, byval frefun as sub(byval as any ptr) = 0 ) as FileSystemDriver ptr

end namespace

# endif ' include guard

