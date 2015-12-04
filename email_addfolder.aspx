<%@Page Language="VB" Debug="True" %>
<%@Import Namespace="System.XML" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="System.DateTime" %>

<SCRIPT LANGUAGE="vb" Runat="server">
Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	dim filePath as String = Request.QueryString("folder")
	viewQS.Text = BreadCrumb(filePath)
	btnRefresh.Attributes.Add("onClick", "parent.menu.location.reload();")
End Sub

Private Sub Add(ByVal sender As System.Object, ByVal e As System.EventArgs)
dim filePath as String = Request.QueryString("folder")
	If Page.IsValid then
		Dim nd as New DirectoryInfo("c:\Inetpub\wwwroot" & filePath & "\" & ddate.text)
		If nd.exists = false
			nd.Create()	
			response.write("Folder <b>"& ddate.text &"</b> has been created")
			response.end
		Else
			response.write("Folder already exists. Choose another")
			response.end
		End If	
	End If
End Sub

function BreadCrumb(path)
	dim filePath as String = Request.QueryString("folder")
	BreadCrumb = Replace(filePath, "\", " -> ")
end function

Sub Date_Selected(sender As Object, e As EventArgs)
	dim filePath as String = Request.QueryString("folder")
	dim newDate as Date = Calendar1.SelectedDate
	dim MONTH as String = newDate.Month
	dim DAY as String = newDate.Day
	dim YEAR as String = newDate.Year

        Select Case filePath
            
            Case "\email\FLEX_MAIL"
                filePath = "_flex_email_docs"
            Case "\email\TRAVELRIGHT_MAIL"
                filePath = "_travel_right_docs"
            Case "\email\FARESALE_MAIL"
                filePath = "_fare_sale_docs"
            Case "\email\DNL_MAIL"
                filePath = "_dnl_email_docs"
            Case "\email\PMI_MAIL"
                filePath = "_pmi_email_docs"
            Case "\email\ELITE_MAIL"
                filePath = "_elite_email_docs"
        End Select
	
	If Val(MONTH) < 10 Then 
		MONTH = "0" + Trim(MONTH)
	End If
	If Val(DAY) < 10 Then 
		DAY = "0" + Trim(DAY)
		dim concatDate As String = MONTH + "_" + DAY
		ddate.Text = concatDate + filePath
	Else
		ddate.Text = MONTH + "_" + DAY + filePath
	End If	
End Sub
</SCRIPT>

<HTML>
<head>
	<script type="text/javascript" src="../includes/calendar.js"></script>
</head>
<BODY>
<asp:label id="viewQS" runat="server" style="font-family: verdana; font-size: 10; color: #000000;" /><br/><br/>
<FORM METHOD="post" name="frmPerson" id="frmPerson" Runat="server">
<TABLE cellpadding="0" cellspacing="0" border="0">
<tr>
<td></td>
<td colspan="2" align="left">
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
    SelectedDayStyle-Font-Bold="True"/></td>
</tr>
<TR>
<TD valign='middle'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
<TD valign='top'><asp:textbox style="border:solid 1 gray; font-size:12px; width:200px;" name='ddate' id='ddate' size='25' runat="server" readonly />&nbsp;</TD>
<td><asp:button id="btnRefresh" Runat="server" size="30" OnCLick="Add" Text="Add Folder" style="cursor: hand; color:#353895; font-weight:bold; font-size:12px; font-family:arial; background-color:gainsboro; border: .5px solid gray; text-decoration:none; vertical-align: middle; width:90;"/></TD>
</TR>
<TR>
<td></td>
<TD colspan="2" align='left' valign='bottom'>
<FONT FACE='arial' Size='2'>
<asp:requiredFieldValidator
	ErrorMessage="* Folder name is required"
	ControlToValidate="ddate"
	runat="server"/>
</TD>
</TR>
</TABLE>
</FORM>
</BODY>
</HTML>