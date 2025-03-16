# ifndef FBE_FILE_BI__
# define FBE_FILE_BI__ -1

# include once "fbefile/detail/common.bi"
#include once "fblimits.bi"

'' Namespace: fbe
namespace fbe

    ''Class: File
    ''Manages a connection to a disk file.
    ''
    ''Notes:
    ''This class is Threadsafe.
    ''
    ''See Also:
    ''<Simple File class example>
    type File
    public:

        ''Sub: Standard "file" constructor
        ''Sets the file to open and its access level.
        ''
        ''Parameters:
        ''filename - the file to open.
        ''acc - one of <ACCESS_TYPE>
        ''
        declare constructor ( byref filename as const string, byval acc as ACCESS_TYPE = R )

        ''Sub: FileSystemDriver constructor
        ''Creates a file-like object from any source.
        ''
        ''Parameters:
        ''fsd - pointer to the <FileSystemDriver> to use (created with new or helper function.)
        ''
        declare constructor ( byval fsd as FileSystemDriver ptr )

        ''Sub: default constructor
        ''Constructs an invalid File object. Use the <open> function to
        ''make this a valid File object.
        ''
        declare constructor ( )

        ''Function: open
        ''Used with the default constructor to open a file.
        ''
        ''Parameters:
        ''filename - the file to open.
        ''acc - one of <ACCESS_TYPE>
        ''
        ''Returns:
        ''true on success, false on failure.
        ''
        declare function open( byref filename as const string, byval acc as ACCESS_TYPE = R ) as boolean

        ''Function: open
        ''Opens the file specified to the constructor.
        ''
        ''Parameters:
        ''*Optional* acc - one of <ACCESS_TYPE>
        ''
        ''Returns:
        ''true on success, false on failure.
        ''
        declare function open(byval acc as ACCESS_TYPE = R) as boolean

        ''Sub: close
        ''Closes access to a disk file.
        ''
        declare sub close()

        ''Property: handle
        ''Used to retrieve the handle of the open file for use in input and write statements.
        ''
        ''Returns:
        ''integer containing the file handle.
        ''
        declare property handle() as integer

        ''Function: lof
        ''Retrieves the length of the currently open file in bytes.
        ''
        ''Returns:
        ''longint containing the number of bytes in the file.
        ''
        declare function lof() as longint

        ''Function: loc
        ''Retrieves the current position in the file.
        ''
        ''Returns:
        ''longint containing the current position in the file.
        ''
        declare function loc() as longint

        ''Function: eof
        ''Tells whether or not the end of the file has been reached.
        ''
        ''Returns:
        ''false at the end of the file, false otherwise.
        declare function eof() as boolean

        ''Property: seek
        ''Seeks to a position in the file.
        ''
        ''Parameters:
        ''poz - the position in the file to seek to, 1 based.
        ''
        declare property seek( byval poz as longint )

        ''Property: seek
        ''Returns the position in the file the next read or write will happen.
        ''
        ''Returns:
        ''longint containing the next read or write position.
        ''
        declare property seek() as longint

        ''Sub: print
        ''Overloaded print routine that will print one of any built-in datatype.
        ''
        ''Parameters:
        ''data_ - the data to print to the file.
        ''
        declare sub print ( byref data_ as byte )

        ''Sub: print
        ''Overloaded print routine that will print an array of any built-in datatype.
        ''
        ''Parameters:
        ''data_ - the data array to print to the file.
        ''amount - the number of records to copy, default of 0 = all items in range
        ''start - the start index (defaults to lbound of array)
        ''finish - the ending index (defaults to ubound of array)
        ''
        declare sub print ( _data() as byte, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as ubyte )
        declare sub print ( _data() as ubyte, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as short )
        declare sub print ( _data() as short, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as ushort )
        declare sub print ( _data() as ushort, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as long )
        declare sub print ( _data() as long, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as ulong )
        declare sub print ( _data() as ulong, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as integer )
        declare sub print ( _data() as integer, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as uinteger )
        declare sub print ( _data() as uinteger, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as longint )
        declare sub print ( _data() as longint, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as ulongint )
        declare sub print ( _data() as ulongint, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as single )
        declare sub print ( _data() as single, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as double )
        declare sub print ( _data() as double, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as string )
        declare sub print ( _data() as string, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        declare sub print ( byref data_ as boolean )
        declare sub print ( _data() as boolean, byval start as integer = fb.MIN_VALUE_INTEGER, byval finish as integer = fb.MAX_VALUE_INTEGER )

        ''Sub: get
        ''Gets any number of a datatype from the open file, overloaded for all built-in types.
        ''
        ''Parameters:
        ''filepos - optional file position to retrieve the data from, defaults to the current file postition.
        ''data_ - the ptr to variable to retrieve the data into.
        ''amount - optional amount of data to retrieve, defaults to 1.
        ''
        declare sub get( byval filepos as longint = -1, byval data_ as byte ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as ubyte ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as short ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as ushort ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as long ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as ulong ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as integer ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as uinteger ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as longint ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as ulongint ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as single ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as double ptr, byval amount as uinteger = 1 )
        declare sub get( byval filepos as longint = -1, byval data_ as string ptr, byval amount as uinteger = 0 )
        declare sub get( byval filepos as longint = -1, byval data_ as boolean ptr, byval amount as uinteger = 1 )

        ''Sub: put
        ''Puts any number of a datatype to the open file, overloaded for all built-in types.
        ''
        ''Parameters:
        ''filepos - optional file position to place the data at, defaults to the current file postition.
        ''data_ - the ptr to data to place in the file.
        ''amount - optional amount of data to place, defaults to 1.
        ''
        declare sub put( byval filepos as longint = -1, byval data_ as byte ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as ubyte ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as short ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as ushort ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as long ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as ulong ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as integer ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as uinteger ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as longint ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as ulongint ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as single ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as double ptr, byval amount as uinteger = 1 )
        declare sub put( byval filepos as longint = -1, byval data_ as string ptr, byval amount as uinteger = 0 )
        declare sub put( byval filepos as longint = -1, byval data_ as boolean ptr, byval amount as uinteger = 1 )


        ''Function: readLine
        ''Line Input function. Retrieves one line of text from the file.
        ''
        ''Returns:
        ''string containing one line of text from the file.
        ''
        declare function readLine () as string

        ''Property: LastError
        ''Retrieves the error number of the last error, only set by <open>
        ''
        ''Returns:
        ''integer value of the error code.
        ''
        declare property LastError () as integer

        ''Function: toBuffer
        ''Loads the file into a memory buffer.
        ''
        ''Parameter:
        ''dest - byref ubyte pointer that will point to the memory buffer. This memory is allocated by the function and should be destroyed using delete[].
        ''
        ''Returns:
        ''The size of the allocated buffer (in bytes)
        ''
        declare function toBuffer( byref dest as ubyte ptr ) as SizeType

        declare destructor ()

        ''Function: getBytesRW
        ''Get the total number of bytes written or read from this file so far.
        ''
        ''Returns:
        ''ulongint of bytes
        declare function getBytesRW() as ulongint

        ''Property: fileName
        ''Retrieve the filename this object points to.
        declare property fileName() as string

        ''Function: Operator Let
        ''Assign a string to a File object to open the filename in string.
        declare operator Let ( byref rhs as string )

    private:

        m_filename as string
        m_access as integer
        m_filehandle as integer
        m_lasterror as integer
        m_fsd as FileSystemDriver ptr
        m_bytes as ulongint

    #if __FB_MT__

        m_mutex as any ptr

    #endif

    end type

end namespace

# endif ' include guard
