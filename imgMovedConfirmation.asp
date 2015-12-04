<html>
<body>
<table cellpadding="0" cellspacing="0" border="0" style="table.border {border: 1px solid #778;}">
<tr>
	<td valign="top">
	<%
		dim rootPath, path, destPath
		rootPath = "C:\Inetpub\wwwroot\email\temp_images\"
		dim fs, folder
		set fs = CreateObject("Scripting.FileSystemObject")
		set folder = fs.GetFolder(rootPath)
	
		for each item in folder.Files
	 		item.Copy "C:\Inetpub\wwwroot\email\temp_images\live_images\", True
		Next
		'for each item in folder.Files
	 	'	item.Copy "\\labdaily01\media_hf\media_us\graphics\mail", True 
		'Next
		for each item in folder.Files
	 		item.Delete 
		Next
		set fs = nothing
	%>
		<b>Complete!</b><br><br>
		<a href="http://propagator/PropPage.aspx?share=media_hf" target="_blank">Go straight to Propagator to push them Live</a>
	</td>
</tr>
</table>
</body>
</html>
