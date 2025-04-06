#include once "fbefile/file_iter.bi"
using fbe

' List all normal files and directories in current directory and display their attributes
for n as FILE_ITER = FILE_ITER("*.*", fbeNormal OR fbeDirectory) to ""
    ? n.filename()
    if (n.hidden()) then
        ? "- Hidden"
    end if
    if (n.archive()) then
        ? "- Archive"
    end if
    if (n.directory()) then
        ? "- Directory"
    end if
    if (n.system()) then
        ? "- System"
    end if
    if (n.readonly()) then
        ? "- Readonly"
    end if
next