# ifndef FBE_FILE_ITER_BI__
# define FBE_FILE_ITER_BI__ -1

# include once "fbefile/detail/common.bi"

'' Namespace: fbe
namespace fbe

''Constant: fbeReadOnly
''The item cannot be written to or deleted.
''DOS & Windows: The item has the "read-only" attribute set.
''Linux:The item has no write permissions associated with the current user or group, nor is it globally writable. (Whether or not the user has root permissions is ignored.)
const fbeReadOnly = &h01

''Constant: fbeHidden
''The item is hidden in ordinary directory listings.
''DOS & Windows: The item has the "hidden" attribute set.
''Linux: The item's name has a period (.) as the first character.
const fbeHidden = &h02

''Constant: fbeSystem
''The item is used almost exclusively by the system.
''DOS & Windows: The item has the "system" attribute set.
''Linux: The item is either a character device, block device, named pipe (FIFO) or Unix socket.
const fbeSystem = &h04

''Constant: fbeDirectory
''The item is a directory. Includes the current (.) and parent (..) directories as well.
''DOS & Windows & Linux: The item is a directory.
const fbeDirectory = &h10

''Constant: fbeArchive
''The item may be backed up after some automated operations.
''DOS & Windows: The item has the "archive" attribute set (automatically set after every write access to a file).
''Linux: The item is not a directory; typical filesystems do not support this metadata.
const fbeArchive = &h20

''Constant: fbeNormal
''Combination of the Readonly and Archive flags
const fbeNormal = (fbeReadOnly or fbeArchive) 

''Class: FILE_ITER
''Provides a simple way to iterate over files and directories in a path
'' 
type FILE_ITER

    ''Function: Constructor
    declare constructor( byref path as string )

    ''Function: Constructor
    declare constructor( byref path as string, byval attrib_ as integer )

    declare operator for( )
    declare operator step( )
    declare operator next( byref end_cond as FILE_ITER ) as integer

    ''Function: filename
    ''Returns the current filename.
    ''
    ''Returns:
    ''string containing the latest filename.
    ''
    declare function filename( ) as string

    declare function attributes( ) as integer
    declare function readOnly() as boolean
    declare function directory() as boolean
    declare function hidden() as boolean
    declare function system() as boolean
    declare function archive() as boolean
'private:

    as string p_pathname, p_latest
    as integer attrib, p_attrib

end type

end namespace

#endif
