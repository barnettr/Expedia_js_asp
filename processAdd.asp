<%@ LANGUAGE="VBSCRIPT" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    
    '====================================================================
    'The "addNewContacttoXML" Function accepts two parameters.
    'strXMLFilePath - The physical path where the XML file will be saved.
    'strFileName - The name of the XML file that will be saved.
    '====================================================================
    Dim linkURL, fileName, eyebrowLink, heroLink 
    eyebrowLink = Request.Form("eyebrowLink001")
    heroLink = Request.Form("heroModuleURL001")
    linkURL = Request.Form("linkURL")
    fileName = Request.Form("fileName")
    Response.Write("strXMLFilePath is = " & linkURL & "<br />")
    Response.Write("strFileName is = " & fileName & "<br />")
    Response.Write("logoLink = " & eyebrowLink & "<br />")
    Response.Write("heroLink = " & heroLink & "<br />")


    Dim objDom
    Dim objRoot
    Dim objChild1
    Dim objChild2
    Dim objPI


    'Instantiate the XMLDOM object using the CreateObject Method of the
    'Server Object.
    Set objDom = Server.CreateObject("Microsoft.XMLDOM")


    'Create a reference to an IXMLDOMElement (XML Element) Object by
    'calling the createElement Method of the XMLDOM. The createElement
    'Method accepts one paramter, a string representing the name of the
    'element. The return value is passed to the objRoot variable. This
    'element reference will represent the root element of the XML
    'Document.
    Set objRoot = objDom.createElement("rootElement")

    'Use the appendChild Method of the XMLDOM Object to add the objRoot
    'Element Reference to the XML Document.
    objDom.appendChild objRoot

    'Now, following the same steps, you will create references to the
    'child elements for the XML Document. The only difference is, when the
    'child elements are appended to the document, you will call the
    'appendChild Method of the IXMLDOMElement Object rather than the
    'appendChild Method of the XMLDOM Object. By using the IXMLDOMElement
    'to append the children, you are differentiating (and applying tiered
    'structure to) the child elements from the root element.
    Set objChild1 = objDom.createElement("childElement1")
    objRoot.appendChild objChild1

    Set objChild2 = objDom.createElement("childElement2")
    objRoot.appendChild objChild2


    'The final step to take care of before saving this document is to add
    'an XML processing instruction. This is necessary so that XML parsers
    'will recognize this document as an XML document.
    Set objPI = objDom.createProcessingInstruction("xml","version='1.0'")


    'Call the insertBefore Method of the XMLDOM Object in order to insert
    'the processing instruction before the root element (the zero element
    'in the XMLDOM childNodes Collection).
    objDom.insertBefore objPI, objDom.childNodes(0)


    'Calling the Save Method of the XMLDOM Object will save this XML
    'document to your disk drive. In this case, the document will be saved
    'to the "c:" drive and will be named "MyXMLDoc.xml". When saving an
    'XML document, if the file does not exist, it will be created. If it
    'does exist, it will be overwritten.
    objDom.Save "\\ctoohey02\previewer_test\MyXMLDoc.xml"
    'objDom.Save "\\belgkp8rb1dp\Inetpub\wwwroot\StripHTMLasText\MyXMLDoc.xml"


%>

