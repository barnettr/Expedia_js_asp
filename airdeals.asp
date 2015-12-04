<%@ Language=VBScript %>
<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
</head>
<body>
<% 
	Set objXML = Server.CreateObject("Microsoft.XMLDOM")
	Set objXSL = Server.CreateObject("Microsoft.XMLDOM")
	objXML.validateOnParse = True
	objXML.preserveWhiteSpace = True
	objXML.async = false
	objXSL.async = false
	objXML.load(Server.MapPath("fare_price.xml"))
	objXSL.load(Server.MapPath("fare_price.xsl"))
	'Set objRootElement = objXML.documentElement
	HTMLstr = objXML.transformNode(objXSL)
	Response.Write HTMLstr
	Set objXML = nothing
	Set objXSL = nothing
	
%>
</body>
</html>
