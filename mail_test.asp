<%
'Set the response buffer to true so we execute all asp code before sending the HTML to the clients browser
Response.Buffer = True

'Dimension variables
Dim strBody 			'Holds the body of the e-mail
Dim objCDOMail 			'Holds the mail server object
Dim strMyEmailAddress 		'Holds your e-mail address
Dim strCCEmailAddress		'Holds any carbon copy e-mail addresses if you want to send carbon copies of the e-mail
Dim strBCCEmailAddress		'Holds any blind copy e-mail addresses if you wish to send blind copies of the e-mail
Dim strReturnEmailAddress	'Holds the return e-mail address of the user


'----------------- Place your e-mail address in the following sting ----------------------------------

strMyEmailAddress = "ctoohey@expedia.com"

'----------- Place Carbon Copy e-mail address's in the following sting, separated by ; --------------

strCCEmailAddress = "" 'Use this string only if you want to send the carbon copies of the e-mail

'----------- Place Blind Copy e-mail address's in the following sting, separated  by ; --------------

strBCCEmailAddress = "" 'Use this string only if you want to send the blind copies of the e-mail

'-----------------------------------------------------------------------------------------------------


'Read in the users e-mail address
strReturnEmailAddress = Request.Form("email")


'Initialse strBody string with the body of the e-mail
strBody = "<h2>E-mail sent from form on Web Site</h2>"
strBody = strBody & "<br><b>Name: </b>" & Request.Form("firstName") & " " & Request.Form("lastName")
strBody = strBody & "<br><br><b>Address: -</b>"
If (Request.Form("street1")) > "" Then 
	strBody = strBody & "<br>  " & Request.Form("street1")
End If
If (Request.Form("street2")) > "" Then 
	strBody = strBody & "<br>  " & Request.Form("street2") 
End If
If (Request.Form("town")) > "" Then 
	strBody = strBody & "<br>  " & Request.Form("town")
End If
If (Request.Form("county")) > "" Then 
	strBody = strBody & "<br>  " & Request.Form("county")
End If
If (Request.Form("country")) > "--- Choose One ---" Then
	strBody = strBody & "<br>  " & Request.Form("country")
End IF
If (Request.Form("postCode")) > "" Then 
	strBody = strBody & "<br>  " & Request.Form("postCode")
End If
strBody = strBody & "<br><br><b>Telephone: </b>" & Request.Form("tel")
strBody = strBody & "<br><b>E-mail: </b>" & strReturnEmailAddress
strBody = strBody & "<br><br><b>Enquiry: - </b><br>" & Replace(Request.Form("enquiry"), vbCrLf, "<br>")


'Check to see if the user has entered an e-mail address and that it is a valid address otherwise set the e-mail address to your own otherwise the e-mail will be rejected
If Len(strReturnEmailAddress) < 5 OR NOT Instr(1, strReturnEmailAddress, " ") = 0 OR InStr(1, strReturnEmailAddress, "@", 1) < 2 OR InStrRev(strReturnEmailAddress, ".") < InStr(1, strReturnEmailAddress, "@", 1) Then
	
	'Set the return e-mail address to your own
	strReturnEmailAddress = strMyEmailAddress
End If	


'Send the e-mail

'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

'Who the e-mail is from (this needs to have an e-mail address in it for the e-mail to be sent)
objCDOMail.From = "ctoohey@expedia.com"

'Who the e-mail is sent to
objCDOMail.To = ctoohey@expedia.com'strMyEmailAddress

'Who the carbon copies are sent to
objCDOMail.Cc = strCCEmailAddress

'Who the blind copies are sent to
objCDOMail.Bcc = strBCCEmailAddress

'Set the subject of the e-mail
objCDOMail.Subject = "Enquiry sent from enquiry form on website"

'Set the e-mail body format (0=HTML 1=Text)
objCDOMail.BodyFormat = 0

'Set the mail format (0=MIME 1=Text)
objCDOMail.MailFormat = 0

'Set the main body of the e-mail
objCDOMail.Body = strBody

'Importance of the e-mail (0=Low, 1=Normal, 2=High)
objCDOMail.Importance = 1 

'Send the e-mail
objCDOMail.Send
	
'Close the server object
Set objCDOMail = Nothing
%>
<html>
	<head>
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
		<title>Contact Us</title> 
	</head>
	<body text="#000000" bgcolor="#FFFFFF" link="#0000FF" vlink="#990099" alink="#FF0000">
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" ID="Table1">
			<tr>
				<td height="2">
					<h1 align="center">Contact Us</h1>
				</td>
			</tr>
		</table>
		<br>
		<br>
		<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" ID="Table2">
			<tr>
				<td align="center">
					Thank-you
					<% = Request.Form("firstName") %>
					&nbsp;<% = Request.Form("lastName") %>
					for filling in the enquiry form.
					<br>
					I shall be receiving your enquiry shortly and will reply as soon as possible.</td>
			</tr>
		</table>
	</body>
</html>
