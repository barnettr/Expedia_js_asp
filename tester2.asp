<%@ LANGUAGE="VBScript" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%
			dim htmlstr
            set xml = Server.CreateObject("Microsoft.XMLDOM")
            xml.async = false
            'xml.setProperty "ServerHTTPRequest", true
            xml.load(Server.MapPath("pmi_test.xml"))
            set xslt = Server.CreateObject("Microsoft.XMLDOM")
            xslt.async = false
            'xslt.setProperty "ServerHTTPRequest", true
            xslt.load(Server.MapPath("hybrid_template.xslt"))
            htmlstr = xml.transformNode(xslt)
            response.Write(htmlstr)
               set xml = nothing
               set xsl = nothing
%>