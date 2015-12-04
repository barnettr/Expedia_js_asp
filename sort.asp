<%@ Language=VBScript %>
<HTML>
<HEAD>
<TITLE>Bill Wilkinson's sort-it-any-which-way Directory Listing</TITLE>
</HEAD>

<BODY>

<%
' In this demo, at least, we don't allow user to change directories...
' Change the DIRECTORY to point to any virtual directory of your choice.
CONST DIRECTORY = "/" ' relative path in virtual directories

' Specify one of these constants for "sortBy"...
CONST FILE_NAME = 0
CONST FILE_EXT = 1
CONST FILE_TYPE = 2
CONST FILE_SIZE = 3
CONST FILE_CREATED = 4
CONST FILE_MODIFIED = 5
CONST FILE_ACCESSED = 6

' get requested sort order, if not first time here...
' (forward by name is default)
req = Request("sortBy")
If Len(req) < 1 Then sortBy = 0 Else sortBy = CInt(req)
req = Request("priorSort")
If Len(req) < 1 Then priorSort = -1 Else priorSort = CInt(req)

'
' did user ask for same sort? to reverse the order?
' but if so, then zap priorSort so clicking again will do forward!
If sortBy = priorSort Then
    reverse = true
    priorSort = -1
Else
    reverse = false
    priorSort = sortBy
End If

' now start the *real* code...
'
path = Server.MapPath( DIRECTORY )

Set fso = CreateObject("Scripting.FileSystemObject")
Set theCurrentFolder = fso.GetFolder( path )
Set curFiles = theCurrentFolder.Files
'
' And now a loop for the files
'
Dim theFiles( )
ReDim theFiles( 500 ) ' arbitrary size!
currentSlot = -1 ' start before first slot

' We collect all the info about each file and put it into one
' "slot" in our "theFiles" array.
'
For Each fileItem in curFiles
    fname = fileItem.Name
    fext = InStrRev( fname, "." )
    If fext < 1 Then fext = "" Else fext = Mid(fname,fext+1)
    ftype = fileItem.Type
    fsize = fileItem.Size
    fcreate = fileItem.DateCreated
    fmod = fileItem.DateLastModified
    faccess = fileItem.DateLastAccessed
    currentSlot = currentSlot + 1
    If currentSlot > UBound( theFiles ) Then
        ReDim Preserve theFiles( currentSlot + 99 )
    End If
    ' note that what we put here is an array!
    theFiles(currentSlot) = Array(fname,fext,ftype,fsize,fcreate,fmod,faccess)
Next
'
' files are now in the array...
'
' As noted, it is actually an ARRAY *OF* ARRAYS. Which makes
' picking the column we will sort on easier!
'
' ...size and sort it...
fileCount = currentSlot ' actually, count is 1 more, since we start at 0
ReDim Preserve theFiles( currentSlot ) ' really not necessary...just neater!

' First, determine which "kind" of sort we are doing.
' (VarType=8 means "string")
'
If VarType( theFiles( 0 )( sortBy ) ) = 8 Then
    If reverse Then kind = 1 Else kind = 2 ' sorting strings...
Else
    If reverse Then kind = 3 Else kind = 4 ' non-strings (numbers, dates)
End If

'
' A simple bubble sort for now...easier to follow the code...
'
For i = fileCount TO 0 Step -1
    minmax = theFiles( 0 )( sortBy )
    minmaxSlot = 0
    For j = 1 To i
        Select Case kind ' which kind of sort are we doing?
        ' after the "is bigger/smaller" test (as appropriate),
        ' mark will be true if we need to "remember" this slot...
        Case 1 ' string, reverse...we do case INsensitive!
            mark = (strComp( theFiles(j)(sortBy), minmax, vbTextCompare ) < 0)
        Case 2 ' string, forward...we do case INsensitive!
            mark = (strComp( theFiles(j)(sortBy), minmax, vbTextCompare ) > 0)
        Case 3 ' non-string, reverse ...
            mark = (theFiles( j )( sortBy ) < minmax)
        Case 4 ' non-string, forward ...
            mark = (theFiles( j )( sortBy ) > minmax)
        End Select
        ' so is the current slot bigger/smaller than the remembered one?
        If mark Then
            ' yep, so remember this one instead!
            minmax = theFiles( j )( sortBy )
            minmaxSlot = j
        End If
    Next
    ' is the last slot the min (or max), as it should be?
    If minmaxSlot <> i Then
        ' nope...so do the needed swap...
        temp = theFiles( minmaxSlot )
        theFiles( minmaxSlot ) = theFiles( i )
        theFiles( i ) = temp
    End If
Next
' Ta-da! The array is sorted!
'
%>
<FORM Name="doSort" Method="Get" ID="Form1">
<INPUT Type=Hidden Name=priorSort Value="<% = priorSort %>" ID="Hidden1">
<INPUT Type=Hidden Name=sortBy Value="-1" ID="Hidden2">
</FORM>

<SCRIPT Language="JavaScript">
function reSort( which )
{
    document.doSort.sortBy.value = which;
    document.doSort.submit( );
}
</SCRIPT>

<CENTER>
<FONT Size="+2">
Showing <% = (fileCount+1) %> files from directory <% = path %>
</FONT>
<P>
Click on a column heading to sort by that column. Click the same column
again to reverse the sort.
<P>
<TABLE Border=1 CellPadding=3 ID="Table1">
<TR>
    <TH><A HREF="javascript:reSort(0);">File name</A></TH>
    <TH><A HREF="javascript:reSort(1);">Extension</A></TH>
    <TH><A HREF="javascript:reSort(2);">Type</A></TH>
    <TH><A HREF="javascript:reSort(3);">Size</A></TH>
    <TH><A HREF="javascript:reSort(4);">Created</A></TH>
    <TH><A HREF="javascript:reSort(5);">Last modified</A></TH>
    <TH><A HREF="javascript:reSort(6);">Last accessed</A></TH>
</TR>
<%
' With the array nicely sorted, this part is a piece of cake!
For i = 0 To fileCount
    Response.Write "<TR>" & vbNewLine
    For j = 0 To UBound( theFiles(i) )
        Response.Write "    <TD>" & theFiles(i)(j) & "</TD>" & vbNewLine
    Next
    Response.Write "</TR>" & vbNewLine
Next
%>
</TABLE>

</BODY>
</HTML>

