<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%  

Dim linkURL, strPosition, MyXMLFileName 

linkURL = Request.Querystring("Path")

If InStr(1, linkURL, "dnl") <> 0 Then
    Response.Redirect("DNL_XML_text_extraction.asp?Path=" & linkURL)
End If

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
//      Rob Barnett 3/29/2007                   //
//      for Expedia ECS email production        //
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
  		xmlDoc.async=false;
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
	 
	var ID_a = (xmlObj.tagName == "email") ? xmlObj.getAttribute("type") : "";
	var ID_b = (xmlObj.childNodes[0].tagName == "ID") ? xmlObj.childNodes[0].getAttribute("issue") : "";
	
	// CONSTANTS
	
	var sOMNITURE = "%%=OmnitureParams('')=%%";  // %%=Format(ISRA_FARE_AMOUNT_FND,"$###.##")=%%    %%=OmnitureParams('')=%%
	var specialRulesFinal = "CST# 2029030-40<br><br>(c)2007 Expedia, Inc. All rights reserved. Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.<br><br>(EMID: "+ID_a+""+ID_b+")(MD: %%=Format(Now()&#44; &#34;yyyyMMddhhmms&#34;)=%%)(EPID: %%sub_PAID%%)(ETID: %%jobid%%)";
	var eightHundred = "Need help planning or booking your trip?<br />Call our travel experts at 1-888-303-9733.";
	
	// ///////////////////////////////////////////////////////////////////////
	//	Variables extracted from the XML document nodes and their attributes:
	////////////////////////////////////////////////////////////////////////// 
	var node = "";
	var node = xmlObj.childNodes[1].childNodes[1].childNodes;
	
	for (var a = 0; a < node.length; a++)
	{
		cNodes = node[a];
		// /////////////////////////////////////////////////////////////////
		// EYEBROW NODE
		// ///////////////////////////////////////////////////////////////// 
		
		
		if (cNodes.tagName == "eyebrowOffer") {
	        var eyebrowText     = (cNodes.getAttribute("eyebrowText") != "lorem ipsum dolor:") ? cNodes.getAttribute("eyebrowText") : "";
		    var eyebrowBlurb    = (cNodes.getAttribute("eyebrowText") != "lorem ipsum dolor:") ? cNodes.getAttribute("eyebrowBlurb") : "";
		    var eyebrowLink     = (cNodes.getAttribute("eyebrowText") != "lorem ipsum dolor:") ? cNodes.getAttribute("link") : "";
		}
		
		// /////////////////////////////////////////////////////////////////
		// HERO MODULE NODE
		// ///////////////////////////////////////////////////////////////// 
		
		if (cNodes.tagName == "heroModule") {
			var heroModuleAltText   = (cNodes.getAttribute("altText") != "Lorem ipsum dolar") ? cNodes.getAttribute("altText") : "";
			var heroModuleURL       = (cNodes.getAttribute("altText") != "Lorem ipsum dolar") ? cNodes.getAttribute("url") : "";
			
			var HeroModule_subHeadline      = [];
			var HeroModule_paragraph        = [];
			var HeroModule_paragraphLink    = [];
			var HeroModule_paragraphLinks   = [];
			var counter = cNodes.childNodes;
			for (z = 0; z < counter.length; z++)
			{
				var subChildNodes = counter[z];
				var HeroModule_headline1 = (subChildNodes.tagName == "headline" && subChildNodes.text != "Header max 30 chars, bold, 16px, can wrap to next line") ? subChildNodes.text : "";
				HeroModule_subHeadline[z] = (subChildNodes.tagName == "my:subheadline" && subChildNodes.text != "lorem ipsum") ? subChildNodes.text : "";
				var reg = /\<li\>/g;
				HeroModule_paragraph[z] = (subChildNodes.tagName == "para" && subChildNodes.text != "Lorem ipsum dolar quia voluptas") ? subChildNodes.text.replace(reg, "<br>- ") : "";
				HeroModule_paragraphLink[z] = (subChildNodes.tagName == "para" && subChildNodes.text != "Lorem ipsum dolar quia voluptas") ? HeroModule_paragraph[z].match(/http\:\/\/[^\"]+/g) : "";
				HeroModule_paragraphLinks[z] = (subChildNodes.tagName == "para" && subChildNodes.text != "Lorem ipsum dolar quia voluptas") ? HeroModule_paragraph[z].match(/https\:\/\/[^\"]+/g) : "";
//				if (subChildNodes.tagName == "headline" && subChildNodes.text != "Header max 30 chars, bold, 16px, can wrap to next line")
//				{
//					var HeroModule_headline1 = subChildNodes.text;
//				}
//				if (subChildNodes.tagName == "my:subheadline" && subChildNodes.text != "lorem ipsum")
//				{
//					HeroModule_subHeadline[z] = subChildNodes.text;
//				}
//				if (subChildNodes.tagName == "para" && subChildNodes.text != "Lorem ipsum dolar quia voluptas")
//				{
//					var reg = /\<li\>/g;
//					HeroModule_paragraph[z] = subChildNodes.text.replace(reg, "<br>- ");
//					HeroModule_paragraphLink[z] = HeroModule_paragraph[z].match(/http\:\/\/[^\"]+/g); 
//					HeroModule_paragraphLinks[z] = HeroModule_paragraph[z].match(/https\:\/\/[^\"]+/g);
//				}
			}	
		}
	}
	
	// //////////////////////////////////////////////////////////////////
	// FIRST MAIN MODULE NODE
	// //////////////////////////////////////////////////////////////////
	
	if (xmlObj.childNodes[1].childNodes[1].childNodes[3].tagName == "mainModule")
	{
		var x = xmlObj.childNodes[1].childNodes[1].childNodes[3].childNodes;
		var MainModule_headline0 = null;
		var MainModule_paragraph = new Array();
		var MainModule_paragraphLink = new Array();
		var MainModule_paragraphLinks = new Array();
		var MainModule_destOffer = new Array();
		var MainModule_destOfferBlurb = new Array();
		var MainModule_destOfferLink = new Array();
		var MainModule_offerText = new Array();
		var MainModule_offerStar = new Array();
		var MainModule_offerBlurb = new Array();
		var MainModule_offerBlurbLink = new Array();
		var MainModule_offerLink = new Array();
		for (var i = 0; i < x.length; i++)
		{
			if (x[i].tagName == "headline")
			{
				if (x[i].text != "Lorem ipsum dolar")
				{
					MainModule_headline0 = x[i].text;
				}
			}
			if (x[i].tagName == "para")
			{
				if (x[i].text != "Lorem ipsum dolar quia ma")
				{
					var rg = /\<li\>/g;
					MainModule_paragraph[i] = x[i].text.replace(rg, "<br>- ");
					MainModule_paragraphLink[i] = MainModule_paragraph[i].match(/http\:\/\/[^\"]+/g);
					MainModule_paragraphLinks[i] = MainModule_paragraph[i].match(/https\:\/\/[^\"]+/g);
				}
			}
			if (x[i].tagName == "offerGroup")
			{
				if (x[i].childNodes[0].getAttribute("my:destination") != "Lorem ipsum city name")
				{
					if (x[i].childNodes[0].getAttribute("my:destination") == "US" || x[i].childNodes[0].getAttribute("my:destination") == "Canada" || x[i].childNodes[0].getAttribute("my:destination") == "Book early to get the best rates")
					{
					}
					else
					{
					    MainModule_destOffer[i] = x[i].childNodes[0].getAttribute("my:destination");
					}
					if (x[i].childNodes[0].getAttribute("my:blurb") != "lorem ipsum and stuff")
					{
					    MainModule_destOfferBlurb[i] = x[i].childNodes[0].getAttribute("my:blurb");
					}
					if (x[i].childNodes[0].getAttribute("my:link") != "ADD_URL")
					{
					    MainModule_destOfferLink[i] = x[i].childNodes[0].getAttribute("my:link");
					}
				}
				// ///////////////////////////////////////////////////////////
				// The old code below was
				// if (x[i].childNodes.length > 0)
				// It has been changed to what you see but may still generate
				// some errors later on
				// //////////////////////////////////////////////////////////
				if (x[i].childNodes.length >= 2)
				{
					if (x[i].childNodes[1].getAttribute("text") == "Lorem ipsum" || x[i].childNodes[1].getAttribute("text") == "lorem ipsum")
					{
					}
					else
					{
						if (x[i].childNodes[1].getAttribute("text").match(/\®/))
						{
							MainModule_offerText[i] = x[i].childNodes[1].getAttribute("text").replace("®", "(R)");
						}
						else
						{
							MainModule_offerText[i] = x[i].childNodes[1].getAttribute("text");
						}
						MainModule_offerStar[i] = x[i].childNodes[1].getAttribute("star");
						switch (MainModule_offerStar[i])
						{
							case "0":
							MainModule_offerStar[i] = "";
							break;
							case "2_0":
							MainModule_offerStar[i] = " (2 stars) - ";
							break;
							case "2_5":
							MainModule_offerStar[i] = " (2 1/2 stars) - ";
							break;
							case "3_0":
							MainModule_offerStar[i] = " (3 stars) - ";
							break;
							case "3_5":
							MainModule_offerStar[i] = " (3 1/2 stars) - ";
							break;
							case "4_0":
							MainModule_offerStar[i] = " (4 stars) - ";
							break;
							case "4_5":
							MainModule_offerStar[i] = " (4 1/2 stars) - ";
							break;
							case "5_0":
							MainModule_offerStar[i] = " (5 stars) - ";
							break;
						}
						MainModule_offerBlurb[i] = x[i].childNodes[1].getAttribute("blurb");
						MainModule_offerBlurbLink[i] = MainModule_offerBlurb[i].match(/http\:\/\/[^\"]+/g);
						if (x[i].childNodes[1].getAttribute("link") == "Add URL Here")
						{
						}
						else
						{
						    MainModule_offerLink[i] = x[i].childNodes[1].getAttribute("link");
						}
						
						var siblings = x[i].childNodes;
						var MainModule_offerTextA = new Array();
						var MainModule_offerBlurbA = new Array();
						var MainModule_offerLinkA = new Array();
						for (var ee = 0; ee < siblings.length; ee++)
						{
							if (ee == 2)
							{
								MainModule_offerTextA[ee] = siblings[ee].getAttribute("text");
								MainModule_offerBlurbA[ee] = siblings[ee].getAttribute("blurb");
								MainModule_offerLinkA[ee] = siblings[ee].getAttribute("link");
								if (MainModule_offerTextA[ee])
								{
								    document.getElementById("MainModule_offerTextA"+i+""+ee).style.cssText = "display:inline;";
                                    document.getElementById("MainModule_offerTextA"+i+""+ee).innerHTML = MainModule_offerTextA[ee];
                                    document.getElementById("MainModule_offerBlurbA"+i+""+ee).style.cssText = "display:inline;";
                                    document.getElementById("MainModule_offerBlurbA"+i+""+ee).innerHTML = MainModule_offerBlurbA[ee]+"<br>";
                                    document.getElementById("MainModule_offerLinkA"+i+""+ee).style.cssText = "display:inline;";
                                    document.getElementById("MainModule_offerLinkA"+i+""+ee).innerHTML = MainModule_offerLinkA[ee]+sOMNITURE+"<br><br>";
								}
							}
							if (ee == 3)
							{
								var MainModule_offerTextB = x[i].childNodes[3].getAttribute("text");
								var MainModule_offerBlurbB = x[i].childNodes[3].getAttribute("blurb");
								var MainModule_offerLinkB = x[i].childNodes[3].getAttribute("link");
							}
							if (ee == 4)
							{
								var MainModule_offerTextC = x[i].childNodes[4].getAttribute("text");
								var MainModule_offerBlurbC = x[i].childNodes[4].getAttribute("blurb");
								var MainModule_offerLinkC = x[i].childNodes[4].getAttribute("link");
							}
							if (ee == 5)
							{
								var MainModule_offerTextD = x[i].childNodes[5].getAttribute("text");
								var MainModule_offerBlurbD = x[i].childNodes[5].getAttribute("blurb");
								var MainModule_offerLinkD = x[i].childNodes[5].getAttribute("link");
							}
							if (ee == 6)
							{
								var MainModule_offerTextE = x[i].childNodes[6].getAttribute("text");
								var MainModule_offerBlurbE = x[i].childNodes[6].getAttribute("blurb");
								var MainModule_offerLinkE = x[i].childNodes[6].getAttribute("link");
							}
						}
					}
				}
			}
			if (x[i].tagName == "callToAction" && x[i].getAttribute("show") == "yes")
			{
				var MainModule_callToActionContent = x[i].getAttribute("content");
				if (x[i].getAttribute("link") == "")
				{
				    var MainModule_callToActionLink = eyebrowLink;
				}
				else
				{
				    var MainModule_callToActionLink = x[i].getAttribute("link");
				}	
			}
		}
	}

	// /////////////////////////////////////////////////////////////////
	// Test for the existence of a SECOND OFFER MODULE or a 
	// SECOND and THIRD MAIN MODULE
	// /////////////////////////////////////////////////////////////////
	
	for (bb = 0; bb < node.length; bb++)
	{
		if (bb == 4)
		{
			// ////////////////////////////////////////////////
			// SECOND MAIN MODULE NODE
			// ////////////////////////////////////////////////
			if (xmlObj.childNodes[1].childNodes[1].childNodes[4].tagName == "mainModule")
			{
				var q = xmlObj.childNodes[1].childNodes[1].childNodes[4].childNodes;
				var MainModule2_paragraph = new Array();
				var MainModule2_paragraphLink = new Array();
				var MainModule2_destOffer = new Array();
		        var MainModule2_destOfferBlurb = new Array();
		        var MainModule2_destOfferLink = new Array();
				var MainModule2_offerText = new Array();
				var MainModule2_offerStar = new Array();
				var MainModule2_offerBlurb = new Array();
				var MainModule2_offerLink = new Array();
			
				for (var i = 0; i < q.length; i++)
				{
					if (q[i].tagName == "headline" && q[i].text != "Lorem ipsum dolar")
					{
							var MainModule2_headline0 = q[i].text;
					}
					if(q[i].tagName == "para" && q[i].text != "Lorem ipsum dolar quia ma")
					{
						// TODO: alert(q[i].text.match(/\<br\>+/i));  Looking for a <br> tag in the paragraph that creates new lines
						var reg = /\<\li\>/g;
						MainModule2_paragraph[i] = q[i].text.replace(reg, "<br>- ");
						MainModule2_paragraphLink[i] = MainModule2_paragraph[i].match(/http\:\/\/[^\"]+/g)  || MainModule2_paragraph[i].match(/https\:\/\/[^\"]+/i);
					}
					if (q[i].tagName == "offerGroup")
					{
					    if (q[i].childNodes[0].getAttribute("my:blurb") != "lorem ipsum and stuff")
				        {
					        var MainModule2_destGroup = q[i].childNodes[0].getAttribute("my:blurb");
				        }
				        if (q[i].childNodes[0].getAttribute("my:destination") != "Lorem ipsum city name")
				        {
					        if (q[i].childNodes[0].getAttribute("my:destination") == "US" || q[i].childNodes[0].getAttribute("my:destination") == "Canada" || q[i].childNodes[0].getAttribute("my:destination") == "Book early to get the best rates")
					        {
					        }
					        else
					        {
					            MainModule2_destOffer[i] = q[i].childNodes[0].getAttribute("my:destination");
					        }
					        if (q[i].childNodes[0].getAttribute("my:blurb") != "lorem ipsum and stuff")
					        {
					            MainModule2_destOfferBlurb[i] = q[i].childNodes[0].getAttribute("my:blurb");
					        }
					        MainModule2_destOfferLink[i] = q[i].childNodes[0].getAttribute("my:link");
				        }
					    if (q[i].childNodes.length > 0) //== 2 || q[i].childNodes.length == 5)
					    {
						    if (q[i].childNodes[1].getAttribute("text") == "Lorem ipsum" || q[i].childNodes[1].getAttribute("text") == "lorem ipsum")
						    {
						    }
						    else
						    {
							    MainModule2_offerText[i] = q[i].childNodes[1].getAttribute("text");
							    MainModule2_offerStar[i] = q[i].childNodes[1].getAttribute("star");
							    switch(MainModule2_offerStar[i])
							    {
								    case "0":
								    MainModule2_offerStar[i] = "";
								    break;
								    case "2_0":
								    MainModule2_offerStar[i] = " (2 stars) - ";
								    break;
								    case "2_5":
								    MainModule2_offerStar[i] = " (2 1/2 stars) - ";
								    break;
								    case "3_0":
								    MainModule2_offerStar[i] = " (3 stars) - ";
								    break;
								    case "3_5":
								    MainModule2_offerStar[i] = " (3 1/2 stars) - ";
								    break;
								    case "4_0":
								    MainModule2_offerStar[i] = " (4 stars) - ";
								    break;
								    case "4_5":
								    MainModule2_offerStar[i] = " (4 1/2 stars) - ";
								    break;
								    case "5_0":
								    MainModule2_offerStar[i] = " (5 stars) - ";
								    break;
							    }
							    MainModule2_offerBlurb[i] = q[i].childNodes[1].getAttribute("blurb");
							    MainModule2_offerLink[i] = q[i].childNodes[1].getAttribute("link");
							
							    // TODO: This is the area where new code may be needed for completion
							    var o_siblings = q[i].childNodes;
							    for (var kb = 0; kb < o_siblings.length; kb++)
							    {
								    if (kb == 2)
								    {
									    var MainModule2_offerTextA = q[i].childNodes[2].getAttribute("text");
									    var MainModule2_offerBlurbA = q[i].childNodes[2].getAttribute("blurb");
									    var MainModule2_offerLinkA = q[i].childNodes[2].getAttribute("link");
								    }
								    if (kb == 3)
								    {
									    var MainModule2_offerTextB = q[i].childNodes[3].getAttribute("text");
									    var MainModule2_offerBlurbB = q[i].childNodes[3].getAttribute("blurb");
									    var MainModule2_offerLinkB = q[i].childNodes[3].getAttribute("link");
								    }
								    if (kb == 4)
								    {
									    var MainModule2_offerTextC = q[i].childNodes[4].getAttribute("text");
									    var MainModule2_offerBlurbC = q[i].childNodes[4].getAttribute("blurb");
									    var MainModule2_offerLinkC = q[i].childNodes[4].getAttribute("link");
								    }
							    }
						    }
					    }
					}
					if (q[i].tagName == "callToAction" && q[i].getAttribute("show") == "yes")
					{
						var MainModule2_callToActionContent = q[i].getAttribute("content");
						if (q[i].getAttribute("link") == "")
						{
						    var MainModule2_callToActionLink = eyebrowLink; 
						}
						else
						{
						    var MainModule2_callToActionLink = q[i].getAttribute("link");
						}
					}
				}
			}
			// ////////////////////////////////
			// Start of the FIRST OFFER MODULE 
			// ////////////////////////////////
			if (xmlObj.childNodes[1].childNodes[1].childNodes[4].tagName == "offerModule" && xmlObj.childNodes[1].childNodes[1].childNodes[4].getAttribute("show") == "yes")
			{
				var f = xmlObj.childNodes[1].childNodes[1].childNodes[4].childNodes;
				var OfferModule_offerTitle = new Array();
				var OfferModule_textLine = new Array();
				var OfferModule_textLineOneURL = new Array();
				var OfferModule_textLineBlurb = new Array();
				var OfferModule_textLineURL = new Array();
				for(var l = 0; l < f.length; l++)
				{
					if (f[l].tagName == "headline")
					{
						
						var OfferModule_headline0 = f[l].text;
					}
					if (f[l].tagName == "para" && f[l].text != "Lorem ipsum dolor")
					{
							var OfferModule_paragraph0 = f[l].text;
					}
					if (f[l].tagName == "offer")
					{
						if (f[l].getAttribute("title") != "Lorem ipsum dolor" && f[l].getAttribute("title") != "Mexico cruise" && f[l].getAttribute("title") != "Carribean cruise")
						{
							OfferModule_offerTitle[l] = f[l].getAttribute("title");
							OfferModule_textLine[l] = f[l].childNodes[0].text;
							if (f[l].childNodes[0].getAttribute("url") != "URL GOES HERE")
							{
								OfferModule_textLineOneURL[l] = f[l].childNodes[0].getAttribute("url");
							}
							var offersibs = f[l].childNodes;
							for (var fg = 0; fg < offersibs.length; fg++)
							{
								if (fg == 1)
								{
									OfferModule_textLineBlurb[l] = f[l].childNodes[1].text;
									OfferModule_textLineURL[l] = f[l].childNodes[1].getAttribute("url");
								}
							}
						}
					}
					if (f[l].tagName == "my:singleOffer" && f[l].childNodes[0].text != "lorem ipsum" && f[l].childNodes[0].text != "orem ipsum")
					{
						var OfferModule_singleHeadline1 = f[l].childNodes[0].text;
						var OfferModule_mypara1 = f[l].childNodes[1].text;
						var OfferModule_myparaLink1 = OfferModule_mypara1.match(/http\:\/\/[^\"]+/i);
					}
					if (f[l].tagName == "bannerAd")
					{
						var BannerAdAltText = f[l].getAttribute("altText");
						var BannerAdLink = f[l].getAttribute("link");
					}
				}
		
			}
		}
		// ////////////////////////////
		// THIRD MAIN MODULE
		// ///////////////////////////
		if (bb == 5)
		{
			if (xmlObj.childNodes[1].childNodes[1].childNodes[5].tagName == "mainModule")
			{
				var bc = xmlObj.childNodes[1].childNodes[1].childNodes[5].childNodes;
				var MainModule3_paragraph = new Array();
				var MainModule3_paragraphLink = new Array();
				var MainModule3_paragraphLinks = new Array();
				var MainModule3_offerText = new Array();
				var MainModule3_offerStar = new Array();
				var MainModule3_offerBlurb = new Array();
				var MainModule3_offerLink = new Array();
				for (var hh = 0; hh < bc.length; hh++)
				{
					if (bc[hh].tagName == "headline" && bc[hh].text != "Lorem ipsum dolar")
					{
						var MainModule3_headline1 = bc[hh].text;
					}
					if (bc[hh].tagName == "para" && bc[hh].text != "Lorem ipsum dolar quia ma")
					{
						MainModule3_paragraph[hh] = bc[hh].text;
						MainModule3_paragraphLink[hh] = MainModule3_paragraph[hh].match(/http\:\/\/[^\"]+/g); 
						MainModule3_paragraphLinks[hh] = MainModule3_paragraph[hh].match(/https\:\/\/[^\"]+/g);
					}
					if (bc[hh].tagName == "offerGroup")
					{
						if (bc[hh].childNodes[1].getAttribute("text") == "Lorem ipsum" || bc[hh].childNodes[1].getAttribute("text") == "lorem ipsum")
						{
						}
						else
						{
							MainModule3_offerText[hh] = bc[hh].childNodes[1].getAttribute("text");
							MainModule3_offerStar[hh] = bc[hh].childNodes[1].getAttribute("star");
							switch(MainModule3_offerStar[hh])
							{
								case "0":
								MainModule3_offerStar[hh] = "";
								break;
								case "2_0":
								MainModule3_offerStar[hh] = " (2 stars) - ";
								break;
								case "2_5":
								MainModule3_offerStar[hh] = " (2 1/2 stars) - ";
								break;
								case "3_0":
								MainModule3_offerStar[hh] = " (3 stars) - ";
								break;
								case "3_5":
								MainModule3_offerStar[hh] = " (3 1/2 stars) - ";
								break;
								case "4_0":
								MainModule3_offerStar[hh] = " (4 stars) - ";
								break;
								case "4_5":
								MainModule3_offerStar[hh] = " (4 1/2 stars) - ";
								break;
								case "5_0":
								MainModule3_offerStar[hh] = " (5 stars) - ";
								break;
							}
							MainModule3_offerBlurb[hh] = bc[hh].childNodes[1].getAttribute("blurb");
							MainModule3_offerLink[hh] = bc[hh].childNodes[1].getAttribute("link");
							
							// TODO: This is the area where new code may be needed for completion
						    var c_siblings = bc[hh].childNodes;
						    for (var mb = 0; mb < c_siblings.length; mb++)
						    {
							    if (mb == 2)
							    {
								    var MainModule3_offerTextA = bc[hh].childNodes[2].getAttribute("text");
								    var MainModule3_offerBlurbA = bc[hh].childNodes[2].getAttribute("blurb");
								    var MainModule3_offerLinkA = bc[hh].childNodes[2].getAttribute("link");
							    }
							    if (mb == 3)
							    {
								    var MainModule3_offerTextB = bc[hh].childNodes[3].getAttribute("text");
								    var MainModule3_offerBlurbB = bc[hh].childNodes[3].getAttribute("blurb");
								    var MainModule3_offerLinkB = bc[hh].childNodes[3].getAttribute("link");
							    }
							    if (mb == 4)
							    {
								    var MainModule3_offerTextC = bc[hh].childNodes[4].getAttribute("text");
								    var MainModule3_offerBlurbC = bc[hh].childNodes[4].getAttribute("blurb");
								    var MainModule3_offerLinkC = bc[hh].childNodes[4].getAttribute("link");
							    }
						    }
						}
					}
					if (bc[hh].tagName == "callToAction" && bc[hh].getAttribute("show") == "yes")
					{
						var MainModule3_callToActionContent = bc[hh].getAttribute("content");
						var MainModule3_callToActionLink = bc[hh].getAttribute("link");
					}
				}
			}
			// //////////////////////////////
			// SECOND OFFER MODULE
			// //////////////////////////////
			if (xmlObj.childNodes[1].childNodes[1].childNodes[5].tagName == "offerModule" && xmlObj.childNodes[1].childNodes[1].childNodes[5].getAttribute("show") == "yes")
			{
				var ff = xmlObj.childNodes[1].childNodes[1].childNodes[5].childNodes;
				var OfferModule2_offerTitle = new Array();
				var OfferModule2_textLine = new Array();
				var OfferModule2_textLineBlurb = new Array();
				var OfferModule2_textLineBlurbTwo = new Array();
				var OfferModule2_textLineURL1 = new Array();
				var OfferModule2_textLineURL = new Array();
				var OfferModule2_textLineURLTwo = new Array();
				for (aa = 0; aa < ff.length; aa++)
				{
					if (ff[aa].tagName == "headline" && ff[aa].text != "Lorem ipsum dolar")
					{
						var OfferModule2_headline1 = ff[aa].text;
					}
					if (ff[aa].tagName == "para" && ff[aa].text != "Lorem ipsum dolor quia")
					{
						var OfferModule2_paragraph1 = ff[aa].text;
					}
					if (ff[aa].tagName == "offer" && ff[aa].getAttribute("title") != "Lorem ipsum dolor" && ff[aa].getAttribute("title") != "Mexico cruise" && ff[aa].getAttribute("title") != "Carribean cruise")
					{
						OfferModule2_offerTitle[aa] = ff[aa].getAttribute("title");
						OfferModule2_textLine[aa] = ff[aa].childNodes[0].text;
						OfferModule2_textLineURL1[aa] = ff[aa].childNodes[0].getAttribute("url");
						if (ff[aa].childNodes.length == 2 || ff[aa].childNodes.length == 3)
						{
						    if (ff[aa].childNodes[1].text == "Lorem ipsum dolor")
						    {
						    }
						    else
						    {
						        OfferModule2_textLineBlurb[aa] = ff[aa].childNodes[1].text;
						        OfferModule2_textLineURL[aa] = ff[aa].childNodes[1].getAttribute("url");
						    }
						    if (ff[aa].childNodes.length > 2)
						    {
					            OfferModule2_textLineBlurbTwo[aa] = ff[aa].childNodes[2].text;
					            OfferModule2_textLineURLTwo[aa] = ff[aa].childNodes[2].getAttribute("url");
						    }
						}
					}
					if (ff[aa].tagName == "my:singleOffer" && ff[aa].childNodes[0].text != "lorem ipsum" && ff[aa].childNodes[0].text != "orem ipsum")
					{
						var OfferModule2_singleHeadline1 = ff[aa].childNodes[0].text;
						if (ff[aa].childNodes[1].text != "Possible PMI ad goes here.")
						{
						    var OfferModule2_mypara1 = ff[aa].childNodes[1].text;
						    var OfferModule2_myparaLink1 = OfferModule2_mypara1.match(/http\:\/\/[^\"]+/i);
						}
						
					}
					if (ff[aa].tagName == "bannerAd")
					{
						var OfferModule2_BannerAdAltText = ff[aa].getAttribute("altText");
						var OfferModule2_BannerAdLink = ff[aa].getAttribute("link");
					}
				}
			}
		}
		if (bb == 6)
		{
			// /////////////////////////////////
			// THIRD OFFER MODULE
			// /////////////////////////////////
			if (xmlObj.childNodes[1].childNodes[1].childNodes[6].tagName == "offerModule")
			{
				var ff = xmlObj.childNodes[1].childNodes[1].childNodes[6].childNodes;
				var OfferModule3_offerTitle = new Array();
				var OfferModule3_textLine = new Array();
				var OfferModule3_textLineURL1 = new Array();
				var OfferModule3_textLineBlurb = new Array();
				var OfferModule3_textLineBlurbTwo = new Array();
				var OfferModule3_textLineURL = new Array();
				var OfferModule3_textLineURLTwo = new Array();
				for (aa = 0; aa < ff.length; aa++)
				{
					if (ff[aa].tagName == "headline" && ff[aa].text != "Lorem ipsum dolar")
					{
						var OfferModule3_headline1 = ff[aa].text;
					}
					if (ff[aa].tagName == "para" && ff[aa].text != "Lorem ipsum dolor quia")
					{
						var OfferModule3_paragraph1 = ff[aa].text;
					}
					if (ff[aa].tagName == "offer" && ff[aa].getAttribute("title") != "Lorem ipsum dolor" && ff[aa].getAttribute("title") != "Mexico cruise" && ff[aa].getAttribute("title") != "Carribean cruise")
					{
						OfferModule3_offerTitle[aa] = ff[aa].getAttribute("title");
						OfferModule3_textLine[aa] = ff[aa].childNodes[0].text;
						OfferModule3_textLineURL1[aa] = ff[aa].childNodes[0].getAttribute("url");
						if (ff[aa].childNodes[1].text != "Lorem ipsum dolor")
						{
						    OfferModule3_textLineBlurb[aa] = ff[aa].childNodes[1].text;
						    OfferModule3_textLineURL[aa] = ff[aa].childNodes[1].getAttribute("url");
						}
						if (ff[aa].childNodes.length > 2)
					    {
				            OfferModule3_textLineBlurbTwo[aa] = ff[aa].childNodes[2].text;
				            OfferModule3_textLineURLTwo[aa] = ff[aa].childNodes[2].getAttribute("url");
					    }
					}
					if (ff[aa].tagName == "my:singleOffer" && ff[aa].childNodes[0].text != "orem ipsum")
					{
						if (ff[aa].childNodes[0].text == "lorem ipsum")
						{
						}
						else
						{
						    var OfferModule3_singleHeadline1 = ff[aa].childNodes[0].text;
						    if (ff[aa].childNodes[1].text.match(/jpg/) != "jpg")
						    {
							    var OfferModule3_mypara1 = ff[aa].childNodes[1].text;
							    var OfferModule3_myparaLink1 = OfferModule3_mypara1.match(/http\:\/\/[^\"]+/g);
						    }
						}
					}
					if (ff[aa].tagName == "bannerAd")
					{
						var OfferModule3_BannerAdAltText = ff[aa].getAttribute("altText");
						var OfferModule3_BannerAdLink = ff[aa].getAttribute("link");
					}
				}
			}
			// //////////////////////////////
			// FOURTH MAIN MODULE
			// //////////////////////////////
			if (xmlObj.childNodes[1].childNodes[1].childNodes[6].tagName == "mainModule")
			{
				var jj = xmlObj.childNodes[1].childNodes[1].childNodes[6].childNodes;
				var MainModule4_paragraph = new Array();
				var MainModule4_paragraphLink = new Array();
				var MainModule4_paragraphLinks = new Array();
				var MainModule4_offerText = new Array();
				var MainModule4_offerStar = new Array();
				var MainModule4_offerBlurb = new Array();
				var MainModule4_offerLink = new Array();
				for (var pb = 0; pb < jj.length; pb++)
				{
					if (jj[pb].tagName == "headline" && jj[pb].text != "Lorem ipsum dolar")
					{
						var MainModule4_headline1 = jj[pb].text;
					}
					if (jj[pb].tagName == "para" && jj[pb].text != "Lorem ipsum dolar quia ma")
					{
						MainModule4_paragraph[pb] = jj[pb].text;
						MainModule4_paragraphLink[pb] = MainModule4_paragraph[pb].match(/http\:\/\/[^\"]+/g); 
						MainModule4_paragraphLinks[pb] = MainModule4_paragraph[pb].match(/https\:\/\/[^\"]+/g);
					}
					if (jj[pb].tagName == "offerGroup")
					{
						if (jj[pb].childNodes[1].getAttribute("text") == "Lorem ipsum" || jj[pb].childNodes[1].getAttribute("text") == "lorem ipsum")
						{
						}
						else
						{
							MainModule4_offerText[pb] = jj[pb].childNodes[1].getAttribute("text");
							MainModule4_offerStar[pb] = jj[pb].childNodes[1].getAttribute("star");
							switch(MainModule4_offerStar[pb])
							{
								case "0":
								MainModule4_offerStar[pb] = "";
								break;
								case "2_0":
								MainModule4_offerStar[pb] = " (2 stars) - ";
								break;
								case "2_5":
								MainModule4_offerStar[pb] = " (2 1/2 stars) - ";
								break;
								case "3_0":
								MainModule4_offerStar[pb] = " (3 stars) - ";
								break;
								case "3_5":
								MainModule4_offerStar[pb] = " (3 1/2 stars) - ";
								break;
								case "4_0":
								MainModule4_offerStar[pb] = " (4 stars) - ";
								break;
								case "4_5":
								MainModule4_offerStar[pb] = " (4 1/2 stars) - ";
								break;
								case "5_0":
								MainModule4_offerStar[pb] = " (5 stars) - ";
								break;
							}
							MainModule4_offerBlurb[pb] = jj[pb].childNodes[1].getAttribute("blurb");
							MainModule4_offerLink[pb] = jj[pb].childNodes[1].getAttribute("link");
							
							// TODO: This is the area where new code may be needed for completion
						    var z_siblings = jj[pb].childNodes;
						    for (var iz = 0; iz < z_siblings.length; iz++)
						    {
							    if (iz == 2)
							    {
								    var MainModule4_offerTextA = jj[pb].childNodes[2].getAttribute("text");
								    var MainModule4_offerBlurbA = jj[pb].childNodes[2].getAttribute("blurb");
								    var MainModule4_offerLinkA = jj[pb].childNodes[2].getAttribute("link");
							    }
							    if (iz == 3)
							    {
								    var MainModule4_offerTextB = jj[pb].childNodes[3].getAttribute("text");
								    var MainModule4_offerBlurbB = jj[pb].childNodes[3].getAttribute("blurb");
								    var MainModule4_offerLinkB = jj[pb].childNodes[3].getAttribute("link");
							    }
							    if (iz == 4)
							    {
								    var MainModule4_offerTextC = jj[pb].childNodes[4].getAttribute("text");
								    var MainModule4_offerBlurbC = jj[pb].childNodes[4].getAttribute("blurb");
								    var MainModule4_offerLinkC = jj[pb].childNodes[4].getAttribute("link");
							    }
						    }
						}
					}
					if (jj[pb].tagName == "callToAction" && jj[pb].getAttribute("show") == "yes")
					{
						var MainModule4_callToActionContent = jj[pb].getAttribute("content");
						var MainModule4_callToActionLink = jj[pb].getAttribute("link");
					}
				}
			}
		}
		if (bb == 7)
		{
		    // //////////////////////////
		    // FIFTH MAIN MODULE
		    // /////////////////////////
		    if (xmlObj.childNodes[1].childNodes[1].childNodes[7].tagName == "mainModule")
			{
				var vv = xmlObj.childNodes[1].childNodes[1].childNodes[7].childNodes;
				var MainModule5_paragraph = new Array();
				var MainModule5_paragraphLink = new Array();
				var MainModule5_paragraphLinks = new Array();
				var MainModule5_offerText = new Array();
				var MainModule5_offerStar = new Array();
				var MainModule5_offerBlurb = new Array();
				var MainModule5_offerLink = new Array();
				for (var ch = 0; ch < jj.length; ch++)
				{
					if (vv[ch].tagName == "headline" && vv[ch].text != "Lorem ipsum dolar")
					{
						var MainModule5_headline1 = vv[ch].text;
					}
					if (vv[ch].tagName == "para" && vv[ch].text != "Lorem ipsum dolar quia ma")
					{
						MainModule5_paragraph[ch] = vv[ch].text;
						MainModule5_paragraphLink[ch] = MainModule5_paragraph[ch].match(/http\:\/\/[^\"]+/g); 
						MainModule5_paragraphLinks[ch] = MainModule5_paragraph[ch].match(/https\:\/\/[^\"]+/g);
					}
					if (vv[ch].tagName == "offerGroup")
					{
						if (vv[ch].childNodes[1].getAttribute("text") == "Lorem ipsum" || vv[ch].childNodes[1].getAttribute("text") == "lorem ipsum")
						{
						}
						else
						{
							MainModule5_offerText[ch] = vv[ch].childNodes[1].getAttribute("text");
							MainModule5_offerStar[ch] = vv[ch].childNodes[1].getAttribute("star");
							switch(MainModule5_offerStar[ch])
							{
								case "0":
								MainModule5_offerStar[ch] = "";
								break;
								case "2_0":
								MainModule5_offerStar[ch] = " (2 stars) - ";
								break;
								case "2_5":
								MainModule5_offerStar[ch] = " (2 1/2 stars) - ";
								break;
								case "3_0":
								MainModule5_offerStar[ch] = " (3 stars) - ";
								break;
								case "3_5":
								MainModule5_offerStar[ch] = " (3 1/2 stars) - ";
								break;
								case "4_0":
								MainModule5_offerStar[ch] = " (4 stars) - ";
								break;
								case "4_5":
								MainModule5_offerStar[ch] = " (4 1/2 stars) - ";
								break;
								case "5_0":
								MainModule5_offerStar[ch] = " (5 stars) - ";
								break;
							}
							MainModule5_offerBlurb[ch] = vv[ch].childNodes[1].getAttribute("blurb");
							MainModule5_offerLink[ch] = vv[ch].childNodes[1].getAttribute("link");
							
							// TODO: This is the area where new code may be needed for completion
						    var cb_siblings = vv[ch].childNodes;
						    for (var jz = 0; jz < cb_siblings.length; jz++)
						    {
							    if (jz == 2)
							    {
								    var MainModule5_offerTextA = vv[ch].childNodes[2].getAttribute("text");
								    var MainModule5_offerBlurbA = vv[ch].childNodes[2].getAttribute("blurb");
								    var MainModule5_offerLinkA = vv[ch].childNodes[2].getAttribute("link");
							    }
							    if (jz == 3)
							    {
								    var MainModule5_offerTextB = vv[ch].childNodes[3].getAttribute("text");
								    var MainModule5_offerBlurbB = vv[ch].childNodes[3].getAttribute("blurb");
								    var MainModule5_offerLinkB = vv[ch].childNodes[3].getAttribute("link");
							    }
							    if (jz == 4)
							    {
								    var MainModule5_offerTextC = vv[ch].childNodes[4].getAttribute("text");
								    var MainModule5_offerBlurbC = vv[ch].childNodes[4].getAttribute("blurb");
								    var MainModule5_offerLinkC = vv[ch].childNodes[4].getAttribute("link");
							    }
						    }
						}
					}
					if (vv[ch].tagName == "callToAction" && vv[ch].getAttribute("show") == "yes")
					{
						var MainModule5_callToActionContent = vv[ch].getAttribute("content");
						var MainModule5_callToActionLink = vv[ch].getAttribute("link");
					}
				}
			}
		}
		if (bb == 8)
		{
		    // /////////////////////////////////
			// OFFER MODULE AT NODE POSITION 8
			// /////////////////////////////////
			if (xmlObj.childNodes[1].childNodes[1].childNodes[8].tagName == "offerModule")
			{
			    var arc = xmlObj.childNodes[1].childNodes[1].childNodes[8].childNodes;
			    for (krc = 0; krc < arc.length; krc++)
				{
				    if (arc[krc].tagName == "bannerAd")
					{
						var OfferModule4_BannerAdAltText = arc[krc].getAttribute("altText");
						var OfferModule4_BannerAdLink = arc[krc].getAttribute("link");
					}   
				}
			}
		}
	}

	//  ////////////////////////////////////////////////////////////////////////////
	//  End of TEMPLATE NODE . . . Start of TERMS & CONDITIONS (SPECIAL RULES NODES)
	//  ////////////////////////////////////////////////////////////////////////////
	
	var tc_nodes = xmlObj.childNodes[1].childNodes;
	var TermsAndConditionsContentLink = new Array();
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
					var TermsAndConditionsContent = TC_nodes.text.replace("®", "(R)");
				}
				else
				{
					var TermsAndConditionsContent = TC_nodes.text;
				}
				
				TermsAndConditionsContentLink[tc] = TermsAndConditionsContent.match(/http\:\/\/[^\"]+/g);
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
	
	
	// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//	
	//	CONDITIONAL STATEMENTS TO RENDER THE NODE AND ATTRIBUTE VALUES THAT HAVE BEEN EXTRACTED FROM THE XML DOCUMENT
	//
	// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//document.getElementById("addressHeader").style.cssText = "display:inline;";
	//document.getElementById("addressHeader").innerHTML = addressHeader;
	document.getElementById("eight_hundred").style.cssText = "display:inline;";
	document.getElementById("eight_hundred").innerHTML = eightHundred;
	// ///////////////
	// EYEBROW TEXT
	// ///////////////
	if (eyebrowText)
	{
		document.getElementById("eyebrowText").style.cssText = "display:inline;";
		document.getElementById("eyebrowBlurb").style.cssText = "display:inline;";
		document.getElementById("eyebrowLink").style.cssText = "display:inline;";
		document.getElementById("eyebrowText").innerHTML = eyebrowText;
		document.getElementById("eyebrowBlurb").innerHTML = eyebrowBlurb+".<br>";
		document.getElementById("eyebrowLink").innerHTML = eyebrowLink+sOMNITURE+"<br><br>";
	}
	// ////////////
	// HERO MODULE
	// ////////////
	if (heroModuleAltText)
	{
		document.getElementById("heroModuleAltText").style.cssText = "display:inline;";
		document.getElementById("heroModuleURL").style.cssText = "display:inline;";
		document.getElementById("heroModuleAltText").innerHTML = heroModuleAltText+".<br>";
		document.getElementById("heroModuleURL").innerHTML = eyebrowLink+sOMNITURE+"<br><br>";
	}
	if (HeroModule_headline1)
	{
		if (HeroModule_headline1)
		{
			document.getElementById("HeroModule_headline1").style.cssText = "display:inline;";
			document.getElementById("HeroModule_headline1").innerHTML = HeroModule_headline1+"<br>";
		}
	}
	var sublen = HeroModule_subHeadline.length;
	for (var rb = 0; rb < sublen; rb++)
	{
		if (HeroModule_subHeadline[rb])
		{
			document.getElementById("HeroModule_subHeadline"+rb).style.cssText = "display:inline;";
			document.getElementById("HeroModule_subHeadline"+rb).innerHTML = HeroModule_subHeadline[rb]+"<br>";
		}
	}
	var leng = HeroModule_paragraph.length;
	for (var d = 0; d < leng; d++)
	{
		if (HeroModule_paragraph[d])
		{
			document.getElementById("HeroModule_paragraph"+d).style.cssText = "display:inline;";
			if (HeroModule_paragraphLinks[d])
		    {
			    document.getElementById("HeroModule_paragraphLinks"+d).style.cssText = "display:inline;";
			    document.getElementById("HeroModule_paragraphLinks"+d).innerHTML = HeroModule_paragraphLinks[d]+"<br>";
		    }
			if (!HeroModule_paragraphLink[d])
			{
				document.getElementById("HeroModule_paragraph"+d).innerHTML = HeroModule_paragraph[d]+"<br><br>";
			}
			else
			{
				document.getElementById("HeroModule_paragraph"+d).innerHTML = HeroModule_paragraph[d]+"<br>";
			}
			if (HeroModule_paragraphLink[d])
			{
				document.getElementById("HeroModule_paragraphLink"+d).style.cssText = "display:inline;";
				if (HeroModule_paragraphLink[d][0])
				{
					document.getElementById("HeroModule_paragraphLink"+d).innerHTML = HeroModule_paragraphLink[d][0]+"<br>";
				}
				if (HeroModule_paragraphLink[d][1])
				{
					document.getElementById("HeroModule_paragraphLink"+d).innerHTML += HeroModule_paragraphLink[d][1]+"<br>";
				}
				if (HeroModule_paragraphLink[d][2])
				{
					document.getElementById("HeroModule_paragraphLink"+d).innerHTML += HeroModule_paragraphLink[d][2]+"<br>";
				}
				if (HeroModule_paragraphLink[d])
				{
					document.getElementById("HeroModule_paragraphLink"+d).innerHTML += "<br>";
				}
			}
		}
	}
	// //////////////////
	// FIRST MAIN MODULE
	// //////////////////
	if (MainModule_headline0)
	{
		document.getElementById("MainModule_headline0").style.cssText = "display:inline;";
		document.getElementById("MainModule_headline0").innerHTML = MainModule_headline0+"<br>";
	}
	if (MainModule_paragraph)
	{
	    var pcount = MainModule_paragraph.length;
	    for (var h = 0; h < pcount; h++)
	    {
		    if (MainModule_paragraph[h])
		    {
			    if (MainModule_paragraph[h].match(/\<br\>/))
			    {
				    document.getElementById("MainModule_paragraph"+h).style.cssText = "display:inline;";
				    document.getElementById("MainModule_paragraph"+h).innerHTML = MainModule_paragraph[h]+"<br>";
			    }
			    else
			    {
				    document.getElementById("MainModule_paragraph"+h).style.cssText = "display:inline;";
				    document.getElementById("MainModule_paragraph"+h).innerHTML = "<br>"+MainModule_paragraph[h]+"<br>";
			    }
			    if (MainModule_paragraphLinks[h])
			    {
				    document.getElementById("MainModule_paragraphLinks"+h).style.cssText = "display:inline;";
				    document.getElementById("MainModule_paragraphLinks"+h).innerHTML = "<br>"+MainModule_paragraphLinks[h]+"<br>";
			    }
			    if (MainModule_paragraphLink[h])
			    {
    				
				    document.getElementById("MainModule_paragraphLink"+h).style.cssText = "display:inline;";
				    if (MainModule_paragraphLink[h][0])
				    {
					    document.getElementById("MainModule_paragraphLink"+h).innerHTML = MainModule_paragraphLink[h][0]+"<br>";
				    }
				    if (MainModule_paragraphLink[h][1])
				    {
					    document.getElementById("MainModule_paragraphLink"+h).innerHTML += MainModule_paragraphLink[h][1]+"<br>";
				    }
				    if (MainModule_paragraphLink[h][2])
				    {
					    document.getElementById("MainModule_paragraphLink"+h).innerHTML += MainModule_paragraphLink[h][2]+"<br>";
				    }
				    if (MainModule_paragraphLink[h][3])
				    {
					    document.getElementById("MainModule_paragraphLink"+h).innerHTML += MainModule_paragraphLink[h][3]+"<br>";
				    }
				    if (MainModule_paragraphLink[h])
				    {
					    document.getElementById("MainModule_paragraphLink"+h).innerHTML += "<br>";
				    }
			    }
		    }
	    }
	}
	if (MainModule_destOffer)
	{
	    for (var bj = 0; bj < MainModule_destOffer.length; bj++)
	    {
	        if (MainModule_destOffer[bj] != undefined)
	        {
			    document.getElementById("MainModule_destOffer"+bj).style.cssText = "display:inline;";
			    if (!MainModule_destOfferLink[bj])
			    {
				    document.getElementById("MainModule_destOffer"+bj).innerHTML = MainModule_destOffer[bj]+"<br><br>";
			    }
			    else
			    {
				    document.getElementById("MainModule_destOffer"+bj).innerHTML = MainModule_destOffer[bj]+" ";
				    document.getElementById("MainModule_destOfferBlurb"+bj).style.cssText = "display:inline;";
				    document.getElementById("MainModule_destOfferBlurb"+bj).innerHTML = MainModule_destOfferBlurb[bj]+"<br>";
				    document.getElementById("MainModule_destOfferLink"+bj).style.cssText = "display:inline;";
				    document.getElementById("MainModule_destOfferLink"+bj).innerHTML = MainModule_destOfferLink[bj]+sOMNITURE+"<br><br>";
			    }
		    }
	    }
	}
	if (MainModule_offerText || MainModule_offerBlurb)
	{
		var ocount = MainModule_offerText.length;
		for (var j = 0; j < ocount; j++)
		{
			if (MainModule_destOfferBlurb[j] == MainModule_offerBlurb[j])
			{
			}
			else
			{
			    if (MainModule_destOffer[j])
			    {
				    document.getElementById("MainModule_destOffer"+j).style.cssText = "display:inline;";
				    if (!MainModule_destOfferLink[j])
				    {
					    document.getElementById("MainModule_destOffer"+j).innerHTML = MainModule_destOffer[j]+"<br><br>";
				    }
				    else
				    {
					    document.getElementById("MainModule_destOffer"+j).innerHTML = MainModule_destOffer[j]+" ";
					    document.getElementById("MainModule_destOfferBlurb"+j).style.cssText = "display:inline;";
					    document.getElementById("MainModule_destOfferBlurb"+j).innerHTML = MainModule_destOfferBlurb[j]+"<br>";
					    document.getElementById("MainModule_destOfferLink"+j).style.cssText = "display:inline;";
					    document.getElementById("MainModule_destOfferLink"+j).innerHTML = MainModule_destOfferLink[j]+"<br><br>";
				    }
			    }
			}
			if (MainModule_offerText[j] || MainModule_offerBlurb[j])
			{
				document.getElementById("MainModule_offerText"+j).style.cssText = "display:inline;";
				if (MainModule_offerStar[j] != "")
				{
				    document.getElementById("MainModule_offerStar"+j).style.cssText = "display:inline;";
				}
				document.getElementById("MainModule_offerBlurb"+j).style.cssText = "display:inline;";
				if (MainModule_offerBlurbLink[j] != null)
				{
				    document.getElementById("MainModule_offerBlurbLink"+j).style.cssText = "display:inline;";
				}
				if (MainModule_offerLink[j] != undefined)
				{
				    document.getElementById("MainModule_offerLink"+j).style.cssText = "display:inline;";
				}
				document.getElementById("MainModule_offerText"+j).innerHTML = MainModule_offerText[j];
				document.getElementById("MainModule_offerStar"+j).innerHTML = "&nbsp;"+MainModule_offerStar[j];
				document.getElementById("MainModule_offerBlurb"+j).innerHTML = MainModule_offerBlurb[j]+"<br>";
				document.getElementById("MainModule_offerBlurbLink"+j).innerHTML = MainModule_offerBlurbLink[j]+"<br><br>";
				document.getElementById("MainModule_offerLink"+j).innerHTML = MainModule_offerLink[j]+sOMNITURE+"<br><br>";
			}
		}
	}
	if (MainModule_offerTextB)
	{
		document.getElementById("MainModule_offerTextB").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerTextB").innerHTML = MainModule_offerTextB;
		document.getElementById("MainModule_offerBlurbB").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerBlurbB").innerHTML = MainModule_offerBlurbB+"<br>";
		document.getElementById("MainModule_offerLinkB").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerLinkB").innerHTML = MainModule_offerLinkB+sOMNITURE+"<br><br>";
	}
	if (MainModule_offerTextC)
	{
		document.getElementById("MainModule_offerTextC").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerTextC").innerHTML = MainModule_offerTextC;
		document.getElementById("MainModule_offerBlurbC").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerBlurbC").innerHTML = MainModule_offerBlurbC+"<br>";
		document.getElementById("MainModule_offerLinkC").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerLinkC").innerHTML = MainModule_offerLinkC+sOMNITURE+"<br><br>";
	}
	if (MainModule_offerTextD)
	{
		document.getElementById("MainModule_offerTextD").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerTextD").innerHTML = MainModule_offerTextD;
		document.getElementById("MainModule_offerBlurbD").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerBlurbD").innerHTML = MainModule_offerBlurbD+"<br>";
		document.getElementById("MainModule_offerLinkD").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerLinkD").innerHTML = MainModule_offerLinkD+sOMNITURE+"<br><br>";
	}
	if (MainModule_offerTextE)
	{
		document.getElementById("MainModule_offerTextE").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerTextE").innerHTML = MainModule_offerTextE;
		document.getElementById("MainModule_offerBlurbE").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerBlurbE").innerHTML = MainModule_offerBlurbE+"<br>";
		document.getElementById("MainModule_offerLinkE").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerLinkE").innerHTML = MainModule_offerLinkE+sOMNITURE+"<br><br>";
	}
	if (MainModule_callToActionContent)
	{
		document.getElementById("MainModule_callToActionContent").style.cssText = "display:inline;";
		document.getElementById("MainModule_callToActionContent").innerHTML = MainModule_callToActionContent+"<br>";
		if (MainModule_callToActionLink)
		{
			document.getElementById("MainModule_callToActionLink").style.cssText = "display:inline;";
			document.getElementById("MainModule_callToActionLink").innerHTML = MainModule_callToActionLink+sOMNITURE+"<br><br>";
		}
		else
		{
			document.getElementById("MainModule_callToActionContent").innerHTML = MainModule_callToActionContent+"<br>";
			document.getElementById("MainModule_callToActionLink").style.cssText = "display:inline;";
			document.getElementById("MainModule_callToActionLink").innerHTML = eyebrowLink+sOMNITURE+"<br><br>";
		}
	}
	// //////////////////////////////////
	// SECOND MAIN MODULE IF ENCOUNTERED
	// //////////////////////////////////
	if (MainModule2_headline0)
	{
		document.getElementById("MainModule2_headline0").style.cssText = "display:inline;";
		document.getElementById("MainModule2_headline0").innerHTML = "<br>"+MainModule2_headline0+"<br>";
	}
	if (MainModule2_paragraph)
		{
		var plen = MainModule2_paragraph.length;
		for (var j = 0; j < plen; j++)
		{
			if (MainModule2_paragraph[j])
			{
				document.getElementById("MainModule2_paragraph"+j).style.cssText = "display:inline;"
				if (!MainModule2_paragraphLink[j])
				{
					if (MainModule2_paragraph[j].match(/\<li\>/))
					{
						document.getElementById("MainModule2_paragraph"+j).innerHTML = MainModule2_paragraph[j]+"<br>";
					}
					else
					{
						document.getElementById("MainModule2_paragraph"+j).innerHTML = MainModule2_paragraph[j]+"<br><br>";
					}
				}
				else
				{
					document.getElementById("MainModule2_paragraph"+j).innerHTML = MainModule2_paragraph[j]+"<br>";
				}
				if (MainModule2_paragraphLink[j])
				{
					document.getElementById("MainModule2_paragraphLink"+j).style.cssText = "display:inline;";
					if (MainModule2_paragraphLink[j][0])
					{
						document.getElementById("MainModule2_paragraphLink"+j).innerHTML = MainModule2_paragraphLink[j][0]+"<br>";
					}
					if (MainModule2_paragraphLink[j][1])
					{
						document.getElementById("MainModule2_paragraphLink"+j).innerHTML += MainModule2_paragraphLink[j][1]+"<br>";
					}
					if (MainModule2_paragraphLink[j][2])
					{
						document.getElementById("MainModule2_paragraphLink"+j).innerHTML += MainModule2_paragraphLink[j][2]+"<br>";
					}
					if (MainModule2_paragraphLink[j][3])
					{
						document.getElementById("MainModule2_paragraphLink"+j).innerHTML += MainModule2_paragraphLink[j][3]+"<br>";
					}
					if (MainModule2_paragraphLink[j][4])
					{
						document.getElementById("MainModule2_paragraphLink"+j).innerHTML += MainModule2_paragraphLink[j][4]+"<br>";
					}
					if (MainModule2_paragraphLink[j][5])
					{
						document.getElementById("MainModule2_paragraphLink"+j).innerHTML += MainModule2_paragraphLink[j][5]+"<br>";
					}
					if (MainModule2_paragraphLink[j])
					{
						document.getElementById("MainModule2_paragraphLink"+j).innerHTML += "<br>";
					}
				}
			}
		}
	}
	if (MainModule2_offerText)
	{
		var om_count = MainModule2_offerText.length;
		for (var xx = 0; xx < om_count; xx++)
		{
			if (MainModule2_offerText[xx])
			{
				document.getElementById("MainModule2_offerText"+xx).style.cssText = "display:inline;";
				document.getElementById("MainModule2_offerStar"+xx).style.cssText = "display:inline;";
				document.getElementById("MainModule2_offerBlurb"+xx).style.cssText = "display:inline;";
				document.getElementById("MainModule2_offerLink"+xx).style.cssText = "display:inline;";
				document.getElementById("MainModule2_offerText"+xx).innerHTML = MainModule2_offerText[xx];
				document.getElementById("MainModule2_offerStar"+xx).innerHTML = "&nbsp;"+MainModule2_offerStar[xx];
				document.getElementById("MainModule2_offerBlurb"+xx).innerHTML = MainModule2_offerBlurb[xx]+"<br>";
				document.getElementById("MainModule2_offerLink"+xx).innerHTML = MainModule2_offerLink[xx]+sOMNITURE+"<br><br>";
			}
		}
	}
	if (MainModule2_offerTextA)
	{
		document.getElementById("MainModule2_offerTextA").style.cssText = "display:inline;";
		document.getElementById("MainModule2_offerTextA").innerHTML = MainModule2_offerTextA;
		document.getElementById("MainModule2_offerBlurbA").style.cssText = "display:inline;";
		document.getElementById("MainModule2_offerBlurbA").innerHTML = MainModule2_offerBlurbA+"<br>";
		document.getElementById("MainModule2_offerLinkA").style.cssText = "display:inline;";
		document.getElementById("MainModule2_offerLinkA").innerHTML = MainModule2_offerLinkA+sOMNITURE+"<br><br>";
	}
	if (MainModule2_offerTextB)
	{
		document.getElementById("MainModule2_offerTextB").style.cssText = "display:inline;";
		document.getElementById("MainModule2_offerTextB").innerHTML = MainModule2_offerTextB;
		document.getElementById("MainModule2_offerBlurbB").style.cssText = "display:inline;";
		document.getElementById("MainModule2_offerBlurbB").innerHTML = MainModule2_offerBlurbB+"<br>";
		document.getElementById("MainModule2_offerLinkB").style.cssText = "display:inline;";
		document.getElementById("MainModule2_offerLinkB").innerHTML = MainModule2_offerLinkB+sOMNITURE+"<br><br>";
	}
	if (MainModule2_offerTextC)
	{
		document.getElementById("MainModule2_offerTextC").style.cssText = "display:inline;";
		document.getElementById("MainModule2_offerTextC").innerHTML = MainModule2_offerTextC;
		document.getElementById("MainModule2_offerBlurbC").style.cssText = "display:inline;";
		document.getElementById("MainModule2_offerBlurbC").innerHTML = MainModule2_offerBlurbC+"<br>";
		document.getElementById("MainModule2_offerLinkC").style.cssText = "display:inline;";
		document.getElementById("MainModule2_offerLinkC").innerHTML = MainModule2_offerLinkC+sOMNITURE+"<br><br>";
	}
	if (MainModule2_callToActionContent)
	{
		document.getElementById("MainModule2_callToActionContent").style.cssText = "display:inline;";
		document.getElementById("MainModule2_callToActionLink").style.cssText = "display:inline;";
		document.getElementById("MainModule2_callToActionContent").innerHTML = MainModule2_callToActionContent+"<br>";
		document.getElementById("MainModule2_callToActionLink").innerHTML = MainModule2_callToActionLink+sOMNITURE+"<br><br>";
	}
	// /////////////////////////////////
	// THIRD MAIN MODULE
	// /////////////////////////////////
	if (MainModule3_headline1)
	{
		document.getElementById("MainModule3_headline1").style.cssText = "display:inline;";
		document.getElementById("MainModule3_headline1").innerHTML = "<br>"+MainModule3_headline1+"<br>";
	}
	if (MainModule3_paragraph)
	{
		var paralen = MainModule3_paragraph.length;
		for (ww = 0; ww < paralen; ww++)
		{
			if (MainModule3_paragraph[ww])
			{
				document.getElementById("MainModule3_paragraph"+ww).style.cssText = "display:inline;"
				if (!MainModule3_paragraphLink[ww] || MainModule3_paragraphLinks[ww])
				{
					document.getElementById("MainModule3_paragraph"+ww).innerHTML = MainModule3_paragraph[ww]+"<br>";
				}
				else
				{
					document.getElementById("MainModule3_paragraph"+ww).innerHTML = MainModule3_paragraph[ww]+"<br>";
				}
				if (MainModule3_paragraphLinks[ww])
				{
					document.getElementById("MainModule3_paragraphLinks"+ww).style.cssText = "display:inline;";
					document.getElementById("MainModule3_paragraphLinks"+ww).innerHTML = MainModule3_paragraphLinks[ww]+"<br><br>";
				}
				if (MainModule3_paragraphLink[ww])
				{
					document.getElementById("MainModule3_paragraphLink"+ww).style.cssText = "display:inline;";
					document.getElementById("MainModule3_paragraphLink"+ww).innerHTML = MainModule3_paragraphLink[ww]+"<br>";
				}
			}
		}
	}
	if (MainModule3_offerText)
	{
		var at_count = MainModule3_offerText.length;
		for (var ss = 0; ss < at_count; ss++)
		{
			if (MainModule3_offerText[ss])
			{
				document.getElementById("MainModule3_offerText"+ss).style.cssText = "display:inline;";
				document.getElementById("MainModule3_offerStar"+ss).style.cssText = "display:inline;";
				document.getElementById("MainModule3_offerBlurb"+ss).style.cssText = "display:inline;";
				document.getElementById("MainModule3_offerLink"+ss).style.cssText = "display:inline;";
				document.getElementById("MainModule3_offerText"+ss).innerHTML = MainModule3_offerText[ss];
				document.getElementById("MainModule3_offerStar"+ss).innerHTML = "&nbsp;"+MainModule3_offerStar[ss];
				document.getElementById("MainModule3_offerBlurb"+ss).innerHTML = MainModule3_offerBlurb[ss]+"<br>";
				document.getElementById("MainModule3_offerLink"+ss).innerHTML = MainModule3_offerLink[ss]+sOMNITURE+"<br><br>";
			}
		}
	}
	if (MainModule3_offerTextA)
	{
		document.getElementById("MainModule3_offerTextA").style.cssText = "display:inline;";
		document.getElementById("MainModule3_offerTextA").innerHTML = MainModule3_offerTextA;
		document.getElementById("MainModule3_offerBlurbA").style.cssText = "display:inline;";
		document.getElementById("MainModule3_offerBlurbA").innerHTML = MainModule3_offerBlurbA+"<br>";
		document.getElementById("MainModule3_offerLinkA").style.cssText = "display:inline;";
		document.getElementById("MainModule3_offerLinkA").innerHTML = MainModule3_offerLinkA+sOMNITURE+"<br><br>";
	}
	if (MainModule3_offerTextB)
	{
		document.getElementById("MainModule3_offerTextB").style.cssText = "display:inline;";
		document.getElementById("MainModule3_offerTextB").innerHTML = MainModule3_offerTextB;
		document.getElementById("MainModule3_offerBlurbB").style.cssText = "display:inline;";
		document.getElementById("MainModule3_offerBlurbB").innerHTML = MainModule3_offerBlurbB+"<br>";
		document.getElementById("MainModule3_offerLinkB").style.cssText = "display:inline;";
		document.getElementById("MainModule3_offerLinkB").innerHTML = MainModule3_offerLinkB+sOMNITURE+"<br><br>";
	}
	if (MainModule3_callToActionContent)
	{
		document.getElementById("MainModule3_callToActionContent").style.cssText = "display:inline;";
		document.getElementById("MainModule3_callToActionContent").innerHTML = MainModule3_callToActionContent+"<br>";
		document.getElementById("MainModule3_callToActionLink").style.cssText = "display:inline;";
		document.getElementById("MainModule3_callToActionLink").innerHTML = MainModule3_callToActionLink+"<br>";
	}
	// ///////////////////////////////
	// FOURTH MAIN MODULE 
	// ///////////////////////////////
	if (MainModule4_paragraph)
	{
	    var para4len = MainModule4_paragraph.length;
		for (www = 0; www < para4len; www++)
		{
			if (MainModule4_paragraph[www])
			{
				document.getElementById("MainModule4_paragraph"+www).style.cssText = "display:inline;";
				if (!MainModule4_paragraphLink[www] || MainModule4_paragraphLinks[www])
				{
					document.getElementById("MainModule4_paragraph"+www).innerHTML = MainModule4_paragraph[www]+"<br>";
				}
				else
				{
					document.getElementById("MainModule4_paragraph"+www).innerHTML = MainModule4_paragraph[www]+"<br>";
				}
				if (MainModule4_paragraphLinks[www])
				{
					document.getElementById("MainModule4_paragraphLinks"+www).style.cssText = "display:inline;";
					document.getElementById("MainModule4_paragraphLinks"+www).innerHTML = MainModule4_paragraphLinks[www]+"<br><br>";
				}
				if (MainModule4_paragraphLink[www])
				{
					document.getElementById("MainModule4_paragraphLink"+www).style.cssText = "display:inline;";
					document.getElementById("MainModule4_paragraphLink"+www).innerHTML = MainModule4_paragraphLink[www]+"<br>";
				}
			}
		}
	}
	if (MainModule4_offerText)
	{
		var att_count = MainModule4_offerText.length;
		for (var sss = 0; sss < att_count; sss++)
		{
			if (MainModule4_offerText[sss])
			{
				document.getElementById("MainModule4_offerText"+sss).style.cssText = "display:inline;";
				document.getElementById("MainModule4_offerStar"+sss).style.cssText = "display:inline;";
				document.getElementById("MainModule4_offerBlurb"+sss).style.cssText = "display:inline;";
				document.getElementById("MainModule4_offerLink"+sss).style.cssText = "display:inline;";
				document.getElementById("MainModule4_offerText"+sss).innerHTML = MainModule4_offerText[sss];
				document.getElementById("MainModule4_offerStar"+sss).innerHTML = "&nbsp;"+MainModule4_offerStar[sss];
				document.getElementById("MainModule4_offerBlurb"+sss).innerHTML = MainModule4_offerBlurb[sss]+"<br>";
				document.getElementById("MainModule4_offerLink"+sss).innerHTML = MainModule4_offerLink[sss]+sOMNITURE+"<br><br>";
			}
		}
	}
	if (MainModule4_offerTextA)
	{
		document.getElementById("MainModule4_offerTextA").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerTextA").innerHTML = MainModule4_offerTextA;
		document.getElementById("MainModule4_offerBlurbA").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerBlurbA").innerHTML = MainModule4_offerBlurbA+"<br>";
		document.getElementById("MainModule4_offerLinkA").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerLinkA").innerHTML = MainModule4_offerLinkA+sOMNITURE+"<br><br>";
	}
	if (MainModule4_offerTextB)
	{
		document.getElementById("MainModule4_offerTextB").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerTextB").innerHTML = MainModule4_offerTextB;
		document.getElementById("MainModule4_offerBlurbB").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerBlurbB").innerHTML = MainModule4_offerBlurbB+"<br>";
		document.getElementById("MainModule4_offerLinkB").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerLinkB").innerHTML = MainModule4_offerLinkB+sOMNITURE+"<br><br>";
	}
	if (MainModule4_callToActionContent)
	{
		document.getElementById("MainModule4_callToActionContent").style.cssText = "display:inline;";
		document.getElementById("MainModule4_callToActionContent").innerHTML = MainModule4_callToActionContent+"<br>";
		document.getElementById("MainModule4_callToActionLink").style.cssText = "display:inline;";
		document.getElementById("MainModule4_callToActionLink").innerHTML = MainModule4_callToActionLink+"<br>";
	}
	
	// //////////////////////////////
	// FIFTH MAIN MODULE  
	// //////////////////////////////
	if (MainModule5_paragraph)
	{
	    var para5len = MainModule5_paragraph.length;
		for (fba = 0; fba < para5len; fba++)
		{
			if (MainModule5_paragraph[fba])
			{
				document.getElementById("MainModule5_paragraph"+fba).style.cssText = "display:inline;"
				if (!MainModule5_paragraphLink[fba] || MainModule5_paragraphLinks[fba])
				{
					document.getElementById("MainModule5_paragraph"+fba).innerHTML = MainModule5_paragraph[fba]+"<br>";
				}
				else
				{
					document.getElementById("MainModule5_paragraph"+fba).innerHTML = MainModule5_paragraph[fba]+"<br>";
				}
				if (MainModule5_paragraphLinks[fba])
				{
					document.getElementById("MainModule5_paragraphLinks"+fba).style.cssText = "display:inline;";
					document.getElementById("MainModule5_paragraphLinks"+fba).innerHTML = MainModule5_paragraphLinks[fba]+"<br><br>";
				}
				if (MainModule5_paragraphLink[fba])
				{
					document.getElementById("MainModule5_paragraphLink"+fba).style.cssText = "display:inline;";
					document.getElementById("MainModule5_paragraphLink"+fba).innerHTML = MainModule5_paragraphLink[fba]+"<br>";
				}
			}
		}
	} 
	// ////////////////////
	// FIRST OFFER MODULE
	// ////////////////////
	if (OfferModule_headline0)
	{
		if (OfferModule_headline0 != "Lorem ipsum dolar")
		{
		document.getElementById("OfferModule_headline0").style.cssText = "display:inline;";
		document.getElementById("OfferModule_headline0").innerHTML = OfferModule_headline0+"<br><br>";
		}
	}
	if (OfferModule_paragraph0)
	{
		if (OfferModule_paragraph0 != "Lorem ipsum dolor quia")
		{
			document.getElementById("OfferModule_paragraph0").style.cssText = "display:inline;";
			document.getElementById("OfferModule_paragraph0").innerHTML = OfferModule_paragraph0+"<br>";
		}
	}
	if (OfferModule_offerTitle)
	{
		var o_count = OfferModule_offerTitle.length;
		for (var ab = 0; ab < o_count; ab++)
		{
			if (OfferModule_offerTitle[ab])    
			{
				document.getElementById("OfferModule_offerTitle"+ab).style.cssText = "display:inline;";
				document.getElementById("OfferModule_offerTitle"+ab).innerHTML = OfferModule_offerTitle[ab]+"<br>";
				document.getElementById("OfferModule_textLine"+ab).style.cssText = "display:inline;";
				document.getElementById("OfferModule_textLine"+ab).innerHTML = OfferModule_textLine[ab]+"<br>";
				if (OfferModule_textLineURL[ab])
				{
				}
				else
				{
					document.getElementById("OfferModule_textLineOneURL"+ab).style.cssText = "display:inline;";
					document.getElementById("OfferModule_textLineOneURL"+ab).innerHTML = OfferModule_textLineOneURL[ab]+"<br><br>";
				}
				if (OfferModule_textLineBlurb[ab])
				{
					document.getElementById("OfferModule_textLineBlurb"+ab).style.cssText = "display:inline;";
					document.getElementById("OfferModule_textLineBlurb"+ab).innerHTML = OfferModule_textLineBlurb[ab]+"<br>";
					document.getElementById("OfferModule_textLineURL"+ab).style.cssText = "display:inline;";
					document.getElementById("OfferModule_textLineURL"+ab).innerHTML = OfferModule_textLineURL[ab]+"<br><br>";
				}
			}
		}
	}
	if (OfferModule_singleHeadline1)
	{
	    document.getElementById("OfferModule_singleHeadline1").style.cssText = "display:inline;";
	    document.getElementById("OfferModule_singleHeadline1").innerHTML = OfferModule_singleHeadline1+"<br><br>";
	    document.getElementById("OfferModule_mypara1").style.cssText = "display:inline;";
	    
	    if (OfferModule_myparaLink1)
	    {
	        document.getElementById("OfferModule_mypara1").innerHTML = OfferModule_mypara1+"<br>";
	        document.getElementById("OfferModule_myparaLink1").style.cssText = "display:inline;";
	        document.getElementById("OfferModule_myparaLink1").innerHTML = OfferModule_myparaLink1+"<br><br>";
	    }
	    else
	    {
	        document.getElementById("OfferModule_mypara1").innerHTML = OfferModule_mypara1+"<br><br>";
	    }
	}
	if (BannerAdAltText)
	{
		document.getElementById("BannerAdAltText").style.cssText = "display:inline;";
		document.getElementById("BannerAdLink").style.cssText = "display:inline;";
		document.getElementById("BannerAdAltText").innerHTML = BannerAdAltText+"<br>";
		document.getElementById("BannerAdLink").innerHTML = BannerAdLink+sOMNITURE+"<br><br>";
	}
	// /////////////////////
	// SECOND OFFER MODULE
	// /////////////////////
	if (OfferModule2_headline1)
	{
		document.getElementById("OfferModule2_headline1").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_headline1").innerHTML = OfferModule2_headline1+"<br><br>";
	}
	if (OfferModule2_paragraph1)
	{
		document.getElementById("OfferModule2_paragraph1").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_paragraph1").innerHTML = OfferModule2_paragraph1+"<br>";
	}
	if (OfferModule2_offerTitle != undefined)    
	{
		var yy_length = OfferModule2_offerTitle.length;
		for (var ii = 0; ii < yy_length; ii++)
		{
			if (OfferModule2_offerTitle[ii] != undefined)
			{
				document.getElementById("OfferModule2_offerTitle"+ii).style.cssText = "display:inline;";
				document.getElementById("OfferModule2_offerTitle"+ii).innerHTML = "<b>"+OfferModule2_offerTitle[ii]+"</b><br>";
				document.getElementById("OfferModule2_textLine"+ii).style.cssText = "display:inline;";
				document.getElementById("OfferModule2_textLine"+ii).innerHTML = OfferModule2_textLine[ii]+"<br>";
				if (OfferModule2_textLineURL1[ii] != "ADD_URL")
				{
				    document.getElementById("OfferModule2_textLineURL1"+ii).style.cssText = "display:inline;";
				    document.getElementById("OfferModule2_textLineURL1"+ii).innerHTML = OfferModule2_textLineURL1[ii]+sOMNITURE+"<br><br>";
				}
				if (OfferModule2_textLineBlurb[ii])
				{
				    document.getElementById("OfferModule2_textLineBlurb"+ii).style.cssText = "display:inline;";
				    document.getElementById("OfferModule2_textLineBlurb"+ii).innerHTML = OfferModule2_textLineBlurb[ii]+"<br>";
				    if (OfferModule2_textLineBlurbTwo[ii])
				    {
				        document.getElementById("OfferModule2_textLineBlurbTwo"+ii).style.cssText = "display:inline;";
				        document.getElementById("OfferModule2_textLineBlurbTwo"+ii).innerHTML = OfferModule2_textLineBlurbTwo[ii]+"<br>";
				    }
				    if (OfferModule2_textLineURLTwo[ii])
				    {
				        document.getElementById("OfferModule2_textLineURLTwo"+ii).style.cssText = "display:inline;";
				        document.getElementById("OfferModule2_textLineURLTwo"+ii).innerHTML = OfferModule2_textLineURLTwo[ii]+sOMNITURE+"<br><br>";    
				    }
				    else
				    {
				        document.getElementById("OfferModule2_textLineURL"+ii).style.cssText = "display:inline;";
				        document.getElementById("OfferModule2_textLineURL"+ii).innerHTML = OfferModule2_textLineURL[ii]+sOMNITURE+"<br><br>";
				    }
				}
			}
		}
	}
	
	if (OfferModule2_singleHeadline1)
	{
		document.getElementById("OfferModule2_singleHeadline1").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_singleHeadline1").innerHTML = OfferModule2_singleHeadline1+"<br><br>";
	}
	if (OfferModule2_mypara1)
	{
		document.getElementById("OfferModule2_mypara1").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_mypara1").innerHTML = OfferModule2_mypara1+"<br>";
		if (OfferModule2_myparaLink1)
		{
			document.getElementById("OfferModule2_myparaLink1").style.cssText = "display:inline;";
			document.getElementById("OfferModule2_myparaLink1").innerHTML = OfferModule2_myparaLink1+"<br><br>";
		}
	}
	if (OfferModule2_BannerAdAltText)
	{
		document.getElementById("OfferModule2_BannerAdAltText").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_BannerAdAltText").innerHTML = OfferModule2_BannerAdAltText+"<br>";
		document.getElementById("OfferModule2_BannerAdLink").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_BannerAdLink").innerHTML = OfferModule2_BannerAdLink+sOMNITURE+"<br><br>";
	}
	// ////////////////////
	// THIRD OFFER MODULE
	// ////////////////////
	if (OfferModule3_headline1)
	{
	    document.getElementById("OfferModule3_headline1").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_headline1").innerHTML = OfferModule3_headline1+"<br><br>";
	}
	if (OfferModule3_offerTitle)    
	{
		for (var lb = 0; lb < OfferModule3_offerTitle.length; lb++)
		{
			if (OfferModule3_offerTitle[lb] != undefined)
			{
				document.getElementById("OfferModule3_offerTitle"+lb).style.cssText = "display:inline;";
				document.getElementById("OfferModule3_offerTitle"+lb).innerHTML = OfferModule3_offerTitle[lb]+"<br>";
				document.getElementById("OfferModule3_textLine"+lb).style.cssText = "display:inline;";
				document.getElementById("OfferModule3_textLine"+lb).innerHTML = OfferModule3_textLine[lb]+"<br>";
				if (OfferModule3_textLineURL1[lb] != "ADD_URL")
				{
				    document.getElementById("OfferModule3_textLineURL1"+lb).style.cssText = "display:inline;";
				    document.getElementById("OfferModule3_textLineURL1"+lb).innerHTML = OfferModule3_textLineURL1[lb]+sOMNITURE+"<br><br>";
				}
				if (OfferModule3_textLineBlurb[lb])
				{
				    document.getElementById("OfferModule3_textLineBlurb"+lb).style.cssText = "display:inline;";
				    document.getElementById("OfferModule3_textLineBlurb"+lb).innerHTML = OfferModule3_textLineBlurb[lb]+"<br>";
				    if (OfferModule3_textLineBlurbTwo[lb] != "undefined")
				    {
				        document.getElementById("OfferModule3_textLineBlurbTwo"+lb).style.cssText = "display:inline;";
				        document.getElementById("OfferModule3_textLineBlurbTwo"+lb).innerHTML = OfferModule3_textLineBlurbTwo[lb]+"<br>";
				    }
				    if (OfferModule3_textLineURLTwo[lb])
				    {
				        document.getElementById("OfferModule3_textLineURLTwo"+lb).style.cssText = "display:inline;";
				        document.getElementById("OfferModule3_textLineURLTwo"+lb).innerHTML = OfferModule3_textLineURLTwo[lb]+sOMNITURE+"<br><br>";    
				    }
				    if (OfferModule3_textLineURL[lb])
				    {
				        document.getElementById("OfferModule3_textLineURL"+lb).style.cssText = "display:inline;";
				        document.getElementById("OfferModule3_textLineURL"+lb).innerHTML = OfferModule3_textLineURL[lb]+sOMNITURE+"<br><br>";
				    }
				}
			}
		}
	}
	if (OfferModule3_singleHeadline1)
	{
		document.getElementById("OfferModule3_singleHeadline1").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_singleHeadline1").innerHTML = OfferModule3_singleHeadline1+"<br><br>";
	}
	if (OfferModule3_mypara1)
	{
		document.getElementById("OfferModule3_mypara1").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_mypara1").innerHTML = OfferModule3_mypara1+"<br>";
		if (OfferModule3_myparaLink1)
		{
			document.getElementById("OfferModule3_myparaLink1").style.cssText = "display:inline;";
			document.getElementById("OfferModule3_myparaLink1").innerHTML = OfferModule3_myparaLink1[0]+"<br>"+OfferModule3_myparaLink1[1]+"<br>"+OfferModule3_myparaLink1[2]+"<br><br>";
		}
	}
	if (OfferModule3_BannerAdAltText)
	{
		document.getElementById("OfferModule3_BannerAdAltText").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_BannerAdLink").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_BannerAdAltText").innerHTML = "<br>"+OfferModule3_BannerAdAltText+"<br>";
		document.getElementById("OfferModule3_BannerAdLink").innerHTML = OfferModule3_BannerAdLink+sOMNITURE+"<br><br>";
	}
	if (OfferModule4_BannerAdAltText)
	{
	    document.getElementById("OfferModule4_BannerAdAltText").style.cssText = "display:inline;";
		document.getElementById("OfferModule4_BannerAdLink").style.cssText = "display:inline;";
		document.getElementById("OfferModule4_BannerAdAltText").innerHTML = "<br>"+OfferModule4_BannerAdAltText+"<br>";
		document.getElementById("OfferModule4_BannerAdLink").innerHTML = OfferModule4_BannerAdLink+sOMNITURE+"<br><br>";
	}
	// /////////////////////
	// TERMS AND CONDITIONS
	// /////////////////////
	document.getElementById("myMER_rule").innerHTML = myMER_rule;
	if (TermsAndConditions)
	{
		document.getElementById("TermsAndConditions").innerHTML = TermsAndConditions+"<br>";
		document.getElementById("TermsAndConditionsContent").innerHTML = TermsAndConditionsContent+"<br>";
	}
	if (TermsAndConditionsContentLink)
	{
	    for (var ps = 0; ps < TermsAndConditionsContentLink.length; ps++)
	    {
	        if (TermsAndConditionsContentLink[ps])
	        {
	            document.getElementById("TermsAndConditionsContentLink"+ps).style.cssText = "display:inline;";
			    if (TermsAndConditionsContentLink[ps][0])
			    {
				    document.getElementById("TermsAndConditionsContentLink"+ps).innerHTML = TermsAndConditionsContentLink[ps][0]+"<br>";
			    }
			    if (TermsAndConditionsContentLink[ps][1])
			    {
				    document.getElementById("TermsAndConditionsContentLink"+ps).innerHTML += TermsAndConditionsContentLink[ps][1]+"<br>";
			    }
			    if (TermsAndConditionsContentLink[ps][2])
			    {
				    document.getElementById("TermsAndConditionsContentLink"+ps).innerHTML += TermsAndConditionsContentLink[ps][2]+"<br>";
			    }
			    if (TermsAndConditionsContentLink[ps])
			    {
				    document.getElementById("TermsAndConditionsContentLink"+ps).innerHTML += "<br>";
			    }
	        }    
	    }
	}
	if (TermsAndConditionsTwo)
	{
	    document.getElementById("TermsAndConditionsTwo").style.cssText = "display:inline;";
	    document.getElementById("TermsAndConditionsTwo").innerHTML = TermsAndConditionsTwo+"<br>";
	    document.getElementById("TermsAndConditionsTwoLink").style.cssText = "display:inline;";
	    document.getElementById("TermsAndConditionsTwoLink").innerHTML = TermsAndConditionsTwoLink+"<br><br>";
	}
	if (Unsubscribe)
	{
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
	}
	document.getElementById("ContactUs").innerHTML = ContactUs;
	document.getElementById("specialRulesContactUs").innerHTML = specialRulesContactUs;
	if (ANoteAboutPrices)
	{
	    document.getElementById("ANoteAboutPrices").style.cssText = "display:inline;";
	    document.getElementById("ANoteAboutPrices").innerHTML = ANoteAboutPrices+"<br>";
	    document.getElementById("specialRulesPrices").style.cssText = "display:inline;";
	    document.getElementById("specialRulesPrices").innerHTML = specialRulesPrices+"<br>";
	}
	if (CustomerSupportTitle)
	{
	    document.getElementById("CustomerSupportTitle").style.cssText = "display:inline;";
	    document.getElementById("CustomerSupportTitle").innerHTML = CustomerSupportTitle+"<br>";
	    document.getElementById("CustomerSupport").style.cssText = "display:inline;";
	    document.getElementById("CustomerSupport").innerHTML = CustomerSupport+"<br>";
	    document.getElementById("CustomerSupportLink").style.cssText = "display:inline;";
	    document.getElementById("CustomerSupportLink").innerHTML = CustomerSupportLink+"<br><br>";
	}
	if (OfficialRulesTitle)
	{
	    document.getElementById("OfficialRulesTitle").style.cssText = "display:inline;";
	    document.getElementById("OfficialRulesTitle").innerHTML = OfficialRulesTitle+"<br>";
	    document.getElementById("OfficialRules").style.cssText = "display:inline;";
	    document.getElementById("OfficialRules").innerHTML = OfficialRules+"<br>";
	    document.getElementById("OfficialRulesLink").style.cssText = "display:inline;";
	    document.getElementById("OfficialRulesLink").innerHTML = OfficialRulesLink+"<br><br>";
	}
	document.getElementById("specialRulesFinal").innerHTML = specialRulesFinal;
}

	</script>
</head>

<body bgcolor="#FFFFCC" onload="loadXML()" style="font-family: verdana; font-size: 11; color: #000000;">
<table width="100%">
<tr><td bgcolor="#FFFFCC" style="font-family: verdana; font-size: 11; color: #000000;">
<!-- SPAN TAGS TO HOLD EXTRACTED TEXT AND RENDER TO PAGE -->
<!-- <span id="addressHeader"></span><br /><br /> -->
<span id="eyebrowText" style="display:none;"></span>&nbsp;<span id="eyebrowBlurb" style="display:none;"></span>
<span id="eyebrowLink" style="display:none;"></span>

<span id="heroModuleAltText" style="display:none;"></span>
<span id="heroModuleURL" style="display:none;"></span>
<span id="HeroModule_headline1" style="display:none;"></span>
<span id="HeroModule_subHeadline1" style="display:none;"></span>
<span id="HeroModule_subHeadline2" style="display:none;"></span>
<span id="HeroModule_paragraph1" style="display:none;"></span>
<span id="HeroModule_paragraphLinks1" style="display:none;"></span>
<span id="HeroModule_paragraphLink1" style="display:none;"></span>
<span id="HeroModule_paragraph2" style="display:none;"></span>
<span id="HeroModule_paragraphLinks2" style="display:none;"></span>
<span id="HeroModule_paragraphLink2" style="display:none;"></span>
<span id="HeroModule_paragraph3" style="display:none;"></span>
<span id="HeroModule_paragraphLinks3" style="display:none;"></span>
<span id="HeroModule_paragraphLink3" style="display:none;"></span>
<span id="HeroModule_paragraph4" style="display:none;"></span>
<span id="HeroModule_paragraphLinks4" style="display:none;"></span>
<span id="HeroModule_paragraphLink4" style="display:none;"></span>
<span id="HeroModule_paragraph5" style="display:none;"></span>
<span id="HeroModule_paragraphLinks5" style="display:none;"></span>
<span id="HeroModule_paragraphLink5" style="display:none;"></span>
<span id="HeroModule_paragraph6" style="display:none;"></span>
<span id="HeroModule_paragraphLinks6" style="display:none;"></span>
<span id="HeroModule_paragraphLink6" style="display:none;"></span>
<span id="HeroModule_paragraph7" style="display:none;"></span>
<span id="HeroModule_paragraphLinks7" style="display:none;"></span>
<span id="HeroModule_paragraphLink7" style="display:none;"></span>

<span id="MainModule_headline0" style="display:none;"></span>
<span id="MainModule_paragraph0" style="display:none;"></span>
<span id="MainModule_paragraphLinks0" style="display:none;"></span>
<span id="MainModule_paragraphLink0" style="display:none;"></span>
<span id="MainModule_paragraph1" style="display:none;"></span>
<span id="MainModule_paragraphLinks1" style="display:none;"></span>
<span id="MainModule_paragraphLink1" style="display:none;"></span>
<span id="MainModule_paragraph2" style="display:none;"></span>
<span id="MainModule_paragraphLinks2" style="display:none;"></span>
<span id="MainModule_paragraphLink2" style="display:none;"></span>
<span id="MainModule_paragraph3" style="display:none;"></span>
<span id="MainModule_paragraphLinks3" style="display:none;"></span>
<span id="MainModule_paragraphLink3" style="display:none;"></span>
<span id="MainModule_paragraph4" style="display:none;"></span>
<span id="MainModule_paragraphLinks4" style="display:none;"></span>
<span id="MainModule_paragraphLink4" style="display:none;"></span>
<span id="MainModule_paragraph5" style="display:none;"></span>
<span id="MainModule_paragraphLinks5" style="display:none;"></span>
<span id="MainModule_paragraphLink5" style="display:none;"></span>
<span id="MainModule_paragraph6" style="display:none;"></span>
<span id="MainModule_paragraphLinks6" style="display:none;"></span>
<span id="MainModule_paragraphLink6" style="display:none;"></span>
<span id="MainModule_paragraph7" style="display:none;"></span>
<span id="MainModule_paragraphLinks7" style="display:none;"></span>
<span id="MainModule_paragraphLink7" style="display:none;"></span>
<span id="MainModule_paragraph8" style="display:none;"></span>
<span id="MainModule_paragraphLinks8" style="display:none;"></span>
<span id="MainModule_paragraphLink8" style="display:none;"></span>
<span id="MainModule_paragraph9" style="display:none;"></span>
<span id="MainModule_paragraphLinks9" style="display:none;"></span>
<span id="MainModule_paragraphLink9" style="display:none;"></span>
<span id="MainModule_paragraph10" style="display:none;"></span>
<span id="MainModule_paragraphLinks10" style="display:none;"></span>
<span id="MainModule_paragraphLink10" style="display:none;"></span>


<span id="MainModule_destGroup" style="display:none;"></span>

<span id="MainModule_destOffer0" style="display:none;"></span> <span id="MainModule_destOfferBlurb0" style="display:none;"></span>
<span id="MainModule_destOfferLink0" style="display:none;"></span>
<span id="MainModule_offerText0" style="display:none;"></span> <span id="MainModule_offerStar0" style="display:none;"></span> <span id="MainModule_offerBlurb0" style="display:none;"></span>
<span id="MainModule_offerBlurbLink0" style="display:none;"></span>
<span id="MainModule_offerLink0" style="display:none;"></span>

<span id="MainModule_destOffer1" style="display:none;"></span> <span id="MainModule_destOfferBlurb1" style="display:none;"></span>
<span id="MainModule_destOfferLink1" style="display:none;"></span>
<span id="MainModule_offerText1" style="display:none;"></span> <span id="MainModule_offerStar1" style="display:none;"></span> <span id="MainModule_offerBlurb1" style="display:none;"></span>
<span id="MainModule_offerBlurbLink1" style="display:none;"></span>
<span id="MainModule_offerLink1" style="display:none;"></span>

<span id="MainModule_destOffer2" style="display:none;"></span> <span id="MainModule_destOfferBlurb2" style="display:none;"></span>
<span id="MainModule_destOfferLink2" style="display:none;"></span>
<span id="MainModule_offerText2" style="display:none;"></span> <span id="MainModule_offerStar2" style="display:none;"></span> <span id="MainModule_offerBlurb2" style="display:none;"></span>
<span id="MainModule_offerBlurbLink2" style="display:none;"></span>
<span id="MainModule_offerLink2" style="display:none;"></span>
<span id="MainModule_offerTextA22" style="display:none;"></span> <span id="MainModule_offerBlurbA22" style="display:none;"></span>
<span id="MainModule_offerLinkA22" style="display:none;"></span>

<span id="MainModule_destOffer3" style="display:none;"></span> <span id="MainModule_destOfferBlurb3" style="display:none;"></span>
<span id="MainModule_destOfferLink3" style="display:none;"></span>
<span id="MainModule_offerText3" style="display:none;"></span> <span id="MainModule_offerStar3" style="display:none;"></span> <span id="MainModule_offerBlurb3" style="display:none;"></span>
<span id="MainModule_offerBlurbLink3" style="display:none;"></span>
<span id="MainModule_offerLink3" style="display:none;"></span>
<span id="MainModule_offerTextA32" style="display:none;"></span> <span id="MainModule_offerBlurbA32" style="display:none;"></span>
<span id="MainModule_offerLinkA32" style="display:none;"></span>

<span id="MainModule_destOffer4" style="display:none;"></span> <span id="MainModule_destOfferBlurb4" style="display:none;"></span>
<span id="MainModule_destOfferLink4" style="display:none;"></span>
<span id="MainModule_destOffer5" style="display:none;"></span> <span id="MainModule_destOfferBlurb5" style="display:none;"></span>
<span id="MainModule_destOfferLink5" style="display:none;"></span>
<span id="MainModule_destOffer6" style="display:none;"></span> <span id="MainModule_destOfferBlurb6" style="display:none;"></span>
<span id="MainModule_destOfferLink6" style="display:none;"></span>
<span id="MainModule_destOffer7" style="display:none;"></span> <span id="MainModule_destOfferBlurb7" style="display:none;"></span>
<span id="MainModule_destOfferLink7" style="display:none;"></span>
<span id="MainModule_destOffer8" style="display:none;"></span> <span id="MainModule_destOfferBlurb8" style="display:none;"></span>
<span id="MainModule_destOfferLink8" style="display:none;"></span>

<span id="MainModule_offerText4" style="display:none;"></span> <span id="MainModule_offerStar4" style="display:none;"></span> <span id="MainModule_offerBlurb4" style="display:none;"></span>
<span id="MainModule_offerBlurbLink4" style="display:none;"></span>
<span id="MainModule_offerLink4" style="display:none;"></span>
<span id="MainModule_offerTextA42" style="display:none;"></span> <span id="MainModule_offerBlurbA42" style="display:none;"></span>
<span id="MainModule_offerLinkA42" style="display:none;"></span>

<span id="MainModule_offerText5" style="display:none;"></span> <span id="MainModule_offerStar5" style="display:none;"></span> <span id="MainModule_offerBlurb5" style="display:none;"></span>
<span id="MainModule_offerBlurbLink5" style="display:none;"></span>
<span id="MainModule_offerLink5" style="display:none;"></span>
<span id="MainModule_offerTextA52" style="display:none;"></span> <span id="MainModule_offerBlurbA52" style="display:none;"></span>
<span id="MainModule_offerLinkA52" style="display:none;"></span>

<span id="MainModule_offerText6" style="display:none;"></span> <span id="MainModule_offerStar6" style="display:none;"></span> <span id="MainModule_offerBlurb6" style="display:none;"></span>
<span id="MainModule_offerBlurbLink6" style="display:none;"></span>
<span id="MainModule_offerLink6" style="display:none;"></span>
<span id="MainModule_offerTextA62" style="display:none;"></span> <span id="MainModule_offerBlurbA62" style="display:none;"></span>
<span id="MainModule_offerLinkA62" style="display:none;"></span>

<span id="MainModule_offerText7" style="display:none;"></span> <span id="MainModule_offerStar7" style="display:none;"></span> <span id="MainModule_offerBlurb7" style="display:none;"></span>
<span id="MainModule_offerBlurbLink7" style="display:none;"></span>
<span id="MainModule_offerLink7" style="display:none;"></span>
<span id="MainModule_offerText8" style="display:none;"></span> <span id="MainModule_offerStar8" style="display:none;"></span> <span id="MainModule_offerBlurb8" style="display:none;"></span>
<span id="MainModule_offerBlurbLink8" style="display:none;"></span>
<span id="MainModule_offerLink8" style="display:none;"></span>
<span id="MainModule_offerText9" style="display:none;"></span> <span id="MainModule_offerStar9" style="display:none;"></span> <span id="MainModule_offerBlurb9" style="display:none;"></span>
<span id="MainModule_offerBlurbLink9" style="display:none;"></span>
<span id="MainModule_offerLink9" style="display:none;"></span>
<span id="MainModule_offerText10" style="display:none;"></span> <span id="MainModule_offerStar10" style="display:none;"></span> <span id="MainModule_offerBlurb10" style="display:none;"></span>
<span id="MainModule_offerBlurbLink10" style="display:none;"></span>
<span id="MainModule_offerLink10" style="display:none;"></span>
<span id="MainModule_offerText11" style="display:none;"></span> <span id="MainModule_offerStar11" style="display:none;"></span> <span id="MainModule_offerBlurb11" style="display:none;"></span>
<span id="MainModule_offerBlurbLink11" style="display:none;"></span>
<span id="MainModule_offerLink11" style="display:none;"></span>
<span id="MainModule_offerText12" style="display:none;"></span> <span id="MainModule_offerStar12" style="display:none;"></span> <span id="MainModule_offerBlurb12" style="display:none;"></span>
<span id="MainModule_offerBlurbLink12" style="display:none;"></span>
<span id="MainModule_offerLink12" style="display:none;"></span>
<span id="MainModule_offerText13" style="display:none;"></span> <span id="MainModule_offerStar13" style="display:none;"></span> <span id="MainModule_offerBlurb13" style="display:none;"></span>
<span id="MainModule_offerBlurbLink13" style="display:none;"></span>
<span id="MainModule_offerLink13" style="display:none;"></span>
<span id="MainModule_offerText14" style="display:none;"></span> <span id="MainModule_offerStar14" style="display:none;"></span> <span id="MainModule_offerBlurb14" style="display:none;"></span>
<span id="MainModule_offerBlurbLink14" style="display:none;"></span>
<span id="MainModule_offerLink14" style="display:none;"></span>
<span id="MainModule_offerText15" style="display:none;"></span> <span id="MainModule_offerStar15" style="display:none;"></span> <span id="MainModule_offerBlurb15" style="display:none;"></span>
<span id="MainModule_offerBlurbLink15" style="display:none;"></span>
<span id="MainModule_offerLink15" style="display:none;"></span>
<span id="MainModule_offerText16" style="display:none;"></span> <span id="MainModule_offerStar16" style="display:none;"></span> <span id="MainModule_offerBlurb16" style="display:none;"></span>
<span id="MainModule_offerBlurbLink16" style="display:none;"></span>
<span id="MainModule_offerLink16" style="display:none;"></span>
<span id="MainModule_offerText17" style="display:none;"></span> <span id="MainModule_offerStar17" style="display:none;"></span> <span id="MainModule_offerBlurb17" style="display:none;"></span>
<span id="MainModule_offerBlurbLink17" style="display:none;"></span>
<span id="MainModule_offerLink17" style="display:none;"></span>
<span id="MainModule_offerText18" style="display:none;"></span> <span id="MainModule_offerStar18" style="display:none;"></span> <span id="MainModule_offerBlurb18" style="display:none;"></span>
<span id="MainModule_offerBlurbLink18" style="display:none;"></span>
<span id="MainModule_offerLink18" style="display:none;"></span>
<span id="MainModule_offerText19" style="display:none;"></span> <span id="MainModule_offerStar19" style="display:none;"></span> <span id="MainModule_offerBlurb19" style="display:none;"></span>
<span id="MainModule_offerBlurbLink19" style="display:none;"></span>
<span id="MainModule_offerLink19" style="display:none;"></span>

<span id="MainModule_offerTextA" style="display:none;"></span> <span id="MainModule_offerBlurbA" style="display:none;"></span>
<span id="MainModule_offerLinkA" style="display:none;"></span>
<span id="MainModule_offerTextB" style="display:none;"></span> <span id="MainModule_offerBlurbB" style="display:none;"></span>
<span id="MainModule_offerLinkB" style="display:none;"></span>
<span id="MainModule_offerTextC" style="display:none;"></span> <span id="MainModule_offerBlurbC" style="display:none;"></span>
<span id="MainModule_offerLinkC" style="display:none;"></span>
<span id="MainModule_offerTextD" style="display:none;"></span> <span id="MainModule_offerBlurbD" style="display:none;"></span>
<span id="MainModule_offerLinkD" style="display:none;"></span>
<span id="MainModule_offerTextE" style="display:none;"></span> <span id="MainModule_offerBlurbE" style="display:none;"></span>
<span id="MainModule_offerLinkE" style="display:none;"></span>

<span id="MainModule_callToActionContent" style="display:none;"></span>
<span id="MainModule_callToActionLink" style="display:none;"></span>

<span id="MainModule2_headline0" style="display:none;"></span>
<span id="MainModule2_paragraph0" style="display:none;"></span>
<span id="MainModule2_paragraphLink0" style="display:none;"></span>
<span id="MainModule2_paragraph1" style="display:none;"></span>
<span id="MainModule2_paragraphLink1" style="display:none;"></span>
<span id="MainModule2_paragraph2" style="display:none;"></span>
<span id="MainModule2_paragraphLink2" style="display:none;"></span>
<span id="MainModule2_paragraph3" style="display:none;"></span>
<span id="MainModule2_paragraphLink3" style="display:none;"></span>
<span id="MainModule2_offerText0" style="display:none;"></span> <span id="MainModule2_offerStar0" style="display:none;"></span> <span id="MainModule2_offerBlurb0" style="display:none;"></span>
<span id="MainModule2_offerLink0" style="display:none;"></span>
<span id="MainModule2_offerText1" style="display:none;"></span> <span id="MainModule2_offerStar1" style="display:none;"></span> <span id="MainModule2_offerBlurb1" style="display:none;"></span>
<span id="MainModule2_offerLink1" style="display:none;"></span>
<span id="MainModule2_offerText2" style="display:none;"></span> <span id="MainModule2_offerStar2" style="display:none;"></span> <span id="MainModule2_offerBlurb2" style="display:none;"></span>
<span id="MainModule2_offerLink2" style="display:none;"></span>
<span id="MainModule2_offerText3" style="display:none;"></span> <span id="MainModule2_offerStar3" style="display:none;"></span> <span id="MainModule2_offerBlurb3" style="display:none;"></span>
<span id="MainModule2_offerLink3" style="display:none;"></span>
<span id="MainModule2_offerText4" style="display:none;"></span> <span id="MainModule2_offerStar4" style="display:none;"></span> <span id="MainModule2_offerBlurb4" style="display:none;"></span>
<span id="MainModule2_offerLink4" style="display:none;"></span>
<span id="MainModule2_offerText5" style="display:none;"></span> <span id="MainModule2_offerStar5" style="display:none;"></span> <span id="MainModule2_offerBlurb5" style="display:none;"></span>
<span id="MainModule2_offerLink5" style="display:none;"></span>
<span id="MainModule2_offerText6" style="display:none;"></span> <span id="MainModule2_offerStar6" style="display:none;"></span> <span id="MainModule2_offerBlurb6" style="display:none;"></span>
<span id="MainModule2_offerLink6" style="display:none;"></span>
<span id="MainModule2_offerText7" style="display:none;"></span> <span id="MainModule2_offerStar7" style="display:none;"></span> <span id="MainModule2_offerBlurb7" style="display:none;"></span>
<span id="MainModule2_offerLink7" style="display:none;"></span>
<span id="MainModule2_offerText8" style="display:none;"></span> <span id="MainModule2_offerStar8" style="display:none;"></span> <span id="MainModule2_offerBlurb8" style="display:none;"></span>
<span id="MainModule2_offerLink8" style="display:none;"></span>
<span id="MainModule2_offerText9" style="display:none;"></span> <span id="MainModule2_offerStar9" style="display:none;"></span> <span id="MainModule2_offerBlurb9" style="display:none;"></span>
<span id="MainModule2_offerLink9" style="display:none;"></span>
<span id="MainModule2_offerText10" style="display:none;"></span> <span id="MainModule2_offerStar10" style="display:none;"></span> <span id="MainModule2_offerBlurb10" style="display:none;"></span>
<span id="MainModule2_offerLink10" style="display:none;"></span>
<span id="MainModule2_offerText11" style="display:none;"></span> <span id="MainModule2_offerStar11" style="display:none;"></span> <span id="MainModule2_offerBlurb11" style="display:none;"></span>
<span id="MainModule2_offerLink11" style="display:none;"></span>

<span id="MainModule2_offerTextA" style="display:none;"></span> <span id="MainModule2_offerBlurbA" style="display:none;"></span>
<span id="MainModule2_offerLinkA" style="display:none;"></span>
<span id="MainModule2_offerTextB" style="display:none;"></span> <span id="MainModule2_offerBlurbB" style="display:none;"></span>
<span id="MainModule2_offerLinkB" style="display:none;"></span>
<span id="MainModule2_offerTextC" style="display:none;"></span> <span id="MainModule2_offerBlurbC" style="display:none;"></span>
<span id="MainModule2_offerLinkC" style="display:none;"></span>
<span id="MainModule2_callToActionContent" style="display:none;"></span>
<span id="MainModule2_callToActionLink" style="display:none;"></span>

<span id="MainModule3_headline1" style="display:none;"></span>
<span id="MainModule3_paragraph1" style="display:none;"></span>
<span id="MainModule3_paragraphLink1" style="display:none;"></span>
<span id="MainModule3_paragraphLinks1" style="display:none;"></span>
<span id="MainModule3_paragraph2" style="display:none;"></span>
<span id="MainModule3_paragraphLink2" style="display:none;"></span>
<span id="MainModule3_paragraphLinks2" style="display:none;"></span>
<span id="MainModule3_paragraph3" style="display:none;"></span>
<span id="MainModule3_paragraphLink3" style="display:none;"></span>
<span id="MainModule3_paragraphLinks3" style="display:none;"></span>
<span id="MainModule3_paragraph4" style="display:none;"></span>
<span id="MainModule3_paragraphLink4" style="display:none;"></span>
<span id="MainModule3_paragraphLinks4" style="display:none;"></span>
<span id="MainModule3_offerText1" style="display:none;"></span> <span id="MainModule3_offerStar1" style="display:none;"></span> <span id="MainModule3_offerBlurb1" style="display:none;"></span>
<span id="MainModule3_offerLink1" style="display:none;"></span>
<span id="MainModule3_offerText2" style="display:none;"></span> <span id="MainModule3_offerStar2" style="display:none;"></span> <span id="MainModule3_offerBlurb2" style="display:none;"></span>
<span id="MainModule3_offerLink2" style="display:none;"></span>
<span id="MainModule3_offerText3" style="display:none;"></span> <span id="MainModule3_offerStar3" style="display:none;"></span> <span id="MainModule3_offerBlurb3" style="display:none;"></span>
<span id="MainModule3_offerLink3" style="display:none;"></span>
<span id="MainModule3_offerText4" style="display:none;"></span> <span id="MainModule3_offerStar4" style="display:none;"></span> <span id="MainModule3_offerBlurb4" style="display:none;"></span>
<span id="MainModule3_offerLink4" style="display:none;"></span>
<span id="MainModule3_offerText5" style="display:none;"></span> <span id="MainModule3_offerStar5" style="display:none;"></span> <span id="MainModule3_offerBlurb5" style="display:none;"></span>
<span id="MainModule3_offerLink5" style="display:none;"></span>
<span id="MainModule3_offerTextA" style="display:none;"></span> <span id="MainModule3_offerBlurbA" style="display:none;"></span>
<span id="MainModule3_offerLinkA" style="display:none;"></span>
<span id="MainModule3_offerTextB" style="display:none;"></span> <span id="MainModule3_offerBlurbB" style="display:none;"></span>
<span id="MainModule3_offerLinkB" style="display:none;"></span>
<span id="MainModule3_callToActionContent" style="display:none;"></span>
<span id="MainModule3_callToActionLink" style="display:none;"></span>

<span id="MainModule4_paragraph1" style="display:none;"></span>
<span id="MainModule4_paragraphLink1" style="display:none;"></span>
<span id="MainModule4_paragraphLinks1" style="display:none;"></span>

<span id="MainModule4_offerText1" style="display:none;"></span> <span id="MainModule4_offerStar1" style="display:none;"></span> <span id="MainModule4_offerBlurb1" style="display:none;"></span>
<span id="MainModule4_offerLink1" style="display:none;"></span>
<span id="MainModule4_offerText2" style="display:none;"></span> <span id="MainModule4_offerStar2" style="display:none;"></span> <span id="MainModule4_offerBlurb2" style="display:none;"></span>
<span id="MainModule4_offerLink2" style="display:none;"></span>

<span id="MainModule4_offerTextA" style="display:none;"></span> <span id="MainModule4_offerBlurbA" style="display:none;"></span>
<span id="MainModule4_offerLinkA" style="display:none;"></span>
<span id="MainModule4_offerTextB" style="display:none;"></span> <span id="MainModule4_offerBlurbB" style="display:none;"></span>
<span id="MainModule4_offerLinkB" style="display:none;"></span>
<span id="MainModule4_offerTextC" style="display:none;"></span> <span id="MainModule4_offerBlurbC" style="display:none;"></span>
<span id="MainModule4_offerLinkC" style="display:none;"></span>

<span id="MainModule5_paragraph1" style="display:none;"></span>
<span id="MainModule5_paragraphLink1" style="display:none;"></span>
<span id="MainModule5_paragraphLinks1" style="display:none;"></span>

<span id="OfferModule_headline0" style="display:none;"></span>
<span id="OfferModule_paragraph0" style="display:none;"></span>

<span id="OfferModule_offerTitle0" style="display:none;"></span>
<span id="OfferModule_textLine0" style="display:none;"></span>
<span id="OfferModule_textLineOneURL0" style="display:none;"></span>
<span id="OfferModule_textLineBlurb0" style="display:none;"></span>
<span id="OfferModule_textLineURL0" style="display:none;"></span>
<span id="OfferModule_offerTitle1" style="display:none;"></span>
<span id="OfferModule_textLine1" style="display:none;"></span>
<span id="OfferModule_textLineOneURL1" style="display:none;"></span>
<span id="OfferModule_textLineBlurb1" style="display:none;"></span>
<span id="OfferModule_textLineURL1" style="display:none;"></span>
<span id="OfferModule_offerTitle2" style="display:none;"></span>
<span id="OfferModule_textLine2" style="display:none;"></span>
<span id="OfferModule_textLineOneURL2" style="display:none;"></span>
<span id="OfferModule_textLineBlurb2" style="display:none;"></span>
<span id="OfferModule_textLineURL2" style="display:none;"></span>
<span id="OfferModule_offerTitle3" style="display:none;"></span>
<span id="OfferModule_textLine3" style="display:none;"></span>
<span id="OfferModule_textLineOneURL3" style="display:none;"></span>
<span id="OfferModule_textLineBlurb3" style="display:none;"></span>
<span id="OfferModule_textLineURL3" style="display:none;"></span>
<span id="OfferModule_offerTitle4" style="display:none;"></span>
<span id="OfferModule_textLine4" style="display:none;"></span>
<span id="OfferModule_textLineOneURL4" style="display:none;"></span>
<span id="OfferModule_textLineBlurb4" style="display:none;"></span>
<span id="OfferModule_textLineURL4" style="display:none;"></span>
<span id="OfferModule_offerTitle5" style="display:none;"></span>
<span id="OfferModule_textLine5" style="display:none;"></span>
<span id="OfferModule_textLineOneURL5" style="display:none;"></span>
<span id="OfferModule_textLineBlurb5" style="display:none;"></span>
<span id="OfferModule_textLineURL5" style="display:none;"></span>
<span id="OfferModule_offerTitle6" style="display:none;"></span>
<span id="OfferModule_textLine6" style="display:none;"></span>
<span id="OfferModule_textLineOneURL6" style="display:none;"></span>
<span id="OfferModule_textLineBlurb6" style="display:none;"></span>
<span id="OfferModule_textLineURL6" style="display:none;"></span>

<span id="OfferModule_singleHeadline1" style="display:none;"></span>
<span id="OfferModule_mypara1" style="display:none;"></span>
<span id="OfferModule_myparaLink1" style="display:none;"></span>
<span id="BannerAdAltText" style="display:none;"></span>
<span id="BannerAdLink" style="display:none;"></span>

<span id="OfferModule2_headline1" style="display:none;"></span>
<span id="OfferModule2_paragraph1" style="display:none;"></span>

<span id="OfferModule2_offerTitle2" style="display:none;"></span>
<span id="OfferModule2_textLine2" style="display:none;"></span>
<span id="OfferModule2_textLineURL12" style="display:none;"></span>
<span id="OfferModule2_textLineBlurb2" style="display:none;"></span>
<span id="OfferModule2_textLineBlurbTwo2" style="display:none;"></span>
<span id="OfferModule2_textLineURL2" style="display:none;"></span>
<span id="OfferModule2_textLineURLTwo2" style="display:none;"></span>
<span id="OfferModule2_offerTitle3" style="display:none;"></span>
<span id="OfferModule2_textLine3" style="display:none;"></span>
<span id="OfferModule2_textLineURL13" style="display:none;"></span>
<span id="OfferModule2_textLineBlurb3" style="display:none;"></span>
<span id="OfferModule2_textLineBlurbTwo3" style="display:none;"></span>
<span id="OfferModule2_textLineURL3" style="display:none;"></span>
<span id="OfferModule2_textLineURLTwo3" style="display:none;"></span>
<span id="OfferModule2_offerTitle4" style="display:none;"></span>
<span id="OfferModule2_textLine4" style="display:none;"></span>
<span id="OfferModule2_textLineURL14" style="display:none;"></span>
<span id="OfferModule2_textLineBlurb4" style="display:none;"></span>
<span id="OfferModule2_textLineBlurbTwo4" style="display:none;"></span>
<span id="OfferModule2_textLineURL4" style="display:none;"></span>
<span id="OfferModule2_textLineURLTwo4" style="display:none;"></span>
<span id="OfferModule2_offerTitle5" style="display:none;"></span>
<span id="OfferModule2_textLine5" style="display:none;"></span>
<span id="OfferModule2_textLineURL15" style="display:none;"></span>
<span id="OfferModule2_textLineBlurb5" style="display:none;"></span>
<span id="OfferModule2_textLineBlurbTwo5" style="display:none;"></span>
<span id="OfferModule2_textLineURL5" style="display:none;"></span>
<span id="OfferModule2_textLineURLTwo5" style="display:none;"></span>
<span id="OfferModule2_offerTitle6" style="display:none;"></span>
<span id="OfferModule2_textLine6" style="display:none;"></span>
<span id="OfferModule2_textLineURL16" style="display:none;"></span>
<span id="OfferModule2_textLineBlurb6" style="display:none;"></span>
<span id="OfferModule2_textLineBlurbTwo6" style="display:none;"></span>
<span id="OfferModule2_textLineURL6" style="display:none;"></span>
<span id="OfferModule2_textLineURLTwo6" style="display:none;"></span>
<span id="OfferModule2_offerTitle7" style="display:none;"></span>
<span id="OfferModule2_textLine7" style="display:none;"></span>
<span id="OfferModule2_textLineURL17" style="display:none;"></span>
<span id="OfferModule2_textLineBlurb7" style="display:none;"></span>
<span id="OfferModule2_textLineBlurbTwo7" style="display:none;"></span>
<span id="OfferModule2_textLineURL7" style="display:none;"></span>
<span id="OfferModule2_textLineURLTwo7" style="display:none;"></span>

<span id="OfferModule2_singleHeadline1" style="display:none;"></span>
<span id="OfferModule2_mypara1" style="display:none;"></span>
<span id="OfferModule2_myparaLink1" style="display:none;"></span>
<span id="OfferModule2_BannerAdAltText" style="display:none;"></span>
<span id="OfferModule2_BannerAdLink" style="display:none;"></span>

<span id="OfferModule3_headline1" style="display:none;"></span>
<span id="OfferModule3_offerTitle2" style="display:none;"></span>
<span id="OfferModule3_textLine2" style="display:none;"></span>
<span id="OfferModule3_textLineURL12" style="display:none;"></span>
<span id="OfferModule3_textLineBlurb2" style="display:none;"></span>
<span id="OfferModule3_textLineBlurbTwo2" style="display:none;"></span>
<span id="OfferModule3_textLineURL2" style="display:none;"></span>
<span id="OfferModule3_textLineURLTwo2" style="display:none;"></span>
<span id="OfferModule3_offerTitle3" style="display:none;"></span>
<span id="OfferModule3_textLine3" style="display:none;"></span>
<span id="OfferModule3_textLineURL13" style="display:none;"></span>
<span id="OfferModule3_textLineBlurb3" style="display:none;"></span>
<span id="OfferModule3_textLineBlurbTwo3" style="display:none;"></span>
<span id="OfferModule3_textLineURL3" style="display:none;"></span>
<span id="OfferModule3_textLineURLTwo3" style="display:none;"></span>
<span id="OfferModule3_offerTitle4" style="display:none;"></span>
<span id="OfferModule3_textLine4" style="display:none;"></span>
<span id="OfferModule3_textLineURL14" style="display:none;"></span>
<span id="OfferModule3_textLineBlurb4" style="display:none;"></span>
<span id="OfferModule3_textLineBlurbTwo4" style="display:none;"></span>
<span id="OfferModule3_textLineURL4" style="display:none;"></span>
<span id="OfferModule3_textLineURLTwo4" style="display:none;"></span>
<span id="OfferModule3_singleHeadline1" style="display:none;"></span>
<span id="OfferModule3_mypara1" style="display:none;"></span>
<span id="OfferModule3_myparaLink1" style="display:none;"></span>
<span id="OfferModule3_BannerAdAltText" style="display:none;"></span>
<span id="OfferModule3_BannerAdLink" style="display:none;"></span>
<span id="OfferModule4_BannerAdAltText" style="display:none;"></span>
<span id="OfferModule4_BannerAdLink" style="display:none;"></span>
<span id="eight_hundred" style="display:none;"></span>
<p>============================</p>
<span id="myMER_rule"></span><br><br>
<span id="TermsAndConditions"></span>
<span id="TermsAndConditionsContent"></span>
<span id="TermsAndConditionsContentLink0" style="display:none;"></span>
<span id="TermsAndConditionsContentLink1" style="display:none;"></span>
<span id="TermsAndConditionsContentLink2" style="display:none;"></span>
<span id="TermsAndConditionsContentLink3" style="display:none;"></span>
<span id="TermsAndConditionsContentLink4" style="display:none;"></span>
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
</td></tr>
</table>
</body>
</html>
