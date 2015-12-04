<%@ Language=VBScript EnableSessionState = False%>

<%
Dim sHTML

sHTML = Request.Form("txtHTML")

If sHTML = "" Then
sHTML = "<B>Bold</B> <UL>Underlined</UL> <FONT COLOR=RED>Red Text</FONT><BR>"
Else
sHTML = StripHTMLTags(sHTML)
End If

%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>HTML Tag Removal Using Regular Expressions</TITLE>
<META NAME="robots" CONTENT="noindex">
<script language="JavaScript">
   
//ensure some content has been entered into the textarea before submitting the form
function SubmitForm() {

if (document.frmHTMLContent.txtHTML.value != "") {
    document.frmHTMLContent.submit();
}
}

</script>
</HEAD>
<BODY>

<H2>HTML Tag Removal Using Regular Expressions</H2>

<P>Enter some HTML into the textarea below and submitting the form will cause ASP to remove the HTML tags.</P>
<CENTER>
<FORM NAME="frmHTMLContent" ACTION="test_htmlstripper.asp" METHOD="POST">

<TEXTAREA NAME="txtHTML" ROWS="10" COLS="50" WRAP="physical">
<%=sHTML%>
</TEXTAREA>
<BR><INPUT TYPE="BUTTON" onClick="javascript:SubmitForm()" NAME="Submit" VALUE="Submit">
</FORM>
</CENTER>
<%
%>
<P>
These two books are invaluable if you want to get the most out of Regular Expressions:
</P>
<p align="center"><a href="http://www.amazon.com/exec/obidos/ASIN/1565922573/brettbcom"><img border="0" src="images/MasteringRegularExpressions.jpg" alt="Mastering Regular Expressions: Powerful Techniques for Perl and Other Tools" WIDTH="107" HEIGHT="140"></a> 
<a href="http://www.amazon.com/exec/obidos/ASIN/0672319365/brettbcom"><img border="0" src="images/TeachYourselfRegularExpressions.jpg" alt="Sams Teach Yourself Regular Expressions in 24 Hours" WIDTH="113" HEIGHT="140"></a> </p>
</P>
<A HREF="../Default.asp" TITLE="Main Page">Main Page</A>

<!--BANNER AD-->
<P><CENTER>

</CENTER><P>
<!--BANNER AD-->

</BODY>
</HTML>

<%
'This function uses Regular Expressions to strip HTML tags from a string  
'See http://authors.aspalliance.com/brettb/VBScriptRegularExpressions.asp  
Public Function StripHTMLTags(HTMLString)

Set RegularExpressionObject = New RegExp

With RegularExpressionObject
 .Pattern = "<[^>]+>"
 .IgnoreCase = True
 .Global = True
End With

StripHTMLTags = RegularExpressionObject.Replace(HTMLString, "")

Set RegularExpressionObject = nothing

End Function
%>