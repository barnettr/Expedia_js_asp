<%@ LANGUAGE="VBSCRIPT" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%

Set MyFileObject = Server.CreateObject("Scripting.FileSystemObject")
'Set MyTextFile = MyFileObject.CreateTextFile(Server.MapPath("/StripHTML/test.txt"))
Set MyTextFile = MyFileObject.CreateTextFile("\\ctoohey02\previewer_test\test.txt")
'Set MyTextFile = MyFileObject.CreateTextFile("C:\Inetpub\wwwroot\StripHTMLasText\myTest.txt", 8,true)
'MyTextFile.WriteLine("Hello There!")
'MyTextFile.Close
MyTextFile.WriteLine ("*** Write file test ***")
MyTextFile.WriteLine ("     file was written to at: " & Now)
MyTextFile.WriteLine (" ")
MyTextFile.Close
Response.Write("Successful creation of test.txt file at:" & Now)

%>