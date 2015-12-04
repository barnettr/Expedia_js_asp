<%@ Language=VBScript %>
<HTML>
<HEAD>
</HEAD>
<BODY>
The path of this file is <% Response.Write Server.MapPath("20051024_CM_C_02_084_Carnival.xml")
%><br><br>
The path of the file1 is <% Response.Write Server.MapPath("\YYYYMMDD_CM_C_02_XXX.xml")
%><br><br>
The path of the file2 is <% Response.Write Server.MapPath("Custom_Mail_vers2\YYYYMMDD_CM_C_02_XXX.xml")
%><br><br>
The path of the file3 is <% Response.Write Server.MapPath("\")
%><br><br>
</BODY>
</HTML>

