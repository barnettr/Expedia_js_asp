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
	<title>JavaScript XML Text Extraction</title>
<script language="JavaScript" type="text/javascript">
   
//////////////////////////////////////////////////
//                                              //
//      Rob Barnett 6/12/2007                   //
//      for Expedia ECS DNL email production    //
//      for use in rendering text versions      //
//      of XML formatted email                  //
//                                              //
//////////////////////////////////////////////////
   

var xmlDoc = "";
function loadXML()
{
	// code for IE
	if (window.ActiveXObject)
  	{
  		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
  		xmlDoc.async = false;
		xmlDoc.load("<%= linkURL %>");
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
	 // //////////////////////////////////////////////////////////////////
	 //  Here the code is looking for the email Issue ID.               //
	 //  Once the id is found in the email node the values ID_a and     //
	 //  ID_b are applied to the variable "specialRulesFinal" which is  //
	 //  the bottom piece of the T & C                                  // 
	 // //////////////////////////////////////////////////////////////////
	 
	if (xmlObj.tagName == "email")
	{
		var ID_a = xmlObj.getAttribute("type");
	}
	if (xmlObj.childNodes[0].tagName == "ID")
	{
		var ID_b = xmlObj.childNodes[0].getAttribute("issue");
	}
	// //////////////////////////////////
	// Constants for Eyebrow, HeroText, /
	// sOMNITURE, & Final Special Rules /
	// //////////////////////////////////
	var Eyebrow = "Act now for great rates on last-minute getaways.<br /><br />";
	var HeroText = "No plans? No problem.<br />Save with our last-minute deals.<br />For best availability and the Best Price Guarantee, book now on Expedia."
	var sOMNITURE = "%%=OmnitureParams('')=%%";
	var specialRulesFinal = "CST# 2029030-40<br /><br />(c)2007 Expedia, Inc. All rights reserved. Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.<br /><br />(EMID: "+ID_a+""+ID_b+")(MD: %%=Format(Now()&#44; &#34;yyyyMMddhhmms&#34;)=%%)(EPID: %%sub_PAID%%)(ETID: %%jobid%%)";
	
	// ////////////////////////////////////////////////////////////////////////
	// Variables extracted from the XML document nodes and their attributes: //
	/////////////////////////////////////////////////////////////////////////// 
	
	document.getElementById("Eyebrow").innerHTML = Eyebrow;
	document.getElementById("HeroText").innerHTML = HeroText;
	var TermsAndConditionsContentLink = new Array();
	for (var a = 0; a < xmlObj.childNodes.length; a++)
	{
	    if (xmlObj.childNodes[a].tagName == "Destination" && xmlObj.childNodes[a].getAttribute("DestPick") == "yes")
	    {
	        var CityEl = document.createElement("p");
	        var BoldEl = document.createElement("b");
	        CityEl.appendChild(BoldEl);
            var CityText = document.createTextNode(xmlObj.childNodes[a].getAttribute("Name"));
            BoldEl.appendChild(CityText);
            CityDiv.appendChild(CityEl);
            for (var b = 0; b < xmlObj.childNodes[a].childNodes.length; b++)
            {
                if (xmlObj.childNodes[a].childNodes[b].tagName == "my:header")
                {
                }
                else
                {
                    var HotelEl = document.createElement("p");
	                var HotelName = document.createTextNode(xmlObj.childNodes[a].childNodes[b].getAttribute("Name"));
	                HotelEl.appendChild(HotelName);
	                CityEl.appendChild(HotelEl);
	            } 
	            
	            var StarRating = new Array();
	            for (var c = 0; c < xmlObj.childNodes[a].childNodes[b].childNodes.length; c++)
	            {
	                if (xmlObj.childNodes[a].childNodes[b].childNodes[c].tagName == "StarRating")
	                {
	                    StarRating[c] = xmlObj.childNodes[a].childNodes[b].childNodes[c].text;
	                    switch (StarRating[c])
						{
							case "0":
							StarRating[c] = "";
							break;
							case "20":
							StarRating[c] = " (2 stars) - ";
							break;
							case "25":
							StarRating[c] = " (2 1/2 stars) - ";
							break;
							case "30":
							StarRating[c] = " (3 stars) - ";
							break;
							case "35":
							StarRating[c] = " (3 1/2 stars) - ";
							break;
							case "40":
							StarRating[c] = " (4 stars) - ";
							break;
							case "45":
							StarRating[c] = " (4 1/2 stars) - ";
							break;
							case "50":
							StarRating[c] = " (5 stars) - ";
							break;
						}
	                    var StarRatingEl = document.createElement("span");
	                    var StarRatingText = document.createTextNode(StarRating[c]);
	                    StarRatingEl.appendChild(StarRatingText);
	                    HotelEl.appendChild(StarRatingEl);
	                }
	                if (xmlObj.childNodes[a].childNodes[b].childNodes[c].tagName == "TravelStartDate")
	                {
	                    var TravelStart = "travel between: "+xmlObj.childNodes[a].childNodes[b].childNodes[c].text+" - ";
	                    var TravelStartEl = document.createElement("span");
	                    var TravelStartText = document.createTextNode(TravelStart);
	                    TravelStartEl.appendChild(TravelStartText);
	                    HotelEl.appendChild(TravelStartEl);
	                }
	                if (xmlObj.childNodes[a].childNodes[b].childNodes[c].tagName == "TravelEndDate")
	                {
	                    var TravelEnd = xmlObj.childNodes[a].childNodes[b].childNodes[c].text+"  ";
	                    var TravelEndEl = document.createElement("span");
	                    var TravelEndText = document.createTextNode(TravelEnd);
	                    TravelEndEl.appendChild(TravelEndText);
	                    HotelEl.appendChild(TravelEndEl);
	                }
	                if (xmlObj.childNodes[a].childNodes[b].childNodes[c].tagName == "Price")
	                {
	                    var Price = "$"+xmlObj.childNodes[a].childNodes[b].childNodes[c].text+"  ";
	                    var PriceEl = document.createElement("span");
	                    var PriceText = document.createTextNode(Price);
	                    PriceEl.appendChild(PriceText);
	                    HotelEl.appendChild(PriceEl);
	                }
	                if (xmlObj.childNodes[a].childNodes[b].childNodes[c].tagName == "strURL")
	                {
	                    var strURL = xmlObj.childNodes[a].childNodes[b].childNodes[c].text+"?"+sOMNITURE;
	                    var strURLEl = document.createElement("div");
	                    var strURLText = document.createTextNode(strURL);
	                    strURLEl.appendChild(strURLText);
	                    HotelEl.appendChild(strURLEl);
	                }
	            }
            }
	    }
	    document.getElementById("myMER_rule").innerHTML = "You are receiving this email because you subscribed to receive promotional emails on Expedia.com.<br />This is a weekly deals newsletter you qualified for based on your email preferences.";
	    var Unsubscribe = "UNSUBSCRIBE";
		var UnsubscribeContent1 = "If you do not wish to receive future e-mail advertisements from us, please click here.";
		var UnsubscribeContent1Link = "http://www.expedia-email.com/Unsub/Unsubscribe.aspx?m=%%memberid%%&s=%%subscriberid%%&%%=OmnitureParams('')=%%";
		var UnsubscribeContent2 = "Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, click here for personalized help.";
		var UnsubscribeContent2Link = "https://www.expedia.com/pub/agent.dll?qscr=fbak&%%=OmnitureParams('')=%%";
		
		document.getElementById("Unsubscribe").style.cssText = "display:inline;";
        document.getElementById("Unsubscribe").innerHTML = Unsubscribe+"<br>";
        document.getElementById("UnsubscribeContent1").style.cssText = "display:inline;";
        document.getElementById("UnsubscribeContent1").innerHTML = UnsubscribeContent1+"<br>";
        document.getElementById("UnsubscribeContent1Link").style.cssText = "display:inline;";
        document.getElementById("UnsubscribeContent1Link").innerHTML = UnsubscribeContent1Link+"<br><br>";
        document.getElementById("UnsubscribeContent2").style.cssText = "display:inline;";
        document.getElementById("UnsubscribeContent2").innerHTML = UnsubscribeContent2+"<br>";
        document.getElementById("UnsubscribeContent2Link").style.cssText = "display:inline;";
        document.getElementById("UnsubscribeContent2Link").innerHTML = UnsubscribeContent2Link+"<br><br>";
		var ContactUs = "CONTACT US";
		var specialRulesContactUs = "Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address.<br>https://www.expedia.com/pub/agent.dll?qscr=fbak&%%=OmnitureParams('')=%%<br><br>To contact us or send feedback, please click here or contact us via postal mail at:<br>Expedia, Inc.,<br>attn: EMC Team, 3150 139th Avenue SE,<br>Bellevue, WA 98005.<br>https://www.expedia.com/pub/agent.dll?qscr=fbak&%%=OmnitureParams('')=%%<br><br>For additional assistance, visit the Expedia.com Customer Support Center, or call 1-800-Expedia.<br>http://www.expedia.com/daily/service/default.asp?%%=OmnitureParams('')=%%";
	    document.getElementById("ContactUs").innerHTML = ContactUs;
        document.getElementById("specialRulesContactUs").innerHTML = specialRulesContactUs;
		var ANoteAboutPrices = "A NOTE ABOUT PRICES";
		var specialRulesPrices = "Prices are subject to availability and subject to change without notice.<br><br>All prices were current at the time this e-mail was published.<br><br>Hotel, vacation package, and cruise prices on the Expedia Website are constantly updated. Please refer to the site for the most current pricing. Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city. additional taxes, fees and charges may apply. airfare is subject to, without limitation:<br>(1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip;<br>(2) up to $18 per roundtrip in local airport charges;<br>(3) federal excise tax of $3.20 per U.S. domestic flight segment;<br>(4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in alaska or Hawaii; and<br>(5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking).<br>a segment is defined as a takeoff and a landing.<br><br>";
	    
	    document.getElementById("ANoteAboutPrices").style.cssText = "display:inline;";
        document.getElementById("ANoteAboutPrices").innerHTML = ANoteAboutPrices+"<br>";
        document.getElementById("specialRulesPrices").style.cssText = "display:inline;";
        document.getElementById("specialRulesPrices").innerHTML = specialRulesPrices+"<br>";
		document.getElementById("specialRulesFinal").innerHTML = specialRulesFinal;
	    //document.getElementById("TermsAndConditions").innerHTML = "TERMS AND CONDITIONS<br />";
	    //document.getElementById("TermsAndConditionsContent").innerHTML = TermsAndConditionsContent+"<br />";
//	    if (xmlObj.childNodes[a].tagName == "specialRules" && xmlObj.childNodes[a].getAttribute("show") == "yes")
//	    {
//	        if (xmlObj.childNodes[a].getAttribute("type") == "TERMS AND CONDITIONS")
//			{
//				var TermsAndConditions = xmlObj.childNodes[a].getAttribute("type");
//				document.getElementById("TermsAndConditions").innerHTML = TermsAndConditions+"<br />";
//				if (xmlObj.childNodes[a].text.match(/\®/))
//				{
//					var TermsAndConditionsContent = xmlObj.childNodes[a].text.replace("®", "(R)");
//				}
//				else
//				{
//					var TermsAndConditionsContent = xmlObj.childNodes[a].text;
//				}
//				document.getElementById("TermsAndConditionsContent").innerHTML = TermsAndConditionsContent+"<br />";
//				TermsAndConditionsContentLink[a] = TermsAndConditionsContent.match(/http\:\/\/[^\"]+/g);
//				for (var d = 0; d < TermsAndConditionsContentLink[a].length; d++)
//				{
//				    
//				    if (TermsAndConditionsContentLink[a][d])
//				    {
//				        document.getElementById("TermsAndConditionsContentLink"+a+""+d).style.cssText = "display:inline;";
//				        if (TermsAndConditionsContentLink[a][0])
//				        {
//				            document.getElementById("TermsAndConditionsContentLink"+a+"0").innerHTML = TermsAndConditionsContentLink[a][0]+"<br />";
//				        }
//				        if (TermsAndConditionsContentLink[a][1])
//				        {
//				            document.getElementById("TermsAndConditionsContentLink"+a+"1").innerHTML = TermsAndConditionsContentLink[a][1]+"<br />";
//				        }
//				        if (TermsAndConditionsContentLink[a][2])
//				        {
//				            document.getElementById("TermsAndConditionsContentLink"+a+"2").innerHTML = TermsAndConditionsContentLink[a][2]+"<br />";
//				        }
//				    }
//				}
//			}
		    
//	    }
	}
}

</script>
</head>

<body bgcolor="#FFFFCC" onload="loadXML()" style="font-family: verdana; font-size: 11; color: #000000;">
    
    <span id="Eyebrow"></span>
    <span id="HeroText" style="padding-bottom:-50px;"></span>
    <div id="CityDiv" style="padding-top:-50px;">
    </div>
    <p>============================</p>
    <span id="myMER_rule"></span><br><br>
    <span id="TermsAndConditions"></span>
    <span id="TermsAndConditionsContent"></span>
    <span id="TermsAndConditionsContentLink130" style="display:none;"></span>
    <span id="TermsAndConditionsContentLink131" style="display:none;"></span>
    <span id="TermsAndConditionsContentLink132" style="display:none;"></span>
    <span id="TermsAndConditionsContentLink133" style="display:none;"></span>
    <span id="TermsAndConditionsContentLink134" style="display:none;"></span>
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
    <span id="specialRulesFinal"></span>

</body>
</html>
