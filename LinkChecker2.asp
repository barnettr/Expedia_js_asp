<%@ LANGUAGE="VBScript"%>
<% 
    '//////////////////////////////////////////////////////
    '// Link Checker Application for the ECS email group //
    '//////////////////////////////////////////////////////
	Option Explicit
	Response.Buffer = True
    Response.ExpiresAbsolute = Now() - 1
    Response.Expires = 0
    Response.CacheControl = "no-cache"
	
	Dim strHTML, linkURL, fileName, newLinkPath
	linkURL = Request.Querystring("Path")
	newLinkPath = LEFT(linkURL, INSTR(linkURL, "docs")+4)
	fileName = RIGHT(linkURL,INSTR(linkURL, "docs/")-1)
	
	Function loadXMLFile(strXMLFile, strXSLFile)
	Dim objXML, objXSL 
	
		Set objXML = Server.CreateObject("Microsoft.XMLDOM")
	
		objXML.async = False
		objXML.load(strXMLFile)
	
		Set objXSL = Server.CreateObject("Microsoft.XMLDOM")
	
		objXSL.async = False
		objXSL.load(strXSLFile)
		
		strHTML = objXML.transformNode(objXSL)
	
	End Function
	
	function MapURL(path)
		dim rootPath, url
		rootPath = Server.MapPath("/")
		url = Right(path, Len(path) - Len(rootPath))
		MapURL = Replace(url, "\", "/")
		'response.Write(path)
	end function
	
	If INSTR(linkURL, "TRAVELRIGHT") > 0 Then
	    loadXMLFile Server.MapPath(linkURL), Server.MapPath("tr_template.xslt")
	End If
	If INSTR(linkURL, "FARESALE_MAIL") > 0 Then
	    loadXMLFile Server.MapPath(linkURL), Server.MapPath("fs_template.xslt")
	End If
	If INSTR(linkURL, "FLEX_MAIL") > 0 Then
	    loadXMLFile Server.MapPath(linkURL), Server.MapPath("hybrid_template.xslt")
	End If

%> 
<html>
	<head>
	<title>Link Checker</title>
	<style type="text/css">
		.alt { background-color:#efefef; }
	</style>
	<script language="javascript" type="text/javascript">
	var sHTML = "";
	var xmlDoc = "";
	var v_foundlinkarray =  new Array();
	var v_foundlinkerror = new Array();
	var v_totallinks = new Array();
	var k = 0;
	function getErrorLinks()
	{
		
		var j = 0;
		var h = 0;
		var strLink = " ";
		var strTotal = "<br>";
		
		// ////////////////////////////////////////////////////////////////////////
		// Explaination of the RegEx below - It bears explaination because it is CPU expensive:
		//zero-width negative lookahead
        //  . (any character)
        //  * (zero or more times) (non-greedy)
        //  Capture
        //    .gif
        //        or
        //    .jpg
        //        or
        //    media.expedia.com
        //        or
        //    schemas.microsoft.com
        //        or
        //    www.w3.org
        //        or
        //    ads.expedia.com
        //        or
        //    expediamail.com
        //  End Capture
        //End Capture
        //Capture
        //  http
        //    or
        //  https
        //End Capture
        //://
        //Any character not in "\"|>"
        //+ (one or more times)
		// ////////////////////////////////////////////////////////////////////////
		
		sHTML = document.getElementById("HTML").value;
		all_links = sHTML.match(/(?!.*?(\.gif|\.jpg|media\.expedia\.com|schemas\.microsoft\.com|www\.w3\.org|ads\.expedia\.com|expediamail\.com))(http|https)\:\/\/[^\"|>]+/g);
		//all_links = sHTML.match(/http\:\/\/(?![^\(x22\)|>]*?(\.(gif|jpg)|media\.expedia\.com|schemas\.microsoft\.com|www\.w3\.org))[^\(x22\)|>]+/)
		setTimeout('document.getElementById("inprogress_img").style.cssText = "display:none;"', 800);
		//document.getElementById("inprogress_img").style.cssText = "display:none;";
		
		// ////////////////////////////////////////////////////////////
		// The Regular Expressions below are the logic to identify the 
		// link anomalies and other unwanted characteristics 
		// in URL's in the email that is currently being viewed                                                              
		///////////////////////////////////////////////////////////////
		
		var rg = /\?\?/g;
		//var rg1 = /\?\&/g;
		var rg2 = /\[\+GET\_LINK\_CONST\(\'OMNITURE\_VAR\'\)\+\]\&\[\+GET\_LINK\_CONST\(\'OMNITURE\_VAR\'\)\+\]/;
		var rg3 = /CCheck\=1\&/g;
		var rg4 = /\&\&/g;
		var rg5 = /mcicid/g;
		var rg7 = /\s/g;
		var rg9 = /(rfrr\=\d\d\d|rfrr\=\d\d\d\d|rfrr\=\d\d\d\d\d|rfrr\=\d\d\d\d\d\d)/g;
		//var rg9 = /rfrr\=[\d{1,9}]/g;
		//var rg9 = /rfrr\=/g;
		
		
		// //////////////////////////////////////////////////////////////////////
		// Begin iteratation through all the elements in 
		// the all_links array and apply the test method of all RegEx's to each one.  
		// Any element for which the test returns true will 
		// be copied to the foundlink array and the foundlinkerror array
		/////////////////////////////////////////////////////////////////////////
		
		
		for (var i = 0; i < all_links.length; i++)
		{
			 v_totallinks[h] = all_links[i];
			 h++;
			if (rg.test(all_links[i]) || rg2.test(all_links[i]) || rg3.test(all_links[i]) || rg4.test(all_links[i]) || rg5.test(all_links[i]) || rg7.test(all_links[i]) || rg9.test(all_links[i]))
			{
				v_foundlinkarray[j] = all_links[i];
				v_foundlinkerror[j] = all_links[i].match(rg) || all_links[i].match(rg2) || all_links[i].match(rg3) || all_links[i].match(rg4) || all_links[i].match(rg5) || all_links[i].match(rg7) || all_links[i].match(rg9);
				if (all_links[i].match(rg))
				{
				    var dblQuestionMarks = "<font color=red><b>Error: double question marks</b></font>";
				}
				if (all_links[i].match(rg2))
				{
				    var dblOmniture = "<font color=red><b>Error: dblOmniture embedded in URL string</b></font>";
				}
				if (all_links[i].match(rg3))
				{
				    var Check1 = "<font color=red><b>Error: CCheck=1& embedded in URL string</b></font>";
				}
				if (all_links[i].match(rg4))
				{
				    var dblAmpersand = "<font color=red><b>Error: double ampersand</b></font>";
				}
				if (all_links[i].match(rg5))
				{
				    var mcicid = "<font color=red><b>Error: mcicid found in URL</b></font>";
				}
				if (all_links[i].match(rg7))
				{
				    var space = "<font color=red><b>Error: white space found in URL</b></font>";
				}
				if (all_links[i].match(rg9))
				{
				    var rfrr = "<font color=red><b>Error: rfrr=XXXX found in URL</b></font>";
				}
				j++;
			}
		}
		if (v_foundlinkarray.length == 0)
		{
		    document.getElementById("no_Error").style.cssText = "display:inline;";
		    document.getElementById("no_Error").innerHTML = "<br /><font color=green><b>No Broken Links were found in this email</b></font>";
		}
		else
		{
		    for (k = 0; k < v_foundlinkarray.length; k++)
		    {
			    document.getElementById("Errors").style.cssText = "display:inline;";
			    document.getElementById("Errors").innerHTML = "<br /><font color=red><b>" + (k+1) + " Broken Link(s) on this page:</b></font><br /><br />";
			    if (v_foundlinkarray[k])
			    {
				    document.getElementById("Error"+k).style.cssText = "display:inline;";
				    document.getElementById("Error"+k).innerHTML = "<font color=red>" + k + " - <b style='color:#002157;'>[" + v_foundlinkerror[k] + "]</b> " + v_foundlinkarray[k] + "</font><br />";
				    if (dblQuestionMarks)
				    {
				        document.getElementById("Error"+k).innerHTML += dblQuestionMarks+"<br />";
				    }
				    if (dblOmniture)
				    {
				        document.getElementById("Error"+k).innerHTML += dblOmniture+"<br />";
				    }
				    if (Check1)
				    {
				        document.getElementById("Error"+k).innerHTML += Check1+"<br />";
				    }
				    if (dblAmpersand)
				    {
				        document.getElementById("Error"+k).innerHTML += dblAmpersand+"<br />";
				    }
				    if (mcicid)
				    {
				        document.getElementById("Error"+k).innerHTML += mcicid+"<br />";
				    }
				    if (space)
				    {
				        document.getElementById("Error"+k).innerHTML += space+"<br />";
				    }
				    if (rfrr)
				    {
				        document.getElementById("Error"+k).innerHTML += rfrr+"<br />";
				    }
			    }
			    document.getElementById("End").style.cssText = "display:inline;";
			    document.getElementById("End").innerHTML = "<br /><br />";
		    }
		}
		for (var n = 0; n < v_totallinks.length; n++)
		{
			if (n % 2 == 0)
			{
				strTotal += "<span class='alt'><font color=green>" + n + " " + v_totallinks[n] + "</font></span><br />";
			}
			else
			{
				strTotal += "<span><font color=green>" + n + " " + v_totallinks[n] + "</font></span><br />";
			}
			document.all.totalvals.style.cssText = "display:block;";
			document.all.totalvals.innerHTML = strTotal;
			
		}
	}
	//window.onload = getErrorLinks;
	//window.onload = setTimeout("getErrorLinks()", 700);
	</script>
	</head>

	<body style="font:normal 0.8em/130%; font-family: verdana, Arial, sans-serif;">

			<p align="left" style="display:block; color:#336699; font-weight:bold;" id="inprogress_img">
                <img src="i_animated_loading_32_2.gif"><br />
                Please wait while URL links are being processed . . .
            </p>
			<span id="Errors" style="display:none;"></span>
			<div id="Error0" style="display:none;"></div>
			<div id="Error1" style="display:none;"></div>
			<div id="Error2" style="display:none;"></div>
			<div id="Error3" style="display:none;"></div>
			<div id="Error4" style="display:none;"></div>
			<div id="Error5" style="display:none;"></div>
			<div id="Error6" style="display:none;"></div>
			<div id="Error7" style="display:none;"></div>
			<div id="Error8" style="display:none;"></div>
			<div id="Error9" style="display:none;"></div>
			<div id="Error10" style="display:none;"></div>
			<div id="Error11" style="display:none;"></div>
			<div id="Error12" style="display:none;"></div>
			<div id="Error13" style="display:none;"></div>
			<div id="Error14" style="display:none;"></div>
			<div id="Error15" style="display:none;"></div>
			<div id="Error16" style="display:none;"></div>
			<div id="Error17" style="display:none;"></div>
			<div id="Error18" style="display:none;"></div>
			<div id="Error19" style="display:none;"></div>
			<div id="Error20" style="display:none;"></div>
			<div id="Error21" style="display:none;"></div>
			<div id="Error22" style="display:none;"></div>
            <div id="Error23" style="display:none;"></div>
            <div id="Error24" style="display:none;"></div>
            <div id="Error25" style="display:none;"></div>
            <div id="Error26" style="display:none;"></div>
            <div id="no_Error" style="display:none;"></div>
			<div id="totalvals" style="display:none;">
			<pre>
			</pre>
			</div>
			<span id="End" style="display:none;"></span>
			<table border="0" bgcolor="#FFFFFF">
				<tr>
					<td align="left" style="font-family: verdana; font-size: 11; color: #000000;">
						<form method="GET" name="" action="">
						<TEXTAREA cols="95" rows="35" id="HTML" style="display:none;"><%= strHTML %></TEXTAREA>	
						</form>
					</td>
				</tr>
			</table>
			

	</body>
</html> 