<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title></title>
<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<body>
<table width="100%" border="0" ID="Table1">
<tr><td width="100%" valign="middle" align="center">
<%
DIM strEmail
strEmail = Request.Form("emailAddy")
IF strEmail <> "" AND inStr(strEmail,"@") <> 0 AND inStr(strEmail,".") <> 0 THEN
Response.Write "<P>Thanks. Your email has been sent to <font color=blue>"& strEmail &"</font></P>"
ELSE
Response.Write "<p>Please click Back on your browser and complete the following field:</p>"
    IF strEmail <> "" THEN
    ELSE
    Response.Write "<b>• Email</b><br>"
    END IF
    IF inStr(strEmail,"@") <> 0 THEN
    ELSE
    Response.Write "<b>• You entered an invalid Email Address</b><br>"
    END IF
    IF inStr(strEmail,".") <> 0 THEN
    ELSE
    Response.Write "<b>• You entered an invalid Email Address</b><br>"
    END IF
END IF
'Set the response buffer to true so we execute all asp code before sending the HTML to the clients browser
Response.Buffer = True
'Dimension variables
Dim strBody 			'Holds the body of the e-mail
Dim objCDOMail 			'Holds the mail server object
Dim strMyEmailAddress 		'Holds your e-mail address
Dim strCCEmailAddress		'Holds any carbon copy e-mail addresses if you want to send carbon copies of the e-mail
Dim strBCCEmailAddress		'Holds any blind copy e-mail addresses if you wish to send blind copies of the e-mail
Dim strReturnEmailAddress	'Holds the return e-mail address of the user
strEmail = Request.Form("emailAddy")
'strCCEmailAddress = "" 'Use this string only if you want to send the carbon copies of the e-mail
'strBCCEmailAddress = "" 'Use this string only if you want to send the blind copies of the e-mail
strReturnEmail = Request.Form("emailAddy")'Read in the users e-mail address
strBody = "this is NOT working!" 'Initialse strBody string with the body of the e-mail
Set objCDOMail = Server.CreateObject("CDONTS.NewMail") 'Create the e-mail server object
objCDOMail.From = strReturnEmail
objCDOMail.To = strEmail 'Who the e-mail is sent to
'objCDOMail.Cc = strCCEmailAddress
'objCDOMail.Bcc = strBCCEmailAddress
objCDOMail.Subject = "Enquiry sent from enquiry form on website"
objCDOMail.BodyFormat = 0 'Set the e-mail body format (0=HTML 1=Text)
objCDOMail.MailFormat = 0 'Set the mail format (0=MIME 1=Text)
objCDOMail.Body = strBody 'Set the main body of the e-mail
objCDOMail.Importance = 1 'Importance of the e-mail (0=Low, 1=Normal, 2=High)
objCDOMail.Send 'Send the e-mail
Set objCDOMail = Nothing 'Close the server object
%>
</td></tr>
</table>
</body>
</html>
