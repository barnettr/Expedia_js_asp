	<html>
	<head>
	<script language="JavaScript" type="text/javascript">
		//IFrame auto height trix
		function autofitIframe(idName){
			var idTemp = idName;
			if (!window.opera && !document.mimeType && document.all && document.getElementById){
				document.getElementById(idTemp).style.height=document.body.offsetHeight+"px";
			}
			else if(document.getElementById) {
				document.getElementById(idTemp).style.height=document.body.scrollHeight+"px";
			}
		} 
	</script>
	</head>
	<body onload="autofitIframe('imgFRM')">
	<%
	
	dim rootPath, path
	'path = Upload.Files(1).Path
	rootPath = "C:\Inetpub\wwwroot\email\temp_images\"
	dim fs, folder
	set fs = CreateObject("Scripting.FileSystemObject")
	set folder = fs.GetFolder(rootPath)
	%>
	<b>Upload Images</b><br>
	The following images are ready to be propped Live:
	<form method="GET" name="" action="imgMovedConfirmation.asp">
	<input type="hidden" name="FILE1">
	<input type="submit" value="Prop Live">
	<ol>
		<% for each item in folder.Files %>
		<li style="FONT-SIZE:10pt; FONT-FAMILY:Arial;">
		<%=item.Name%><br><img src="<%=rootPath%><%=item.Name%>" border="0" align="absMiddle"></li><br><br>
		<% Next %>
	</ol>
	</form>	
	</body>
	</html>

