<%@ Language=VBScript %>
<%
Dim colInPaths As Collection
Dim colOutpaths As Collection
Dim sInputPath As String
Dim sOutputPath As String
Dim sInputPath2 As String
Dim sOutputPath2 As String
Dim lTotalProcess As Long
Dim SearchPath As String, FindStr As String
Dim FileSize As Long
Dim NumFiles As Integer, NumDirs As Integer
Dim AppStringName As String
Dim cTempCollection As Collection

Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function GetFileAttributes Lib "kernel32" Alias "GetFileAttributesA" (ByVal lpFileName As String) As Long
Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long

Const MAX_PATH = 260
Const MAXDWORD = &HFFFF
Const INVALID_HANDLE_VALUE = -1
Const FILE_ATTRIBUTE_ARCHIVE = &H20
Const FILE_ATTRIBUTE_DIRECTORY = &H10
Const FILE_ATTRIBUTE_HIDDEN = &H2
Const FILE_ATTRIBUTE_NORMAL = &H80
Const FILE_ATTRIBUTE_READONLY = &H1
Const FILE_ATTRIBUTE_SYSTEM = &H4
Const FILE_ATTRIBUTE_TEMPORARY = &H100

Private Type FILETIME
   dwLowDateTime As Long
   dwHighDateTime As Long
End Type

Enum ListPaths

   PathsAndFilenames = 1
   FilenamesOnly = 2
   PathsOnly = 3

End Enum

Dim ListSelected As ListPaths

Private Type WIN32_FIND_DATA
   dwFileAttributes As Long
   ftCreationTime As FILETIME
   ftLastAccessTime As FILETIME
   ftLastWriteTime As FILETIME
   nFileSizeHigh As Long
   nFileSizeLow As Long
   dwReserved0 As Long
   dwReserved1 As Long
   cFileName As String * MAX_PATH
   cAlternate As String * 14
End Type

Function StripNulls(OriginalStr As String) As String
   If (InStr(OriginalStr, Chr(0)) > 0) Then
       OriginalStr = Left(OriginalStr, InStr(OriginalStr, Chr(0)) - 1)
   End If
   StripNulls = OriginalStr
End Function

Function FindFilesAPI(ByVal Path As String, ByVal SearchStr As String, ByVal FileCount As Integer, ByVal DirCount As Integer)


   Dim FileName As String ' Walking filename variable...
   Dim DirName As String ' SubDirectory Name
   Dim dirNames() As String ' Buffer for directory name entries
   Dim nDir As Integer ' Number of directories in this path
   Dim i As Integer ' For-loop counter...
   Dim hSearch As Long ' Search Handle
   Dim WFD As WIN32_FIND_DATA
   Dim Cont As Integer
   If Right(Path, 1) <> "\" Then Path = Path & "\"
   ' Search for subdirectories.
   nDir = 0
   ReDim dirNames(nDir)
   Cont = True
   hSearch = FindFirstFile(Path & "*", WFD)
   If hSearch <> INVALID_HANDLE_VALUE Then
       Do While Cont
       DirName = StripNulls(WFD.cFileName)
       ' Ignore the current and encompassing directories.
        If (DirName <> ".") And (DirName <> "..") Then
           ' Check for directory with bitwise comparison.
           If GetFileAttributes(Path & DirName) And FILE_ATTRIBUTE_DIRECTORY Then
           If InStr(1, Path & DirName, "Processed") = 0 Then
               dirNames(nDir) = DirName
               DirCount = DirCount + 1
               nDir = nDir + 1
               ReDim Preserve dirNames(nDir)
           End If
           End If
       End If
       Cont = FindNextFile(hSearch, WFD) 'Get next subdirectory.
       Loop
       Cont = FindClose(hSearch)
   End If
   ' Walk through this directory and sum file sizes.
   hSearch = FindFirstFile(Path & SearchStr, WFD)
   Cont = True
   If hSearch <> INVALID_HANDLE_VALUE Then
       While Cont
           FileName = StripNulls(WFD.cFileName)
           If (FileName <> ".") And (FileName <> "..") Then
               FindFilesAPI = FindFilesAPI + (WFD.nFileSizeHigh * MAXDWORD) + WFD.nFileSizeLow
               FileCount = FileCount + 1
               
               If InStr(1, Path & FileName, "SYSTEM FILES") <> 0 Then
               
                   '// SYSTEM FILES DIRECTORY
               
               Else
               
                   '// OTHER DIRECTORIES
                   
                   cTempCollection.Add Path & FileName
               
               End If
               
           End If
           Cont = FindNextFile(hSearch, WFD) ' Get next file
       Wend
       Cont = FindClose(hSearch)
   End If
   ' If there are sub-directories...
   If nDir > 0 Then
       ' Recursively walk into them...
       For i = 0 To nDir - 1
           FindFilesAPI = FindFilesAPI + FindFilesAPI(Path & dirNames(i) & "\", SearchStr, FileCount, DirCount)
       Next i
   End If
End Function

Public Function DoFileSystemSearch(ByVal sPath As String, ByVal sFilter As String, ByVal ListAction As ListPaths) As Collection

   ListSelected = ListAction
   
   Set cTempCollection = New Collection
   
   FindFilesAPI sPath, sFilter, NumFiles, NumDirs
   
   Set DoFileSystemSearch = cTempCollection

End Function 

Dim cFind As New cFindFiles
Dim cfList As New Collection
Set cfList = cFind.DoFileSystemSearch("C:\Inetpub\wwwroot\email\FLEX_MAIL", "*.xml*", PathsAndFilenames)
%>
<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
</head>
<body>
<form>
<INPUT type="text" ID="Text1" NAME="txtPath"/>
<INPUT type="button" value="Button" ID="Button1" NAME="cmdDisplay"/>
<SELECT size=2 ID="Select1" NAME="lstDisplay"/>
</form>
</SELECT>
</body>
</html>
