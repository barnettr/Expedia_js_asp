<%@ LANGUAGE="VBScript" %>
<html>
<head>
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1"/>

<title>TeMP:  Template eMail Previewer</title>
<%
Dim objXML, linkURL, folderStr, folderName, folderName2, folderStrL, folderStrR

linkURL = request.querystring("filePath")
folderStr = request.querystring("folder")
'response.write linkURL
'read in text version
Set MyFileObject = Server.CreateObject("Scripting.FileSystemObject")
Set MyFile = MyFileObject.GetFile(linkURL)

'Load the XML File
Set objXML = Server.CreateObject("Microsoft.XMLDOM")
objXML.async = False 
Dim XSLTstyle, URLpath

'**Setup: to added new XSL Template to the TeMP

'1) Declare XSLT name, use in the Array of templates below 
Dim cm_template, fs_template, fs_template_01, fs_template_02a, fs_template_02b, tr_template, crm_template, cruises_template, dnl_template, mr_template, mr_template_01, elite_template

'2) Declare Folder name, use this in the Case Statement below
Dim cm_name, cruises_name, fs_name, fs_name_01, fs_name_02, tr_name, crm_name, dnl_name, mr_name, mr_name_01, elite_name 

'3) Associate declared vars with strings
cm_template = "cm_template.xslt"
cruises_template = "cruises_template.xslt"
fs_template = "fs_template.xslt"
fs_template_01 = "fs_template_01.xslt"
fs_template_02a = "fs_template_02a.xslt"
fs_template_02b = "fs_template_02b.xslt"
tr_template = "tr_template.xslt"
crm_template = "crm_template.xslt"
dnl_template = "deals_template.xslt"
mr_template = "hybrid_template.xslt"
mr_template_01 = "hybrid_template_01.xslt"
elite_template = "elite_template.xslt"
cm_name = "custom_email"
cruises_name = "cruises_email"
fs_name = "fare_sale"
fs_name_01 = "fare_sale_01"
fs_name_02 = "fare_sale_02"
tr_name = "travel_right"
crm_name = "crm_mail"
dnl_name = "dnl_email"
mr_name = "flex_email"
mr_name_01 = "pmi_email"
elite_name = "elite_email" 

'4) array of XSL Templates, get name from var declaration
XSLTstyle = Array(mr_template, mr_template_01, elite_template, cm_template, cruises_template, tr_template, crm_template, fs_template, fs_template_01, fs_template_02a, fs_template_02b, dnl_template)
'**END XSLT Setup - add condition to the Case Statement below (Step 5) and your done.

folderStrL = Left(folderStr, 6)
folderStrR = Right(folderStr, 5)
folderName2 = Right(folderStr, Len(folderStr) - Len(folderStrL))
folderName = Left(folderName2, Len(folderName2) - Len(folderStrR))
%>
	<script language="JavaScript" type="text/JavaScript">
		if(document.images){
			expandC = new Image; 
			expandC.src="../images/minus.jpg";
			expandO = new Image;
			expandO.src="../images/plus.jpg";
		}
		function expand(expandSection){
			var exDiv = expandSection;
			var current = document.getElementById(exDiv).style.display;

			if (current == 'block')
			{
				document.getElementById(exDiv).style.display='none';
				if (document.images) 
					document.getElementById(exDiv + '_Img').src = expandO.src;
			}
			else
			{
				document.getElementById(exDiv).style.display='block';
				if (document.images) 
					document.getElementById(exDiv + '_Img').src = expandC.src;
			}
		}
		function refresh(){
			window.location.reload(true);
		}
		function loadIframe(theURL){
			document.getElementById("imgFRM").src = theURL;
		}
		function getCheckerWindow(url)
        {
	        newWindow = window.open(url,'LinkChecker','height=768,width=1024,toolbar=yes,menubar=yes,location=yes,scrollbars=yes,resizable=yes,status=yes,left=25,top=15');
	        if (window.focus) 
	        {
		        newWindow.focus()
	        }
        }
		</script>
		<script type="text/javascript" src="linkchecker.js"></script>
		<script type="text/javascript" src="../includes/tabber.js"></script>
		<link rel=stylesheet type="text/css" href="../includes/temp_style.css"/>
	</head>
	<body bgcolor="#FFFFFF">
	<!--<div id="faqpanel_1_answer">-->
	<div id="faqpanel_2_answer">
		<table cellpadding="0" cellspacing="5" width="100%">
	<tr><td colspan="2" style="font-family: verdana; font-size: 10; color: #000000;"><%= BreadCrumb(linkURL) %></td></tr></table>
	<%
'objXML.load(Server.MapPath(linkURL))
objXML.load(linkURL)

'5) Finish Setup process: Add the declared folder and XSLT names here.
Select Case folderName
   Case mr_name
       XSLTLocator(Server.MapPath(XSLTstyle(0))) 
   Case mr_name_01
		XSLTLocator(Server.MapPath(XSLTstyle(1)))
   Case elite_name
       XSLTLocator(Server.MapPath(XSLTstyle(2)))
   Case cm_name
       XSLTLocator(Server.MapPath(XSLTstyle(3)))
   Case cruises_name
       XSLTLocator(Server.MapPath(XSLTstyle(4)))
   Case tr_name
       XSLTLocator(Server.MapPath(XSLTstyle(5)))
   Case crm_name
       XSLTLocator(Server.MapPath(XSLTstyle(6)))
   Case fs_name
       XSLTLocator(Server.MapPath(XSLTstyle(7)))
   Case fs_name_01
       XSLTLocator(Server.MapPath(XSLTstyle(8)))
   Case fs_name_02%>
     <div class="tabber">
		<div class="tabbertab" title="Version A"><br> 
		<% XSLTLocatorVers(Server.MapPath(XSLTstyle(9)))%>
		</div>
		<div class="tabbertab" title="Version B"><br>
		<% XSLTLocatorVers(Server.MapPath(XSLTstyle(10)))%>
		</div>
	</div><%
	Case dnl_name
       XSLTLocator(Server.MapPath(XSLTstyle(11)))
	Case Else
      Response.Write("what just happened...  don't know? Please email Craig at: <a href='mailto:ctoohey@expedia.com'>ctoohey@expedia.com</a>")
End Select
		
'Fxn to load XSLT and display page contents on demand
sub XSLTLocator(template)
	dim objXSL

	Set objXSL = Server.CreateObject("Microsoft.XMLDOM")

	objXSL.async = False
	
	objXSL.load(template)

	' Transform the XML file using the XSL stylesheet
	strHTML = objXML.transformNode(objXSL)
%>		
<table border="0" cellpadding="0" cellspacing="1">
    <tr>
	    <td valign="top" align="left" width="700" style="font-family: verdana; font-size: 11; color: #000000;">
		    <p style="padding-bottom:3;">
		    <a href="javascript:expand('Table1')" style="text-decoration: none; color: #448;"><img src='../images/plus.jpg' width="11" height="11" border="0" align="absmiddle" align="left" id="Table1_Img">&nbsp;<u>View HTML code</u></a>&nbsp;|&nbsp;
		    <a href="javascript:expand('Table2')" style="text-decoration: none; color: #448;"><img src='../images/plus.jpg' width="11" height="11" border="0" align="absmiddle" align="left" id="Table2_Img">&nbsp;<u>View TEXT only</u></a>&nbsp;|&nbsp;
		    <a href="javascript:getErrorLinks()" style="text-decoration: none; color: #448;" onactivate="document.getElementById('inprogress_img').style.cssText = 'display:block; font-weight:bold;';"><img src='checker.gif' width="15" height="15" border="0" align="absmiddle" align="left">&nbsp;<u>Link Checker</u></a>&nbsp;|&nbsp;
		    <a href="javascript:refresh()" style="text-decoration: none; color: #448;"><img src='../images/refresh.gif' width="15" height="14" border="0" align="absmiddle">&nbsp;<u>Refresh</u></a>&nbsp;|&nbsp;
		    <a href="<%= MapURL(linkURL) %>" target="_blank" style="text-decoration: none; color: #448;"><img src='../images/edit.gif' width="15" height="13" border="0" align="absmiddle">&nbsp;<u>Edit</u></a>&nbsp;|&nbsp;
		    <a href="mailto:?subject=Please%20review%20email:%20%20<%=Left(folderStr,Len(folderStr)-Len("_docs"))%>&body=http://ctoohey02/email/previewer/render2.asp?filePath=<%=linkURL%>%26folder=<%=folderStr%>" target="_blank" style="text-decoration: none; color: #448;"><img src="../images/email_icon.gif" alt="" border="0" height="17" width="26" align="absmiddle"><u>eMail this page</u></a>&nbsp;|&nbsp;<a href="help.html" target="_blank" style="text-decoration: none; color: #448;"><img src='../images/help.gif' width="15" height="15" border="0" align="absmiddle">&nbsp;<u>Help</u></a>
		    </p>
		    <p align="left" style="display:none; color:#336699; font-weight:bold;" id="inprogress_img">
                <img src="mozilla_blu.gif"><br /><br />
                Please wait while URL links are being processed . . .
            </p>
		    <div class="collapse" id="Table1" style="">
			    <table border="0" bgcolor="#FFFFFF" width="725">
			        <tr>
				        <td align="left" style="font-family: verdana; font-size: 11; color: #000000;"><b>HTML Code</b><br>
					        <form method="GET" name="" action="">
					        <TEXTAREA cols="125" rows="35"><%= response.Write(strHTML) %></TEXTAREA>	
					        </form>
				        </td>
			        </tr>
			    </table>
		    </div>
		    <div class="collapse" id="Table2" style="">
			    <table border="0" bgcolor="#FFFFFF" width="780">
			        <tr>
				        <td align="left" style="font-family: verdana; font-size: 11; color: #000000;"><b>TEXT Only</b><br>
					        <%  
						        dim newpath
						        newpath = MapURL(MyFile)
						        newpath = left(newpath,23)
						        response.write newpath
					        %>
					        <%if left(newpath,23) = "/email/TRAVELRIGHT_MAIL" then%>
					        <iframe src="transformXML_TravelRight.asp?Path=<%= MapURL(MyFile) %>" width="100%" align="left" frameborder="1" height="500" scrolling="yes"></iframe>
					        <%else%>
					        <iframe src="transformXML_js.asp?Path=<%= MapURL(MyFile) %>" width="100%" align="left" frameborder="1" height="500" scrolling="yes"></iframe>
					        <%end if%>
				        </td>
			        </tr>
			    </table>
		    </div>
		    <div class="collapse" id="Table3" style="overflow-y:scroll; width:780px; height:450px; border-left:1px solid #87a3cb; border-top:1px solid #87a3cb; border-bottom:1px solid #87a3cb;">
			    <table border="0" bgcolor="#FFFFFF" width="780">
			        <tr>
				        <td width="780" align="left" style="font-family: verdana; font-size: 11; color: #000000; word-wrap: break-word;">
				            <b>Link Checker</b><br>
			                <span id="Errors" style="display:none;"></span>
			                <div id="Error0" style="display:none;"></div>
			                <div id="Error1" style="display:none;"></div>
			                <div id="Error2" style="display:none;"></div>
			                <div id="Error3" style="display:none;"></div>
			                <div id="Error4" style="display:none;"></div>
			                <div id="Error5" style="display:none;"></div>
			                <div id="Error6" style="display:none;"></div>
			                <div id="Error7" style="display:none;"></div>
			                <div id="Error8" style="display:none;"></div>
			                <div id="Error9" style="display:none;"></div>
			                <div id="Error10" style="display:none;"></div>
			                <div id="Error11" style="display:none;"></div>
			                <div id="Error12" style="display:none;"></div>
			                <div id="Error13" style="display:none;"></div>
			                <div id="Error14" style="display:none;"></div>
			                <div id="Error15" style="display:none;"></div>
			                <div id="Error16" style="display:none;"></div>
			                <div id="Error17" style="display:none;"></div>
			                <div id="Error18" style="display:none;"></div>
			                <div id="Error19" style="display:none;"></div>
			                <div id="Error20" style="display:none;"></div>
			                <div id="Error21" style="display:none;"></div>
			                <div id="Error22" style="display:none;"></div>
                            <div id="Error23" style="display:none;"></div>
                            <div id="Error24" style="display:none;"></div>
                            <div id="Error25" style="display:none;"></div>
                            <div id="Error26" style="display:none;"></div>
                            <div id="firstError" style="display:none;"></div>
                            <div id="no_Error" style="display:none;"></div>
			                <span id="totalnum"></span>
			                <div id="totalvals" style="display:none;">
			                </div>
			                <span id="End" style="display:none;"></span>
			            </td>
			        </tr>
		        </table>
		    </div>
			
			<table border="0" bgcolor="#FFFFFF">
				<tr>
					<td align="left" style="font-family: verdana; font-size: 11; color: #000000;">
						<form method="GET" name="" action="">
						<TEXTAREA cols="95" rows="35" id="HTML" style="display:none;"><%= strHTML %></TEXTAREA>	
						</form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
	    <td align="left"><%= strHTML %></td>
	</tr>
</table>
	</div>
	<!--</td>
</tr>
<tr>-->
	
<!--</tr>-->
<!--</table>-->
<%end sub%>
<%'Fxn to load XSLT and display page contents on demand
sub XSLTLocatorVers(template)
	dim objXSL

	Set objXSL = Server.CreateObject("Microsoft.XMLDOM")

	objXSL.async = False
	
	objXSL.load(template)

	' Transform the XML file using the XSL stylesheet
	strHTML = objXML.transformNode(objXSL)
%>
<table border="0" cellpadding="0" cellspacing="1">
<tr>
	<td valign="top" align="left" width="600" style="font-family: verdana; font-size: 11; color: #000000;">
		
		<p style="padding-bottom:3;">
		<a href="javascript:expand('Table1')" style="text-decoration: none; color: #448;"><img src='../images/plus.jpg' width="11" height="11" border="0" align="absmiddle" align="left" id="Table1_Img">&nbsp;<u>View HTML code</u></a>&nbsp;|&nbsp;
		<a href="javascript:expand('Table2')" style="text-decoration: none; color: #448;"><img src='../images/plus.jpg' width="11" height="11" border="0" align="absmiddle" align="left" id="Table2_Img">&nbsp;<u>View TEXT only</u></a>&nbsp;|&nbsp;
		<a href="javascript:refresh()" style="text-decoration: none; color: #448;"><img src='../images/refresh.gif' width="15" height="14" border="0" align="absmiddle">&nbsp;<u>Refresh</u></a>&nbsp;|&nbsp;
		<a href="<%= MapURL(linkURL) %>" target="_blank" style="text-decoration: none; color: #448;"><img src='../images/edit.gif' width="15" height="13" border="0" align="absmiddle">&nbsp;<u>Edit</u></a>&nbsp;|&nbsp;
		<a href="mailto:?subject=Please%20review%20email:%20%20<%=Left(folderStr,Len(folderStr)-Len("_docs"))%>&body=http://ctoohey02/email/previewer/render2.asp?filePath=<%=linkURL%>%26folder=<%=folderStr%>" target="_blank" style="text-decoration: none; color: #448;"><img src="../images/email_icon.gif" alt="" border="0" height="17" width="26" align="absmiddle"><u>eMail this page</u></a>&nbsp;|&nbsp;
		<a href="javascript:getCheckerWindow('LinkChecker.asp?Path=<%= MapURL(MyFile) %>');" style="text-decoration: underline; color: #448;">&nbsp;Link Checker</a>&nbsp;&nbsp;		
		<a href="help.html" target="_blank" style="text-decoration: none; color: #448;"><img src='../images/help.gif' width="15" height="15" border="0" align="absmiddle">&nbsp;<u>Help</u></a>
		</p>
		<div class="collapse" id="Table1" style="">
			<table border="0" bgcolor="#FFFFFF">
			<tr>
				<td align="left" style="font-family: verdana; font-size: 11; color: #000000;"><b>HTML Code</b><br>
					<form method="GET" name="" action="" ID="Form1">
					<TEXTAREA cols="95" rows="35"><%= response.Write(strHTML) %></TEXTAREA>	
					</form>
				</td>
			</tr>
			</table>
		</div>
		<div class="collapse" id="Table2" style="">
			<table border="0" bgcolor="#FFFFFF" ID="Table6">
			<tr>
				<td align="left" style="font-family: verdana; font-size: 11; color: #000000;"><b>TEXT Only</b><br>
					<form method="GET" name="" action="" ID="Form2">
					<TEXTAREA cols="95" rows="35"><%= StripHTMLTags(strHTML) %></TEXTAREA>	
					</form>
				</td>
			</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td align="center"><%= strHTML %></td>
</tr>
</table>
<%end sub%>
</body>	
</html>
<%
function MapURL(path)
	dim rootPath, url
	rootPath = Server.MapPath("/")
	url = Right(path, Len(path) - Len(rootPath))
	MapURL = Replace(url, "\", "/")
	'response.Write(path)
end function

function BreadCrumb(path)
	dim rootPath, url, url2
	rootPath = Server.MapPath("/")
	url = Right(path, Len(path) - Len(rootPath))
	url2 = Left(url, Len(url) - Len(".xml"))
	BreadCrumb = Replace(url2, "\", " -> ")
	'response.Write(path)
end function

'This function uses Regular Expressions to strip HTML tags from a string  
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

'This function uses Regular Expressions to replace ASCII symbol code in a string 
Public Function ReplaceSymbols(HTMLString)

Set RegularExpressionObject = New RegExp

With RegularExpressionObject
 .Pattern = "<[ ]*[&amp;]*(#133;|#151;|#174;|#169;|nbsp;|lt;|gt;)*>"
 .IgnoreCase = True
 .Global = True
End With

ReplaceSymbols = RegularExpressionObject.Replace(HTMLString, "&")

Set RegularExpressionObject = nothing

End Function

'Report.EnableSafeEncoding = true


Set objXML = Nothing
Set objXSL = Nothing

%>
