<%@ LANGUAGE="VBScript" %>
<!--meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /-->
<%
            set xml = Server.CreateObject("Microsoft.XMLDOM")
            xml.async = false
            'xml.setProperty "ServerHTTPRequest", true
            xml.load(Server.MapPath("wintersale07_central.xml"))
            set xslt = Server.CreateObject("Microsoft.XMLDOM")
            xslt.async = false
            'xslt.setProperty "ServerHTTPRequest", true
            xslt.load(Server.MapPath("test_regex.xslt"))
            Response.Write(xml.transformNode(xslt))
               set xml = nothing
               set xsl = nothing
%>