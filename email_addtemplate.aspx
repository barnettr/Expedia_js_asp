<%@ Page Language="VB" Debug="True" %>
<%@ Import Namespace="System.XML" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %> 
<%@ Import Namespace="System.Data.SqlClient" %> 

<SCRIPT LANGUAGE="vb" Runat="server">
Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	dim filePath as String = Request.QueryString("folder")
	viewQS.Text = BreadCrumb(filePath)
	btnRefresh.Attributes.Add("onClick", "parent.menu.location.reload();")
End Sub

Sub AddFile(ByVal sender As System.Object, ByVal e As System.EventArgs)
	If Page.IsValid then
		Dim xmlFile As String = ddate.text & "_" & mailType.SelectedItem.value & emcid.text & "_" & desc.text & ".xml"
		dim filePath As String = Request.QueryString("folder")
		dim rootPath As String = Server.MapPath("/")
		dim url As String = Right(filePath, Len(filePath) - Len(rootPath))
            Dim newFlex As String = Left(url, 15)
            Response.Write(newFlex)
            Dim newPMI As String = Left(url, 14)
            Dim newElite As String = Left(url, 16)
            Dim newFaresale As String = Left(url, 19)
            Dim newTravRt As String = Left(url, 22)
            Dim newDealsNL As String = Left(url, 14)
            Dim nd As New FileInfo(Request.QueryString("folder") & "\" & xmlFile)
            Dim ecat As String = mailType.SelectedItem.Value
            
            If newFlex = "email\FLEX_MAIL" Or newPMI = "email\PMI_MAIL" Or newElite = "email\ELITE_MAIL" Then
                If nd.Exists = False Then
                    Select Case ecat
                        Case "CM_CZ_01_"
                            Dim xmldoc As XmlDocument
                            Dim pmi_file As String
                            pmi_file = "C:\\Inetpub\wwwroot\email\previewer_test\xml_templates\20070531_CM_CZ_01_xxx_sample.xml"
                            xmldoc = New XmlDocument()
                            xmldoc.Load(pmi_file)
                            Dim xmlread As XmlTextReader = New XmlTextReader(pmi_file)
                            Dim memStream As New MemoryStream()
                            Dim AE As New ASCIIEncoding()
                            Dim xmlStr As String = xmldoc.DocumentElement.InnerXml
                            Dim xmlWrite As New XmlTextWriter(Request.QueryString("folder") & "\" & xmlFile, System.Text.Encoding.UTF8)
                            ' Use the data from the stream here.
                            memStream.Close()
                            While xmlread.Read()
                                Select Case xmlread.NodeType
                                    Case XmlNodeType.Element
                                        Dim root As XmlNode = xmldoc.DocumentElement
                                        If xmlread.Name = "email" Then
                                            root.RemoveChild(root.FirstChild)
                                        End If
                                        
                                End Select
                            End While
                            ' Start writng to xmldoc
                            xmlWrite.WriteStartDocument()
                            xmlWrite.WriteProcessingInstruction("mso-infoPathSolution", "PIVersion='1.0.0.0' href='file:///C:\Inetpub\wwwroot\email\previewer\master_template.xsn' name='urn:schemas-microsoft-com:office:infopath:master-template:' productVersion='11.0.6357' solutionVersion='1.0.0.127'")
                            xmlWrite.WriteProcessingInstruction("mso-application", "progid='InfoPath.Document'")
                            xmlWrite.WriteComment("Created on " & Now())
                            xmlWrite.Formatting = Formatting.Indented
                            xmlWrite.Indentation = 3
                            xmlWrite.WriteStartElement("email")
                            xmlWrite.WriteAttributeString("type", mailType.SelectedItem.Value)
                            xmlWrite.WriteAttributeString("xmlns:ns1", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-03-31T20:32:03")
                            xmlWrite.WriteAttributeString("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance")
                            xmlWrite.WriteAttributeString("xmlns:xdEnvironment", "http://schemas.microsoft.com/office/infopath/2006/xslt/environment")
                            xmlWrite.WriteAttributeString("xmlns:xdUser", "http://schemas.microsoft.com/office/infopath/2006/xslt/User")
                            xmlWrite.WriteAttributeString("xmlns:xsf2", "http://schemas.microsoft.com/office/infopath/2006/solutionDefinition/extensions")
                            xmlWrite.WriteAttributeString("xmlns:my", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-08-04T21:17:17")
                            xmlWrite.WriteAttributeString("xmlns:xd", "http://schemas.microsoft.com/office/infopath/2003")
                            xmlWrite.WriteAttributeString("xml:lang", "en-us")
                            xmlWrite.WriteStartElement("ID")
                            xmlWrite.WriteAttributeString("issue", emcid.Text)
                            xmlWrite.WriteEndElement()
                            xmlWrite.WriteRaw(xmlStr)
                            xmlWrite.WriteEndElement()
                            xmlWrite.Flush()
                            xmlWrite.Close()
                            xmlread.Close()
                            
                            Response.Write(Left(xmlFile, Len(xmlFile) - Len(".xml")) & " has been created")
                            Response.End()
                        Case "SUR_AH"
                            Dim xmldoc As XmlDocument
                            Dim pmi_file As String
                            pmi_file = "C:\\Inetpub\wwwroot\email\previewer_test\xml_templates\20070531_SUR_AH_sample.xml"
                            xmldoc = New XmlDocument()
                            xmldoc.Load(pmi_file)
                            Dim xmlread As XmlTextReader = New XmlTextReader(pmi_file)
                            Dim memStream As New MemoryStream()
                            Dim AE As New ASCIIEncoding()
                            Dim xmlStr As String = xmldoc.DocumentElement.InnerXml
                            Dim xmlWrite As New XmlTextWriter(Request.QueryString("folder") & "\" & xmlFile, System.Text.Encoding.UTF8)
                            ' Use the data from the stream here.
                            memStream.Close()
                            While xmlread.Read()
                                Select Case xmlread.NodeType
                                    Case XmlNodeType.Element
                                        Dim root As XmlNode = xmldoc.DocumentElement
                                        If xmlread.Name = "email" Then
                                            root.RemoveChild(root.FirstChild)
                                        End If
                                        
                                End Select
                            End While
                            ' Start writng to xmldoc
                            xmlWrite.WriteStartDocument()
                            xmlWrite.WriteProcessingInstruction("mso-infoPathSolution", "PIVersion='1.0.0.0' href='file:///C:\Inetpub\wwwroot\email\previewer\master_template.xsn' name='urn:schemas-microsoft-com:office:infopath:master-template:' productVersion='11.0.6357' solutionVersion='1.0.0.127'")
                            xmlWrite.WriteProcessingInstruction("mso-application", "progid='InfoPath.Document'")
                            xmlWrite.WriteComment("Created on " & Now())
                            xmlWrite.Formatting = Formatting.Indented
                            xmlWrite.Indentation = 3
                            xmlWrite.WriteStartElement("email")
                            xmlWrite.WriteAttributeString("type", mailType.SelectedItem.Value)
                            xmlWrite.WriteAttributeString("xmlns:ns1", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-03-31T20:32:03")
                            xmlWrite.WriteAttributeString("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance")
                            xmlWrite.WriteAttributeString("xmlns:xdEnvironment", "http://schemas.microsoft.com/office/infopath/2006/xslt/environment")
                            xmlWrite.WriteAttributeString("xmlns:xdUser", "http://schemas.microsoft.com/office/infopath/2006/xslt/User")
                            xmlWrite.WriteAttributeString("xmlns:xsf2", "http://schemas.microsoft.com/office/infopath/2006/solutionDefinition/extensions")
                            xmlWrite.WriteAttributeString("xmlns:my", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-08-04T21:17:17")
                            xmlWrite.WriteAttributeString("xmlns:xd", "http://schemas.microsoft.com/office/infopath/2003")
                            xmlWrite.WriteAttributeString("xml:lang", "en-us")
                            xmlWrite.WriteStartElement("ID")
                            xmlWrite.WriteAttributeString("issue", emcid.Text)
                            xmlWrite.WriteEndElement()
                            xmlWrite.WriteRaw(xmlStr)
                            xmlWrite.WriteEndElement()
                            xmlWrite.Flush()
                            xmlWrite.Close()
                            xmlread.Close()
                            
                            Response.Write(Left(xmlFile, Len(xmlFile) - Len(".xml")) & " has been created")
                            Response.End()
                        Case "CM_FS_01_"
                            Dim xmldoc As XmlDocument
                            Dim pmi_file As String
                            pmi_file = "C:\\Inetpub\wwwroot\email\previewer_test\xml_templates\20070531_CM_FS_01_xxx_flex.xml"
                            xmldoc = New XmlDocument()
                            xmldoc.Load(pmi_file)
                            Dim xmlread As XmlTextReader = New XmlTextReader(pmi_file)
                            Dim memStream As New MemoryStream()
                            Dim AE As New ASCIIEncoding()
                            Dim xmlStr As String = xmldoc.DocumentElement.InnerXml
                            Dim xmlWrite As New XmlTextWriter(Request.QueryString("folder") & "\" & xmlFile, System.Text.Encoding.UTF8)
                            ' Use the data from the stream here.
                            memStream.Close()
                            While xmlread.Read()
                                Select Case xmlread.NodeType
                                    Case XmlNodeType.Element
                                        Dim root As XmlNode = xmldoc.DocumentElement
                                        If xmlread.Name = "email" Then
                                            root.RemoveChild(root.FirstChild)
                                        End If
                                        
                                End Select
                            End While
                            ' Start writng to xmldoc
                            xmlWrite.WriteStartDocument()
                            xmlWrite.WriteProcessingInstruction("mso-infoPathSolution", "PIVersion='1.0.0.0' href='file:///C:\Inetpub\wwwroot\email\previewer\master_template.xsn' name='urn:schemas-microsoft-com:office:infopath:master-template:' productVersion='11.0.6357' solutionVersion='1.0.0.127'")
                            xmlWrite.WriteProcessingInstruction("mso-application", "progid='InfoPath.Document'")
                            xmlWrite.WriteComment("Created on " & Now())
                            xmlWrite.Formatting = Formatting.Indented
                            xmlWrite.Indentation = 3
                            xmlWrite.WriteStartElement("email")
                            xmlWrite.WriteAttributeString("type", mailType.SelectedItem.Value)
                            xmlWrite.WriteAttributeString("xmlns:ns1", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-03-31T20:32:03")
                            xmlWrite.WriteAttributeString("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance")
                            xmlWrite.WriteAttributeString("xmlns:xdEnvironment", "http://schemas.microsoft.com/office/infopath/2006/xslt/environment")
                            xmlWrite.WriteAttributeString("xmlns:xdUser", "http://schemas.microsoft.com/office/infopath/2006/xslt/User")
                            xmlWrite.WriteAttributeString("xmlns:xsf2", "http://schemas.microsoft.com/office/infopath/2006/solutionDefinition/extensions")
                            xmlWrite.WriteAttributeString("xmlns:my", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-08-04T21:17:17")
                            xmlWrite.WriteAttributeString("xmlns:xd", "http://schemas.microsoft.com/office/infopath/2003")
                            xmlWrite.WriteAttributeString("xml:lang", "en-us")
                            xmlWrite.WriteStartElement("ID")
                            xmlWrite.WriteAttributeString("issue", emcid.Text)
                            xmlWrite.WriteEndElement()
                            xmlWrite.WriteRaw(xmlStr)
                            xmlWrite.WriteEndElement()
                            xmlWrite.Flush()
                            xmlWrite.Close()
                            xmlread.Close()
                            
                            Response.Write(Left(xmlFile, Len(xmlFile) - Len(".xml")) & " has been created")
                            Response.End()
                        Case Else
                            Dim xmldoc As XmlDocument
                            Dim pmi_file As String
                            pmi_file = "C:\\Inetpub\wwwroot\email\previewer_test\xml_templates\20070531_CM_P_01_xxx_sample.xml"
                            xmldoc = New XmlDocument()
                            xmldoc.Load(pmi_file)
                            Dim xmlread As XmlTextReader = New XmlTextReader(pmi_file)
                            Dim memStream As New MemoryStream()
                            Dim AE As New ASCIIEncoding()
                            Dim xmlStr As String = xmldoc.DocumentElement.InnerXml
                            Dim xmlWrite As New XmlTextWriter(Request.QueryString("folder") & "\" & xmlFile, System.Text.Encoding.UTF8)
                            ' Use the data from the stream here.
                            memStream.Close()
                            While xmlread.Read()
                                Select Case xmlread.NodeType
                                    Case XmlNodeType.Element
                                        Dim root As XmlNode = xmldoc.DocumentElement
                                        If xmlread.Name = "email" Then
                                            root.RemoveChild(root.FirstChild)
                                        End If
                                        
                                End Select
                            End While
                            ' Start writng to xmldoc
                            xmlWrite.WriteStartDocument()
                            xmlWrite.WriteProcessingInstruction("mso-infoPathSolution", "PIVersion='1.0.0.0' href='file:///C:\Inetpub\wwwroot\email\previewer\master_template.xsn' name='urn:schemas-microsoft-com:office:infopath:master-template:' productVersion='11.0.6357' solutionVersion='1.0.0.127'")
                            xmlWrite.WriteProcessingInstruction("mso-application", "progid='InfoPath.Document'")
                            xmlWrite.WriteComment("Created on " & Now())
                            xmlWrite.Formatting = Formatting.Indented
                            xmlWrite.Indentation = 3
                            xmlWrite.WriteStartElement("email")
                            xmlWrite.WriteAttributeString("type", mailType.SelectedItem.Value)
                            xmlWrite.WriteAttributeString("xmlns:ns1", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-03-31T20:32:03")
                            xmlWrite.WriteAttributeString("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance")
                            xmlWrite.WriteAttributeString("xmlns:xdEnvironment", "http://schemas.microsoft.com/office/infopath/2006/xslt/environment")
                            xmlWrite.WriteAttributeString("xmlns:xdUser", "http://schemas.microsoft.com/office/infopath/2006/xslt/User")
                            xmlWrite.WriteAttributeString("xmlns:xsf2", "http://schemas.microsoft.com/office/infopath/2006/solutionDefinition/extensions")
                            xmlWrite.WriteAttributeString("xmlns:my", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-08-04T21:17:17")
                            xmlWrite.WriteAttributeString("xmlns:xd", "http://schemas.microsoft.com/office/infopath/2003")
                            xmlWrite.WriteAttributeString("xml:lang", "en-us")
                            xmlWrite.WriteStartElement("ID")
                            xmlWrite.WriteAttributeString("issue", emcid.Text)
                            xmlWrite.WriteEndElement()
                            xmlWrite.WriteRaw(xmlStr)
                            xmlWrite.WriteEndElement()
                            xmlWrite.Flush()
                            xmlWrite.Close()
                            xmlread.Close()
                            
                            Response.Write(Left(xmlFile, Len(xmlFile) - Len(".xml")) & " has been created")
                            Response.End()
                    End Select
                Else
                    Response.Write("<font color='#cc0000'>" & Left(xmlFile, Len(xmlFile) - Len(".xml")) & " file already exists. Create a different one.</font>")
                End If
            End If
            If newTravRt = "email\TRAVELRIGHT_MAIL" Then
                If nd.Exists = False Then
                    Dim xmldoc As XmlDocument
                    Dim pmi_file As String
                    pmi_file = "C:\\Inetpub\wwwroot\email\previewer_test\xml_templates\20070531_MMN_TR_04_xxx_sample.xml"
                    xmldoc = New XmlDocument()
                    xmldoc.Load(pmi_file)
                    Dim xmlread As XmlTextReader = New XmlTextReader(pmi_file)
                    Dim memStream As New MemoryStream()
                    Dim AE As New ASCIIEncoding()
                    Dim xmlStr As String = xmldoc.DocumentElement.InnerXml
                    Dim xmlWrite As New XmlTextWriter(Request.QueryString("folder") & "\" & xmlFile, System.Text.Encoding.UTF8)
                    ' Use the data from the stream here.
                    memStream.Close()
                    While xmlread.Read()
                        Select Case xmlread.NodeType
                            Case XmlNodeType.Element
                                Dim root As XmlNode = xmldoc.DocumentElement
                                If xmlread.Name = "email" Then
                                    root.RemoveChild(root.FirstChild)
                                End If
                                        
                        End Select
                    End While
                    ' Start writng to xmldoc
                    xmlWrite.WriteStartDocument()
                    xmlWrite.WriteProcessingInstruction("mso-infoPathSolution", "PIVersion='1.0.0.0' href='file:///C:\Inetpub\wwwroot\email\previewer\Travel_Right_Mail_template_pub.xsn' name='urn:schemas-microsoft-com:office:infopath:Travel-Right-Mail-template-pub:' productVersion='11.0.6357' solutionVersion='1.0.0.45'")
                    xmlWrite.WriteProcessingInstruction("mso-application", "progid='InfoPath.Document'")
                    xmlWrite.WriteComment("Created on " & Now())
                    xmlWrite.Formatting = Formatting.Indented
                    xmlWrite.Indentation = 3
                    xmlWrite.WriteStartElement("email")
                    xmlWrite.WriteAttributeString("my:type", mailType.SelectedItem.Value)
                    xmlWrite.WriteAttributeString("xmlns:ns1", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-03-31T20:32:03")
                    xmlWrite.WriteAttributeString("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance")
                    xmlWrite.WriteAttributeString("xmlns:xdEnvironment", "http://schemas.microsoft.com/office/infopath/2006/xslt/environment")
                    xmlWrite.WriteAttributeString("xmlns:xdUser", "http://schemas.microsoft.com/office/infopath/2006/xslt/User")
                    xmlWrite.WriteAttributeString("xmlns:xsf2", "http://schemas.microsoft.com/office/infopath/2006/solutionDefinition/extensions")
                    xmlWrite.WriteAttributeString("xmlns:my", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2005-12-29T00:09:13")
                    xmlWrite.WriteAttributeString("xmlns:xd", "http://schemas.microsoft.com/office/infopath/2003")
                    xmlWrite.WriteAttributeString("xml:lang", "en-us")
                    xmlWrite.WriteStartElement("ID")
                    xmlWrite.WriteAttributeString("issue", emcid.Text)
                    xmlWrite.WriteEndElement()
                    xmlWrite.WriteRaw(xmlStr)
                    xmlWrite.WriteEndElement()
                    xmlWrite.Flush()
                    xmlWrite.Close()
                    xmlread.Close()
                            
                    Response.Write(Left(xmlFile, Len(xmlFile) - Len(".xml")) & " has been created")
                    Response.End()
                Else
                    Response.Write("<font color='#cc0000'>" & Left(xmlFile, Len(xmlFile) - Len(".xml")) & " file already exists. Create a different one.</font>")
                End If
            End If
            If newFaresale = "email\FARESALE_MAIL" Then
                If nd.Exists = False Then
                    Dim xmldoc As XmlDocument
                    Dim pmi_file As String
                    pmi_file = "C:\\Inetpub\wwwroot\email\previewer_test\xml_templates\20070531_CM_FS_01_xxx_reg.xml"
                    xmldoc = New XmlDocument()
                    xmldoc.Load(pmi_file)
                    Dim xmlread As XmlTextReader = New XmlTextReader(pmi_file)
                    Dim memStream As New MemoryStream()
                    Dim AE As New ASCIIEncoding()
                    Dim xmlStr As String = xmldoc.DocumentElement.InnerXml
                    Dim xmlWrite As New XmlTextWriter(Request.QueryString("folder") & "\" & xmlFile, System.Text.Encoding.UTF8)
                    ' Use the data from the stream here.
                    memStream.Close()
                    While xmlread.Read()
                        Select Case xmlread.NodeType
                            Case XmlNodeType.Element
                                Dim root As XmlNode = xmldoc.DocumentElement
                                If xmlread.Name = "email" Then
                                    root.RemoveChild(root.FirstChild)
                                End If
                                        
                        End Select
                    End While
                    ' Start writng to xmldoc
                    xmlWrite.WriteStartDocument()
                    xmlWrite.WriteProcessingInstruction("mso-infoPathSolution", "PIVersion='1.0.0.0' href='file:///C:\Inetpub\wwwroot\email\previewer\FareSale_Mail_template.xsn' name='urn:schemas-microsoft-com:office:infopath:FareSale-Mail-template:' productVersion='11.0.6357' solutionVersion='1.0.0.21'")
                    xmlWrite.WriteProcessingInstruction("mso-application", "progid='InfoPath.Document'")
                    xmlWrite.WriteComment("Created on " & Now())
                    xmlWrite.Formatting = Formatting.Indented
                    xmlWrite.Indentation = 3
                    xmlWrite.WriteStartElement("email")
                    xmlWrite.WriteAttributeString("type", mailType.SelectedItem.Value)
                    xmlWrite.WriteAttributeString("xmlns:ns1", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-03-31T20:32:03")
                    xmlWrite.WriteAttributeString("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance")
                    xmlWrite.WriteAttributeString("xmlns:xdEnvironment", "http://schemas.microsoft.com/office/infopath/2006/xslt/environment")
                    xmlWrite.WriteAttributeString("xmlns:xdUser", "http://schemas.microsoft.com/office/infopath/2006/xslt/User")
                    xmlWrite.WriteAttributeString("xmlns:xsf2", "http://schemas.microsoft.com/office/infopath/2006/solutionDefinition/extensions")
                    xmlWrite.WriteAttributeString("xmlns:my", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-08-04T21:17:17")
                    xmlWrite.WriteAttributeString("xmlns:xd", "http://schemas.microsoft.com/office/infopath/2003")
                    xmlWrite.WriteAttributeString("xml:lang", "en-us")
                    xmlWrite.WriteStartElement("ID")
                    xmlWrite.WriteAttributeString("issue", emcid.Text)
                    xmlWrite.WriteEndElement()
                    xmlWrite.WriteRaw(xmlStr)
                    xmlWrite.WriteEndElement()
                    xmlWrite.Flush()
                    xmlWrite.Close()
                    xmlread.Close()
                            
                    Response.Write(Left(xmlFile, Len(xmlFile) - Len(".xml")) & " has been created")
                    Response.End()
                Else
                    Response.Write("<font color='#cc0000'>" & Left(xmlFile, Len(xmlFile) - Len(".xml")) & " file already exists. Create a different one.</font>")	
                End If
            End If
            If newDealsNL = "email\DNL_MAIL" Then               
                If nd.Exists = False Then
                    Dim xmlWrite As New XmlTextWriter(Request.QueryString("folder") & "\" & xmlFile, System.Text.Encoding.UTF8)
                    Dim connString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\\Inetpub\\wwwroot\\deals\\db2.mdb"
                    Dim myConnection As New OleDbConnection(connString)
                    Dim strSQL As String = "SELECT DestinationID,HotelName,HotelID,DealID,StarRating,Format(TravelStartDate,'mm/dd') As TravelStartDate,Format(TravelEndDate,'mm/dd') As TravelEndDate,Price,TerminateDate,strURL FROM AriesDealsLocal ORDER BY Destination, Price"
                    Dim strDestSQL As String = "SELECT * FROM AriesDestinationLocal ORDER BY Destination"
                    Dim objCommand As New OleDbCommand(strSQL, myConnection)
                    Dim objCommandDest As New OleDbCommand(strDestSQL, myConnection)
                    'create a data adapters
                    Dim da As New OleDbDataAdapter(objCommand)
                    Dim daDest As New OleDbDataAdapter(objCommandDest)
                    Dim ds As New DataSet()
                    Dim dsDest As New DataSet()
                    'Dim dtable As New Data.DataTable("AriesDealsLocal")
                    Dim drow As DataRow
                    Dim destrow As DataRow
                    
                    'Dim dcol As New DataColumn()
                    da.Fill(ds, "AriesDealsLocal")
                    daDest.Fill(dsDest, "AriesDestinationLocal")
                    Dim xmlDoc As New XmlDocument()
                    xmlWrite.WriteStartDocument()
                    xmlWrite.WriteProcessingInstruction("mso-infoPathSolution", "PIVersion='1.0.0.0' href='file:///C:\Inetpub\wwwroot\email\previewer\deals_template.xsn' name='urn:schemas-microsoft-com:office:infopath:deals-template:' productVersion='11.0.6565' solutionVersion='1.0.0.7'")
                    xmlWrite.WriteProcessingInstruction("mso-application", "progid='InfoPath.Document'")
                    xmlWrite.WriteComment("Created on " & Now())
                    xmlWrite.Formatting = Formatting.Indented
                    xmlWrite.Indentation = 3
                    xmlWrite.WriteStartElement("email")
                    xmlWrite.WriteAttributeString("type", mailType.SelectedItem.Value)
                    xmlWrite.WriteAttributeString("xmlns:ns1", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-08-04T21:17:17")
                    xmlWrite.WriteAttributeString("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance")
                    xmlWrite.WriteAttributeString("xmlns:xdEnvironment", "http://schemas.microsoft.com/office/infopath/2006/xslt/environment")
                    xmlWrite.WriteAttributeString("xmlns:xdUser", "http://schemas.microsoft.com/office/infopath/2006/xslt/User")
                    xmlWrite.WriteAttributeString("xmlns:xsf2", "http://schemas.microsoft.com/office/infopath/2006/solutionDefinition/extensions")
                    xmlWrite.WriteAttributeString("xmlns:my", "http://schemas.microsoft.com/office/infopath/2003/myXSD/2007-06-12T19:35:47")
                    xmlWrite.WriteAttributeString("xmlns:xd", "http://schemas.microsoft.com/office/infopath/2003")
                    xmlWrite.WriteAttributeString("xml:lang", "en-us")
                    xmlWrite.WriteStartElement("ID")
                    xmlWrite.WriteAttributeString("issue", emcid.Text)
                    xmlWrite.WriteEndElement()
                    xmlWrite.WriteElementString("subjectText", "Last-minute deals: Get yours before they're gone")

                    'Dim rootNode As XmlElement = xmlDoc.CreateElement("email")
                    'For Each dcol In ds.Tables(0).Columns
                    'Response.Write(dcol.ColumnName)
                    'Next
                                        
                    For Each destrow In dsDest.Tables(0).Rows
                        xmlWrite.WriteStartElement("Destination")
                        xmlWrite.WriteAttributeString("DestinationID", destrow("DestinationID"))
                        xmlWrite.WriteAttributeString("Name", destrow("Destination"))
                        xmlWrite.WriteAttributeString("DestPick", "no")
                        For Each drow In ds.Tables(0).Rows
                            If drow("DestinationID") = destrow("DestinationID") Then
                                xmlWrite.WriteStartElement("Hotel")
                                xmlWrite.WriteAttributeString("Name", drow("HotelName"))
                                xmlWrite.WriteAttributeString("HotelID", drow("HotelID"))
                                xmlWrite.WriteAttributeString("DealID", drow("DealID"))
                                If drow("StarRating") Is DBNull.Value Then
                                    xmlWrite.WriteElementString("StarRating", "no rating")
                                Else
                                    Convert.ToString(drow("StarRating"))
                                    xmlWrite.WriteElementString("StarRating", drow("StarRating"))
                                End If
                                xmlWrite.WriteElementString("TravelStartDate", drow("TravelStartDate"))
                                xmlWrite.WriteElementString("TravelEndDate", drow("TravelEndDate"))
                                xmlWrite.WriteElementString("Price", drow("Price"))
                                xmlWrite.WriteElementString("TerminateDate", drow("TerminateDate"))
                                xmlWrite.WriteElementString("strURL", Right(drow("strURL"), Len(drow("strURL"))-Len(Left(drow("strURL"),62))))
                                xmlWrite.WriteEndElement()
                            End If
                        Next
                        xmlWrite.WriteElementString("my:header", "")
                        xmlWrite.WriteEndElement()
                    Next
                    xmlWrite.WriteStartElement("specialRules")
                    xmlWrite.WriteAttributeString("show", "no")
                    xmlWrite.WriteEndElement() 'end of specialRules element
                    xmlWrite.WriteEndElement() 'end of email element
                    xmlWrite.Flush()
                    xmlWrite.Close()
                    myConnection.Close()
                    Response.Write(Left(xmlFile, Len(xmlFile) - Len(".xml")) & " has been created")
                    Response.End()
                Else
                    Response.Write("<font color='#cc0000'>" & Left(xmlFile, Len(xmlFile) - Len(".xml")) & " file already exists. Create a different one.</font>")
                End If
            End If
        End If
    End Sub

    Sub Date_Selected(ByVal sender As Object, ByVal e As EventArgs)
        Dim filePath As String = Request.QueryString("folder")
        Dim newDate As Date = Calendar1.SelectedDate
        Dim MONTH As String = newDate.Month
        Dim DAY As String = newDate.Day
        Dim YEAR As String = newDate.Year

        If Val(MONTH) < 10 Then
            MONTH = "0" + Trim(MONTH)
        End If
        If Val(DAY) < 10 Then
            DAY = "0" + Trim(DAY)
            Dim concatDate As String = YEAR + MONTH + DAY
            ddate.Text = concatDate
        Else
            ddate.Text = YEAR + MONTH + DAY
        End If
    End Sub

    Function BreadCrumb(ByVal path)
        Dim rootPath As String
        Dim url As String
        rootPath = Server.MapPath("/")
        url = Right(path, Len(path) - Len(rootPath))
        BreadCrumb = Replace(url, "\", " -> ")
    End Function
</SCRIPT>

<HTML>
<head>
<script type="text/javascript">
<!--
function showBox(szDivID, iState) // 1 visible, 0 hidden
{
   var obj = document.layers ? document.layers[szDivID] :
   document.getElementById ?  document.getElementById(szDivID).style :
   document.all[szDivID].style;
   obj.visibility = document.layers ? (iState ? "show" : "hide") :
   (iState ? "visible" : "hidden");
}
// -->
</script>
</head>
<BODY onload="showBox('calShow',0);">
<asp:label id="viewQS" runat="server" style="font-family: verdana; font-size: 10; color: #000000;" /><br/><br/>
<FORM METHOD="post" name="frmPerson" id="frmPerson" encType="multipart/form-data" Runat="server">
<TABLE cellpadding="0" cellspacing="0" border="0">
<TR>
<TD><FONT FACE='arial' Size='1'>Deployment Date:</FONT><br/><asp:textbox name='ddate' id='ddate' size='10' runat="server" style="border:solid 1 gray; font-size:12px;" onClick="showBox('calShow',1);" readonly /></TD>
<td width="5"></td>
<td><FONT FACE='arial' Size='1'>Type:</FONT><br/><asp:DropDownList id="mailType" name="mailType" runat="server" style="border:solid 1 gray; font-size:12px;"><asp:ListItem Value="">Choose</asp:ListItem>
    <asp:ListItem Value="CM_P_01_">CM - PMI</asp:ListItem>
    <asp:ListItem Value="CM_CP_01_">CM - Coupon</asp:ListItem>
    <asp:ListItem Value="CM_CZ_01_">CM - Cruise</asp:ListItem>
    <asp:ListItem Value="CM_M_01_">CM - Merchandise</asp:ListItem>
    <asp:ListItem Value="CM_O_01_">CM - Other</asp:ListItem>
    <asp:ListItem Value="CRM_R_01_">Elite - Marketing</asp:ListItem>
    <asp:ListItem Value="CRM_R_01_">Elite - Service</asp:ListItem>
    <asp:ListItem Value="MMN_TR_04_">TR - Mass Mail (weekly)</asp:ListItem>
    <asp:ListItem Value="MMN_PE_01_">TR - Non-Segmented</asp:ListItem>
    <asp:ListItem Value="CM_FS_01_">FS - Fare Sale only</asp:ListItem>
    <asp:ListItem Value="SUR_AH">Survey - Ad Hoc</asp:ListItem>
</asp:DropDownList>&nbsp;</td>
<TD><FONT FACE='arial' Size='1'>ID:</FONT><br/><asp:textbox name='emcid' id='emcid' size='5' maxlength='4' runat="server" style="border:solid 1 gray; font-size:12px;"/>&nbsp;</TD>
<TD><FONT FACE='arial' Size='1'>Brief Desc:</FONT><br/><asp:textbox name='desc' id='desc' size='10' maxlength='12' runat="server" style="border:solid 1 gray; font-size:12px;"/>&nbsp;</TD>
<TD valign="bottom" align="right">
<asp:button id="btnRefresh" Runat="server" size="30" OnCLick="AddFile" Text="Add Template" style="cursor: hand; color:#353895; font-weight:bold; font-size:12px; font-family:arial; background-color:gainsboro; border: .5px solid gray; text-decoration:none; vertical-align: middle; width:110;"/></TD>
</TR>
<TR>
<td colspan="2" align='left' valign='top'>
<FONT FACE='arial' Size='1'>
<asp:requiredFieldValidator
	ErrorMessage="* need date"
	ControlToValidate="ddate"
	runat="server"/></FONT></td>
<td align='left' valign='top'>
<FONT FACE='arial' Size='1'>
<asp:requiredFieldValidator
	ErrorMessage="* Select mail type"
	ControlToValidate="mailType"
	runat="server"/></FONT></td>
<td align='left' valign='top'></td>
<td align='left' valign='top'>
<FONT FACE='arial' Size='1'>
<asp:requiredFieldValidator
	ErrorMessage="* description"
	ControlToValidate="desc"
	runat="server"/></FONT></td>
<td align='left' valign='top'></td>
</TR>
<tr><td colspan="6">
<div id="calShow">
<asp:Calendar id=Calendar1 onselectionchanged="Date_Selected" runat="server" 
	Font-Name="Arial" Font-Size="12px"
    Height="180px" Width="200px"
    SelectorStyle-BackColor="gainsboro"
    TodayDayStyle-BackColor="gainsboro"
    DayHeaderStyle-BackColor="gainsboro"
    OtherMonthDayStyle-ForeColor="gray"
    TitleStyle-BackColor="gray"
    TitleStyle-Font-Bold="True"
    TitleStyle-Font-Size="12px"
    SelectedDayStyle-BackColor="#353895"
    SelectedDayStyle-Font-Bold="True"/>
</div>
</td></tr>
</TABLE>
</FORM>
</BODY>
</HTML>