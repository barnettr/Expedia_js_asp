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

'Response.Write ("<b>Email Name: = " & MyXMLFileName & "</b><br /><br />")

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
	var toWeb = "View this e-mail as a web page.<br />%%view_email_url%%";
	var sOMNITURE = "%%=OmnitureParams('')=%%";  // %%=Format(ISRA_FARE_AMOUNT_FND,"$###.##")=%%    %%=OmnitureParams('')=%%
	var specialRulesFinal = "CST# 2029030-40<br /><br />(c)2007 Expedia, Inc. All rights reserved. Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.<br /><br />(EMID: "+ID_a+""+ID_b+")(MD: %%=Format(Now()&#44; &#34;yyyyMMddhhmms&#34;)=%%)(EPID: %%sub_PAID%%)(ETID: %%jobid%%)";
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
			var HeroModule_headline1        = [];
			var HeroModule_subHeadline      = [];
			var HeroModule_paragraph        = [];
			var HeroModule_paragraphLink    = [];
			var HeroModule_paragraphLinks   = [];
			var counter = cNodes.childNodes;
			for (z = 0; z < counter.length; z++) {
				var subChildNodes = counter[z];
				if (subChildNodes.tagName == "headline" && subChildNodes.text != "Header max 30 chars, bold, 16px, can wrap to next line")
				{
				    HeroModule_headline1[z]    = subChildNodes.text;
				}
				HeroModule_subHeadline[z]       = (subChildNodes.tagName == "my:subheadline" && subChildNodes.text != "lorem ipsum") ? subChildNodes.text : "";
				var reg = /\<li\>/g;
				HeroModule_paragraph[z]         = (subChildNodes.tagName == "para" && subChildNodes.text != "Lorem ipsum dolar quia voluptas") ? subChildNodes.text.replace(reg, "<br />- ") : "";
				HeroModule_paragraphLink[z]     = (subChildNodes.tagName == "para" && subChildNodes.text != "Lorem ipsum dolar quia voluptas") ? HeroModule_paragraph[z].match(/http\:\/\/[^\"]+/g) : "";
				HeroModule_paragraphLinks[z]    = (subChildNodes.tagName == "para" && subChildNodes.text != "Lorem ipsum dolar quia voluptas") ? HeroModule_paragraph[z].match(/https\:\/\/[^\"]+/g) : "";
			}	
		}
	}
	
	// //////////////////////////////////////////////////////////////////
	// FIRST MAIN MODULE NODE
	// //////////////////////////////////////////////////////////////////
	
	if (xmlObj.childNodes[1].childNodes[1].childNodes[3].tagName == "mainModule") {
		var mainModule = xmlObj.childNodes[1].childNodes[1].childNodes[3].childNodes;
		var MainModule_headline0        = [];
		var MainModule_paragraph        = [];
		var MainModule_paragraphLink    = [];
		var MainModule_paragraphLinks   = [];
		var MainModule_destOffer        = [];
		var MainModule_destOfferBlurb   = [];
		var MainModule_destOfferLink    = [];
		var MainModule_offerText        = [];
		var MainModule_offerStar        = [];
		var MainModule_offerBlurb       = [];
		var MainModule_offerBlurbLink   = [];
		var MainModule_offerLink        = [];
		var MainModule_offerPrice       = [];
		var MainModule_offerTextA       = [];
		var MainModule_offerBlurbA      = [];
		var MainModule_offerLinkA       = [];
		var MainModule_offerTextB       = [];
		var MainModule_offerBlurbB      = [];
		var MainModule_offerLinkB       = [];
		var MainModule_offerTextC       = [];
		var MainModule_offerBlurbC      = [];
		var MainModule_offerLinkC       = [];
		var MainModule_offerTextD       = [];
		var MainModule_offerBlurbD      = [];
		var MainModule_offerLinkD       = [];
		var MainModule_offerTextE       = [];
		var MainModule_offerBlurbE      = [];
		var MainModule_offerLinkE       = [];
		for (var i = 0; i < mainModule.length; i++) {
			if (mainModule[i].tagName == "headline") {
				MainModule_headline0[i] = (mainModule[i].text != "Lorem ipsum dolar") ? mainModule[i].text : "";
			}
			if (mainModule[i].tagName == "para") {
				var rg = /\<li\>/g;
				MainModule_paragraph[i] = (mainModule[i].text != "Lorem ipsum dolar quia ma") ? mainModule[i].text.replace(rg, "<br />- ") : "";
				MainModule_paragraphLink[i] = (mainModule[i].text != "Lorem ipsum dolar quia ma") ? MainModule_paragraph[i].match(/http\:\/\/[^\"]+/g) : "";
				MainModule_paragraphLinks[i] = (mainModule[i].text != "Lorem ipsum dolar quia ma") ? MainModule_paragraph[i].match(/https\:\/\/[^\"]+/g) : "";
			}
			if (mainModule[i].tagName == "offerGroup") {
				if (mainModule[i].childNodes[0].getAttribute("my:destination") != "Lorem ipsum city name") {
					MainModule_destOffer[i]         = (mainModule[i].childNodes[0].getAttribute("my:destination") == "US" || mainModule[i].childNodes[0].getAttribute("my:destination") == "Canada" || mainModule[i].childNodes[0].getAttribute("my:destination") == "Book early to get the best rates") ? "" : MainModule_destOffer[i] = mainModule[i].childNodes[0].getAttribute("my:destination");
					MainModule_destOfferBlurb[i]    = (mainModule[i].childNodes[0].getAttribute("my:blurb") != "lorem ipsum and stuff") ? mainModule[i].childNodes[0].getAttribute("my:blurb") : "";
					MainModule_destOfferLink[i]     = (mainModule[i].childNodes[0].getAttribute("my:link") != "URL Here") ? mainModule[i].childNodes[0].getAttribute("my:link") : "";
				}
				
				// ///////////////////////////////////////////////////////////
				// The old code below was
				// if (mainModule[i].childNodes.length > 0)
				// It has been changed to what you see but may still generate
				// some errors later on
				// //////////////////////////////////////////////////////////
				
				if (mainModule[i].childNodes.length >= 2) 
				{
					if (mainModule[i].childNodes[1].getAttribute("text") == "Lorem ipsum" || mainModule[i].childNodes[1].getAttribute("text") == "lorem ipsum") 
					{}
					else
					{
						MainModule_offerText[i] = (mainModule[i].childNodes[1].getAttribute("text").match(/\�/)) ? mainModule[i].childNodes[1].getAttribute("text").replace("�", "(R)") : mainModule[i].childNodes[1].getAttribute("text");
						MainModule_offerStar[i] = mainModule[i].childNodes[1].getAttribute("star");
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
						MainModule_offerBlurb[i]        = mainModule[i].childNodes[1].getAttribute("blurb");
						MainModule_offerBlurbLink[i]    = MainModule_offerBlurb[i].match(/http\:\/\/[^\"]+/g);
						MainModule_offerLink[i]         = (mainModule[i].childNodes[1].getAttribute("link") == "Add URL Here") ? "" : mainModule[i].childNodes[1].getAttribute("link");
						MainModule_offerPrice[i]        = mainModule[i].childNodes[1].getAttribute("my:price");
					}
					try
				    {
                        MainModule_offerTextA[i]   = mainModule[i].childNodes[2].getAttribute("text");
                        MainModule_offerBlurbA[i]  = mainModule[i].childNodes[2].getAttribute("blurb");
					    MainModule_offerLinkA[i]   = mainModule[i].childNodes[2].getAttribute("link");
					    
					    MainModule_offerTextB[i]   = mainModule[i].childNodes[3].getAttribute("text");
					    MainModule_offerBlurbB[i]  = mainModule[i].childNodes[3].getAttribute("blurb");
					    MainModule_offerLinkB[i]   = mainModule[i].childNodes[3].getAttribute("link");
					    
					    MainModule_offerTextC[i]   = mainModule[i].childNodes[4].getAttribute("text");
					    MainModule_offerBlurbC[i]  = mainModule[i].childNodes[4].getAttribute("blurb");
					    MainModule_offerLinkC[i]   = mainModule[i].childNodes[4].getAttribute("link");
					    
					    MainModule_offerTextD[i]   = mainModule[i].childNodes[5].getAttribute("text");
					    MainModule_offerBlurbD[i]  = mainModule[i].childNodes[5].getAttribute("blurb");
					    MainModule_offerLinkD[i]   = mainModule[i].childNodes[5].getAttribute("link");
					    
					    MainModule_offerTextE[i]   = mainModule[i].childNodes[6].getAttribute("text");
					    MainModule_offerBlurbE[i]  = mainModule[i].childNodes[6].getAttribute("blurb");
					    MainModule_offerLinkE[i]   = mainModule[i].childNodes[6].getAttribute("link");       						    
				    }
				    catch (e)
				    {
				        for(x=0; x<e.length; x++)
				            return false;
				    }
				}
			}
			if (mainModule[i].tagName == "callToAction" && mainModule[i].getAttribute("show") == "yes") {
				var MainModule_callToActionContent = mainModule[i].getAttribute("content");
				var MainModule_callToActionLink = (mainModule[i].getAttribute("link") == "") ? eyebrowLink : mainModule[i].getAttribute("link");
			}
		}
	}

	// /////////////////////////////////////////////////////////////////
	// Test for the existence of a SECOND OFFER MODULE or a 
	// SECOND and THIRD MAIN MODULE
	// /////////////////////////////////////////////////////////////////
	
	for (bb = 0; bb < node.length; bb++) {
		if (bb == 4) {
			
			// ////////////////////////////////////////////////
			// SECOND MAIN MODULE NODE
			// ////////////////////////////////////////////////
			
			if (xmlObj.childNodes[1].childNodes[1].childNodes[4].tagName == "mainModule") {
				var mainModuleTwo = xmlObj.childNodes[1].childNodes[1].childNodes[4].childNodes;
				var MainModule2_paragraph       = [];
				var MainModule2_paragraphLink   = [];
				var MainModule2_destOffer       = [];
		        var MainModule2_destOfferBlurb  = [];
		        var MainModule2_destOfferLink   = [];
				var MainModule2_offerText       = [];
				var MainModule2_offerStar       = [];
				var MainModule2_offerPrice      = [];
				var MainModule2_offerBlurb      = [];
				var MainModule2_offerLink       = [];
				var MainModule2_offerTextA      = [];
				var MainModule2_offerBlurbA     = [];
				var MainModule2_offerLinkA      = [];
				var MainModule2_offerTextB      = [];
				var MainModule2_offerBlurbB     = [];
				var MainModule2_offerLinkB      = [];
				var MainModule2_offerTextC      = [];
				var MainModule2_offerBlurbC     = [];
				var MainModule2_offerLinkC      = [];
			
				for (var i = 0; i < mainModuleTwo.length; i++) {
					if (mainModuleTwo[i].tagName == "headline" && mainModuleTwo[i].text != "Lorem ipsum dolar")
					{
					    var MainModule2_headline0 = mainModuleTwo[i].text;
					}
					
					// TODO: alert(mainModuleTwo[i].text.match(/\<br\>+/i));  Looking for a <br /> tag in the paragraph that creates new lines
					var reg = /\<\li\>/g;
					MainModule2_paragraph[i] = (mainModuleTwo[i].tagName == "para" && mainModuleTwo[i].text != "Lorem ipsum dolar quia ma") ? mainModuleTwo[i].text.replace(reg, "<br />- ") : "";
					MainModule2_paragraphLink[i] = (mainModuleTwo[i].tagName == "para" && mainModuleTwo[i].text != "Lorem ipsum dolar quia ma") ? MainModule2_paragraph[i].match(/http\:\/\/[^\"]+/g)  || MainModule2_paragraph[i].match(/https\:\/\/[^\"]+/i) : "";
					if (mainModuleTwo[i].tagName == "offerGroup") {
					    var MainModule2_destGroup = (mainModuleTwo[i].childNodes[0].getAttribute("my:blurb") != "lorem ipsum and stuff") ? mainModuleTwo[i].childNodes[0].getAttribute("my:blurb") : "";
				        if (mainModuleTwo[i].childNodes[0].getAttribute("my:destination") != "Lorem ipsum city name") {
					        MainModule2_destOffer[i]        = (mainModuleTwo[i].childNodes[0].getAttribute("my:destination") == "US" || mainModuleTwo[i].childNodes[0].getAttribute("my:destination") == "Canada" || mainModuleTwo[i].childNodes[0].getAttribute("my:destination") == "Book early to get the best rates") ? "" : mainModuleTwo[i].childNodes[0].getAttribute("my:destination");
					        MainModule2_destOfferBlurb[i]   = (mainModuleTwo[i].childNodes[0].getAttribute("my:blurb") != "lorem ipsum and stuff") ? mainModuleTwo[i].childNodes[0].getAttribute("my:blurb") : "";
					        MainModule2_destOfferLink[i]    = mainModuleTwo[i].childNodes[0].getAttribute("my:link");
				        }
					    if (mainModuleTwo[i].childNodes.length > 0) {  //== 2 || mainModuleTwo[i].childNodes.length == 5)
						    if ((mainModuleTwo[i].childNodes[1].getAttribute("text") != "Lorem ipsum") && (mainModuleTwo[i].childNodes[1].getAttribute("text") != "lorem ipsum")) {
							    MainModule2_offerText[i] = mainModuleTwo[i].childNodes[1].getAttribute("text");
							    MainModule2_offerStar[i] = mainModuleTwo[i].childNodes[1].getAttribute("star");
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
							    MainModule2_offerBlurb[i]   = mainModuleTwo[i].childNodes[1].getAttribute("blurb");
							    MainModule2_offerLink[i]    = mainModuleTwo[i].childNodes[1].getAttribute("link");
							    MainModule2_offerPrice[i]   = mainModuleTwo[i].childNodes[1].getAttribute("my:price");
						    }
						    try
						    {
                                MainModule2_offerTextA[i]   = mainModuleTwo[i].childNodes[2].getAttribute("text");
                                MainModule2_offerBlurbA[i]  = mainModuleTwo[i].childNodes[2].getAttribute("blurb");
							    MainModule2_offerLinkA[i]   = mainModuleTwo[i].childNodes[2].getAttribute("link");
							    
							    MainModule2_offerTextB[i]   = mainModuleTwo[i].childNodes[3].getAttribute("text");
							    MainModule2_offerBlurbB[i]  = mainModuleTwo[i].childNodes[3].getAttribute("blurb");
							    MainModule2_offerLinkB[i]   = mainModuleTwo[i].childNodes[3].getAttribute("link");
							    
							    MainModule2_offerTextC[i]   = mainModuleTwo[i].childNodes[4].getAttribute("text");
							    MainModule2_offerBlurbC[i]  = mainModuleTwo[i].childNodes[4].getAttribute("blurb");
							    MainModule2_offerLinkC[i]   = mainModuleTwo[i].childNodes[4].getAttribute("link");       						    
						    }
						    catch (e)
						    {
						        for(x=0; x<e.length; x++)
						            return false;
						    }
					    }
					}
					if (mainModuleTwo[i].tagName == "callToAction" && mainModuleTwo[i].getAttribute("show") == "yes")
					{
						var MainModule2_callToActionContent = mainModuleTwo[i].getAttribute("content");
						var MainModule2_callToActionLink = (mainModuleTwo[i].getAttribute("link") == "") ? eyebrowLink : mainModuleTwo[i].getAttribute("link");
					}
				}
			}
			// ////////////////////////////////
			// Start of the FIRST OFFER MODULE 
			// ////////////////////////////////
			if (xmlObj.childNodes[1].childNodes[1].childNodes[4].tagName == "offerModule" && xmlObj.childNodes[1].childNodes[1].childNodes[4].getAttribute("show") == "yes") {
				var offerModule = xmlObj.childNodes[1].childNodes[1].childNodes[4].childNodes;
				var OfferModule_offerTitle      = [];
				var OfferModule_textLine        = [];
				var OfferModule_textLineOneURL  = [];
				var OfferModule_textLineBlurb   = [];
				var OfferModule_textLineURL     = [];
				for(var y = 0; y < offerModule.length; y++) 
				{
					if (offerModule[y].tagName == "headline")
					{
					    var OfferModule_headline0 = offerModule[y].text;
					}
					var OfferModule_paragraph0 = (offerModule[y].tagName == "para" && offerModule[y].text != "Lorem ipsum dolor") ? offerModule[y].text : "";
					if (offerModule[y].tagName == "offer") {
						if (offerModule[y].getAttribute("title") != "Lorem ipsum dolor" && offerModule[y].getAttribute("title") != "Mexico cruise" && offerModule[y].getAttribute("title") != "Carribean cruise") {
							OfferModule_offerTitle[y] = offerModule[y].getAttribute("title");
							OfferModule_textLine[y] = offerModule[y].childNodes[0].text;
							if (offerModule[y].childNodes[0].getAttribute("url") == "URL GOES HERE")
							{}
							else
							{
							    OfferModule_textLineOneURL[y] = offerModule[y].childNodes[0].getAttribute("url");
							}
							
							try
							{
							    OfferModule_textLineBlurb[y] = offerModule[y].childNodes[1].text;
							    OfferModule_textLineURL[y] = offerModule[y].childNodes[1].getAttribute("url");
							}
							catch (e)
							{
							    for(x=0; x<e.length; x++)
						          return false;
							}
						}
					}
					var OfferModule_singleHeadline1 = (offerModule[y].tagName == "my:singleOffer" && offerModule[y].childNodes[0].text != "lorem ipsum" && offerModule[y].childNodes[0].text != "orem ipsum") ? offerModule[y].childNodes[0].text : "";
					var OfferModule_mypara1 = (offerModule[y].tagName == "my:singleOffer" && offerModule[y].childNodes[0].text != "lorem ipsum" && offerModule[y].childNodes[0].text != "orem ipsum") ? offerModule[y].childNodes[1].text : "";
					var OfferModule_myparaLink1 = (offerModule[y].tagName == "my:singleOffer" && offerModule[y].childNodes[0].text != "lorem ipsum" && offerModule[y].childNodes[0].text != "orem ipsum") ? OfferModule_mypara1.match(/http\:\/\/[^\"]+/i) : "";
					var BannerAdAltText = (offerModule[y].tagName == "bannerAd") ? offerModule[y].getAttribute("altText") : "";
					var BannerAdLink = (offerModule[y].tagName == "bannerAd") ? offerModule[y].getAttribute("link") : "";
				}
		
			}
		}
		// ////////////////////////////
		// THIRD MAIN MODULE
		// ///////////////////////////
		if (bb == 5) {
			if (xmlObj.childNodes[1].childNodes[1].childNodes[5].tagName == "mainModule") {
				var mainModuleThree = xmlObj.childNodes[1].childNodes[1].childNodes[5].childNodes;
				var MainModule3_paragraph       = [];
				var MainModule3_paragraphLink   = [];
				var MainModule3_paragraphLinks  = [];
				var MainModule3_offerText       = [];
				var MainModule3_offerStar       = [];
				var MainModule3_offerBlurb      = [];
				var MainModule3_offerLink       = [];
				var MainModule3_offerTextA      = [];
				var MainModule3_offerBlurbA     = [];
				var MainModule3_offerLinkA      = [];
				var MainModule3_offerTextB      = [];
				var MainModule3_offerBlurbB     = [];
				var MainModule3_offerLinkB      = [];
				var MainModule3_offerTextC      = [];
				var MainModule3_offerBlurbC     = [];
				var MainModule3_offerLinkC      = [];
				for (var hh = 0; hh < mainModuleThree.length; hh++) {
					if (mainModuleThree[hh].tagName == "headline" && mainModuleThree[hh].text != "Lorem ipsum dolar")
					{
					    var MainModule3_headline1   = mainModuleThree[hh].text;
					}
					MainModule3_paragraph[hh]       = (mainModuleThree[hh].tagName == "para" && mainModuleThree[hh].text != "Lorem ipsum dolar quia ma") ? mainModuleThree[hh].text : "";
					MainModule3_paragraphLink[hh]   = (mainModuleThree[hh].tagName == "para" && mainModuleThree[hh].text != "Lorem ipsum dolar quia ma") ? MainModule3_paragraph[hh].match(/http\:\/\/[^\"]+/g) : ""; 
					MainModule3_paragraphLinks[hh]  = (mainModuleThree[hh].tagName == "para" && mainModuleThree[hh].text != "Lorem ipsum dolar quia ma") ? MainModule3_paragraph[hh].match(/https\:\/\/[^\"]+/g) : "";
					if (mainModuleThree[hh].tagName == "offerGroup") {
						if ((mainModuleThree[hh].childNodes[1].getAttribute("text") == "Lorem ipsum") || (mainModuleThree[hh].childNodes[1].getAttribute("text") == "lorem ipsum")) 
						{}
						else
						{
							MainModule3_offerText[hh] = mainModuleThree[hh].childNodes[1].getAttribute("text");
							MainModule3_offerStar[hh] = mainModuleThree[hh].childNodes[1].getAttribute("star");
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
							MainModule3_offerBlurb[hh]  = mainModuleThree[hh].childNodes[1].getAttribute("blurb");
							MainModule3_offerLink[hh]   = mainModuleThree[hh].childNodes[1].getAttribute("link");
						}
						try
						{
						    MainModule3_offerTextA[hh]  = mainModuleThree[hh].childNodes[2].getAttribute("text");
						    MainModule3_offerBlurbA[hh] = mainModuleThree[hh].childNodes[2].getAttribute("blurb");
						    MainModule3_offerLinkA[hh]  = mainModuleThree[hh].childNodes[2].getAttribute("link");
							
							MainModule3_offerTextB[hh]  = mainModuleThree[hh].childNodes[3].getAttribute("text");
						    MainModule3_offerBlurbB[hh] = mainModuleThree[hh].childNodes[3].getAttribute("blurb");
						    MainModule3_offerLinkB[hh]  = mainModuleThree[hh].childNodes[3].getAttribute("link");
						    
						    MainModule3_offerTextC[hh]  = mainModuleThree[hh].childNodes[4].getAttribute("text");
						    MainModule3_offerBlurbC[hh] = mainModuleThree[hh].childNodes[4].getAttribute("blurb");
						    MainModule3_offerLinkC[hh]  = mainModuleThree[hh].childNodes[4].getAttribute("link");
						}
						catch (e)
						{
						    for(x=0; x<e.length; x++)
						      return false;
						}
					}
				    if (mainModuleThree[hh].tagName == "callToAction" && mainModuleThree[hh].getAttribute("show") == "yes") {
				         var MainModule3_callToActionContent = mainModuleThree[hh].getAttribute("content");
				         var MainModule3_callToActionLink = mainModuleThree[hh].getAttribute("link");
				    }	
				}
			}
			// //////////////////////////////
			// SECOND OFFER MODULE
			// //////////////////////////////
			if (xmlObj.childNodes[1].childNodes[1].childNodes[5].tagName == "offerModule" && xmlObj.childNodes[1].childNodes[1].childNodes[5].getAttribute("show") == "yes") {
				var offerModuleTwo = xmlObj.childNodes[1].childNodes[1].childNodes[5].childNodes;
				var OfferModule2_offerTitle         = [];
				var OfferModule2_textLine           = [];
				var OfferModule2_textLineBlurb      = [];
				var OfferModule2_textLineBlurbTwo   = [];
				var OfferModule2_textLineURL1       = [];
				var OfferModule2_textLineURL        = [];
				var OfferModule2_textLineURLTwo     = [];
				for (aa = 0; aa < offerModuleTwo.length; aa++) {
					var OfferModule2_headline1  = (offerModuleTwo[aa].tagName == "headline" && offerModuleTwo[aa].text != "Lorem ipsum dolar") ? offerModuleTwo[aa].text : "";
					var OfferModule2_paragraph1 = (offerModuleTwo[aa].tagName == "para" && offerModuleTwo[aa].text != "Lorem ipsum dolor quia") ? offerModuleTwo[aa].text : "";
					if (offerModuleTwo[aa].tagName == "offer" && offerModuleTwo[aa].getAttribute("title") != "Lorem ipsum dolor" && offerModuleTwo[aa].getAttribute("title") != "Mexico cruise" && offerModuleTwo[aa].getAttribute("title") != "Carribean cruise") {
						OfferModule2_offerTitle[aa]     = offerModuleTwo[aa].getAttribute("title");
						OfferModule2_textLine[aa]       = offerModuleTwo[aa].childNodes[0].text;
						OfferModule2_textLineURL1[aa]   = (offerModuleTwo[aa].childNodes[0].getAttribute("url") != "URL GOES HERE") ? offerModuleTwo[aa].childNodes[0].getAttribute("url") : "";
						if (offerModuleTwo[aa].childNodes.length == 2 || offerModuleTwo[aa].childNodes.length == 3) {
						    OfferModule2_textLineBlurb[aa]      = (offerModuleTwo[aa].childNodes[1].text == "Lorem ipsum dolor") ? "" : offerModuleTwo[aa].childNodes[1].text;
						    OfferModule2_textLineURL[aa]        = (offerModuleTwo[aa].childNodes[1].text == "Lorem ipsum dolor") ? "" : offerModuleTwo[aa].childNodes[1].getAttribute("url");
						    OfferModule2_textLineBlurbTwo[aa]   = (offerModuleTwo[aa].childNodes.length > 2) ? offerModuleTwo[aa].childNodes[2].text : "";
					        OfferModule2_textLineURLTwo[aa]     = (offerModuleTwo[aa].childNodes.length > 2) ? offerModuleTwo[aa].childNodes[2].getAttribute("url") : "";
						}
					}
					if (offerModuleTwo[aa].tagName == "my:singleOffer" && offerModuleTwo[aa].childNodes[0].text != "lorem ipsum" && offerModuleTwo[aa].childNodes[0].text != "orem ipsum") 
					{
						var OfferModule2_singleHeadline1    = offerModuleTwo[aa].childNodes[0].text;
						var OfferModule2_mypara1            = (offerModuleTwo[aa].childNodes[1].text != "Possible PMI ad goes here.") ? offerModuleTwo[aa].childNodes[1].text : "";
						var OfferModule2_myparaLink1        = (offerModuleTwo[aa].childNodes[1].text != "Possible PMI ad goes here.") ? OfferModule2_mypara1.match(/http\:\/\/[^\"]+/i) : "";
						
					}
					var OfferModule2_BannerAdAltText    = (offerModuleTwo[aa].tagName == "bannerAd") ? offerModuleTwo[aa].getAttribute("altText") : "";
					var OfferModule2_BannerAdLink       = (offerModuleTwo[aa].tagName == "bannerAd") ? offerModuleTwo[aa].getAttribute("link") : "";
				}
			}
		}
		if (bb == 6) {
			// /////////////////////////////////
			// THIRD OFFER MODULE
			// /////////////////////////////////
			if (xmlObj.childNodes[1].childNodes[1].childNodes[6].tagName == "offerModule") {
				var offerModuleThree = xmlObj.childNodes[1].childNodes[1].childNodes[6].childNodes;
				var OfferModule3_offerTitle         = [];
				var OfferModule3_textLine           = [];
				var OfferModule3_textLineURL1       = [];
				var OfferModule3_textLineBlurb      = [];
				var OfferModule3_textLineBlurbTwo   = [];
				var OfferModule3_textLineURL        = [];
				var OfferModule3_textLineURLTwo     = [];
				var OfferModule3_myparaLink1        = [];
				for (aa = 0; aa < offerModuleThree.length; aa++) {
					var OfferModule3_headline1 = (offerModuleThree[aa].tagName == "headline" && offerModuleThree[aa].text != "Lorem ipsum dolar") ? offerModuleThree[aa].text : "";
					var OfferModule3_paragraph1 = (offerModuleThree[aa].tagName == "para" && offerModuleThree[aa].text != "Lorem ipsum dolor quia") ? offerModuleThree[aa].text : "";
					if (offerModuleThree[aa].tagName == "offer" && offerModuleThree[aa].getAttribute("title") != "Lorem ipsum dolor" && offerModuleThree[aa].getAttribute("title") != "Mexico cruise" && offerModuleThree[aa].getAttribute("title") != "Carribean cruise") {
						OfferModule3_offerTitle[aa] = offerModuleThree[aa].getAttribute("title");
						OfferModule3_textLine[aa] = offerModuleThree[aa].childNodes[0].text;
						OfferModule3_textLineURL1[aa] = offerModuleThree[aa].childNodes[0].getAttribute("url");
						  OfferModule3_textLineBlurb[aa] = (offerModuleThree[aa].childNodes[1].text != "Lorem ipsum dolor") ? offerModuleThree[aa].childNodes[1].text : "";
						  OfferModule3_textLineURL[aa] = (offerModuleThree[aa].childNodes[1].text != "Lorem ipsum dolor") ? offerModuleThree[aa].childNodes[1].getAttribute("url") : "";
						  OfferModule3_textLineBlurbTwo[aa] = (offerModuleThree[aa].childNodes.length > 2) ? offerModuleThree[aa].childNodes[2].text : "";
				          OfferModule3_textLineURLTwo[aa] = (offerModuleThree[aa].childNodes.length > 2) ? offerModuleThree[aa].childNodes[2].getAttribute("url") : "";
					}
					if (offerModuleThree[aa].tagName == "my:singleOffer" && offerModuleThree[aa].childNodes[0].text != "orem ipsum") {
						if (offerModuleThree[aa].childNodes[0].text != "lorem ipsum") {
						    var OfferModule3_singleHeadline1 = offerModuleThree[aa].childNodes[0].text;
						    var OfferModule3_mypara1 = (offerModuleThree[aa].childNodes[1].text.match(/jpg/) != "jpg") ? offerModuleThree[aa].childNodes[1].text : "";
							OfferModule3_myparaLink1[aa] = (offerModuleThree[aa].childNodes[1].text.match(/jpg/) != "jpg") ? OfferModule3_mypara1.match(/http\:\/\/[^\"]+/g) : "";
						}
					}
					var OfferModule3_BannerAdAltText = (offerModuleThree[aa].tagName == "bannerAd") ? offerModuleThree[aa].getAttribute("altText") : "";
					var OfferModule3_BannerAdLink = (offerModuleThree[aa].tagName == "bannerAd") ? offerModuleThree[aa].getAttribute("link") : "";
				}
			}
			// //////////////////////////////
			// FOURTH MAIN MODULE
			// //////////////////////////////
			if (xmlObj.childNodes[1].childNodes[1].childNodes[6].tagName == "mainModule") {
				var mainModuleFour = xmlObj.childNodes[1].childNodes[1].childNodes[6].childNodes;
				var MainModule4_paragraph       = [];
				var MainModule4_paragraphLink   = [];
				var MainModule4_paragraphLinks  = [];
				var MainModule4_offerText       = [];
				var MainModule4_offerStar       = [];
				var MainModule4_offerBlurb      = [];
				var MainModule4_offerLink       = [];
				var MainModule4_offerTextA      = [];
				var MainModule4_offerBlurbA     = [];
				var MainModule4_offerLinkA      = [];
				var MainModule4_offerTextB      = [];
				var MainModule4_offerBlurbB     = [];
				var MainModule4_offerLinkB      = [];
				var MainModule4_offerTextC      = [];
				var MainModule4_offerBlurbC     = [];
				var MainModule4_offerLinkC      = [];
				for (var pb = 0; pb < mainModuleFour.length; pb++) {
					var MainModule4_headline1 = (mainModuleFour[pb].tagName == "headline" && mainModuleFour[pb].text != "Lorem ipsum dolar") ? mainModuleFour[pb].text : "";
					MainModule4_paragraph[pb] = (mainModuleFour[pb].tagName == "para" && mainModuleFour[pb].text != "Lorem ipsum dolar quia ma") ? mainModuleFour[pb].text : "";
					MainModule4_paragraphLink[pb] = (mainModuleFour[pb].tagName == "para" && mainModuleFour[pb].text != "Lorem ipsum dolar quia ma") ? MainModule4_paragraph[pb].match(/http\:\/\/[^\"]+/g) : ""; 
					MainModule4_paragraphLinks[pb] = (mainModuleFour[pb].tagName == "para" && mainModuleFour[pb].text != "Lorem ipsum dolar quia ma") ? MainModule4_paragraph[pb].match(/https\:\/\/[^\"]+/g) : "";
					if (mainModuleFour[pb].tagName == "offerGroup") {
						if (mainModuleFour[pb].childNodes[1].getAttribute("text") != "Lorem ipsum" || mainModuleFour[pb].childNodes[1].getAttribute("text") != "lorem ipsum") {
							MainModule4_offerText[pb] = mainModuleFour[pb].childNodes[1].getAttribute("text");
							MainModule4_offerStar[pb] = mainModuleFour[pb].childNodes[1].getAttribute("star");
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
							MainModule4_offerBlurb[pb] = mainModuleFour[pb].childNodes[1].getAttribute("blurb");
							MainModule4_offerLink[pb] = mainModuleFour[pb].childNodes[1].getAttribute("link");
							
							
						}
					}
					try
					{
					    MainModule4_offerTextA[pb]  = mainModuleFour[pb].childNodes[2].getAttribute("text");
						MainModule4_offerBlurbA[pb] = mainModuleFour[pb].childNodes[2].getAttribute("blurb");
						MainModule4_offerLinkA[pb]  = mainModuleFour[pb].childNodes[2].getAttribute("link");
						
						MainModule4_offerTextB[pb]  = mainModuleFour[pb].childNodes[3].getAttribute("text");
						MainModule4_offerBlurbB[pb] = mainModuleFour[pb].childNodes[3].getAttribute("blurb");
						MainModule4_offerLinkB[pb]  = mainModuleFour[pb].childNodes[3].getAttribute("link");
						
						MainModule4_offerTextC[pb]  = mainModuleFour[pb].childNodes[4].getAttribute("text");
						MainModule4_offerBlurbC[pb] = mainModuleFour[pb].childNodes[4].getAttribute("blurb");
						MainModule4_offerLinkC[pb]  = mainModuleFour[pb].childNodes[4].getAttribute("link");
					}
					catch(e) 
					{
					    for(x=0; x<e.length; x++)
						  return false;
					}
					var MainModule4_callToActionContent = (mainModuleFour[pb].tagName == "callToAction" && mainModuleFour[pb].getAttribute("show") == "yes") ? mainModuleFour[pb].getAttribute("content") : "";
					var MainModule4_callToActionLink = (mainModuleFour[pb].tagName == "callToAction" && mainModuleFour[pb].getAttribute("show") == "yes") ? mainModuleFour[pb].getAttribute("link") : "";
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
				var mainModuleFive = xmlObj.childNodes[1].childNodes[1].childNodes[7].childNodes;
				var MainModule5_paragraph       = [];
				var MainModule5_paragraphLink   = [];
				var MainModule5_paragraphLinks  = [];
				var MainModule5_offerText       = [];
				var MainModule5_offerStar       = [];
				var MainModule5_offerBlurb      = [];
				var MainModule5_offerLink       = [];
				var MainModule5_offerTextA      = [];
				var MainModule5_offerBlurbA     = [];
				var MainModule5_offerLinkA      = [];
				var MainModule5_offerTextB      = [];
				var MainModule5_offerBlurbB     = [];
				var MainModule5_offerLinkB      = [];
				var MainModule5_offerTextC      = [];
				var MainModule5_offerBlurbC     = [];
				var MainModule5_offerLinkC      = [];
				for (var ch = 0; ch < mainModuleFive.length; ch++)
				{
					if (mainModuleFive[ch].tagName == "headline" && mainModuleFive[ch].text != "Lorem ipsum dolar")
					{
						var MainModule5_headline1 = mainModuleFive[ch].text;
					}
					if (mainModuleFive[ch].tagName == "para" && mainModuleFive[ch].text != "Lorem ipsum dolar quia ma")
					{
						MainModule5_paragraph[ch] = mainModuleFive[ch].text;
						MainModule5_paragraphLink[ch] = MainModule5_paragraph[ch].match(/http\:\/\/[^\"]+/g); 
						MainModule5_paragraphLinks[ch] = MainModule5_paragraph[ch].match(/https\:\/\/[^\"]+/g);
					}
					if (mainModuleFive[ch].tagName == "offerGroup")
					{
						if (mainModuleFive[ch].childNodes[1].getAttribute("text") == "Lorem ipsum" || mainModuleFive[ch].childNodes[1].getAttribute("text") == "lorem ipsum")
						{
						}
						else
						{
							MainModule5_offerText[ch] = mainModuleFive[ch].childNodes[1].getAttribute("text");
							MainModule5_offerStar[ch] = mainModuleFive[ch].childNodes[1].getAttribute("star");
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
							MainModule5_offerBlurb[ch] = mainModuleFive[ch].childNodes[1].getAttribute("blurb");
							MainModule5_offerLink[ch] = mainModuleFive[ch].childNodes[1].getAttribute("link");
						}
						try
						{
						    MainModule5_offerTextA[ch]  = mainModuleFive[ch].childNodes[2].getAttribute("text");
							MainModule5_offerBlurbA[ch] = mainModuleFive[ch].childNodes[2].getAttribute("blurb");
							MainModule5_offerLinkA[ch]  = mainModuleFive[ch].childNodes[2].getAttribute("link");
							
							MainModule5_offerTextB[ch]  = mainModuleFive[ch].childNodes[3].getAttribute("text");
							MainModule5_offerBlurbB[ch] = mainModuleFive[ch].childNodes[3].getAttribute("blurb");
							MainModule5_offerLinkB[ch]  = mainModuleFive[ch].childNodes[3].getAttribute("link");
							
							MainModule5_offerTextC[ch]  = mainModuleFive[ch].childNodes[4].getAttribute("text");
							MainModule5_offerBlurbC[ch] = mainModuleFive[ch].childNodes[4].getAttribute("blurb");
							MainModule5_offerLinkC[ch]  = mainModuleFive[ch].childNodes[4].getAttribute("link");
						}
						catch (e)
						{
						  for(x=0; x<e.length; x++)
						    return false;
						}
					}
					if (mainModuleFive[ch].tagName == "callToAction" && mainModuleFive[ch].getAttribute("show") == "yes")
					{
						var MainModule5_callToActionContent = mainModuleFive[ch].getAttribute("content");
						var MainModule5_callToActionLink = mainModuleFive[ch].getAttribute("link");
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
				if (TC_nodes.text.match(/\�/))
				{
					var TermsAndConditionsContent = TC_nodes.text.replace("�", "(R)");
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
				var specialRulesContactUs = "Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address.<br />https://www.expedia.com/pub/agent.dll?qscr=fbak&%%=OmnitureParams('')=%%<br /><br />To contact us or send feedback, please click here or contact us via postal mail at:<br />Expedia, Inc.,<br />attn: EMC Team, 3150 139th Avenue SE,<br />Bellevue, WA 98005.<br />https://www.expedia.com/pub/agent.dll?qscr=fbak&%%=OmnitureParams('')=%%<br /><br />For additional assistance, visit the Expedia.com Customer Support Center, or call 1-800-Expedia.<br />http://www.expedia.com/daily/service/default.asp?%%=OmnitureParams('')=%%";
			}
			if (TC_nodes.getAttribute("type") == "A NOTE ABOUT PRICES")
			{
				var ANoteAboutPrices = TC_nodes.getAttribute("type");
				var specialRulesPrices = "Prices are subject to availability and subject to change without notice.<br /><br />All prices were current at the time this e-mail was published.<br /><br />Hotel, vacation package, and cruise prices on the Expedia Website are constantly updated. Please refer to the site for the most current pricing. Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city. additional taxes, fees and charges may apply. airfare is subject to, without limitation:<br />(1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip;<br />(2) up to $18 per roundtrip in local airport charges;<br />(3) federal excise tax of $3.20 per U.S. domestic flight segment;<br />(4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in alaska or Hawaii; and<br />(5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking).<br />a segment is defined as a takeoff and a landing.<br /><br />";
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
	document.getElementById("toWeb").style.cssText = "display:inline;";
	document.getElementById("toWeb").innerHTML = toWeb;
	// ///////////////
	// EYEBROW TEXT
	// ///////////////
	if (eyebrowText || eyebrowBlurb)
	{
		document.getElementById("eyebrowText").style.cssText = "display:inline;";
		document.getElementById("eyebrowBlurb").style.cssText = "display:inline;";
		document.getElementById("eyebrowLink").style.cssText = "display:inline;";
		document.getElementById("eyebrowText").innerHTML = eyebrowText;
		document.getElementById("eyebrowBlurb").innerHTML = eyebrowBlurb+".<br />";
		document.getElementById("eyebrowLink").innerHTML = eyebrowLink+sOMNITURE+"<br /><br />";
	}
	// ////////////
	// HERO MODULE
	// ////////////
	if (heroModuleAltText)
	{
		document.getElementById("heroModuleAltText").style.cssText = "display:inline;";
		document.getElementById("heroModuleURL").style.cssText = "display:inline;";
		document.getElementById("heroModuleAltText").innerHTML = heroModuleAltText+".<br />";
		document.getElementById("heroModuleURL").innerHTML = eyebrowLink+sOMNITURE+"<br /><br />";
	}
	for (y=0; y<HeroModule_headline1.length; y++)
	{
	    if (HeroModule_headline1[y])
	    {
    	    document.getElementById("HeroModule_headline1"+y).style.cssText = "display:inline;";
		    document.getElementById("HeroModule_headline1"+y).innerHTML = "<b>"+HeroModule_headline1[y]+"<b><br />";
	    }
	}
	
	var sublen = HeroModule_subHeadline.length;
	for (var rb = 0; rb < sublen; rb++)
	{
		if (HeroModule_subHeadline[rb])
		{
			document.getElementById("HeroModule_subHeadline"+rb).style.cssText = "display:inline;";
			document.getElementById("HeroModule_subHeadline"+rb).innerHTML = "<b>"+HeroModule_subHeadline[rb]+"<b><br />";
		}
	}
	var leng = HeroModule_paragraph.length;
	for (var d = 0; d < leng; d++)
	{
		if (HeroModule_paragraph[d])
		{
			document.getElementById("HeroModule_paragraph"+d).style.cssText = "display:inline;";
			document.getElementById("HeroModule_paragraph"+d).innerHTML = HeroModule_paragraph[d]+"<br /><br />";
			if (HeroModule_paragraph[d].match(/(http\:)|(https\:)/))
			{
			    document.getElementById("HeroModule_paragraph"+d).innerHTML = HeroModule_paragraph[d]+"<br />";
			}
			if (HeroModule_paragraphLinks[d])
		    {
			    for (x=0; x<HeroModule_paragraphLinks[d].length; x++)
				{
				    if (HeroModule_paragraphLinks[d][x])
			        {
			            document.getElementById("HeroModule_paragraphLinks"+d+x).style.cssText = "display:inline;";
			            document.getElementById("HeroModule_paragraphLinks"+d+x).innerHTML = HeroModule_paragraphLinks[d][x]+"<br />";
			        }
			        else (x == HeroModule_paragraphLinks[d].length -1)
			        {
			            document.getElementById("HeroModule_paragraphLinks"+d+x).innerHTML += "<br />";
			        }
				}
		    }
			if (HeroModule_paragraphLink[d])
			{
				for (x=0; x<HeroModule_paragraphLink[d].length; x++)
				{
				    if (HeroModule_paragraphLink[d][x])
			        {
			            document.getElementById("HeroModule_paragraphLink"+d+x).style.cssText = "display:inline;";
			            document.getElementById("HeroModule_paragraphLink"+d+x).innerHTML = HeroModule_paragraphLink[d][x]+"<br />";
			        }
			        if (x == HeroModule_paragraphLink[d].length -1)
			        {
			            document.getElementById("HeroModule_paragraphLink"+d+x).innerHTML += "<br />";
			        }
				}
			}
		}
	}
	// //////////////////
	// FIRST MAIN MODULE
	// //////////////////
	if (MainModule_headline0)
	{
		for (a=0;a<MainModule_headline0.length;a++)
		{
		    if (MainModule_headline0[a])
		    {
		        document.getElementById("MainModule_headline0"+a).style.cssText = "display:inline;";
		        document.getElementById("MainModule_headline0"+a).innerHTML = "<b>"+MainModule_headline0[a]+"<b><br />";
		        if (MainModule_headline0[a]){"<br />";}
		    }
		}
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
				    var paraString = MainModule_paragraph[h].replace(/\<p\>/i, "");
				    if (paraString.match(/(http\:)|(https\:)/))
				    {
				        document.getElementById("MainModule_paragraph"+h).innerHTML = paraString+"<br />";
				    }
				    else
				    {
				        document.getElementById("MainModule_paragraph"+h).innerHTML = paraString+"<br /><br />";
				    }
			    }
			    else
			    {
			        document.getElementById("MainModule_paragraph"+h).style.cssText = "display:inline;";
			        var paraString = MainModule_paragraph[h].replace(/\<p\>/i, "");
			        var book_now = /(Expedia|Enter)/;
			        if (paraString.match(book_now))
			        {
			            document.getElementById("MainModule_paragraph"+h).innerHTML = "<br />"+paraString+"<br />";
			        }
			        else
			        {
			            if (MainModule_paragraphLink[h])
			            {
			                document.getElementById("MainModule_paragraph"+h).innerHTML = "<br />"+paraString+"<br />";
			            }
			            else
			            {
			                document.getElementById("MainModule_paragraph"+h).innerHTML = "<br />"+paraString+"<br /><br />";
			            }
			            if (MainModule_paragraphLinks[h])
			            {
			                document.getElementById("MainModule_paragraph"+h).innerHTML = "<br />"+paraString+"<br />";
			            }
			            else
			            {
			                document.getElementById("MainModule_paragraph"+h).innerHTML = "<br />"+paraString+"<br /><br />";
			            }
			        }
			    }
			    if (MainModule_paragraphLinks[h])
			    {
				    document.getElementById("MainModule_paragraphLinks"+h).style.cssText = "display:inline;";
				    if (MainModule_paragraphLink[h])
				    {
				        document.getElementById("MainModule_paragraphLinks"+h).innerHTML = MainModule_paragraphLinks[h]+"<br />";
				    }
				    else
				    {
				        document.getElementById("MainModule_paragraphLinks"+h).innerHTML = MainModule_paragraphLinks[h]+"<br /><br />";
			        }
			    }
			    if (MainModule_paragraphLink[h])
			    {
				    for (x=0; x<MainModule_paragraphLink[h].length; x++)
				    {
				        if (MainModule_paragraphLink[h][x])
				        {
				            document.getElementById("MainModule_paragraphLink"+h+x).style.cssText = "display:inline;";
				            document.getElementById("MainModule_paragraphLink"+h+x).innerHTML = MainModule_paragraphLink[h][x]+"<br />";
				        }
				        if (x == MainModule_paragraphLink[h].length -1)
				        {
				            document.getElementById("MainModule_paragraphLink"+h+x).innerHTML += "<br />";
				        }
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
				    document.getElementById("MainModule_destOffer"+bj).innerHTML = MainModule_destOffer[bj]+"<br /><br />";
				    document.getElementById("MainModule_destOfferBlurb"+bj).style.cssText = "display:inline;";
				    document.getElementById("MainModule_destOfferBlurb"+bj).innerHTML = MainModule_destOfferBlurb[bj]+"<br />";
			    }
			    else
			    {
				    document.getElementById("MainModule_destOffer"+bj).innerHTML = MainModule_destOffer[bj]+" ";
				    document.getElementById("MainModule_destOfferBlurb"+bj).style.cssText = "display:inline;";
				    document.getElementById("MainModule_destOfferBlurb"+bj).innerHTML = MainModule_destOfferBlurb[bj]+"<br />";
				    document.getElementById("MainModule_destOfferLink"+bj).style.cssText = "display:inline;";
				    document.getElementById("MainModule_destOfferLink"+bj).innerHTML = MainModule_destOfferLink[bj]+sOMNITURE+"<br /><br />";
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
					    document.getElementById("MainModule_destOffer"+j).innerHTML = MainModule_destOffer[j]+"<br /><br />";
				    }
				    else
				    {
					    document.getElementById("MainModule_destOffer"+j).innerHTML = MainModule_destOffer[j]+" ";
					    document.getElementById("MainModule_destOfferBlurb"+j).style.cssText = "display:inline;";
					    document.getElementById("MainModule_destOfferBlurb"+j).innerHTML = MainModule_destOfferBlurb[j]+"<br />";
					    document.getElementById("MainModule_destOfferLink"+j).style.cssText = "display:inline;";
					    document.getElementById("MainModule_destOfferLink"+j).innerHTML = MainModule_destOfferLink[j]+"<br /><br />";
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
				if (MainModule_offerPrice[j] != "" && MainModule_offerPrice[j] != "XXX")
				{
				    document.getElementById("MainModule_offerPrice"+j).style.cssText = "display:inline;";
				}
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
				document.getElementById("MainModule_offerPrice"+j).innerHTML = "&nbsp;&nbsp;&nbsp;$"+MainModule_offerPrice[j];
				document.getElementById("MainModule_offerBlurb"+j).innerHTML = MainModule_offerBlurb[j]+"<br />";
				document.getElementById("MainModule_offerBlurbLink"+j).innerHTML = MainModule_offerBlurbLink[j]+"<br /><br />";
				document.getElementById("MainModule_offerLink"+j).innerHTML = MainModule_offerLink[j]+sOMNITURE+"<br /><br />";
			}
		}
	}
	if (MainModule_offerTextA)
	{
		for(var a=0;a<MainModule_offerTextA.length;a++)
		{
		    if (MainModule_offerTextA[a])
		    {
		        document.getElementById("MainModule_offerTextA"+a).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerTextA"+a).innerHTML = MainModule_offerTextA[a];
		        document.getElementById("MainModule_offerBlurbA"+a).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerBlurbA"+a).innerHTML = MainModule_offerBlurbA[a]+"<br />";
	            document.getElementById("MainModule_offerLinkA"+a).style.cssText = "display:inline;";
	            document.getElementById("MainModule_offerLinkA"+a).innerHTML = MainModule_offerLinkA[a]+sOMNITURE+"<br /><br />";
	        }
	    }
	}
	if (MainModule_offerTextB)
	{
		for(var b=0;b<MainModule_offerTextB.length;b++)
		{
		    if (MainModule_offerTextB[b])
		    {
		        document.getElementById("MainModule_offerTextB"+b).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerTextB"+b).innerHTML = MainModule_offerTextB[b];
		        document.getElementById("MainModule_offerBlurbB"+b).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerBlurbB"+b).innerHTML = MainModule_offerBlurbB[b]+"<br />";
		        document.getElementById("MainModule_offerLinkB"+b).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerLinkB"+b).innerHTML = MainModule_offerLinkB[b]+sOMNITURE+"<br /><br />";
		    }
		}
	}
	if (MainModule_offerTextC)
	{
		for(var c=0;c<MainModule_offerTextC.length;c++)
		{
		    if (MainModule_offerTextC[c])
		    {
		        document.getElementById("MainModule_offerTextC"+c).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerTextC"+c).innerHTML = MainModule_offerTextC[c];
		        document.getElementById("MainModule_offerBlurbC"+c).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerBlurbC"+c).innerHTML = MainModule_offerBlurbC[c]+"<br />";
		        document.getElementById("MainModule_offerLinkC"+c).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerLinkC"+c).innerHTML = MainModule_offerLinkC[c]+sOMNITURE+"<br /><br />";
		    }
		}
	}
	if (MainModule_offerTextD)
	{
		for(var d=0;d<MainModule_offerTextD.length;d++)
		{
		    if (MainModule_offerTextD[d])
		    {
		        document.getElementById("MainModule_offerTextD"+d).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerTextD"+d).innerHTML = MainModule_offerTextD[d];
		        document.getElementById("MainModule_offerBlurbD"+d).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerBlurbD"+d).innerHTML = MainModule_offerBlurbD[d]+"<br />";
		        document.getElementById("MainModule_offerLinkD"+d).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerLinkD"+d).innerHTML = MainModule_offerLinkD[d]+sOMNITURE+"<br /><br />";
		    }
		}
	}
	if (MainModule_offerTextE)
	{
		for(var e=0;e<MainModule_offerTextE.length;e++)
		{
		    if (MainModule_offerTextE[e])
		    {
		        document.getElementById("MainModule_offerTextE"+e).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerTextE"+e).innerHTML = MainModule_offerTextE[e];
		        document.getElementById("MainModule_offerBlurbE"+e).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerBlurbE"+e).innerHTML = MainModule_offerBlurbE[e]+"<br />";
		        document.getElementById("MainModule_offerLinkE"+e).style.cssText = "display:inline;";
		        document.getElementById("MainModule_offerLinkE"+e).innerHTML = MainModule_offerLinkE[e]+sOMNITURE+"<br /><br />";
		    }
		}
	}
	if (MainModule_callToActionContent)
	{
		document.getElementById("MainModule_callToActionContent").style.cssText = "display:inline;";
		document.getElementById("MainModule_callToActionContent").innerHTML = MainModule_callToActionContent+"<br />";
		if (MainModule_callToActionLink)
		{
			document.getElementById("MainModule_callToActionLink").style.cssText = "display:inline;";
			document.getElementById("MainModule_callToActionLink").innerHTML = MainModule_callToActionLink+sOMNITURE+"<br /><br />";
		}
		else
		{
			document.getElementById("MainModule_callToActionContent").innerHTML = MainModule_callToActionContent+"<br />";
			document.getElementById("MainModule_callToActionLink").style.cssText = "display:inline;";
			document.getElementById("MainModule_callToActionLink").innerHTML = eyebrowLink+sOMNITURE+"<br /><br />";
		}
	}
	// //////////////////////////////////
	// SECOND MAIN MODULE IF ENCOUNTERED
	// //////////////////////////////////
	
	if (MainModule2_headline0)
	{
		document.getElementById("MainModule2_headline0").style.cssText = "display:inline;";
		document.getElementById("MainModule2_headline0").innerHTML = "<b>"+MainModule2_headline0+"<b><br /><br />";
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
						document.getElementById("MainModule2_paragraph"+j).innerHTML = MainModule2_paragraph[j]+"<br />";
					}
					else
					{
						document.getElementById("MainModule2_paragraph"+j).innerHTML = MainModule2_paragraph[j]+"<br /><br />";
					}
				}
				else
				{
					document.getElementById("MainModule2_paragraph"+j).innerHTML = MainModule2_paragraph[j]+"<br />";
				}
				if (MainModule2_paragraphLink[j])
				{
				    for (x=0; x<MainModule2_paragraphLink[j].length; x++)
				    {
				        if (MainModule2_paragraphLink[j][x])
				        {
				            document.getElementById("MainModule2_paragraphLink"+j+x).style.cssText = "display:inline;";
				            document.getElementById("MainModule2_paragraphLink"+j+x).innerHTML = MainModule2_paragraphLink[j][x]+"<br />";
				        }
				        if (x == MainModule2_paragraphLink[j].length -1)
				        {
				            document.getElementById("MainModule2_paragraphLink"+j+x).innerHTML += "<br />";
				        }
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
				document.getElementById("MainModule2_offerPrice"+xx).style.cssText = "display:inline;";
				document.getElementById("MainModule2_offerText"+xx).innerHTML = MainModule2_offerText[xx];
				document.getElementById("MainModule2_offerStar"+xx).innerHTML = "&nbsp;"+MainModule2_offerStar[xx];
				if (MainModule2_offerPrice[xx] && MainModule2_offerPrice[xx] != "XXX")
				{
				    document.getElementById("MainModule2_offerBlurb"+xx).innerHTML = MainModule2_offerBlurb[xx];
				    document.getElementById("MainModule2_offerPrice"+xx).innerHTML = "&nbsp;&nbsp;&nbsp;$"+MainModule2_offerPrice[xx]+"<br />";
				}
				else
				{
				    document.getElementById("MainModule2_offerBlurb"+xx).innerHTML = MainModule2_offerBlurb[xx]+"<br />";
				}
				document.getElementById("MainModule2_offerLink"+xx).innerHTML = MainModule2_offerLink[xx]+sOMNITURE+"<br /><br />";
			}
		}
	}
	if (MainModule2_offerTextA)
	{
		for(var a=0;a<MainModule2_offerTextA.length;a++)
		{
		    if (MainModule2_offerTextA[a])
		    {
		        document.getElementById("MainModule2_offerTextA"+a).style.cssText = "display:inline;";
		        document.getElementById("MainModule2_offerTextA"+a).innerHTML = MainModule2_offerTextA[a];
		        document.getElementById("MainModule2_offerBlurbA"+a).style.cssText = "display:inline;";
		        document.getElementById("MainModule2_offerBlurbA"+a).innerHTML = MainModule2_offerBlurbA[a]+"<br />";
	            document.getElementById("MainModule2_offerLinkA"+a).style.cssText = "display:inline;";
	            document.getElementById("MainModule2_offerLinkA"+a).innerHTML = MainModule2_offerLinkA[a]+sOMNITURE+"<br /><br />";
	        }
	    }
	}
	if (MainModule2_offerTextB)
	{
		for(var b=0;b<MainModule2_offerTextB.length;b++)
		{
		    if (MainModule2_offerTextB[b])
		    {
		        document.getElementById("MainModule2_offerTextB"+b).style.cssText = "display:inline;";
		        document.getElementById("MainModule2_offerTextB"+b).innerHTML = MainModule2_offerTextB[b];
		        document.getElementById("MainModule2_offerBlurbB"+b).style.cssText = "display:inline;";
		        document.getElementById("MainModule2_offerBlurbB"+b).innerHTML = MainModule2_offerBlurbB[b]+"<br />";
		        document.getElementById("MainModule2_offerLinkB"+b).style.cssText = "display:inline;";
		        document.getElementById("MainModule2_offerLinkB"+b).innerHTML = MainModule2_offerLinkB[b]+sOMNITURE+"<br /><br />";
		    }
		}
	}
	if (MainModule2_offerTextC)
	{
		for(var c=0;c<MainModule2_offerTextC.length;c++)
		{
		    if (MainModule2_offerTextC[c])
		    {
		        document.getElementById("MainModule2_offerTextC"+c).style.cssText = "display:inline;";
		        document.getElementById("MainModule2_offerTextC"+c).innerHTML = MainModule2_offerTextC[c];
		        document.getElementById("MainModule2_offerBlurbC"+c).style.cssText = "display:inline;";
		        document.getElementById("MainModule2_offerBlurbC"+c).innerHTML = MainModule2_offerBlurbC[c]+"<br />";
		        document.getElementById("MainModule2_offerLinkC"+c).style.cssText = "display:inline;";
		        document.getElementById("MainModule2_offerLinkC"+c).innerHTML = MainModule2_offerLinkC[c]+sOMNITURE+"<br /><br />";
		    }
		}
	}
	if (MainModule2_callToActionContent)
	{
		document.getElementById("MainModule2_callToActionContent").style.cssText = "display:inline;";
		document.getElementById("MainModule2_callToActionLink").style.cssText = "display:inline;";
		document.getElementById("MainModule2_callToActionContent").innerHTML = "<br />"+MainModule2_callToActionContent+"<br />";
		document.getElementById("MainModule2_callToActionLink").innerHTML = MainModule2_callToActionLink+sOMNITURE+"<br /><br />";
	}
	// /////////////////////////////////
	// THIRD MAIN MODULE
	// /////////////////////////////////
	if (MainModule3_headline1)
	{
		document.getElementById("MainModule3_headline1").style.cssText = "display:inline;";
		document.getElementById("MainModule3_headline1").innerHTML = "<br /><b>"+MainModule3_headline1+"<b><br /><br />";
	}
	if (MainModule3_paragraph)
	{
		for (ww = 0; ww < MainModule3_paragraph.length; ww++)
		{
			if (MainModule3_paragraph[ww])
			{
				document.getElementById("MainModule3_paragraph"+ww).style.cssText = "display:inline;"
				if (MainModule3_paragraphLink[ww])
				{
				    document.getElementById("MainModule3_paragraph"+ww).innerHTML = MainModule3_paragraph[ww]+"<br />";
				}
				else
				{
				    document.getElementById("MainModule3_paragraph"+ww).innerHTML = MainModule3_paragraph[ww]+"<br /><br />";
				}
				if (MainModule3_paragraphLinks[ww])
				{
					document.getElementById("MainModule3_paragraphLinks"+ww).style.cssText = "display:inline;";
					document.getElementById("MainModule3_paragraphLinks"+ww).innerHTML = MainModule3_paragraphLinks[ww]+"<br /><br />";
				}
				if (MainModule3_paragraphLink[ww])
				{
					for (x=0; x<MainModule3_paragraphLink[ww].length; x++)
				    {
				        if (MainModule3_paragraphLink[ww][x])
				        {
				            document.getElementById("MainModule3_paragraphLink"+ww+x).style.cssText = "display:inline;";
				            document.getElementById("MainModule3_paragraphLink"+ww+x).innerHTML = MainModule3_paragraphLink[ww][x]+"<br />";
				        }
				        if (x == MainModule3_paragraphLink[ww].length -1)
				        {
				            document.getElementById("MainModule3_paragraphLink"+ww+x).innerHTML += "<br />";
				        }
				    }
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
				document.getElementById("MainModule3_offerBlurb"+ss).innerHTML = MainModule3_offerBlurb[ss]+"<br />";
				document.getElementById("MainModule3_offerLink"+ss).innerHTML = MainModule3_offerLink[ss]+sOMNITURE+"<br /><br />";
			}
		}
	}
	if (MainModule3_offerTextA)
	{
		for(var a=0;a<MainModule3_offerTextA.length;a++)
		{
		    if (MainModule3_offerTextA[a])
		    {
		        document.getElementById("MainModule3_offerTextA"+a).style.cssText = "display:inline;";
		        document.getElementById("MainModule3_offerTextA"+a).innerHTML = MainModule3_offerTextA[a];
		        document.getElementById("MainModule3_offerBlurbA"+a).style.cssText = "display:inline;";
		        document.getElementById("MainModule3_offerBlurbA"+a).innerHTML = MainModule3_offerBlurbA[a]+"<br />";
		        document.getElementById("MainModule3_offerLinkA"+a).style.cssText = "display:inline;";
		        document.getElementById("MainModule3_offerLinkA"+a).innerHTML = MainModule3_offerLinkA[a]+sOMNITURE+"<br /><br />";
		    }
		}
	}
	if (MainModule3_offerTextB)
	{
		for(var b=0;b<MainModule3_offerTextB.length;b++)
		{
		    if (MainModule3_offerTextB[b])
		    {
		        document.getElementById("MainModule3_offerTextB"+b).style.cssText = "display:inline;";
		        document.getElementById("MainModule3_offerTextB"+b).innerHTML = MainModule3_offerTextB[b];
		        document.getElementById("MainModule3_offerBlurbB"+b).style.cssText = "display:inline;";
		        document.getElementById("MainModule3_offerBlurbB"+b).innerHTML = MainModule3_offerBlurbB[b]+"<br />";
		        document.getElementById("MainModule3_offerLinkB"+b).style.cssText = "display:inline;";
		        document.getElementById("MainModule3_offerLinkB"+b).innerHTML = MainModule3_offerLinkB[b]+sOMNITURE+"<br /><br />";
		    }
		}
	}
	if (MainModule3_callToActionContent)
	{
		document.getElementById("MainModule3_callToActionContent").style.cssText = "display:inline;";
		document.getElementById("MainModule3_callToActionContent").innerHTML = MainModule3_callToActionContent+"<br />";
		document.getElementById("MainModule3_callToActionLink").style.cssText = "display:inline;";
		document.getElementById("MainModule3_callToActionLink").innerHTML = MainModule3_callToActionLink+sOMNITURE+"<br /><br />";
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
					document.getElementById("MainModule4_paragraph"+www).innerHTML = MainModule4_paragraph[www]+"<br />";
				}
				else
				{
					document.getElementById("MainModule4_paragraph"+www).innerHTML = MainModule4_paragraph[www]+"<br />";
				}
				if (MainModule4_paragraphLinks[www])
				{
					document.getElementById("MainModule4_paragraphLinks"+www).style.cssText = "display:inline;";
					document.getElementById("MainModule4_paragraphLinks"+www).innerHTML = MainModule4_paragraphLinks[www]+"<br /><br />";
				}
				if (MainModule4_paragraphLink[www])
				{
					document.getElementById("MainModule4_paragraphLink"+www).style.cssText = "display:inline;";
					document.getElementById("MainModule4_paragraphLink"+www).innerHTML = MainModule4_paragraphLink[www]+"<br />";
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
				document.getElementById("MainModule4_offerBlurb"+sss).innerHTML = MainModule4_offerBlurb[sss]+"<br />";
				document.getElementById("MainModule4_offerLink"+sss).innerHTML = MainModule4_offerLink[sss]+sOMNITURE+"<br /><br />";
			}
		}
	}
	if (MainModule4_offerTextA)
	{
		document.getElementById("MainModule4_offerTextA").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerTextA").innerHTML = MainModule4_offerTextA;
		document.getElementById("MainModule4_offerBlurbA").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerBlurbA").innerHTML = MainModule4_offerBlurbA+"<br />";
		document.getElementById("MainModule4_offerLinkA").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerLinkA").innerHTML = MainModule4_offerLinkA+sOMNITURE+"<br /><br />";
	}
	if (MainModule4_offerTextB)
	{
		document.getElementById("MainModule4_offerTextB").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerTextB").innerHTML = MainModule4_offerTextB;
		document.getElementById("MainModule4_offerBlurbB").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerBlurbB").innerHTML = MainModule4_offerBlurbB+"<br />";
		document.getElementById("MainModule4_offerLinkB").style.cssText = "display:inline;";
		document.getElementById("MainModule4_offerLinkB").innerHTML = MainModule4_offerLinkB+sOMNITURE+"<br /><br />";
	}
	if (MainModule4_callToActionContent)
	{
		document.getElementById("MainModule4_callToActionContent").style.cssText = "display:inline;";
		document.getElementById("MainModule4_callToActionContent").innerHTML = MainModule4_callToActionContent+"<br />";
		document.getElementById("MainModule4_callToActionLink").style.cssText = "display:inline;";
		document.getElementById("MainModule4_callToActionLink").innerHTML = MainModule4_callToActionLink+"<br />";
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
					document.getElementById("MainModule5_paragraph"+fba).innerHTML = MainModule5_paragraph[fba]+"<br />";
				}
				else
				{
					document.getElementById("MainModule5_paragraph"+fba).innerHTML = MainModule5_paragraph[fba]+"<br />";
				}
				if (MainModule5_paragraphLinks[fba])
				{
					document.getElementById("MainModule5_paragraphLinks"+fba).style.cssText = "display:inline;";
					document.getElementById("MainModule5_paragraphLinks"+fba).innerHTML = MainModule5_paragraphLinks[fba]+"<br /><br />";
				}
				if (MainModule5_paragraphLink[fba])
				{
					document.getElementById("MainModule5_paragraphLink"+fba).style.cssText = "display:inline;";
					document.getElementById("MainModule5_paragraphLink"+fba).innerHTML = MainModule5_paragraphLink[fba]+"<br />";
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
		document.getElementById("OfferModule_headline0").innerHTML = OfferModule_headline0+"<br /><br />";
		}
	}
	if (OfferModule_paragraph0)
	{
		if (OfferModule_paragraph0 != "Lorem ipsum dolor quia")
		{
			document.getElementById("OfferModule_paragraph0").style.cssText = "display:inline;";
			document.getElementById("OfferModule_paragraph0").innerHTML = OfferModule_paragraph0+"<br />";
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
				document.getElementById("OfferModule_offerTitle"+ab).innerHTML = "<b>"+OfferModule_offerTitle[ab]+"<b><br />";
				document.getElementById("OfferModule_textLine"+ab).style.cssText = "display:inline;";
				document.getElementById("OfferModule_textLine"+ab).innerHTML = OfferModule_textLine[ab]+"<br />";
				if (OfferModule_textLineURL[ab])
				{
				}
				else
				{
					document.getElementById("OfferModule_textLineOneURL"+ab).style.cssText = "display:inline;";
					document.getElementById("OfferModule_textLineOneURL"+ab).innerHTML = OfferModule_textLineOneURL[ab]+"<br /><br />";
				}
				if (OfferModule_textLineBlurb[ab])
				{
					document.getElementById("OfferModule_textLineBlurb"+ab).style.cssText = "display:inline;";
					document.getElementById("OfferModule_textLineBlurb"+ab).innerHTML = OfferModule_textLineBlurb[ab]+"<br />";
					document.getElementById("OfferModule_textLineURL"+ab).style.cssText = "display:inline;";
					document.getElementById("OfferModule_textLineURL"+ab).innerHTML = OfferModule_textLineURL[ab]+"<br /><br />";
				}
			}
		}
	}
	if (OfferModule_singleHeadline1)
	{
	    document.getElementById("OfferModule_singleHeadline1").style.cssText = "display:inline;";
	    document.getElementById("OfferModule_singleHeadline1").innerHTML = OfferModule_singleHeadline1+"<br /><br />";
	    document.getElementById("OfferModule_mypara1").style.cssText = "display:inline;";
	    
	    if (OfferModule_myparaLink1)
	    {
	        document.getElementById("OfferModule_mypara1").innerHTML = OfferModule_mypara1+"<br />";
	        document.getElementById("OfferModule_myparaLink1").style.cssText = "display:inline;";
	        document.getElementById("OfferModule_myparaLink1").innerHTML = OfferModule_myparaLink1+"<br /><br />";
	    }
	    else
	    {
	        document.getElementById("OfferModule_mypara1").innerHTML = OfferModule_mypara1+"<br /><br />";
	    }
	}
	if (BannerAdAltText)
	{
		document.getElementById("BannerAdAltText").style.cssText = "display:inline;";
		document.getElementById("BannerAdLink").style.cssText = "display:inline;";
		document.getElementById("BannerAdAltText").innerHTML = BannerAdAltText+"<br />";
		document.getElementById("BannerAdLink").innerHTML = BannerAdLink+sOMNITURE+"<br /><br />";
	}
	// /////////////////////
	// SECOND OFFER MODULE
	// /////////////////////
	if (OfferModule2_headline1)
	{
		document.getElementById("OfferModule2_headline1").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_headline1").innerHTML = OfferModule2_headline1+"<br /><br />";
	}
	if (OfferModule2_paragraph1)
	{
		document.getElementById("OfferModule2_paragraph1").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_paragraph1").innerHTML = OfferModule2_paragraph1+"<br />";
	}
	if (OfferModule2_offerTitle != undefined)    
	{
		var yy_length = OfferModule2_offerTitle.length;
		for (var ii = 0; ii < yy_length; ii++)
		{
			if (OfferModule2_offerTitle[ii] != undefined)
			{
				document.getElementById("OfferModule2_offerTitle"+ii).style.cssText = "display:inline;";
				document.getElementById("OfferModule2_offerTitle"+ii).innerHTML = "<b>"+OfferModule2_offerTitle[ii]+"</b><br />";
				document.getElementById("OfferModule2_textLine"+ii).style.cssText = "display:inline;";
				document.getElementById("OfferModule2_textLine"+ii).innerHTML = OfferModule2_textLine[ii]+"<br />";
				if (OfferModule2_textLineURL1[ii] != "ADD_URL" || OfferModule2_textLineURL1[ii] != "URL GOES HERE")
				{
				    if (OfferModule2_textLineBlurb[ii] || OfferModule2_textLine[ii])
				    {
				        if (OfferModule2_textLineURL1[ii] == "")
				        {}
				        else
				        {
				            document.getElementById("OfferModule2_textLineURL1"+ii).style.cssText = "display:inline;";
				            document.getElementById("OfferModule2_textLineURL1"+ii).innerHTML = OfferModule2_textLineURL1[ii]+sOMNITURE+"<br />";
				        }
				    }
				    else
				    {
				        document.getElementById("OfferModule2_textLineURL1"+ii).style.cssText = "display:inline;";
				        document.getElementById("OfferModule2_textLineURL1"+ii).innerHTML = OfferModule2_textLineURL1[ii]+sOMNITURE+"<br /><br />";
				    }
				}
				if (OfferModule2_textLineBlurb[ii])
				{
				    document.getElementById("OfferModule2_textLineBlurb"+ii).style.cssText = "display:inline;";
				    document.getElementById("OfferModule2_textLineBlurb"+ii).innerHTML = OfferModule2_textLineBlurb[ii]+"<br />";
				    if (OfferModule2_textLineBlurbTwo[ii])
				    {
				        document.getElementById("OfferModule2_textLineBlurbTwo"+ii).style.cssText = "display:inline;";
				        document.getElementById("OfferModule2_textLineBlurbTwo"+ii).innerHTML = OfferModule2_textLineBlurbTwo[ii]+"<br />";
				    }
				    if (OfferModule2_textLineURLTwo[ii])
				    {
				        document.getElementById("OfferModule2_textLineURLTwo"+ii).style.cssText = "display:inline;";
				        document.getElementById("OfferModule2_textLineURLTwo"+ii).innerHTML = OfferModule2_textLineURLTwo[ii]+sOMNITURE+"<br /><br />";    
				    }
				    else
				    {
				        document.getElementById("OfferModule2_textLineURL"+ii).style.cssText = "display:inline;";
				        document.getElementById("OfferModule2_textLineURL"+ii).innerHTML = OfferModule2_textLineURL[ii]+sOMNITURE+"<br /><br />";
				    }
				}
			}
		}
	}
	
	if (OfferModule2_singleHeadline1)
	{
		document.getElementById("OfferModule2_singleHeadline1").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_singleHeadline1").innerHTML = OfferModule2_singleHeadline1+"<br /><br />";
	}
	if (OfferModule2_mypara1)
	{
		document.getElementById("OfferModule2_mypara1").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_mypara1").innerHTML = OfferModule2_mypara1+"<br />";
		if (OfferModule2_myparaLink1)
		{
			document.getElementById("OfferModule2_myparaLink1").style.cssText = "display:inline;";
			document.getElementById("OfferModule2_myparaLink1").innerHTML = OfferModule2_myparaLink1+"<br /><br />";
		}
	}
	if (OfferModule2_BannerAdAltText)
	{
		document.getElementById("OfferModule2_BannerAdAltText").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_BannerAdAltText").innerHTML = OfferModule2_BannerAdAltText+"<br />";
		document.getElementById("OfferModule2_BannerAdLink").style.cssText = "display:inline;";
		document.getElementById("OfferModule2_BannerAdLink").innerHTML = OfferModule2_BannerAdLink+sOMNITURE+"<br /><br />";
	}
	// ////////////////////
	// THIRD OFFER MODULE
	// ////////////////////
	if (OfferModule3_headline1)
	{
	    document.getElementById("OfferModule3_headline1").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_headline1").innerHTML = OfferModule3_headline1+"<br /><br />";
	}
	if (OfferModule3_offerTitle)    
	{
		for (var lb = 0; lb < OfferModule3_offerTitle.length; lb++)
		{
			if (OfferModule3_offerTitle[lb] != undefined)
			{
				document.getElementById("OfferModule3_offerTitle"+lb).style.cssText = "display:inline;";
				document.getElementById("OfferModule3_offerTitle"+lb).innerHTML = OfferModule3_offerTitle[lb]+"<br />";
				document.getElementById("OfferModule3_textLine"+lb).style.cssText = "display:inline;";
				document.getElementById("OfferModule3_textLine"+lb).innerHTML = OfferModule3_textLine[lb]+"<br />";
				if (OfferModule3_textLineURL1[lb] != "ADD_URL")
				{
				    document.getElementById("OfferModule3_textLineURL1"+lb).style.cssText = "display:inline;";
				    document.getElementById("OfferModule3_textLineURL1"+lb).innerHTML = OfferModule3_textLineURL1[lb]+sOMNITURE+"<br /><br />";
				}
				if (OfferModule3_textLineBlurb[lb])
				{
				    document.getElementById("OfferModule3_textLineBlurb"+lb).style.cssText = "display:inline;";
				    document.getElementById("OfferModule3_textLineBlurb"+lb).innerHTML = OfferModule3_textLineBlurb[lb]+"<br />";
				    if (OfferModule3_textLineBlurbTwo[lb] != "undefined")
				    {
				        document.getElementById("OfferModule3_textLineBlurbTwo"+lb).style.cssText = "display:inline;";
				        document.getElementById("OfferModule3_textLineBlurbTwo"+lb).innerHTML = OfferModule3_textLineBlurbTwo[lb]+"<br />";
				    }
				    if (OfferModule3_textLineURLTwo[lb])
				    {
				        document.getElementById("OfferModule3_textLineURLTwo"+lb).style.cssText = "display:inline;";
				        document.getElementById("OfferModule3_textLineURLTwo"+lb).innerHTML = OfferModule3_textLineURLTwo[lb]+sOMNITURE+"<br /><br />";    
				    }
				    if (OfferModule3_textLineURL[lb])
				    {
				        document.getElementById("OfferModule3_textLineURL"+lb).style.cssText = "display:inline;";
				        document.getElementById("OfferModule3_textLineURL"+lb).innerHTML = OfferModule3_textLineURL[lb]+sOMNITURE+"<br /><br />";
				    }
				}
			}
		}
	}
	if (OfferModule3_singleHeadline1)
	{
		document.getElementById("OfferModule3_singleHeadline1").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_singleHeadline1").innerHTML = "<b>"+OfferModule3_singleHeadline1+"</b><br /><br />";
	}
	if (OfferModule3_mypara1)
	{
		document.getElementById("OfferModule3_mypara1").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_mypara1").innerHTML = OfferModule3_mypara1+"<br />";
		
		if (OfferModule3_myparaLink1)
		{
			for (var x=0;x<OfferModule3_myparaLink1.length;x++)
			{
			    //alert(x);
			    if (OfferModule3_myparaLink1[x])
			    {
			        for (var y=0;y<OfferModule3_myparaLink1[x].length;y++)
			        {
			            if (OfferModule3_myparaLink1[x][y])
			            {
			                document.getElementById("OfferModule3_myparaLink1"+x+y).style.cssText = "display:inline;";
			                document.getElementById("OfferModule3_myparaLink1"+x+y).innerHTML = OfferModule3_myparaLink1[x][y]+"<br />";
//			                if (OfferModule3_myparaLink1[x][y] = -1)
//			                {
//			                    document.getElementById("OfferModule3_myparaLink1"+x+y).innerHTML += "<br />";
//			                }    
			            }
			        }
			    }
			}
		}
	}
	if (OfferModule3_BannerAdAltText)
	{
		document.getElementById("OfferModule3_BannerAdAltText").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_BannerAdLink").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_BannerAdAltText").innerHTML = "<br />"+OfferModule3_BannerAdAltText+"<br />";
		document.getElementById("OfferModule3_BannerAdLink").innerHTML = OfferModule3_BannerAdLink+sOMNITURE+"<br /><br />";
	}
	if (OfferModule4_BannerAdAltText)
	{
	    document.getElementById("OfferModule4_BannerAdAltText").style.cssText = "display:inline;";
		document.getElementById("OfferModule4_BannerAdLink").style.cssText = "display:inline;";
		document.getElementById("OfferModule4_BannerAdAltText").innerHTML = "<br />"+OfferModule4_BannerAdAltText+"<br />";
		document.getElementById("OfferModule4_BannerAdLink").innerHTML = OfferModule4_BannerAdLink+sOMNITURE+"<br /><br />";
	}
	// /////////////////////
	// TERMS AND CONDITIONS
	// /////////////////////
	document.getElementById("myMER_rule").innerHTML = myMER_rule;
	if (TermsAndConditions)
	{
		document.getElementById("TermsAndConditions").innerHTML = TermsAndConditions+"<br />";
		document.getElementById("TermsAndConditionsContent").innerHTML = TermsAndConditionsContent+"<br />";
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
				    document.getElementById("TermsAndConditionsContentLink"+ps).innerHTML = TermsAndConditionsContentLink[ps][0]+"<br />";
			    }
			    if (TermsAndConditionsContentLink[ps][1])
			    {
				    document.getElementById("TermsAndConditionsContentLink"+ps).innerHTML += TermsAndConditionsContentLink[ps][1]+"<br />";
			    }
			    if (TermsAndConditionsContentLink[ps][2])
			    {
				    document.getElementById("TermsAndConditionsContentLink"+ps).innerHTML += TermsAndConditionsContentLink[ps][2]+"<br />";
			    }
			    if (TermsAndConditionsContentLink[ps])
			    {
				    document.getElementById("TermsAndConditionsContentLink"+ps).innerHTML += "<br />";
			    }
	        }    
	    }
	}
	if (TermsAndConditionsTwo)
	{
	    document.getElementById("TermsAndConditionsTwo").style.cssText = "display:inline;";
	    document.getElementById("TermsAndConditionsTwo").innerHTML = TermsAndConditionsTwo+"<br />";
	    document.getElementById("TermsAndConditionsTwoLink").style.cssText = "display:inline;";
	    document.getElementById("TermsAndConditionsTwoLink").innerHTML = TermsAndConditionsTwoLink+"<br /><br />";
	}
	if (Unsubscribe)
	{
		document.getElementById("Unsubscribe").style.cssText = "display:inline;";
		document.getElementById("Unsubscribe").innerHTML = Unsubscribe+"<br />";
		document.getElementById("UnsubscribeContent1").style.cssText = "display:inline;";
		document.getElementById("UnsubscribeContent1").innerHTML = UnsubscribeContent1+"<br />";
		document.getElementById("UnsubscribeContent1Link").style.cssText = "display:inline;";
		document.getElementById("UnsubscribeContent1Link").innerHTML = UnsubscribeContent1Link+"<br /><br />";
		document.getElementById("UnsubscribeContent2").style.cssText = "display:inline;";
		document.getElementById("UnsubscribeContent2").innerHTML = UnsubscribeContent2+"<br />";
		document.getElementById("UnsubscribeContent2Link").style.cssText = "display:inline;";
		document.getElementById("UnsubscribeContent2Link").innerHTML = UnsubscribeContent2Link+"<br /><br />";
	}
	document.getElementById("ContactUs").innerHTML = ContactUs;
	document.getElementById("specialRulesContactUs").innerHTML = specialRulesContactUs;
	if (ANoteAboutPrices)
	{
	    document.getElementById("ANoteAboutPrices").style.cssText = "display:inline;";
	    document.getElementById("ANoteAboutPrices").innerHTML = ANoteAboutPrices+"<br />";
	    document.getElementById("specialRulesPrices").style.cssText = "display:inline;";
	    document.getElementById("specialRulesPrices").innerHTML = specialRulesPrices+"<br />";
	}
	if (CustomerSupportTitle)
	{
	    document.getElementById("CustomerSupportTitle").style.cssText = "display:inline;";
	    document.getElementById("CustomerSupportTitle").innerHTML = CustomerSupportTitle+"<br />";
	    document.getElementById("CustomerSupport").style.cssText = "display:inline;";
	    document.getElementById("CustomerSupport").innerHTML = CustomerSupport+"<br />";
	    document.getElementById("CustomerSupportLink").style.cssText = "display:inline;";
	    document.getElementById("CustomerSupportLink").innerHTML = CustomerSupportLink+"<br /><br />";
	}
	if (OfficialRulesTitle)
	{
	    document.getElementById("OfficialRulesTitle").style.cssText = "display:inline;";
	    document.getElementById("OfficialRulesTitle").innerHTML = OfficialRulesTitle+"<br />";
	    document.getElementById("OfficialRules").style.cssText = "display:inline;";
	    document.getElementById("OfficialRules").innerHTML = OfficialRules+"<br />";
	    document.getElementById("OfficialRulesLink").style.cssText = "display:inline;";
	    document.getElementById("OfficialRulesLink").innerHTML = OfficialRulesLink+"<br /><br />";
	}
	document.getElementById("specialRulesFinal").innerHTML = specialRulesFinal;
}
                var condition = [];
                    
                for (var i = 0; i < 2; i++)
                condition[i] ? (this.vars.slide6.is(":visible") && this.vars.thumb3.hasClass("hover")): ;
                    switch (conditions) {
                        case "3":
                            this.hideYouTubeVideo();
                            break
                        case "4":
                            this.hideYouTubeVideo();
                            break
                        case "5":
                            this.hideYouTubeVideo();
                    }
	</script>
</head>

<body bgcolor="#FFFFCC" onload="loadXML()" style="font-family: verdana; font-size: 11; color: #000000;">
<table width="100%">
<tr><td bgcolor="#FFFFCC" style="font-family: verdana; font-size: 11; color: #000000;">
<!-- SPAN TAGS TO HOLD EXTRACTED TEXT AND RENDER TO PAGE -->
<span id="toWeb"></span><br /><br /> 
<span id="eyebrowText" style="display:none;"></span>&nbsp;<span id="eyebrowBlurb" style="display:none;"></span>
<span id="eyebrowLink" style="display:none;"></span>

<span id="heroModuleAltText" style="display:none;"></span>
<span id="heroModuleURL" style="display:none;"></span>
<span id="HeroModule_headline10" style="display:none;"></span>
<span id="HeroModule_headline11" style="display:none;"></span>
<span id="HeroModule_subHeadline1" style="display:none;"></span>
<span id="HeroModule_subHeadline2" style="display:none;"></span>
<span id="HeroModule_paragraph1" style="display:none;"></span>
<span id="HeroModule_paragraphLinks10" style="display:none;"></span>
<span id="HeroModule_paragraphLink10" style="display:none;"></span>
<span id="HeroModule_paragraph2" style="display:none;"></span>
<span id="HeroModule_paragraphLinks20" style="display:none;"></span>
<span id="HeroModule_paragraphLink20" style="display:none;"></span>
<span id="HeroModule_paragraphLink21" style="display:none;"></span>
<span id="HeroModule_paragraphLink22" style="display:none;"></span>
<span id="HeroModule_paragraph3" style="display:none;"></span>
<span id="HeroModule_paragraphLinks30" style="display:none;"></span>
<span id="HeroModule_paragraphLink30" style="display:none;"></span>
<span id="HeroModule_paragraphLink31" style="display:none;"></span>
<span id="HeroModule_paragraphLink32" style="display:none;"></span>
<span id="HeroModule_paragraphLink33" style="display:none;"></span>
<span id="HeroModule_paragraphLink34" style="display:none;"></span>
<span id="HeroModule_paragraph4" style="display:none;"></span>
<span id="HeroModule_paragraphLinks40" style="display:none;"></span>
<span id="HeroModule_paragraphLink40" style="display:none;"></span>
<span id="HeroModule_paragraphLink41" style="display:none;"></span>
<span id="HeroModule_paragraphLink42" style="display:none;"></span>
<span id="HeroModule_paragraphLink43" style="display:none;"></span>
<span id="HeroModule_paragraph5" style="display:none;"></span>
<span id="HeroModule_paragraphLinks50" style="display:none;"></span>
<span id="HeroModule_paragraphLink50" style="display:none;"></span>
<span id="HeroModule_paragraph6" style="display:none;"></span>
<span id="HeroModule_paragraphLinks60" style="display:none;"></span>
<span id="HeroModule_paragraphLink60" style="display:none;"></span>
<span id="HeroModule_paragraph7" style="display:none;"></span>
<span id="HeroModule_paragraphLinks70" style="display:none;"></span>
<span id="HeroModule_paragraphLink70" style="display:none;"></span>

<span id="MainModule_headline00" style="display:none;"></span>
<span id="MainModule_headline01" style="display:none;"></span>
<span id="MainModule_paragraph0" style="display:none;"></span>
<span id="MainModule_paragraphLinks0" style="display:none;"></span>

<span id="MainModule_paragraph1" style="display:none;"></span>
<span id="MainModule_paragraphLinks1" style="display:none;"></span>
<span id="MainModule_paragraphLink10" style="display:none;"></span>
<span id="MainModule_paragraphLink11" style="display:none;"></span>
<span id="MainModule_paragraph2" style="display:none;"></span>
<span id="MainModule_paragraphLinks2" style="display:none;"></span>
<span id="MainModule_paragraphLink12" style="display:none;"></span>
<span id="MainModule_paragraphLink20" style="display:none;"></span>
<span id="MainModule_paragraphLink21" style="display:none;"></span>
<span id="MainModule_paragraphLink22" style="display:none;"></span>
<span id="MainModule_paragraphLink23" style="display:none;"></span>
<span id="MainModule_paragraphLink24" style="display:none;"></span>
<span id="MainModule_paragraph3" style="display:none;"></span>
<span id="MainModule_paragraphLinks3" style="display:none;"></span>
<span id="MainModule_paragraphLink13" style="display:none;"></span>
<span id="MainModule_paragraphLink30" style="display:none;"></span>
<span id="MainModule_paragraph4" style="display:none;"></span>
<span id="MainModule_paragraphLinks4" style="display:none;"></span>
<span id="MainModule_paragraphLink14" style="display:none;"></span>
<span id="MainModule_paragraphLink40" style="display:none;"></span>
<span id="MainModule_paragraph5" style="display:none;"></span>
<span id="MainModule_paragraphLinks5" style="display:none;"></span>
<span id="MainModule_paragraphLink15" style="display:none;"></span>
<span id="MainModule_paragraphLink50" style="display:none;"></span>
<span id="MainModule_paragraph6" style="display:none;"></span>
<span id="MainModule_paragraphLinks6" style="display:none;"></span>
<span id="MainModule_paragraphLink16" style="display:none;"></span>
<span id="MainModule_paragraphLink60" style="display:none;"></span>
<span id="MainModule_paragraph7" style="display:none;"></span>
<span id="MainModule_paragraphLinks7" style="display:none;"></span>
<span id="MainModule_paragraphLink17" style="display:none;"></span>
<span id="MainModule_paragraphLink70" style="display:none;"></span>
<span id="MainModule_paragraph8" style="display:none;"></span>
<span id="MainModule_paragraphLinks8" style="display:none;"></span>
<span id="MainModule_paragraphLink18" style="display:none;"></span>
<span id="MainModule_paragraphLink80" style="display:none;"></span>
<span id="MainModule_paragraph9" style="display:none;"></span>
<span id="MainModule_paragraphLinks9" style="display:none;"></span>
<span id="MainModule_paragraphLink19" style="display:none;"></span>
<span id="MainModule_paragraphLink90" style="display:none;"></span>
<span id="MainModule_paragraph10" style="display:none;"></span>
<span id="MainModule_paragraphLinks10" style="display:none;"></span>
<span id="MainModule_paragraphLink110" style="display:none;"></span>


<span id="MainModule_destGroup" style="display:none;"></span>

<span id="MainModule_destOffer0" style="display:none;"></span> <span id="MainModule_destOfferBlurb0" style="display:none;"></span>
<span id="MainModule_destOfferLink0" style="display:none;"></span>
<span id="MainModule_offerText0" style="display:none;"></span> <span id="MainModule_offerStar0" style="display:none;"></span> <span id="MainModule_offerPrice0" style="display:none;"></span> <span id="MainModule_offerBlurb0" style="display:none;"></span>
<span id="MainModule_offerBlurbLink0" style="display:none;"></span>
<span id="MainModule_offerLink0" style="display:none;"></span>

<span id="MainModule_destOffer1" style="display:none;"></span> <span id="MainModule_destOfferBlurb1" style="display:none;"></span>
<span id="MainModule_destOfferLink1" style="display:none;"></span>
<span id="MainModule_offerText1" style="display:none;"></span> <span id="MainModule_offerStar1" style="display:none;"></span> <span id="MainModule_offerPrice1" style="display:none;"></span> <span id="MainModule_offerBlurb1" style="display:none;"></span>
<span id="MainModule_offerBlurbLink1" style="display:none;"></span>
<span id="MainModule_offerLink1" style="display:none;"></span>

<span id="MainModule_destOffer2" style="display:none;"></span> <span id="MainModule_destOfferBlurb2" style="display:none;"></span>
<span id="MainModule_destOfferLink2" style="display:none;"></span>
<span id="MainModule_offerText2" style="display:none;"></span> <span id="MainModule_offerStar2" style="display:none;"></span> <span id="MainModule_offerPrice2" style="display:none;"></span> <span id="MainModule_offerBlurb2" style="display:none;"></span>
<span id="MainModule_offerBlurbLink2" style="display:none;"></span>
<span id="MainModule_offerLink2" style="display:none;"></span>
<span id="MainModule_offerTextA22" style="display:none;"></span> <span id="MainModule_offerBlurbA22" style="display:none;"></span>
<span id="MainModule_offerLinkA22" style="display:none;"></span>

<span id="MainModule_destOffer3" style="display:none;"></span> <span id="MainModule_destOfferBlurb3" style="display:none;"></span>
<span id="MainModule_destOfferLink3" style="display:none;"></span>
<span id="MainModule_offerText3" style="display:none;"></span> <span id="MainModule_offerStar3" style="display:none;"></span> <span id="MainModule_offerPrice3" style="display:none;"></span> <span id="MainModule_offerBlurb3" style="display:none;"></span>
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

<span id="MainModule_offerText4" style="display:none;"></span> <span id="MainModule_offerStar4" style="display:none;"></span> <span id="MainModule_offerPrice4" style="display:none;"></span> <span id="MainModule_offerBlurb4" style="display:none;"></span>
<span id="MainModule_offerBlurbLink4" style="display:none;"></span>
<span id="MainModule_offerLink4" style="display:none;"></span>
<span id="MainModule_offerTextA42" style="display:none;"></span> <span id="MainModule_offerBlurbA42" style="display:none;"></span>
<span id="MainModule_offerLinkA42" style="display:none;"></span>

<span id="MainModule_offerText5" style="display:none;"></span> <span id="MainModule_offerStar5" style="display:none;"></span> <span id="MainModule_offerPrice5" style="display:none;"></span> <span id="MainModule_offerBlurb5" style="display:none;"></span>
<span id="MainModule_offerBlurbLink5" style="display:none;"></span>
<span id="MainModule_offerLink5" style="display:none;"></span>
<span id="MainModule_offerTextA52" style="display:none;"></span> <span id="MainModule_offerBlurbA52" style="display:none;"></span>
<span id="MainModule_offerLinkA52" style="display:none;"></span>

<span id="MainModule_offerText6" style="display:none;"></span> <span id="MainModule_offerStar6" style="display:none;"></span> <span id="MainModule_offerPrice6" style="display:none;"></span> <span id="MainModule_offerBlurb6" style="display:none;"></span>
<span id="MainModule_offerBlurbLink6" style="display:none;"></span>
<span id="MainModule_offerLink6" style="display:none;"></span>
<span id="MainModule_offerTextA62" style="display:none;"></span> <span id="MainModule_offerBlurbA62" style="display:none;"></span>
<span id="MainModule_offerLinkA62" style="display:none;"></span>

<span id="MainModule_offerText7" style="display:none;"></span> <span id="MainModule_offerStar7" style="display:none;"></span> <span id="MainModule_offerPrice7" style="display:none;"></span> <span id="MainModule_offerBlurb7" style="display:none;"></span>
<span id="MainModule_offerBlurbLink7" style="display:none;"></span>
<span id="MainModule_offerLink7" style="display:none;"></span>
<span id="MainModule_offerText8" style="display:none;"></span> <span id="MainModule_offerStar8" style="display:none;"></span> <span id="MainModule_offerPrice8" style="display:none;"></span> <span id="MainModule_offerBlurb8" style="display:none;"></span>
<span id="MainModule_offerBlurbLink8" style="display:none;"></span>
<span id="MainModule_offerLink8" style="display:none;"></span>
<span id="MainModule_offerText9" style="display:none;"></span> <span id="MainModule_offerStar9" style="display:none;"></span> <span id="MainModule_offerPrice9" style="display:none;"></span> <span id="MainModule_offerBlurb9" style="display:none;"></span>
<span id="MainModule_offerBlurbLink9" style="display:none;"></span>
<span id="MainModule_offerLink9" style="display:none;"></span>
<span id="MainModule_offerText10" style="display:none;"></span> <span id="MainModule_offerStar10" style="display:none;"></span> <span id="MainModule_offerPrice10" style="display:none;"></span> <span id="MainModule_offerBlurb10" style="display:none;"></span>
<span id="MainModule_offerBlurbLink10" style="display:none;"></span>
<span id="MainModule_offerLink10" style="display:none;"></span>
<span id="MainModule_offerText11" style="display:none;"></span> <span id="MainModule_offerStar11" style="display:none;"></span> <span id="MainModule_offerPrice11" style="display:none;"></span> <span id="MainModule_offerBlurb11" style="display:none;"></span>
<span id="MainModule_offerBlurbLink11" style="display:none;"></span>
<span id="MainModule_offerLink11" style="display:none;"></span>
<span id="MainModule_offerText12" style="display:none;"></span> <span id="MainModule_offerStar12" style="display:none;"></span> <span id="MainModule_offerPrice12" style="display:none;"></span> <span id="MainModule_offerBlurb12" style="display:none;"></span>
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

<span id="MainModule_offerTextA0" style="display:none;"></span> <span id="MainModule_offerBlurbA0" style="display:none;"></span>
<span id="MainModule_offerLinkA0" style="display:none;"></span>
<span id="MainModule_offerTextA1" style="display:none;"></span> <span id="MainModule_offerBlurbA1" style="display:none;"></span>
<span id="MainModule_offerLinkA1" style="display:none;"></span>
<span id="MainModule_offerTextA2" style="display:none;"></span> <span id="MainModule_offerBlurbA2" style="display:none;"></span>
<span id="MainModule_offerLinkA2" style="display:none;"></span>
<span id="MainModule_offerTextA3" style="display:none;"></span> <span id="MainModule_offerBlurbA3" style="display:none;"></span>
<span id="MainModule_offerLinkA3" style="display:none;"></span>
<span id="MainModule_offerTextA4" style="display:none;"></span> <span id="MainModule_offerBlurbA4" style="display:none;"></span>
<span id="MainModule_offerLinkA4" style="display:none;"></span>
<span id="MainModule_offerTextA5" style="display:none;"></span> <span id="MainModule_offerBlurbA5" style="display:none;"></span>
<span id="MainModule_offerLinkA5" style="display:none;"></span>
<span id="MainModule_offerTextB2" style="display:none;"></span> <span id="MainModule_offerBlurbB2" style="display:none;"></span>
<span id="MainModule_offerLinkB2" style="display:none;"></span>
<span id="MainModule_offerTextB3" style="display:none;"></span> <span id="MainModule_offerBlurbB3" style="display:none;"></span>
<span id="MainModule_offerLinkB3" style="display:none;"></span>
<span id="MainModule_offerTextB4" style="display:none;"></span> <span id="MainModule_offerBlurbB4" style="display:none;"></span>
<span id="MainModule_offerLinkB4" style="display:none;"></span>

<span id="MainModule_offerTextC2" style="display:none;"></span> <span id="MainModule_offerBlurbC2" style="display:none;"></span>
<span id="MainModule_offerLinkC2" style="display:none;"></span>
<span id="MainModule_offerTextC3" style="display:none;"></span> <span id="MainModule_offerBlurbC3" style="display:none;"></span>
<span id="MainModule_offerLinkC3" style="display:none;"></span>
<span id="MainModule_offerTextC4" style="display:none;"></span> <span id="MainModule_offerBlurbC4" style="display:none;"></span>
<span id="MainModule_offerLinkC4" style="display:none;"></span>
<span id="MainModule_offerTextC5" style="display:none;"></span> <span id="MainModule_offerBlurbC5" style="display:none;"></span>
<span id="MainModule_offerLinkC5" style="display:none;"></span>
<span id="MainModule_offerTextC6" style="display:none;"></span> <span id="MainModule_offerBlurbC6" style="display:none;"></span>
<span id="MainModule_offerLinkC6" style="display:none;"></span>
<span id="MainModule_offerTextD2" style="display:none;"></span> <span id="MainModule_offerBlurbD2" style="display:none;"></span>
<span id="MainModule_offerLinkD2" style="display:none;"></span>
<span id="MainModule_offerTextD3" style="display:none;"></span> <span id="MainModule_offerBlurbD3" style="display:none;"></span>
<span id="MainModule_offerLinkD3" style="display:none;"></span>
<span id="MainModule_offerTextD4" style="display:none;"></span> <span id="MainModule_offerBlurbD4" style="display:none;"></span>
<span id="MainModule_offerLinkD4" style="display:none;"></span>
<span id="MainModule_offerTextD5" style="display:none;"></span> <span id="MainModule_offerBlurbD5" style="display:none;"></span>
<span id="MainModule_offerLinkD5" style="display:none;"></span>
<span id="MainModule_offerTextD6" style="display:none;"></span> <span id="MainModule_offerBlurbD6" style="display:none;"></span>
<span id="MainModule_offerLinkD6" style="display:none;"></span>
<span id="MainModule_offerTextE2" style="display:none;"></span> <span id="MainModule_offerBlurbE2" style="display:none;"></span>
<span id="MainModule_offerLinkE2" style="display:none;"></span>

<span id="MainModule_callToActionContent" style="display:none;"></span>
<span id="MainModule_callToActionLink" style="display:none;"></span>

<span id="MainModule2_headline0" style="display:none;"></span>
<span id="MainModule2_paragraph0" style="display:none;"></span>
<span id="MainModule2_paragraphLink0" style="display:none;"></span>
<span id="MainModule2_paragraph1" style="display:none;"></span>
<span id="MainModule2_paragraphLink10" style="display:none;"></span>
<span id="MainModule2_paragraphLink11" style="display:none;"></span>
<span id="MainModule2_paragraphLink12" style="display:none;"></span>
<span id="MainModule2_paragraphLink13" style="display:none;"></span>
<span id="MainModule2_paragraphLink14" style="display:none;"></span>
<span id="MainModule2_paragraphLink15" style="display:none;"></span>
<span id="MainModule2_paragraphLink16" style="display:none;"></span>
<span id="MainModule2_paragraphLink17" style="display:none;"></span>
<span id="MainModule2_paragraphLink18" style="display:none;"></span>
<span id="MainModule2_paragraphLink19" style="display:none;"></span>
<span id="MainModule2_paragraph2" style="display:none;"></span>
<span id="MainModule2_paragraphLink20" style="display:none;"></span>
<span id="MainModule2_paragraphLink21" style="display:none;"></span>
<span id="MainModule2_paragraphLink22" style="display:none;"></span>
<span id="MainModule2_paragraph3" style="display:none;"></span>
<span id="MainModule2_paragraphLink30" style="display:none;"></span>

<span id="MainModule2_offerText0" style="display:none;"></span> <span id="MainModule2_offerStar0" style="display:none;"></span> <span id="MainModule2_offerBlurb0" style="display:none;"></span> <span id="MainModule2_offerPrice0" style="display:none;"></span>
<span id="MainModule2_offerLink0" style="display:none;"></span>
<span id="MainModule2_offerText1" style="display:none;"></span> <span id="MainModule2_offerStar1" style="display:none;"></span> <span id="MainModule2_offerBlurb1" style="display:none;"></span> <span id="MainModule2_offerPrice1" style="display:none;"></span>
<span id="MainModule2_offerLink1" style="display:none;"></span>
<span id="MainModule2_offerText2" style="display:none;"></span> <span id="MainModule2_offerStar2" style="display:none;"></span> <span id="MainModule2_offerBlurb2" style="display:none;"></span> <span id="MainModule2_offerPrice2" style="display:none;"></span>
<span id="MainModule2_offerLink2" style="display:none;"></span>
<span id="MainModule2_offerText3" style="display:none;"></span> <span id="MainModule2_offerStar3" style="display:none;"></span> <span id="MainModule2_offerBlurb3" style="display:none;"></span> <span id="MainModule2_offerPrice3" style="display:none;"></span> 


<span id="MainModule2_offerLink3" style="display:none;"></span>
<span id="MainModule2_offerText4" style="display:none;"></span> <span id="MainModule2_offerStar4" style="display:none;"></span> <span id="MainModule2_offerBlurb4" style="display:none;"></span> <span id="MainModule2_offerPrice4" style="display:none;"></span>
<span id="MainModule2_offerLink4" style="display:none;"></span>
<span id="MainModule2_offerText5" style="display:none;"></span> <span id="MainModule2_offerStar5" style="display:none;"></span> <span id="MainModule2_offerBlurb5" style="display:none;"></span> <span id="MainModule2_offerPrice5" style="display:none;"></span>
<span id="MainModule2_offerLink5" style="display:none;"></span>
<span id="MainModule2_offerText6" style="display:none;"></span> <span id="MainModule2_offerStar6" style="display:none;"></span> <span id="MainModule2_offerBlurb6" style="display:none;"></span> <span id="MainModule2_offerPrice6" style="display:none;"></span>
<span id="MainModule2_offerLink6" style="display:none;"></span>
<span id="MainModule2_offerText7" style="display:none;"></span> <span id="MainModule2_offerStar7" style="display:none;"></span> <span id="MainModule2_offerBlurb7" style="display:none;"></span> <span id="MainModule2_offerPrice7" style="display:none;"></span>
<span id="MainModule2_offerLink7" style="display:none;"></span>
<span id="MainModule2_offerText8" style="display:none;"></span> <span id="MainModule2_offerStar8" style="display:none;"></span> <span id="MainModule2_offerBlurb8" style="display:none;"></span> <span id="MainModule2_offerPrice8" style="display:none;"></span>
<span id="MainModule2_offerLink8" style="display:none;"></span>
<span id="MainModule2_offerText9" style="display:none;"></span> <span id="MainModule2_offerStar9" style="display:none;"></span> <span id="MainModule2_offerBlurb9" style="display:none;"></span> <span id="MainModule2_offerPrice9" style="display:none;"></span>
<span id="MainModule2_offerLink9" style="display:none;"></span>
<span id="MainModule2_offerText10" style="display:none;"></span> <span id="MainModule2_offerStar10" style="display:none;"></span> <span id="MainModule2_offerBlurb10" style="display:none;"></span> <span id="MainModule2_offerPrice10" style="display:none;"></span>
<span id="MainModule2_offerLink10" style="display:none;"></span>
<span id="MainModule2_offerText11" style="display:none;"></span> <span id="MainModule2_offerStar11" style="display:none;"></span> <span id="MainModule2_offerBlurb11" style="display:none;"></span> <span id="MainModule2_offerPrice11" style="display:none;"></span>
<span id="MainModule2_offerLink11" style="display:none;"></span>

<span id="MainModule2_offerTextA0" style="display:none;"></span> <span id="MainModule2_offerBlurbA0" style="display:none;"></span>
<span id="MainModule2_offerLinkA0" style="display:none;"></span>
<span id="MainModule2_offerTextA1" style="display:none;"></span> <span id="MainModule2_offerBlurbA1" style="display:none;"></span>
<span id="MainModule2_offerLinkA1" style="display:none;"></span>
<span id="MainModule2_offerTextA2" style="display:none;"></span> <span id="MainModule2_offerBlurbA2" style="display:none;"></span>
<span id="MainModule2_offerLinkA2" style="display:none;"></span>
<span id="MainModule2_offerTextA3" style="display:none;"></span> <span id="MainModule2_offerBlurbA3" style="display:none;"></span>
<span id="MainModule2_offerLinkA3" style="display:none;"></span>
<span id="MainModule2_offerTextA4" style="display:none;"></span> <span id="MainModule2_offerBlurbA4" style="display:none;"></span>
<span id="MainModule2_offerLinkA4" style="display:none;"></span>
<span id="MainModule2_offerTextA5" style="display:none;"></span> <span id="MainModule2_offerBlurbA5" style="display:none;"></span>
<span id="MainModule2_offerLinkA5" style="display:none;"></span>
<span id="MainModule2_offerTextB0" style="display:none;"></span> <span id="MainModule2_offerBlurbB0" style="display:none;"></span>
<span id="MainModule2_offerLinkB0" style="display:none;"></span>
<span id="MainModule2_offerTextB1" style="display:none;"></span> <span id="MainModule2_offerBlurbB1" style="display:none;"></span>
<span id="MainModule2_offerLinkB1" style="display:none;"></span>
<span id="MainModule2_offerTextB2" style="display:none;"></span> <span id="MainModule2_offerBlurbB2" style="display:none;"></span>
<span id="MainModule2_offerLinkB2" style="display:none;"></span>
<span id="MainModule2_offerTextC0" style="display:none;"></span> <span id="MainModule2_offerBlurbC0" style="display:none;"></span>
<span id="MainModule2_offerLinkC0" style="display:none;"></span>
<span id="MainModule2_offerTextC1" style="display:none;"></span> <span id="MainModule2_offerBlurbC1" style="display:none;"></span>
<span id="MainModule2_offerLinkC1" style="display:none;"></span>
<span id="MainModule2_offerTextC2" style="display:none;"></span> <span id="MainModule2_offerBlurbC2" style="display:none;"></span>
<span id="MainModule2_offerLinkC2" style="display:none;"></span>
<span id="MainModule2_offerTextC3" style="display:none;"></span> <span id="MainModule2_offerBlurbC3" style="display:none;"></span>
<span id="MainModule2_offerLinkC3" style="display:none;"></span>
<span id="MainModule2_callToActionContent" style="display:none;"></span>
<span id="MainModule2_callToActionLink" style="display:none;"></span>

<span id="MainModule3_headline1" style="display:none;"></span>
<span id="MainModule3_paragraph1" style="display:none;"></span>
<span id="MainModule3_paragraphLink10" style="display:none;"></span>
<span id="MainModule3_paragraphLinks1" style="display:none;"></span>
<span id="MainModule3_paragraph2" style="display:none;"></span>
<span id="MainModule3_paragraphLink11" style="display:none;"></span>
<span id="MainModule3_paragraphLink20" style="display:none;"></span>
<span id="MainModule3_paragraphLink21" style="display:none;"></span>
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
<span id="MainModule3_offerTextA0" style="display:none;"></span> <span id="MainModule3_offerBlurbA0" style="display:none;"></span>
<span id="MainModule3_offerLinkA0" style="display:none;"></span>
<span id="MainModule3_offerTextA1" style="display:none;"></span> <span id="MainModule3_offerBlurbA1" style="display:none;"></span>
<span id="MainModule3_offerLinkA1" style="display:none;"></span>
<span id="MainModule3_offerTextA2" style="display:none;"></span> <span id="MainModule3_offerBlurbA2" style="display:none;"></span>
<span id="MainModule3_offerLinkA2" style="display:none;"></span>
<span id="MainModule3_offerTextA3" style="display:none;"></span> <span id="MainModule3_offerBlurbA3" style="display:none;"></span>
<span id="MainModule3_offerLinkA3" style="display:none;"></span>
<span id="MainModule3_offerTextA4" style="display:none;"></span> <span id="MainModule3_offerBlurbA4" style="display:none;"></span>
<span id="MainModule3_offerLinkA4" style="display:none;"></span>
<span id="MainModule3_offerTextA5" style="display:none;"></span> <span id="MainModule3_offerBlurbA5" style="display:none;"></span>
<span id="MainModule3_offerLinkA5" style="display:none;"></span>
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
<span id="OfferModule3_myparaLink10" style="display:none;"></span>
<span id="OfferModule3_myparaLink11" style="display:none;"></span>
<span id="OfferModule3_myparaLink12" style="display:none;"></span>
<span id="OfferModule3_myparaLink13" style="display:none;"></span>
<span id="OfferModule3_myparaLink14" style="display:none;"></span>
<span id="OfferModule3_myparaLink15" style="display:none;"></span>
<span id="OfferModule3_myparaLink16" style="display:none;"></span>
<span id="OfferModule3_myparaLink17" style="display:none;"></span>
<span id="OfferModule3_myparaLink180" style="display:none;"></span>
<span id="OfferModule3_myparaLink181" style="display:none;"></span>
<span id="OfferModule3_myparaLink182" style="display:none;"></span>
<span id="OfferModule3_myparaLink183" style="display:none;"></span>
<span id="OfferModule3_myparaLink19" style="display:none;"></span>
<span id="OfferModule3_BannerAdAltText" style="display:none;"></span>
<span id="OfferModule3_BannerAdLink" style="display:none;"></span>
<span id="OfferModule4_BannerAdAltText" style="display:none;"></span>
<span id="OfferModule4_BannerAdLink" style="display:none;"></span>
<span id="eight_hundred" style="display:none;"></span>
<p>============================</p>
<span id="myMER_rule"></span><br /><br />
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
<span id="ContactUs"></span><br />
<span id="specialRulesContactUs"></span><br /><br />
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
