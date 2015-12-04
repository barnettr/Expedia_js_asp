<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%  

Dim linkURL, strPosition, MyXMLFileName 

linkURL = Request.Querystring("Path")

If InStr(1,linkURL, "2006") <> 0 Then
    strPosition = InStr(1, linkURL, "2006", 1)
End If
If InStr(1,linkURL, "2007") <> 0 Then
    strPosition = InStr(1, linkURL, "2007", 1)
End If
If InStr(1,linkURL, "2008") <> 0 Then
    strPosition = InStr(1, linkURL, "2008", 1)
End If

'MyXMLFileName = Mid(linkURL, strPosition, 50)

'Response.Write ("<b>Email Name: = " & MyXMLFileName & "</b><br><br>")

%>
<html>
<head>
	<title>Travel Right - Text Extraction</title>
	<script language="JavaScript" type="text/javascript">

/* /////////////////////////////////////////////////////////////////
////	by Rob Barnett 04/30/2007 for Expedia                      //
////	for use in rendering text versions of XML formatted email //
//////////////////////////////////////////////////////////////////// */

var xmlDoc = "";
function loadXML()
{
	// code for IE
	if (window.ActiveXObject)
  	{
  		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
  		xmlDoc.async=false;
		xmlDoc.load("<%= linkURL %>")
		xmlObj = xmlDoc.documentElement;
		getEmailText();
  	}
	// code for Mozilla, Firefox, Opera, etc.
	else if (document.implementation && document.implementation.createDocument)
  	{
  		xmlDoc=document.implementation.createDocument("","",null);
  		xmlDoc.load("<%= linkURL %>");
  		xmlObj = xmlDoc.documentElement;
  		xmlDoc.onload = getEmailText;
  	}
	else
  	{
  		alert('Your browser cannot handle this script');
  	}
}

function getEmailText()
{
	// Issue ID
	if (xmlObj.tagName == "email")
	{
		var ID_a = xmlObj.getAttribute("type");
	}
	if (xmlObj.childNodes[0].tagName == "ID")
	{
		var ID_b = xmlObj.childNodes[0].getAttribute("issue");
	}
	
	// Constants
	var hotDealsForWeek = "----------------------------------------------------<br>Hot Deals For The Week:<br>----------------------------------------------------";
	var beginEyebrowModule = "<--*****************START 03_01Eyebrow Module*****************-->";
	var endEyebrowModule = "<--*****************END 03_01Eyebrow Module*****************-->";
	var beginMessageModule = "<--*****************START 03_03Message Module*****************-->";
	var endMessageModule = "<--*****************END 03_03Message Module*****************-->";
	var beginHotDealsModule = "<--*****************START 03_04HotDeals Module*****************-->";
	var endHotDealsModule = "<--*****************END 03_04HotDeals Module*****************-->";
	var sOMNITURE = "%%=OmnitureParams('')=%%";
	var specialRulesFinal = "CST# 2029030-40<br><br>(c)2007 Expedia, Inc. All rights reserved. Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.<br><br>(EMID: "+ID_a+""+ID_b+")(MD: %%=Format(Now()&#44; &#34;yyyyMMddhhmms&#34;)=%%)(EPID: %%sub_PAID%%)(ETID: %%jobid%%)";
	
	/* //////////////////////////////////////////////////////////////////////
	//	Variables extracted from the XML document nodes and their attributes:
	///////////////////////////////////////////////////////////////////////// */
	
	var nodes = xmlObj.childNodes;
	
	for (var a = 0; a < nodes.length; a++)
	{
		//alert(a+" = "+xmlObj.childNodes[a].tagName);
		if (nodes[a].tagName == "my:headerOffer")
		{
		    if (xmlObj.childNodes[a].getAttribute("my:state") == "no")
		    {
		    }
		    else
		    {
		        var myShortText = xmlObj.childNodes[a].getAttribute("my:shortText");
		        var myBlurb =  xmlObj.childNodes[a].getAttribute("my:blurb");
		        var myURL = xmlObj.childNodes[a].getAttribute("my:url");
		    }
		}
		if (nodes[a].tagName == "header")
		{
		    var Headline_One = xmlObj.childNodes[a].text;
		}
		if (nodes[a].tagName == "subHeader")
		{
		    var subHeadline_One = xmlObj.childNodes[a].text;
		}
		if (nodes[a].tagName == "my:message")
		{
		    //var myParagraphDeal = new Array();
		    var children = nodes[a].childNodes;
		    for (var x = 0; x < children.length; x++)
		    {
		        var chNodes = children[x];
		        if (x == 0)
		        {
		            if (chNodes.getAttribute("my:linktext") != "lorem ipsum")
		            {
		                var myDealLinkText = chNodes.getAttribute("my:linktext");
		                var myDealLink = chNodes.getAttribute("my:link");
		                var myDealBlurb = chNodes.text;
		            }
		        }
		        if (x == 1)
		        {
		            if (chNodes.tagName == "my:deal")
		            {
		                var myDealLinkText_One = chNodes.getAttribute("my:linktext");
		                var myDealLink_One = chNodes.getAttribute("my:link");
		                var myDealBlurb_One = chNodes.text;
		            }
		            if (chNodes.tagName == "my:paradeal" && chNodes.text != "lorem ipsum")
		            {
		                var myParagraphDeal_One = chNodes.text;
		                var myParagraphDeal_OneLink = myParagraphDeal_One.match(/http\:\/\/[^\"]+/g);
		            } 
		        }
		        if (x == 2)
		        {
		            if (chNodes.tagName == "my:deal")
		            {
		                var myDealLinkText_Two = chNodes.getAttribute("my:linktext");
		                var myDealLink_Two = chNodes.getAttribute("my:link");
		                var myDealBlurb_Two = chNodes.text;
		            }
		            if (chNodes.tagName == "my:paradeal")
		            {
		                var reg = /\<li\>/g;
		                var reg2 = /\<br\>/g;
		                var myParagraphDeal_Two = chNodes.text;
		                var myParagraphDeal_TwoLink = myParagraphDeal_Two.match(/http\:\/\/[^\"]+/g);
		            } 
		        }
		        if (x == 3)
		        {
		            if (chNodes.tagName == "my:deal")
		            {
		                var myDealLinkText_Three = chNodes.getAttribute("my:linktext");
		                var myDealLink_Three = chNodes.getAttribute("my:link");
		                var myDealBlurb_Three = chNodes.text;
		            }
		            if (chNodes.tagName == "my:paradeal")
		            {
		                var myParagraphDeal_Three = chNodes.text;
		                var myParagraphDeal_ThreeLink = myParagraphDeal_Three.match(/http\:\/\/[^\"]+/i);
		            } 
		        }
		        if (x == 4)
		        {
		            var myParagraphDeal_Four = chNodes.text;
		            var myParagraphDeal_FourLink = myParagraphDeal_Four.match(/http\:\/\/[^\"]+/i);
		        }
		    }
		}
		if (a == 10)
		{
		    //alert(nodes[a].tagName);
		    if (nodes[a].tagName == "deals")
		    {
                var dealsHeader_Alt = nodes[a].getAttribute("header");
                 
		        var e_children = nodes[a].childNodes;
		        for (var f = 0; f < e_children.length; f++)
		        {
		            var ee_Nodes = e_children[f];
		            if (f == 3)
		            {
		                var myLinkBlurb_AltOne = ee_Nodes.text;
		                var myLink_AltOne =  ee_Nodes.getAttribute("link");
		                var myLinkText_AltOne = ee_Nodes.getAttribute("linktext");
		            }
		            if (f == 4)
		            {
		                var myLinkBlurb_AltTwo = ee_Nodes.text;
		                var myLink_AltTwo =  ee_Nodes.getAttribute("link");
		                var myLinkText_AltTwo = ee_Nodes.getAttribute("linktext"); 
		            }
		            if (f == 5)
		            {
		                var myLinkBlurb_AltThree = ee_Nodes.text;
		                var myLink_AltThree =  ee_Nodes.getAttribute("link");
		                var myLinkText_AltThree = ee_Nodes.getAttribute("linktext"); 
		            }
		            if (f == 6)
		            {
		                var myLinkBlurb_AltFour = ee_Nodes.text;
		                var myLink_AltFour =  ee_Nodes.getAttribute("link");
		                var myLinkText_AltFour = ee_Nodes.getAttribute("linktext"); 
		            }
		        }
		    }
		}
		if (a == 11)
		{
		    //alert(nodes[a].tagName);
		    if (nodes[a].tagName == "deals")
		    {
                var dealsHeader_One = nodes[a].getAttribute("header");
                 
		        var a_children = nodes[a].childNodes;
		        for (var y = 0; y < a_children.length; y++)
		        {
		            var aa_Nodes = a_children[y];
		            if (y == 3)
		            {
		                var myLinkBlurb_One = aa_Nodes.text;
		                var myLink_One =  aa_Nodes.getAttribute("link");
		                var myLinkText_One = aa_Nodes.getAttribute("linktext");
		            }
		            if (y == 4)
		            {
		                var myLinkBlurb_Two = aa_Nodes.text;
		                var myLink_Two =  aa_Nodes.getAttribute("link");
		                var myLinkText_Two = aa_Nodes.getAttribute("linktext"); 
		            }
		            if (y == 5)
		            {
		                var myLinkBlurb_Three = aa_Nodes.text;
		                var myLink_Three =  aa_Nodes.getAttribute("link");
		                var myLinkText_Three = aa_Nodes.getAttribute("linktext"); 
		            }
		            if (y == 6)
		            {
		                var myLinkBlurb_Four = aa_Nodes.text;
		                var myLink_Four =  aa_Nodes.getAttribute("link");
		                var myLinkText_Four = aa_Nodes.getAttribute("linktext"); 
		            }
		        }
		    }
		}
		if (a == 12)
		{
		    //alert(nodes[a].tagName);
		    if (nodes[a].tagName == "deals")
		    {
                var dealsHeader_Two = nodes[a].getAttribute("header");
                 
		        var b_children = nodes[a].childNodes;
		        for (var z = 0; z < b_children.length; z++)
		        {
		            var bb_Nodes = b_children[z];
		            if (z == 3)
		            {
		                var myLinkBlurb_One_a = bb_Nodes.text;
		                var myLink_One_a =  bb_Nodes.getAttribute("link");
		                var myLinkText_One_a = bb_Nodes.getAttribute("linktext");
		            }
		            if (z == 4)
		            {
		                var myLinkBlurb_Two_a = bb_Nodes.text;
		                var myLink_Two_a =  bb_Nodes.getAttribute("link");
		                var myLinkText_Two_a = bb_Nodes.getAttribute("linktext"); 
		            }
		            if (z == 5)
		            {
		                var myLinkBlurb_Three_a = bb_Nodes.text;
		                var myLink_Three_a =  bb_Nodes.getAttribute("link");
		                var myLinkText_Three_a = bb_Nodes.getAttribute("linktext"); 
		            }
		            if (z == 6)
		            {
		                var myLinkBlurb_Four_a = bb_Nodes.text;
		                var myLink_Four_a =  bb_Nodes.getAttribute("link");
		                var myLinkText_Four_a = bb_Nodes.getAttribute("linktext"); 
		            }
		        }
		    }
		}
		if (a == 13)
		{
		    //alert(nodes[a].tagName);
		    if (nodes[a].tagName == "deals")
		    {
                var dealsHeader_Three = nodes[a].getAttribute("header");
                 
		        var c_children = nodes[a].childNodes;
		        for (var w = 0; w < c_children.length; w++)
		        {
		            var cc_Nodes = c_children[w];
		            if (w == 3)
		            {
		                var myLinkBlurb_One_b = cc_Nodes.text;
		                var myLink_One_b =  cc_Nodes.getAttribute("link");
		                var myLinkText_One_b = cc_Nodes.getAttribute("linktext");
		            }
		            if (w == 4)
		            {
		                var myLinkBlurb_Two_b = cc_Nodes.text;
		                var myLink_Two_b =  cc_Nodes.getAttribute("link");
		                var myLinkText_Two_b = cc_Nodes.getAttribute("linktext"); 
		            }
		            if (w == 5)
		            {
		                var myLinkBlurb_Three_b = cc_Nodes.text;
		                var myLink_Three_b =  cc_Nodes.getAttribute("link");
		                var myLinkText_Three_b = cc_Nodes.getAttribute("linktext"); 
		            }
		            if (w == 6)
		            {
		                var myLinkBlurb_Four_b = cc_Nodes.text;
		                var myLink_Four_b =  cc_Nodes.getAttribute("link");
		                var myLinkText_Four_b = cc_Nodes.getAttribute("linktext"); 
		            }
		        }
		    }
		}
		if (a == 14)
		{
		    //alert(nodes[a].tagName);
		    if (nodes[a].tagName == "deals")
		    {
                var dealsHeader_Four = nodes[a].getAttribute("header");
                 
		        var d_children = nodes[a].childNodes;
		        for (var t = 0; t < d_children.length; t++)
		        {
		            var dd_Nodes = d_children[t];
		            if (t == 3)
		            {
		                var myLinkBlurb_One_c = dd_Nodes.text;
		                var myLink_One_c =  dd_Nodes.getAttribute("link");
		                var myLinkText_One_c = dd_Nodes.getAttribute("linktext");
		            }
		            if (t == 4)
		            {
		                var myLinkBlurb_Two_c = dd_Nodes.text;
		                var myLink_Two_c =  dd_Nodes.getAttribute("link");
		                var myLinkText_Two_c = dd_Nodes.getAttribute("linktext"); 
		            }
		            if (t == 5)
		            {
		                var myLinkBlurb_Three_c = dd_Nodes.text;
		                var myLink_Three_c =  dd_Nodes.getAttribute("link");
		                var myLinkText_Three_c = dd_Nodes.getAttribute("linktext"); 
		            }
		            if (t == 6)
		            {
		                var myLinkBlurb_Four_c = dd_Nodes.text;
		                var myLink_Four_c =  dd_Nodes.getAttribute("link");
		                var myLinkText_Four_c = dd_Nodes.getAttribute("linktext"); 
		            }
		        }
		    }
		}
	}
	

	
	// End of Template Node . . . Start of TERMS & CONDITIONS (SPECIAL RULES NODES)
	var tc_nodes = xmlObj.childNodes[1].childNodes;
	for (tc = 0; tc < tc_nodes.length; tc++)
	{
		var TC_nodes = tc_nodes[tc];
		if (TC_nodes.tagName == "my:MER_rule")
		{
			var myMER_rule = TC_nodes.text;
		}
		if (TC_nodes.tagName == "specialRules" && TC_nodes.getAttribute("show") == "yes" && TC_nodes.text != "Lorem ipsum dolar")
		{
			if (TC_nodes.getAttribute("type") == "TERMS AND CONDITIONS")
			{
				var TermsAndConditions = TC_nodes.getAttribute("type");
				if (TC_nodes.text.match(/\®/))
				{
					//while (TC_nodes.text.indexOf("®") > -1)  var TermsAndConditionsContent += TC_nodes.text.replace("¢", "cent");
					//{
						var TermsAndConditionsContent = TC_nodes.text.replace("®", "(R)");
					//}
				}
				else
				{
					var TermsAndConditionsContent = TC_nodes.text;
				}
				
				var TermsAndConditionsContentLink = TermsAndConditionsContent.match(/http\:\/\/[^\"]+/i);
			}
			if (TC_nodes.getAttribute("type") == "" && TC_nodes.getAttribute("show") == "yes")
			{
			    var TermsAndConditionsTwo = TC_nodes.text;
			    var TermsAndConditionsTwoLink = TermsAndConditionsTwo.match(/http\:\/\/[^\"]+/i);
			}
			if (TC_nodes.getAttribute("type") == "UNSUBSCRIBE")
			{
				var Unsubscribe = TC_nodes.getAttribute("type");
				var UnsubscribeContent1 = "If you do not wish to receive future e-mail advertisements from us, please click here.";
				var UnsubscribeContent1Link = "http://www.expedia-email.com/Unsub/Unsubscribe.aspx?m=%%memberid%%&s=%%subscriberid%%&%%=OmnitureParams('')=%%";
				var UnsubscribeContent2 = "Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, click here for personalized help.";
				var UnsubscribeContent2Link = "https://www.expedia.com/pub/agent.dll?qscr=fbak&%%=OmnitureParams('')=%%";
			}
			if (TC_nodes.getAttribute("type") == "CONTACT US")
			{
				var ContactUs = TC_nodes.getAttribute("type");
				var specialRulesContactUs = "Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address.<br>https://www.expedia.com/pub/agent.dll?qscr=fbak&%%=OmnitureParams('')=%%<br><br>To contact us or send feedback, please click here or contact us via postal mail at:<br>Expedia, Inc.,<br>attn: EMC Team, 3150 139th Avenue SE,<br>Bellevue, WA 98005.<br>https://www.expedia.com/pub/agent.dll?qscr=fbak&%%=OmnitureParams('')=%%<br><br>For additional assistance, visit the Expedia.com Customer Support Center, or call 1-800-Expedia.<br>http://www.expedia.com/daily/service/default.asp?%%=OmnitureParams('')=%%";
			}
			if (TC_nodes.getAttribute("type") == "A NOTE ABOUT PRICES")
			{
				var ANoteAboutPrices = TC_nodes.getAttribute("type");
				var specialRulesPrices = "Prices are subject to availability and subject to change without notice.<br><br>All prices were current at the time this e-mail was published.<br><br>Hotel, vacation package, and cruise prices on the Expedia Website are constantly updated. Please refer to the site for the most current pricing. Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city. additional taxes, fees and charges may apply. airfare is subject to, without limitation:<br>(1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip;<br>(2) up to $18 per roundtrip in local airport charges;<br>(3) federal excise tax of $3.20 per U.S. domestic flight segment;<br>(4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in alaska or Hawaii; and<br>(5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking).<br>a segment is defined as a takeoff and a landing.<br><br>";
			}
			if (TC_nodes.getAttribute("type") == "CUSTOMER SUPPORT CENTER" && TC_nodes.getAttribute("show") == "yes")
			{
			    var CustomerSupportTitle = TC_nodes.getAttribute("type");
			    var CustomerSupport =  TC_nodes.text;
			    var CustomerSupportLink = CustomerSupport.match(/http\:\/\/[^\"]+/i);
			}
			if (TC_nodes.getAttribute("type") == "OFFICIAL RULES" && TC_nodes.getAttribute("show") == "yes")
			{
			    var OfficialRulesTitle = TC_nodes.getAttribute("type");
			    var OfficialRules = TC_nodes.text;
			    var OfficialRulesLink = OfficialRules.match(/http\:\/\/[^\"]+/i);
			}
		}
	}
	
	
	/* ////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//	
	//	Conditional statements to show the node and attribute values that have been extracted from the XML document
	//
	// ///////////////////////////////////////////////////////////////////////////////////////////////////////////// */
	
	// Show the eyebrow text
	if (myShortText)
	{
		document.getElementById("beginEyebrowModule").style.cssText = "display:inline; color:Red;";
		document.getElementById("beginEyebrowModule").innerHTML = beginEyebrowModule+"<br><br>";
		document.getElementById("myShortText").style.cssText = "display:inline;";
		document.getElementById("myBlurb").style.cssText = "display:inline;";
		document.getElementById("myURL").style.cssText = "display:inline;";
		document.getElementById("myShortText").innerHTML = myShortText;
		document.getElementById("myBlurb").innerHTML = myBlurb+"<br>";
		document.getElementById("myURL").innerHTML = myURL+sOMNITURE+"<br><br>";
		document.getElementById("endEyebrowModule").style.cssText = "display:inline; color:Red;";
		document.getElementById("endEyebrowModule").innerHTML = endEyebrowModule+"<br><br>";
	}
	if (Headline_One)
	{
	    document.getElementById("beginMessageModule").style.cssText = "display:inline; color:Red;";
	    document.getElementById("beginMessageModule").innerHTML = beginMessageModule+"<br><br>";
	    document.getElementById("Headline_One").style.cssText = "display:inline;";
	    document.getElementById("Headline_One").innerHTML = Headline_One+"<br><br>";
	}
	if (subHeadline_One)
	{
	    document.getElementById("subHeadline_One").style.cssText = "display:inline;";
	    document.getElementById("subHeadline_One").innerHTML = subHeadline_One+"<br><br>";
	}
	if (myParagraphDeal_One)
	{
	    document.getElementById("myParagraphDeal_One").style.cssText = "display:inline;";
	    if (myParagraphDeal_OneLink)
	    {
	        document.getElementById("myParagraphDeal_One").innerHTML = myParagraphDeal_One+"<br>";
	    }
	    else
	    {
	        document.getElementById("myParagraphDeal_One").innerHTML = myParagraphDeal_One+"<br><br>";
	    }
	    if (myParagraphDeal_OneLink)
	    {
	        if (myParagraphDeal_OneLink[0])
	        {
	            document.getElementById("myParagraphDeal_OneLink_a").style.cssText = "display:inline;";
	            if (myParagraphDeal_OneLink[1])
	            {
	                document.getElementById("myParagraphDeal_OneLink_a").innerHTML = myParagraphDeal_OneLink[0]+"<br>";
	            }
	            else
	            {
	                document.getElementById("myParagraphDeal_OneLink_a").innerHTML = myParagraphDeal_OneLink[0]+"<br><br>";
	            }
	        }
	        if (myParagraphDeal_OneLink[1])
	        {
	            document.getElementById("myParagraphDeal_OneLink_b").style.cssText = "display:inline;";
	            document.getElementById("myParagraphDeal_OneLink_b").innerHTML = myParagraphDeal_OneLink[1]+"<br><br>";
	        }
	    }
	}
	if (myParagraphDeal_Two)
	{
	    document.getElementById("myParagraphDeal_Two").style.cssText = "display:inline;";
	    if (myParagraphDeal_TwoLink)
	    {
	        document.getElementById("myParagraphDeal_Two").innerHTML = myParagraphDeal_Two+"<br>";
	    }
	    else
	    {
	        document.getElementById("myParagraphDeal_Two").innerHTML = myParagraphDeal_Two+"<br><br>";
	    }
	    if (myParagraphDeal_TwoLink)
	    {
	        if (myParagraphDeal_TwoLink[0])
	        {
	            document.getElementById("myParagraphDeal_TwoLink_a").style.cssText = "display:inline;";
	            if (myParagraphDeal_TwoLink[1])
	            {
	                document.getElementById("myParagraphDeal_TwoLink_a").innerHTML = myParagraphDeal_TwoLink[0]+"<br>";
	            }
	            else
	            {
	                document.getElementById("myParagraphDeal_TwoLink_a").innerHTML = myParagraphDeal_TwoLink[0]+"<br><br>";
	            }
	        }
	        if (myParagraphDeal_TwoLink[1])
	        {
	            document.getElementById("myParagraphDeal_TwoLink_b").style.cssText = "display:inline;";
	            if (myParagraphDeal_TwoLink[2])
	            {
	                document.getElementById("myParagraphDeal_TwoLink_b").innerHTML = myParagraphDeal_TwoLink[1]+"<br>";
	            }
	            else
	            {
	                document.getElementById("myParagraphDeal_TwoLink_b").innerHTML = myParagraphDeal_TwoLink[1]+"<br><br>";
	            }
	        }
	        if (myParagraphDeal_TwoLink[2])
	        {
	            document.getElementById("myParagraphDeal_TwoLink_c").style.cssText = "display:inline;";
	            if (myParagraphDeal_TwoLink[3])
	            {
	                document.getElementById("myParagraphDeal_TwoLink_c").innerHTML = myParagraphDeal_TwoLink[2]+"<br>";
	            }
	            else
	            {
	                document.getElementById("myParagraphDeal_TwoLink_c").innerHTML = myParagraphDeal_TwoLink[2]+"<br><br>";
	            }
	        }
	        if (myParagraphDeal_TwoLink[3])
	        {
	            document.getElementById("myParagraphDeal_TwoLink_d").style.cssText = "display:inline;";
	            document.getElementById("myParagraphDeal_TwoLink_d").innerHTML = myParagraphDeal_TwoLink[3]+"<br><br>";
	        }
	    }
	}
	if (myParagraphDeal_Three)
	{
	    document.getElementById("myParagraphDeal_Three").style.cssText = "display:inline;";
	    if (myParagraphDeal_ThreeLink)
	    {
	        document.getElementById("myParagraphDeal_Three").innerHTML = myParagraphDeal_Three+"<br>";
	    }
	    else
	    {
	        document.getElementById("myParagraphDeal_Three").innerHTML = myParagraphDeal_Three+"<br><br>";
	    }
	    if (myParagraphDeal_ThreeLink)
	    {
	        document.getElementById("myParagraphDeal_ThreeLink").style.cssText = "display:inline;";
	        document.getElementById("myParagraphDeal_ThreeLink").innerHTML = myParagraphDeal_ThreeLink+"<br><br>";
	    }    
	}
	if (myParagraphDeal_Four)
	{
	    document.getElementById("myParagraphDeal_Four").style.cssText = "display:inline;";
	    if (myParagraphDeal_FourLink)
	    {
	        document.getElementById("myParagraphDeal_Four").innerHTML = myParagraphDeal_Four+"<br>";
	    }
	    else
	    {
	        document.getElementById("myParagraphDeal_Four").innerHTML = myParagraphDeal_Four+"<br><br>";
	    }
	    if (myParagraphDeal_FourLink)
	    {
	        document.getElementById("myParagraphDeal_FourLink").style.cssText = "display:inline;";
	        document.getElementById("myParagraphDeal_FourLink").innerHTML = myParagraphDeal_FourLink+"<br><br>";
	    }    
	}
	if (myDealLinkText)
	{
	    document.getElementById("myDealLinkText").style.cssText = "display:inline;";
	    document.getElementById("myDealLinkText").innerHTML = myDealLinkText;
	    document.getElementById("myDealBlurb").style.cssText = "display:inline;";
	    document.getElementById("myDealBlurb").innerHTML = myDealBlurb+"<br>";
	    document.getElementById("myDealLink").style.cssText = "display:inline;";
	    document.getElementById("myDealLink").innerHTML = myDealLink+sOMNITURE+"<br><br>";
	}
	if (myDealLinkText)
	{
	    document.getElementById("myDealLinkText_One").style.cssText = "display:inline;";
	    document.getElementById("myDealLinkText_One").innerHTML = myDealLinkText_One;
	    document.getElementById("myDealBlurb_One").style.cssText = "display:inline;";
	    document.getElementById("myDealBlurb_One").innerHTML = myDealBlurb_One+"<br>";
	    document.getElementById("myDealLink_One").style.cssText = "display:inline;";
	    document.getElementById("myDealLink_One").innerHTML = myDealLink_One+sOMNITURE+"<br><br>";
	}
	if (myDealLinkText)
	{
	    document.getElementById("myDealLinkText_Two").style.cssText = "display:inline;";
	    document.getElementById("myDealLinkText_Two").innerHTML = myDealLinkText_Two;
	    document.getElementById("myDealBlurb_Two").style.cssText = "display:inline;";
	    document.getElementById("myDealBlurb_Two").innerHTML = myDealBlurb_Two+"<br>";
	    document.getElementById("myDealLink_Two").style.cssText = "display:inline;";
	    document.getElementById("myDealLink_Two").innerHTML = myDealLink_Two+sOMNITURE+"<br><br>";
	}
	if (myDealLinkText)
	{
	    document.getElementById("myDealLinkText_Three").style.cssText = "display:inline;";
	    document.getElementById("myDealLinkText_Three").innerHTML = myDealLinkText_Three;
	    document.getElementById("myDealBlurb_Three").style.cssText = "display:inline;";
	    document.getElementById("myDealBlurb_Three").innerHTML = myDealBlurb_Three+"<br>";
	    document.getElementById("myDealLink_Three").style.cssText = "display:inline;";
	    document.getElementById("myDealLink_Three").innerHTML = myDealLink_Three+sOMNITURE+"<br><br>";
	}
	document.getElementById("endMessageModule").style.cssText = "display:inline; color:Red;";
	document.getElementById("endMessageModule").innerHTML = endMessageModule+"<br><br>";
	document.getElementById("beginHotDealsModule").style.cssText = "display:inline; color:Red;";
	document.getElementById("beginHotDealsModule").innerHTML = beginHotDealsModule+"<br><br>";
	if (dealsHeader_Alt)
	{
	    document.getElementById("dealsHeader_Alt").style.cssText = "display:inline;";
	    document.getElementById("dealsHeader_Alt").innerHTML = dealsHeader_Alt+"<br><br>";
	    document.getElementById("myLinkText_AltOne").style.cssText = "display:inline;";
	    document.getElementById("myLinkText_AltOne").innerHTML = "- "+myLinkText_AltOne+": ";
	    document.getElementById("myLinkBlurb_AltOne").style.cssText = "display:inline;";
	    document.getElementById("myLinkBlurb_AltOne").innerHTML = myLinkBlurb_AltOne+"<br>";
	    document.getElementById("myLink_AltOne").style.cssText = "display:inline;";
	    document.getElementById("myLink_AltOne").innerHTML = myLink_AltOne+sOMNITURE+"<br><br>";
	    if (myLinkText_AltTwo)
	    {
	        document.getElementById("myLinkText_AltTwo").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_AltTwo").innerHTML = "- "+myLinkText_AltTwo+": ";
	        document.getElementById("myLinkBlurb_AltTwo").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_AltTwo").innerHTML = myLinkBlurb_AltTwo+"<br>";
	        document.getElementById("myLink_AltTwo").style.cssText = "display:inline;";
	        document.getElementById("myLink_AltTwo").innerHTML = myLink_AltTwo+sOMNITURE+"<br><br>";
	    }
	    if (myLinkText_AltThree)
	    {
	        document.getElementById("myLinkText_AltThree").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_AltThree").innerHTML = "- "+myLinkText_AltThree+": ";
	        document.getElementById("myLinkBlurb_AltThree").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_AltThree").innerHTML = myLinkBlurb_AltThree+"<br>";
	        document.getElementById("myLink_AltThree").style.cssText = "display:inline;";
	        document.getElementById("myLink_AltThree").innerHTML = myLink_AltThree+sOMNITURE+"<br><br>";
	    }
	    if (myLinkText_Four)
	    {
	        document.getElementById("myLinkText_AltFour").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_AltFour").innerHTML = "- "+myLinkText_AltFour+": ";
	        document.getElementById("myLinkBlurb_AltFour").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_AltFour").innerHTML = myLinkBlurb_AltFour+"<br>";
	        document.getElementById("myLink_AltFour").style.cssText = "display:inline;";
	        document.getElementById("myLink_AltFour").innerHTML = myLink_AltFour+sOMNITURE+"<br><br>";
	    }
	    
	}
	if (dealsHeader_One)
	{
	    document.getElementById("dealsHeader_One").style.cssText = "display:inline;";
	    document.getElementById("dealsHeader_One").innerHTML = dealsHeader_One+"<br><br>";
	    document.getElementById("myLinkText_One").style.cssText = "display:inline;";
	    document.getElementById("myLinkText_One").innerHTML = "- "+myLinkText_One+": ";
	    document.getElementById("myLinkBlurb_One").style.cssText = "display:inline;";
	    document.getElementById("myLinkBlurb_One").innerHTML = myLinkBlurb_One+"<br>";
	    document.getElementById("myLink_One").style.cssText = "display:inline;";
	    document.getElementById("myLink_One").innerHTML = myLink_One+sOMNITURE+"<br><br>";
	    if (myLinkText_Two)
	    {
	        document.getElementById("myLinkText_Two").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Two").innerHTML = "- "+myLinkText_Two+": ";
	        document.getElementById("myLinkBlurb_Two").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Two").innerHTML = myLinkBlurb_Two+"<br>";
	        document.getElementById("myLink_Two").style.cssText = "display:inline;";
	        document.getElementById("myLink_Two").innerHTML = myLink_Two+sOMNITURE+"<br><br>";
	    }
	    if (myLinkText_Three)
	    {
	        document.getElementById("myLinkText_Three").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Three").innerHTML = "- "+myLinkText_Three+": ";
	        document.getElementById("myLinkBlurb_Three").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Three").innerHTML = myLinkBlurb_Three+"<br>";
	        document.getElementById("myLink_Three").style.cssText = "display:inline;";
	        document.getElementById("myLink_Three").innerHTML = myLink_Three+sOMNITURE+"<br><br>";
	    }
	    if (myLinkText_Four)
	    {
	        document.getElementById("myLinkText_Four").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Four").innerHTML = "- "+myLinkText_Four+": ";
	        document.getElementById("myLinkBlurb_Four").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Four").innerHTML = myLinkBlurb_Four+"<br>";
	        document.getElementById("myLink_Four").style.cssText = "display:inline;";
	        document.getElementById("myLink_Four").innerHTML = myLink_Four+sOMNITURE+"<br><br>";
	    }
	    
	}
	if (dealsHeader_Two)
	{
	    document.getElementById("dealsHeader_Two").style.cssText = "display:inline;";
	    document.getElementById("dealsHeader_Two").innerHTML = dealsHeader_Two+"<br><br>";
	    document.getElementById("myLinkText_One_a").style.cssText = "display:inline;";
	    document.getElementById("myLinkText_One_a").innerHTML = "- "+myLinkText_One_a+": ";
	    document.getElementById("myLinkBlurb_One_a").style.cssText = "display:inline;";
	    document.getElementById("myLinkBlurb_One_a").innerHTML = myLinkBlurb_One_a+"<br>";
	    document.getElementById("myLink_One_a").style.cssText = "display:inline;";
	    document.getElementById("myLink_One_a").innerHTML = myLink_One_a+sOMNITURE+"<br><br>";
	    if (myLinkText_Two_a)
	    {
	        document.getElementById("myLinkText_Two_a").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Two_a").innerHTML = "- "+myLinkText_Two_a+": ";
	        document.getElementById("myLinkBlurb_Two_a").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Two_a").innerHTML = myLinkBlurb_Two_a+"<br>";
	        document.getElementById("myLink_Two_a").style.cssText = "display:inline;";
	        document.getElementById("myLink_Two_a").innerHTML = myLink_Two_a+sOMNITURE+"<br><br>";
	    }
	    if (myLinkText_Three_a)
	    {
	        document.getElementById("myLinkText_Three_a").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Three_a").innerHTML = "- "+myLinkText_Three_a+": ";
	        document.getElementById("myLinkBlurb_Three_a").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Three_a").innerHTML = myLinkBlurb_Three_a+"<br>";
	        document.getElementById("myLink_Three_a").style.cssText = "display:inline;";
	        document.getElementById("myLink_Three_a").innerHTML = myLink_Three_a+sOMNITURE+"<br><br>";
	    }
	    if (myLinkText_Four_a)
	    {
	        document.getElementById("myLinkText_Four_a").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Four_a").innerHTML = "- "+myLinkText_Four_a+": ";
	        document.getElementById("myLinkBlurb_Four_a").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Four_a").innerHTML = myLinkBlurb_Four_a+"<br>";
	        document.getElementById("myLink_Four_a").style.cssText = "display:inline;";
	        document.getElementById("myLink_Four_a").innerHTML = myLink_Four_a+sOMNITURE+"<br><br>";
	    }
	    
	}
	if (dealsHeader_Three)
	{
	    document.getElementById("dealsHeader_Three").style.cssText = "display:inline;";
	    document.getElementById("dealsHeader_Three").innerHTML = dealsHeader_Three+"<br><br>";
	    document.getElementById("myLinkText_One_b").style.cssText = "display:inline;";
	    document.getElementById("myLinkText_One_b").innerHTML = "- "+myLinkText_One_b+": ";
	    document.getElementById("myLinkBlurb_One_b").style.cssText = "display:inline;";
	    document.getElementById("myLinkBlurb_One_b").innerHTML = myLinkBlurb_One_b+"<br>";
	    document.getElementById("myLink_One_b").style.cssText = "display:inline;";
	    document.getElementById("myLink_One_b").innerHTML = myLink_One_b+sOMNITURE+"<br><br>";
	    if (myLinkText_Two_b)
	    {
	        document.getElementById("myLinkText_Two_b").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Two_b").innerHTML = "- "+myLinkText_Two_b+": ";
	        document.getElementById("myLinkBlurb_Two_b").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Two_b").innerHTML = myLinkBlurb_Two_b+"<br>";
	        document.getElementById("myLink_Two_b").style.cssText = "display:inline;";
	        document.getElementById("myLink_Two_b").innerHTML = myLink_Two_b+sOMNITURE+"<br><br>";
	    }
	    if (myLinkText_Three_b)
	    {
	        document.getElementById("myLinkText_Three_b").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Three_b").innerHTML = "- "+myLinkText_Three_b+": ";
	        document.getElementById("myLinkBlurb_Three_b").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Three_b").innerHTML = myLinkBlurb_Three_b+"<br>";
	        document.getElementById("myLink_Three_b").style.cssText = "display:inline;";
	        document.getElementById("myLink_Three_b").innerHTML = myLink_Three_b+sOMNITURE+"<br><br>";
	    }
	    if (myLinkText_Four_b)
	    {
	        document.getElementById("myLinkText_Four_b").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Four_b").innerHTML = "- "+myLinkText_Four_b+": ";
	        document.getElementById("myLinkBlurb_Four_b").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Four_b").innerHTML = myLinkBlurb_Four_b+"<br>";
	        document.getElementById("myLink_Four_b").style.cssText = "display:inline;";
	        document.getElementById("myLink_Four_b").innerHTML = myLink_Four_b+sOMNITURE+"<br><br>";
	    }
	}
	if (dealsHeader_Four)
	{
	    document.getElementById("dealsHeader_Four").style.cssText = "display:inline;";
	    document.getElementById("dealsHeader_Four").innerHTML = dealsHeader_Four+"<br><br>";
	    document.getElementById("myLinkText_One_c").style.cssText = "display:inline;";
	    document.getElementById("myLinkText_One_c").innerHTML = "- "+myLinkText_One_c+": ";
	    document.getElementById("myLinkBlurb_One_c").style.cssText = "display:inline;";
	    document.getElementById("myLinkBlurb_One_c").innerHTML = myLinkBlurb_One_c+"<br>";
	    document.getElementById("myLink_One_c").style.cssText = "display:inline;";
	    document.getElementById("myLink_One_c").innerHTML = myLink_One_c+sOMNITURE+"<br><br>";
	    if (myLinkText_Two_c)
	    {
	        document.getElementById("myLinkText_Two_c").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Two_c").innerHTML = "- "+myLinkText_Two_c+": ";
	        document.getElementById("myLinkBlurb_Two_c").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Two_c").innerHTML = myLinkBlurb_Two_c+"<br>";
	        document.getElementById("myLink_Two_c").style.cssText = "display:inline;";
	        document.getElementById("myLink_Two_c").innerHTML = myLink_Two_c+sOMNITURE+"<br><br>";
	    }
	    if (myLinkText_Three_c)
	    {
	        document.getElementById("myLinkText_Three_c").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Three_c").innerHTML = "- "+myLinkText_Three_c+": ";
	        document.getElementById("myLinkBlurb_Three_c").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Three_c").innerHTML = myLinkBlurb_Three_c+"<br>";
	        document.getElementById("myLink_Three_c").style.cssText = "display:inline;";
	        document.getElementById("myLink_Three_c").innerHTML = myLink_Three_c+sOMNITURE+"<br><br>";
	    }
	    if (myLinkText_Four_c)
	    {
	        document.getElementById("myLinkText_Four_c").style.cssText = "display:inline;";
	        document.getElementById("myLinkText_Four_c").innerHTML = "- "+myLinkText_Four_c+": ";
	        document.getElementById("myLinkBlurb_Four_c").style.cssText = "display:inline;";
	        document.getElementById("myLinkBlurb_Four_c").innerHTML = myLinkBlurb_Four_c+"<br>";
	        document.getElementById("myLink_Four_c").style.cssText = "display:inline;";
	        document.getElementById("myLink_Four_c").innerHTML = myLink_Four_c+sOMNITURE+"<br><br>";
	    }    
	}
	document.getElementById("endHotDealsModule").style.cssText = "display:inline; color:Red;";
	document.getElementById("endHotDealsModule").innerHTML = endHotDealsModule+"<br><br>";
	
	
	
	// TERMS AND CONDITIONS
//	document.getElementById("myMER_rule").innerHTML = myMER_rule;
//	if (TermsAndConditions)
//	{
//		document.getElementById("TermsAndConditions").innerHTML = TermsAndConditions+"<br>";
//		document.getElementById("TermsAndConditionsContent").innerHTML = TermsAndConditionsContent+"<br>";
//		document.getElementById("TermsAndConditionsContentLink").innerHTML = TermsAndConditionsContentLink+"<br><br>";
//	}
//	if (TermsAndConditionsTwo)
//	{
//	    document.getElementById("TermsAndConditionsTwo").style.cssText = "display:inline;";
//	    document.getElementById("TermsAndConditionsTwo").innerHTML = TermsAndConditionsTwo+"<br>";
//	    document.getElementById("TermsAndConditionsTwoLink").style.cssText = "display:inline;";
//	    document.getElementById("TermsAndConditionsTwoLink").innerHTML = TermsAndConditionsTwoLink+"<br><br>";
//	}
//	if (Unsubscribe)
//	{
//		document.getElementById("Unsubscribe").style.cssText = "display:inline;";
//		document.getElementById("Unsubscribe").innerHTML = Unsubscribe+"<br>";
//		document.getElementById("UnsubscribeContent1").style.cssText = "display:inline;";
//		document.getElementById("UnsubscribeContent1").innerHTML = UnsubscribeContent1+"<br>";
//		document.getElementById("UnsubscribeContent1Link").style.cssText = "display:inline;";
//		document.getElementById("UnsubscribeContent1Link").innerHTML = UnsubscribeContent1Link+"<br><br>";
//		document.getElementById("UnsubscribeContent2").style.cssText = "display:inline;";
//		document.getElementById("UnsubscribeContent2").innerHTML = UnsubscribeContent2+"<br>";
//		document.getElementById("UnsubscribeContent2Link").style.cssText = "display:inline;";
//		document.getElementById("UnsubscribeContent2Link").innerHTML = UnsubscribeContent2Link+"<br><br>";
//	}
//	document.getElementById("ContactUs").innerHTML = ContactUs;
//	document.getElementById("specialRulesContactUs").innerHTML = specialRulesContactUs;
//	if (ANoteAboutPrices)
//	{
//	    document.getElementById("ANoteAboutPrices").style.cssText = "display:inline;";
//	    document.getElementById("ANoteAboutPrices").innerHTML = ANoteAboutPrices+"<br>";
//	    document.getElementById("specialRulesPrices").style.cssText = "display:inline;";
//	    document.getElementById("specialRulesPrices").innerHTML = specialRulesPrices+"<br>";
//	}
//	if (CustomerSupportTitle)
//	{
//	    document.getElementById("CustomerSupportTitle").style.cssText = "display:inline;";
//	    document.getElementById("CustomerSupportTitle").innerHTML = CustomerSupportTitle+"<br>";
//	    document.getElementById("CustomerSupport").style.cssText = "display:inline;";
//	    document.getElementById("CustomerSupport").innerHTML = CustomerSupport+"<br>";
//	    document.getElementById("CustomerSupportLink").style.cssText = "display:inline;";
//	    document.getElementById("CustomerSupportLink").innerHTML = CustomerSupportLink+"<br><br>";
//	}
//	if (OfficialRulesTitle)
//	{
//	    document.getElementById("OfficialRulesTitle").style.cssText = "display:inline;";
//	    document.getElementById("OfficialRulesTitle").innerHTML = OfficialRulesTitle+"<br>";
//	    document.getElementById("OfficialRules").style.cssText = "display:inline;";
//	    document.getElementById("OfficialRules").innerHTML = OfficialRules+"<br>";
//	    document.getElementById("OfficialRulesLink").style.cssText = "display:inline;";
//	    document.getElementById("OfficialRulesLink").innerHTML = OfficialRulesLink+"<br><br>";
//	}
//	document.getElementById("specialRulesFinal").innerHTML = specialRulesFinal;
}

	</script>
</head>

<body bgcolor="#FFFFCC" onload="loadXML()" style="font-family: verdana; font-size: 11; color: #000000;">
<table width="100%">
<tr><td bgcolor="#FFFFCC" style="font-family: verdana; font-size: 11; color: #000000;">
<span id="beginEyebrowModule" style="display:none;"></span>
<span id="myShortText" style="display:none;"></span>&nbsp;<span id="myBlurb" style="display:none;"></span>
<span id="myURL" style="display:none;"></span>
<span id="endEyebrowModule" style="display:none;"></span>

<span id="beginMessageModule" style="display:none;"></span>
<span id="Headline_One" style="display:none;"></span>
<span id="subHeadline_One" style="display:none;"></span>
<span id="myParagraphDeal_One" style="display:none;"></span>
<span id="myParagraphDeal_OneLink_a" style="display:none;"></span>
<span id="myParagraphDeal_OneLink_b" style="display:none;"></span>
<span id="myParagraphDeal_Two" style="display:none;"></span>
<span id="myParagraphDeal_TwoLink_a" style="display:none;"></span>
<span id="myParagraphDeal_TwoLink_b" style="display:none;"></span>
<span id="myParagraphDeal_TwoLink_c" style="display:none;"></span>
<span id="myParagraphDeal_TwoLink_d" style="display:none;"></span>
<span id="myParagraphDeal_Three" style="display:none;"></span>
<span id="myParagraphDeal_ThreeLink" style="display:none;"></span>
<span id="myParagraphDeal_Four" style="display:none;"></span>
<span id="myParagraphDeal_FourLink" style="display:none;"></span>
<span id="myDealLinkText" style="display:none;"></span> <span id="myDealBlurb" style="display:none;"></span>
<span id="myDealLink" style="display:none;"></span>
<span id="myDealLinkText_One" style="display:none;"></span> <span id="myDealBlurb_One" style="display:none;"></span>
<span id="myDealLink_One" style="display:none;"></span>
<span id="myDealLinkText_Two" style="display:none;"></span> <span id="myDealBlurb_Two" style="display:none;"></span>
<span id="myDealLink_Two" style="display:none;"></span>
<span id="myDealLinkText_Three" style="display:none;"></span> <span id="myDealBlurb_Three" style="display:none;"></span>
<span id="myDealLink_Three" style="display:none;"></span>
<span id="endMessageModule" style="display:none;"></span>

<span id="beginHotDealsModule" style="display:none;"></span>
<span id="dealsHeader_Alt" style="display:none;"></span>
<span id="myLinkText_AltOne" style="display:none;"></span><span id="myLinkBlurb_AltOne" style="display:none;"></span>
<span id="myLink_AltOne" style="display:none;"></span>
<span id="myLinkText_AltTwo" style="display:none;"></span><span id="myLinkBlurb_AltTwo" style="display:none;"></span>
<span id="myLink_AltTwo" style="display:none;"></span>
<span id="myLinkText_AltThree" style="display:none;"></span><span id="myLinkBlurb_AltThree" style="display:none;"></span>
<span id="myLink_AltThree" style="display:none;"></span>
<span id="myLinkText_AltFour" style="display:none;"></span><span id="myLinkBlurb_AltFour" style="display:none;"></span>
<span id="myLink_AltFour" style="display:none;"></span>

<span id="dealsHeader_One" style="display:none;"></span>
<span id="myLinkText_One" style="display:none;"></span><span id="myLinkBlurb_One" style="display:none;"></span>
<span id="myLink_One" style="display:none;"></span>
<span id="myLinkText_Two" style="display:none;"></span><span id="myLinkBlurb_Two" style="display:none;"></span>
<span id="myLink_Two" style="display:none;"></span>
<span id="myLinkText_Three" style="display:none;"></span><span id="myLinkBlurb_Three" style="display:none;"></span>
<span id="myLink_Three" style="display:none;"></span>
<span id="myLinkText_Four" style="display:none;"></span><span id="myLinkBlurb_Four" style="display:none;"></span>
<span id="myLink_Four" style="display:none;"></span>
<span id="dealsHeader_Two" style="display:none;"></span>
<span id="myLinkText_One_a" style="display:none;"></span><span id="myLinkBlurb_One_a" style="display:none;"></span>
<span id="myLink_One_a" style="display:none;"></span>
<span id="myLinkText_Two_a" style="display:none;"></span><span id="myLinkBlurb_Two_a" style="display:none;"></span>
<span id="myLink_Two_a" style="display:none;"></span>
<span id="myLinkText_Three_a" style="display:none;"></span><span id="myLinkBlurb_Three_a" style="display:none;"></span>
<span id="myLink_Three_a" style="display:none;"></span>
<span id="myLinkText_Four_a" style="display:none;"></span><span id="myLinkBlurb_Four_a" style="display:none;"></span>
<span id="myLink_Four_a" style="display:none;"></span>
<span id="dealsHeader_Three" style="display:none;"></span>
<span id="myLinkText_One_b" style="display:none;"></span><span id="myLinkBlurb_One_b" style="display:none;"></span>
<span id="myLink_One_b" style="display:none;"></span>
<span id="myLinkText_Two_b" style="display:none;"></span><span id="myLinkBlurb_Two_b" style="display:none;"></span>
<span id="myLink_Two_b" style="display:none;"></span>
<span id="myLinkText_Three_b" style="display:none;"></span><span id="myLinkBlurb_Three_b" style="display:none;"></span>
<span id="myLink_Three_b" style="display:none;"></span>
<span id="myLinkText_Four_b" style="display:none;"></span><span id="myLinkBlurb_Four_b" style="display:none;"></span>
<span id="myLink_Four_b" style="display:none;"></span>
<span id="dealsHeader_Four" style="display:none;"></span>
<span id="myLinkText_One_c" style="display:none;"></span><span id="myLinkBlurb_One_c" style="display:none;"></span>
<span id="myLink_One_c" style="display:none;"></span>
<span id="myLinkText_Two_c" style="display:none;"></span><span id="myLinkBlurb_Two_c" style="display:none;"></span>
<span id="myLink_Two_c" style="display:none;"></span>
<span id="myLinkText_Three_c" style="display:none;"></span><span id="myLinkBlurb_Three_c" style="display:none;"></span>
<span id="myLink_Three_c" style="display:none;"></span>
<span id="myLinkText_Four_c" style="display:none;"></span><span id="myLinkBlurb_Four_c" style="display:none;"></span>
<span id="myLink_Four_c" style="display:none;"></span>
<span id="endHotDealsModule" style="display:none;"></span>
<!--<p>============================</p>
<span id="myMER_rule"></span><br><br>
<span id="TermsAndConditions"></span>
<span id="TermsAndConditionsContent"></span>
<span id="TermsAndConditionsContentLink"></span>
<span id="TermsAndConditionsTwo" style="display:none;"></span>
<span id="TermsAndConditionsTwoLink" style="display:none;"></span>
<span id="Unsubscribe" style="display:none;"></span>
<span id="UnsubscribeContent1" style="display:none;"></span>
<span id="UnsubscribeContent1Link" style="display:none;"></span>
<span id="UnsubscribeContent2" style="display:none;"></span>
<span id="UnsubscribeContent2Link" style="display:none;"></span>
<span id="ContactUs"></span><br>
<span id="specialRulesContactUs"></span><br><br>
<span id="ANoteAboutPrices" style="display:none;"></span>
<span id="specialRulesPrices" style="display:none;"></span>
<span id="CustomerSupportTitle" style="display:none;"></span>
<span id="CustomerSupport" style="display:none;"></span>
<span id="CustomerSupportLink" style="display:none;"></span>
<span id="OfficialRulesTitle" style="display:none;"></span>
<span id="OfficialRules" style="display:none;"></span>
<span id="OfficialRulesLink" style="display:none;"></span>
<span id="specialRulesFinal"></span>-->
</td></tr>
</table>
</body>
</html>
