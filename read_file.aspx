<%@Page Language="VB" Debug="True" %>
<%@Import Namespace="System.XML" %>

<html>
<body bgcolor="#ffffff">

<div id="outDocURL" runat="server"></div>
<div id="outError" runat="server">&nbsp;</div>
<div id="outResults" runat="server"></div>

<script language="vb" runat="server">

Sub Page_Load()
Dim strCurrentPath As String = Request.PhysicalPath
Dim strXMLPath As String = Left(strCurrentPath, InStrRev(strCurrentPath, "\")) & "fare_price.xml"
Dim objXMLReader As XmlTextReader
Try
objXMLReader = New XmlTextReader(strXMLPath)
outDocURL.innerHTML = "Opened file: <b>" & strXMLPath & "</b>"
Catch objError As Exception
outError.innerHTML = "<b>* Error while accessing document</b>.<br />" & objError.Message & "<br />" & objError.Source
Exit Sub
End Try
Dim strNodeResult As String = ""
Dim objNodeType As XmlNodeType
Dim MostRecentElement As String = ""
Dim RecordElementsNow = False
Do While objXMLReader.Read()
objNodeType = objXMLReader.NodeType
Select Case objNodeType
Case XmlNodeType.XmlDeclaration:
'do nothing'
Case XmlNodeType.Element:
			If UCase(objXMLReader.Name) = "SETTINGS" Then
RecordElementsNow = True
End If
			MostRecentElement = objXMLReader.Name
Case XmlNodeType.Text:
			If RecordElementsNow Then
				Session(MostRecentElement) = objXMLReader.Value
End If
End Select
If objXMLReader.AttributeCount > 0 Then
Do While objXMLReader.MoveToNextAttribute()
'strNodeResult +=  "&nbsp; - Attribute: <b>" & objXMLReader.Name & "</b> &nbsp; Value: <b>" & objXMLReader.Value & "</b><br />"'
Loop
End If
Loop
objXMLReader.Close()
outResults.innerHTML = strNodeResult
response.write(outResults.innerHTML)
End Sub
</script>

BackgroundColor = <%= Session("BackgroundColor") %><br>
FontColor = <%= Session("FontColor") %><br>
FontFamily = <%= Session("FontFamily") %><br>
FontSizeBase = <%= Session("FontSizeBase") %>


</body>
</html>
