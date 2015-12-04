<html>
<head>
<title>TeMP:  Template eMail Previewer</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<script type="text/javascript" src="../includes/tabber.js"></script>
	<script type="text/javascript" src="../includes/collapser.js"></script>
	<link rel=stylesheet type="text/css" href="../includes/temp_style.css" />
</head>		
<body bgcolor="#FFFFFF" style="margin:0px 0px 0px 5px">
		<% 
			'To add folder directory to the nav here
			dim cm_folder, cruises_folder, fs_folder, fs_folder_01, fs_folder_02, tr_folder, crm_folder, dnl_folder, mr_folder, mr_folder_01, elite_folder, cm_mail, tr_mail, fs_mail, fs_mail1, fs_mail2, crm_mail, cruises_mail, dnl_mail, mr_mail, mr_mail_01, elite_mail
			cm_folder = "\email\CUSTOM_MAIL"
			cruises_folder = "\email\CRUISES_MAIL"
			tr_folder = "\email\TRAVELRIGHT_MAIL"
			crm_folder = "\email\CRM_MAIL"
			fs_folder = "\email\FARESALE_MAIL"
			fs_folder_01 = "\email\FARESALE_MAIL_01"
			fs_folder_02 = "\email\FARESALE_MAIL_02"
			dnl_folder = "\email\DNL_MAIL"
			mr_folder = "\email\FLEX_MAIL"
			mr_folder_01 = "\email\PMI_MAIL"
			elite_folder = "\email\ELITE_MAIL"
			'trigger and display the new for the template setup form
			cm_mail = Right(cm_folder, 11)
			cruises_mail = Right(cruises_folder, 12)
			tr_mail = Right(tr_folder, 16)
			crm_mail = Right(crm_folder, 8)
			fs_mail = Right(fs_folder, 13)
			fs_mail1 = Right(fs_folder_01, 16)
			fs_mail2 = Right(fs_folder_02, 16)
			dnl_mail = Right(dnl_folder, 8)
			mr_mail = Right(mr_folder, 9)
			mr_mail_01 = Right(mr_folder_01, 8)
			elite_mail = Right(elite_folder, 10)
		%>
	
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" width="300">
	<tr>
		<td><a href="http://ctoohey02/email/previewer/default.html" target="_top"><img 
src="../images/temp_logo.gif" width="300" height="75" border="0" alt="TeMP:Template eMail Previewer"></a></td></tr><tr><td width="300">
			<form style="margin: 0; padding: 0;" action="../../advancedsearch.asp" target="main" method="get">
			<input style="border:solid 1 #353895; font-size:12px" size="30" type="text" name="query"/>
			<input type="submit" value="Search" ID="Submit1" NAME="Submit1" style="cursor: hand; color:#353895; font-weight:bold; font-size:12px; font-family:arial; background-color:#e6e5f2; border: .5px solid #353895; text-decoration:none; vertical-align: middle; width:100;"/></form>
		</td>
	</tr>
	<tr>
		<td align="left">
		<div class="tabber">
			<div class="tabbertab" title="Daily/FS">
				<% ListFolderContents(Server.MapPath(mr_folder)) %><a href="email_addfolder.aspx?folder=<%=mr_folder%>" target="main" style="position:absolute; left:100px; top:140px;"><img 
src="../images/add_sign.gif" width="7" height="7" border="0" alt="Add Folder"></a>					
			</div>
			<div class="tabbertab" title="ELITE">
				<% ListFolderContents(Server.MapPath(elite_folder)) %><a href="email_addfolder.aspx?folder=<%=elite_folder%>" target="main" style="position:absolute; left:110px; top:140px;"><img 
src="../images/add_sign.gif" width="7" height="7" border="0" alt="Add Folder"></a>		
			</div>
			<div class="tabbertab" title="TR"> 
				<% ListFolderContents(Server.MapPath(tr_folder)) %><a href="email_addfolder.aspx?folder=<%=tr_folder%>" target="main" style="position:absolute; left:152px; top:140px;"><img 
src="../images/add_sign.gif" width="7" height="7" border="0" alt="Add Folder"></a>
			</div>
			<div class="tabbertab" title="DNL">
				<% ListFolderContents(Server.MapPath(dnl_folder)) %><a href="email_addfolder.aspx?folder=<%=dnl_folder%>" target="main" style="position:absolute; left:132px; top:140px;"><img 
src="../images/add_sign.gif" width="7" height="7" border="0" alt="Add Folder"></a>
			</div>
		</div>
		<div class="tabber">
			<div class="tabbertab" title="CM">				
				<table align="right" width="75" cellpadding="3" cellspacing="0" border="0">
				<tr>
					<td align="center" style="font-family: verdana; font-size: 11; font-weight: bold; color: #353895; border-bottom: 1px dotted #000000; border-left: 1px dotted #000000;">Archive</td>
				</tr>
				</table>								
				<% ListFolderContents(Server.MapPath(cm_folder)) %>
			</div>
			<div class="tabbertab" title="Daily">
			    <table align="right" width="75" cellpadding="3" cellspacing="0" border="0">
				<tr>
					<td align="center" style="font-family: verdana; font-size: 11; font-weight: bold; color: #353895; border-bottom: 1px dotted #000000; border-left: 1px dotted #000000;">Archive</td>
				</tr>
				</table>
				<% ListFolderContents(Server.MapPath(mr_folder_01)) %>		
			</div>
			<div class="tabbertab" title="Cruise">
				<table align="right" width="75" cellpadding="3" cellspacing="0" border="0">
				<tr>
					<td align="center" style="font-family: verdana; font-size: 11; font-weight: bold; color: #353895; border-bottom: 1px dotted #000000; border-left: 1px dotted #000000;">Archive</td>
				</tr>
				</table>								
				<% ListFolderContents(Server.MapPath(cruises_folder)) %>
			</div>
			<div class="tabbertab" title="CRM">
				<table align="right" width="75" cellpadding="3" cellspacing="0" border="0">
				<tr>
					<td align="center" style="font-family: verdana; font-size: 11; font-weight: bold; color: #353895; border-bottom: 1px dotted #000000; border-left: 1px dotted #000000;">Archive</td>
				</tr>
				</table>
				<% ListFolderContents(Server.MapPath(crm_folder)) %>
			</div>
			<div class="tabbertab" title="FS">
				<table align="right" width="75" cellpadding="3" cellspacing="0" border="0">
				<tr>
					<td align="center" style="font-family: verdana; font-size: 11; font-weight: bold; color: #353895; border-bottom: 1px dotted #000000; border-left: 1px dotted #000000;">Archive</td>
				</tr>
				</table>
				<% 
				    ListFolderContents(Server.MapPath(fs_folder)) 
				    ListFolderContents(Server.MapPath(fs_folder_01)) 
				    ListFolderContents(Server.MapPath(fs_folder_02))
				%>
			</div>
		</div>
		<%
		sub ListFolderContents(path)
			dim fs, folder, fsFolder, file, item, url, custom, strSplit

			set fs = CreateObject("Scripting.FileSystemObject")
			set folder = fs.GetFolder(path)
			
			strSplit = Split(folder.path, "\")
            UBound(strSplit)
            If UBound(strSplit) > 1 Then 
            fsFolder = strSplit(Ubound(strSplit) - 1) &"-"& folder.Name         
		    %>
		        <ul style="margin:0 0 0 3;" id="nav">
	
		        <li><a href="javascript:expand('<%= fsFolder %>')"><img src="../images/closed.gif" border="0" align="absmiddle" id="<%= fsFolder %>_Img" alt="<% 
		        if folder.SubFolders.Count = 1 then Response.Write(folder.SubFolders.Count & " directory") end if 
		        if folder.SubFolders.Count > 1 then Response.Write(folder.SubFolders.Count & " directories") end if
		        if folder.Files.Count = 1 then Response.Write(folder.Files.Count & " mail") end if
		        if folder.Files.Count > 1 then Response.Write(folder.Files.Count & " mails") end if %>">&nbsp;<%= folder.Name %></a>
		    <div class="collapse" id="<%= fsFolder %>">			
		    <% 
		    End If
			'Display a list of sub folders.					
			for each item in folder.SubFolders
			Select Case folder.Name
				Case "FLEX_MAIL" %>
					<table style="margin:0 0 0 0;"><tr><td style="margin:0 0 0 0;" valign="top"><% ListFolderContents(item.Path)%> </td><td style="margin:0 0 0 0;" valign="top"><a href="email_addtemplate.aspx?folder=<%=item.Path%>" target="main"><img 
src="../images/add_sign.gif" width="7" height="7" border="0" alt="Add Template"></a></td></tr></table>
                <% Case "ELITE_MAIL" %>
					<table style="margin:0 0 0 0;"><tr><td style="margin:0 0 0 0;" valign="top"><% ListFolderContents(item.Path)%> </td><td style="margin:0 0 0 0;" valign="top"><a href="email_addtemplate.aspx?folder=<%=item.Path%>" target="main"><img 
src="../images/add_sign.gif" width="7" height="7" border="0" alt="Add Template"></a></td></tr></table>
				<% Case "TRAVELRIGHT_MAIL" %>
					<table style="margin:0 0 0 0;"><tr><td style="margin:0 0 0 0;" valign="top"><% ListFolderContents(item.Path)%> </td><td style="margin:0 0 0 0;" valign="top"><a href="email_addtemplate.aspx?folder=<%=item.Path%>" target="main"><img 
src="../images/add_sign.gif" width="7" height="7" border="0" alt="Add Template"></a></td></tr></table>
				<% Case "DNL_MAIL" %>
					<table style="margin:0 0 0 0;"><tr><td style="margin:0 0 0 0;" valign="top"><% ListFolderContents(item.Path)%> </td><td style="margin:0 0 0 0;" valign="top"><a href="email_addtemplate.aspx?folder=<%=item.Path%>" target="main"><img 
src="../images/add_sign.gif" width="7" height="7" border="0" alt="Add Template"></a></td></tr></table>
	
				<% Case Else
				ListFolderContents(item.Path)
				End Select
			next
			'Display a list of files.
			for each item in folder.Files
		%>
			<div id="item"><a href="render2.asp?filePath=<%=item.path%>&folder=<%=folder.Name%>" target="main"><img src="../images/bullet.gif" border="0" align="absmiddle">&nbsp;<%=Left(item.Name, Len(item.Name) - Len(".xml"))%><font color="#000000" style="font-weight:normal;"><br>Last saved: <%=item.DateLastModified %></font></a></div>
		<% next %>
		</div>
		</li></ul><% end sub %></td>
	</tr>
	<tr>
		<td colspan="2" height="5"></td>
	</tr>
	<tr>
		<td>
		<table width="300" cellpadding="1" cellspacing="0" border="0">
		<tr>
			<td bgcolor="#353895">
				<table width="300" cellpadding="3" cellspacing="0" border="0" bgcolor="#e6e5f2">
				<tr>
					<td colspan="3" style="font-family: verdana; font-size: 11; color: #000000;">Email Campaign & Omniture naming convention</td>
				</tr>
				<tr>
					<td colspan="3" style="font-family: verdana; font-size: 10; color: #000000;"><b>Custom Mail Group:</b></td>
				</tr>
				<tr>
					<td style="font-family: verdana; font-size: 10; color: #000000;">&nbsp;&nbsp;PMI</td><td style="font-family: verdana; font-size: 10; color: #000000;">CM_P_01_xxx</td><td style="font-family: verdana; font-size: 10;"><a href="http://ctoohey02/email/previewer/master_template.xsn" style="color: #cc0000;">new</a></td>
				</tr>
				<tr>
					<td style="font-family: verdana; font-size: 10; color: #000000;">&nbsp;&nbsp;Coupon</td><td style="font-family: verdana; font-size: 10; color: #000000;">CM_CP_01_xxx</td><td style="font-family: verdana; font-size: 10;"><a href="http://ctoohey02/email/previewer/master_template.xsn" style="color: #cc0000;">new</a></td>
				</tr>
				<tr>
					<td style="font-family: verdana; font-size: 10; color: #000000;">&nbsp;&nbsp;Cruise</td><td style="font-family: verdana; font-size: 10; color: #000000;">CM_CZ_01_xxx</td><td style="font-family: verdana; font-size: 10;"><a href="http://ctoohey02/email/previewer/master_template.xsn" style="color: #cc0000;">new</a></td>
				</tr>
				<tr>
					<td style="font-family: verdana; font-size: 10; color: #000000;">&nbsp;&nbsp;FareSale</td><td style="font-family: verdana; font-size: 10; color: #000000;">CM_FS_01_xxx</td><td style="font-family: verdana; font-size: 10;"><a href="http://ctoohey02/email/previewer/FareSale_Mail_template.xsn" style="color: #cc0000;">new</a></td>
				</tr>
				<tr>
					<td style="font-family: verdana; font-size: 10; color: #000000;">&nbsp;&nbsp;Merchandising</td><td style="font-family: verdana; font-size: 10; color: #000000;">CM_M_01_xxx</td><td style="font-family: verdana; font-size: 10;"><a href="http://ctoohey02/email/previewer/master_template.xsn" style="color: #cc0000;">new</a></td>
				</tr>
				<tr>
					<td style="font-family: verdana; font-size: 10; color: #000000;">&nbsp;&nbsp;Other</td><td style="font-family: verdana; font-size: 10; color: #000000;">CM_O_01_xxx</td><td style="font-family: verdana; font-size: 10;"><a href="http://ctoohey02/email/previewer/master_template.xsn" style="color: #cc0000;">new</a></td>
				</tr>
				<tr>
					<td colspan="3" style="font-family: verdana; font-size: 10; color: #000000;"><b>Mass Mail Group:</b></td>
				</tr>
				<tr>
					<td style="font-family: verdana; font-size: 10; color: #000000;">&nbsp;&nbsp;Travel Right</td><td style="font-family: verdana; font-size: 10; color: #000000;">MMN_TR_04_xxx</td><td style="font-family: verdana; font-size: 10;"><a href="http://ctoohey02/email/previewer/Travel_Right_Mail_template_pub.xsn" style="color: #cc0000;">new</a></td>
				</tr>
				<tr>
					<td style="font-family: verdana; font-size: 10; color: #000000;">&nbsp;&nbsp;Non-Segmented</td><td style="font-family: verdana; font-size: 10; color: #000000;">MMN_PE_01_xxx</td><td style="font-family: verdana; font-size: 10;"><a href="http://ctoohey02/email/previewer/master_template.xsn" style="color: #cc0000;">new</a></td>
				</tr>
				<tr>
					<td style="font-family: verdana; font-size: 10; color: #000000;">&nbsp;&nbsp;Deals Newsletter</td><td style="font-family: verdana; font-size: 10; color: #000000;">CM_M_01_xxx</td><td style="font-family: verdana; font-size: 10;"><a href="http://ctoohey02/email/previewer/deals_template.xsn" style="color: #cc0000;">new</a></td>
				</tr>
				<tr>
					<td colspan="3" style="font-family: verdana; font-size: 10; color: #000000;"><b>CRM Group:</b></td>
				</tr>
				<tr>
					<td style="font-family: verdana; font-size: 10; color: #000000;">&nbsp;&nbsp;Elite/Service</td><td style="font-family: verdana; font-size: 10; color: #000000;">CRM_R_01_xxx</td><td style="font-family: verdana; font-size: 10;"><a href="http://ctoohey02/email/previewer/master_template.xsn" style="color: #cc0000;">new</a></td>
				</tr>
				<tr>
					<td style="font-family: verdana; font-size: 10; color: #000000;">&nbsp;&nbsp;Segmented</td><td style="font-family: verdana; font-size: 10; color: #000000;">CRM_PE_01_xxx</td><td style="font-family: verdana; font-size: 10;"><a href="http://ctoohey02/email/previewer/master_template.xsn" style="color: #cc0000;">new</a></td>
				</tr>
				<tr>
					<td colspan="3" style="font-family: verdana; font-size: 10;"><a href="\\Bel-pfs-01\marketing\PCC-Root\Mailings\US_Mailing_Calendar.xls" target="_blank" style="color: #448"><b>EMC campaign issue ids</b></a> (.xls format)</td>
				</tr>
				<tr>
					<td colspan="3" style="font-family: verdana; font-size: 10;"><a href="http://expediashares/sites/ENA/MROps/ECS/Lists/Email%20Archive/temp_view.aspx" target="_blank" style="color: #448"><b>ECS eMail Archive</b></a></td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
		
		</td>
	</tr>
	</table>
</body>	
</html>