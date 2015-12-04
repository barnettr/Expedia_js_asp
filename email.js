var xmlDoc = "";
function loadXML()
{
	// code for IE
	if (window.ActiveXObject)
  	{
  		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
  		xmlDoc.async = false;
		xmlDoc.load(link)
  		//xmlDoc.load("20070305_CM_M_01_010_Hawaii_LA_a.xml");  //20070306_CM_P_01_277_ChinaAir.xml -- 20070305_CM_M_01_010_Hawaii_LA_a.xml -- 20070306_CM_CZ_01_030_Disney.xml
		xmlObj = xmlDoc.documentElement;
		getEmailText();
  	}
	// code for Mozilla, Firefox, Opera, etc.
	else if (document.implementation && document.implementation.createDocument)
  	{
  		xmlDoc=document.implementation.createDocument("","",null);
  		xmlDoc.load(link);
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
	var sOMNITURE = "[+GET_LINK_CONST('OMNITURE_VAR')+]";
	var specialRulesFinal = "CST# 2029030-40<br><br>(c)2007 Expedia, Inc. All rights reserved. Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.<br><br>[+ &#34;(EMID: "+ID_a+""+ID_b+")(MD: &#34; . VAR(TODAY) . &#34;)(EPID: $p->{'profile_key'})(BIID: $p->{'mailing_id'}_$p->{'_WAVE_ID_'})&#34; +]";
	
	/* *********************************************************************** 
		Variables extracted from the XML document nodes and their attributes:
	*************************************************************************/
	
	var node = xmlObj.childNodes[1].childNodes[1].childNodes;
	
	for (var a = 0; a < node.length; a++)
	{
		cNodes = node[a]
		// Eyebrow Text Attributes
		if (cNodes.tagName == "eyebrowOffer")
		{
			var eyebrowText = cNodes.getAttribute("eyebrowText");
			var eyebrowBlurb = cNodes.getAttribute("eyebrowBlurb");
			var eyebrowLink = cNodes.getAttribute("link");	
		}
	
		// Start of the Hero Module Node and Child Nodes
		if (cNodes.tagName == "heroModule")
		{
			var heroModuleAltText = cNodes.getAttribute("altText");
			var heroModuleURL = cNodes.getAttribute("url");
			
			var HeroModule_subHeadline = new Array();
			var HeroModule_paragraph = new Array();
			var HeroModule_paragraphLink = new Array();
			var cNodes2 = cNodes.childNodes;
			for (z = 0; z < cNodes2.length; z++)
			{
				var subcNodes = cNodes2[z]
				if (subcNodes.tagName == "headline")
				{
					var HeroModule_headline1 = subcNodes.text;
				}
				if (subcNodes.tagName == "my:subheadline" && subcNodes.text != "lorem ipsum")
				{
					HeroModule_subHeadline[z] = subcNodes.text;
				}
				if (subcNodes.tagName == "para" && subcNodes.text != "Lorem ipsum dolar quia voluptas")
				{
					var reg = /\<li\>/g;
					HeroModule_paragraph[z] = subcNodes.text.replace(reg, "<br>- ");
					HeroModule_paragraphLink[z] = HeroModule_paragraph[z].match(/http\:\/\/[^\"]+/g) || HeroModule_paragraph[z].match(/https\:\/\/[^\"]+/i);
				}
			}	
		}
	}
	
	// Start of the First Main Module Node and Child Nodes
	if (xmlObj.childNodes[1].childNodes[1].childNodes[3].tagName == "mainModule")
	{
		var x = xmlObj.childNodes[1].childNodes[1].childNodes[3].childNodes;
		var MainModule_headline0 = null;
		var MainModule_paragraph = new Array();
		var MainModule_paragraphLink = new Array();
		var MainModule_paragraphLinks = new Array();
		var MainModule_destOffer = new Array();
		var MainModule_destOfferLink = new Array();
		var MainModule_offerText = new Array();
		var MainModule_offerStar = new Array();
		var MainModule_offerBlurb = new Array();
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
				if (x[i].childNodes[0].getAttribute("my:blurb") != "lorem ipsum and stuff")
				{
					var MainModule_destGroup = x[i].childNodes[0].getAttribute("my:blurb");
				}
				if (x[i].childNodes[0].getAttribute("my:destination") != "Lorem ipsum city name")
				{
					MainModule_destOffer[i] = x[i].childNodes[0].getAttribute("my:destination");
					MainModule_destOfferLink[i] = x[i].childNodes[0].getAttribute("my:link");
				}
				if (x[i].childNodes.length == 2 || x[i].childNodes.length == 3 || x[i].childNodes.length == 4 || x[i].childNodes.length == 6)
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
						MainModule_offerLink[i] = x[i].childNodes[1].getAttribute("link");
						
						var siblings = x[i].childNodes;
						for (var ee = 0; ee < siblings.length; ee++)
						{
							if (ee == 2)
							{
								var MainModule_offerTextA = x[i].childNodes[2].getAttribute("text");
								var MainModule_offerBlurbA = x[i].childNodes[2].getAttribute("blurb");
								var MainModule_offerLinkA = x[i].childNodes[2].getAttribute("link");
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
				var MainModule_callToActionLink = x[i].getAttribute("link");	
			}
		}
	}

	
	// Test for the existence of a second Offer Module OR a Second and Third Main Module
	for (bb = 0; bb < node.length; bb++)
	{
		if (bb == 4)
		{
			// Test for the existence a second Main Module Node and Child Nodes
			if (xmlObj.childNodes[1].childNodes[1].childNodes[4].tagName == "mainModule")
			{
				var q = xmlObj.childNodes[1].childNodes[1].childNodes[4].childNodes;
				var MainModule2_paragraph = new Array();
				var MainModule2_paragraphLink = new Array();
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
					if (q[i].childNodes.length == 2 || q[i].childNodes.length == 5)
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
					if (q[i].tagName == "callToAction" && q[i].getAttribute("show") == "yes")
					{
						var MainModule2_callToActionContent = q[i].getAttribute("content");
						var MainModule2_callToActionLink = q[i].getAttribute("link");
					}
				}
			}
			// Start of the first Offer Module
			if (xmlObj.childNodes[1].childNodes[1].childNodes[4].tagName == "offerModule")
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
						if (f[l].getAttribute("title") != "Lorem ipsum dolor")
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
					if (f[l].tagName == "bannerAd")
					{
						var BannerAdAltText = f[l].getAttribute("altText");
						var BannerAdLink = f[l].getAttribute("link");
					}
				}
		
			}
		}
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
					if (bc[hh].tagName == "headline")
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
						}
					}
					if (bc[hh].tagName == "callToAction" && bc[hh].getAttribute("show") == "yes")
					{
						var MainModule3_callToActionContent = bc[hh].getAttribute("content");
						var MainModule3_callToActionLink = bc[hh].getAttribute("link");
					}
				}
			}
			if (xmlObj.childNodes[1].childNodes[1].childNodes[5].tagName == "offerModule")
			{
				var ff = xmlObj.childNodes[1].childNodes[1].childNodes[5].childNodes;
				var OfferModule2_offerTitle = new Array();
				var OfferModule2_textLine = new Array();
				var OfferModule2_textLineBlurb = new Array();
				var OfferModule2_textLineURL = new Array();
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
					if (ff[aa].tagName == "offer" && ff[aa].getAttribute("title") != "Lorem ipsum dolor")
					{
						OfferModule2_offerTitle[aa] = ff[aa].getAttribute("title");
						OfferModule2_textLine[aa] = ff[aa].childNodes[0].text;
						OfferModule2_textLineBlurb[aa] = ff[aa].childNodes[1].text;
						OfferModule2_textLineURL[aa] = ff[aa].childNodes[1].getAttribute("url");
					}
					if (ff[aa].tagName == "my:singleOffer" && ff[aa].childNodes[0].text != "orem ipsum")
					{
						var OfferModule2_singleHeadline1 = ff[aa].childNodes[0].text;
						var OfferModule2_mypara1 = ff[aa].childNodes[1].text;
						var OfferModule2_myparaLink1 = OfferModule2_mypara1.match(/http\:\/\/[^\"]+/i);
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
			if (xmlObj.childNodes[1].childNodes[1].childNodes[6].tagName == "offerModule")
			{
				var ff = xmlObj.childNodes[1].childNodes[1].childNodes[6].childNodes;
				var OfferModule2_offerTitle = new Array();
				var OfferModule2_textLine = new Array();
				var OfferModule2_textLineBlurb = new Array();
				var OfferModule2_textLineURL = new Array();
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
					if (ff[aa].tagName == "offer" && ff[aa].getAttribute("title") != "Lorem ipsum dolor")
					{
						OfferModule3_offerTitle[aa] = ff[aa].getAttribute("title");
						OfferModule3_textLine[aa] = ff[aa].childNodes[0].text;
						OfferModule3_textLineBlurb[aa] = ff[aa].childNodes[1].text;
						OfferModule3_textLineURL[aa] = ff[aa].childNodes[1].getAttribute("url");
					}
					if (ff[aa].tagName == "my:singleOffer" && ff[aa].childNodes[0].text != "orem ipsum")
					{
						var OfferModule3_singleHeadline1 = ff[aa].childNodes[0].text;
						if (ff[aa].childNodes[1].text.match(/jpg/) != "jpg")
						{
							var OfferModule3_mypara1 = ff[aa].childNodes[1].text;
							var OfferModule3_myparaLink1 = OfferModule3_mypara1.match(/http\:\/\/[^\"]+/i);
						}
					}
					if (ff[aa].tagName == "bannerAd")
					{
						var OfferModule3_BannerAdAltText = ff[aa].getAttribute("altText");
						var OfferModule3_BannerAdLink = ff[aa].getAttribute("link");
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
			if (TC_nodes.getAttribute("type") == "UNSUBSCRIBE")
			{
				var Unsubscribe = TC_nodes.getAttribute("type");
				var UnsubscribeContent1 = "If you do not wish to receive future e-mail advertisements from us, please click here.";
				var UnsubscribeContent1Link = "http://expediamail.com/PUBLISH(sub_mgmt_page)?[+GET_LINK_CONST('OMNITURE_VAR')+]";
				var UnsubscribeContent2 = "Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, click here for personalized help.";
				var UnsubscribeContent2Link = "https://www.expedia.com/pub/agent.dll?qscr=fbak&[+GET_LINK_CONST('OMNITURE_VAR')+]";
			}
			if (TC_nodes.getAttribute("type") == "CONTACT US")
			{
				var ContactUs = TC_nodes.getAttribute("type");
				var specialRulesContactUs = "Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address.<br>https://www.expedia.com/pub/agent.dll?qscr=fbak&[+GET_LINK_CONST('OMNITURE_VAR')+]<br><br>To contact us or send feedback, please click here or contact us via postal mail at:<br>Expedia, Inc.,<br>attn: EMC Team, 3150 139th Avenue SE,<br>Bellevue, WA 98005.<br>https://www.expedia.com/pub/agent.dll?qscr=fbak&[+GET_LINK_CONST('OMNITURE_VAR')+]<br><br>For additional assistance, visit the Expedia.com Customer Support Center, or call 1-800-Expedia.<br>http://www.expedia.com/daily/service/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]";
			}
			if (TC_nodes.getAttribute("type") == "A NOTE ABOUT PRICES")
			{
				var ANoteAboutPrices = TC_nodes.getAttribute("type");
				var specialRulesPrices = "Prices are subject to availability and subject to change without notice.<br><br>All prices were current at the time this e-mail was published.<br><br>Hotel, vacation package, and cruise prices on the Expedia Website are constantly updated. Please refer to the site for the most current pricing. Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city. additional taxes, fees and charges may apply. airfare is subject to, without limitation:<br>(1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip;<br>(2) up to $18 per roundtrip in local airport charges;<br>(3) federal excise tax of $3.20 per U.S. domestic flight segment;<br>(4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in alaska or Hawaii; and<br>(5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking).<br>a segment is defined as a takeoff and a landing.<br><br>";
			}
		}
	}
	
	
	/* ***********************************************************************************************************
	*	
	*	Conditional statements to show the node and attribute values that have been extracted from the XML document
	*
	* *************************************************************************************************************/
	var emailText = "";
	// Show the eyebrow text
	if (eyebrowText)
	{
		//document.getElementById("emailText").style.cssText = "display:inline;";
		//document.getElementById("emailText").style.cssText = "display:inline;";
		//document.getElementById("emailText").style.cssText = "display:inline;";
		//document.getElementById("emailText").innerHTML += eyebrowText;
		//document.getElementById("emailText").innerHTML += eyebrowBlurb+"\r\n";
		//document.getElementById("emailText").innerHTML += eyebrowLink+sOMNITURE+"\r\n"+"\r\n";
		emailText = eyebrowText;
		emailText += " "+eyebrowBlurb+"\r\n";
		emailText += eyebrowLink+sOMNITURE+'\r\n\r\n';
	}
	// Show the Hero Module
	if (heroModuleAltText)
	{
		//document.getElementById("emailText").style.cssText = "display:inline;";
		//document.getElementById("emailText").style.cssText = "display:inline;";
		//document.getElementById("emailText").innerHTML += "\r\n"+heroModuleAltText+"\r\n";
		//document.getElementById("emailText").innerHTML += eyebrowLink+sOMNITURE+"\r\n\r\n";
		emailText += heroModuleAltText+"\r\n";
		emailText += eyebrowLink+sOMNITURE+"\r\n\n";
		//document.getElementById("emailText").style.cssText = "display:inline;";

		
	}
	if (HeroModule_headline1)
	{
		if (!HeroModule_headline1.match(/Header max 30 chars/))
		{
			emailText += HeroModule_headline1+"\r\n";
			//document.getElementById("HeroModule_headline1").style.cssText = "display:inline;";
			//document.getElementById("HeroModule_headline1").innerHTML = HeroModule_headline1+"<br>";
			document.getElementById("ActionText").value = emailText;
		    document.getElementById("emailText").innerHTML = document.getElementById("ActionText").value;
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
	
	// Show the Initial Main Module
	if (MainModule_headline0)
	{
		document.getElementById("MainModule_headline0").style.cssText = "display:inline;";
		document.getElementById("MainModule_headline0").innerHTML = MainModule_headline0+"<br>";
	}
	var pcount = MainModule_paragraph.length;
	for (var h = 0; h < pcount; h++)
	{
		if (MainModule_paragraph[h])
		{
			if (MainModule_paragraph[h].match(/\<br\>/))
			{
				document.getElementById("MainModule_paragraph"+h).style.cssText = "display:inline;"
				document.getElementById("MainModule_paragraph"+h).innerHTML = MainModule_paragraph[h]+"";
			}
			else
			{
				document.getElementById("MainModule_paragraph"+h).style.cssText = "display:inline;"
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
	if (MainModule_destGroup)
	{
		document.getElementById("MainModule_destGroup").style.cssText = "display:inline;"
		document.getElementById("MainModule_destGroup").innerHTML = MainModule_destGroup+"<br><br>";
	}
	if (MainModule_offerText)
	{
		var ocount = MainModule_offerText.length;
		for (var j = 0; j < ocount; j++)
		{
			if (MainModule_offerText[j])
			{
				if (MainModule_destOffer[j])
				{
					document.getElementById("MainModule_destOffer"+j).style.cssText = "display:inline;"
					if (!MainModule_destOfferLink[j])
					{
						document.getElementById("MainModule_destOffer"+j).innerHTML = MainModule_destOffer[j]+"<br><br>";
					}
					else
					{
						document.getElementById("MainModule_destOffer"+j).innerHTML = MainModule_destOffer[j]+"<br>";
						document.getElementById("MainModule_destOfferLink"+j).style.cssText = "display:inline;"
						document.getElementById("MainModule_destOfferLink"+j).innerHTML = MainModule_destOfferLink[j]+"<br><br>"
					}
				}
				document.getElementById("MainModule_offerText"+j).style.cssText = "display:inline;";
				document.getElementById("MainModule_offerStar"+j).style.cssText = "display:inline;";
				document.getElementById("MainModule_offerBlurb"+j).style.cssText = "display:inline;";
				document.getElementById("MainModule_offerLink"+j).style.cssText = "display:inline;";
				document.getElementById("MainModule_offerText"+j).innerHTML = MainModule_offerText[j];
				document.getElementById("MainModule_offerStar"+j).innerHTML = "&nbsp;"+MainModule_offerStar[j];
				document.getElementById("MainModule_offerBlurb"+j).innerHTML = MainModule_offerBlurb[j]+"<br>";
				document.getElementById("MainModule_offerLink"+j).innerHTML = MainModule_offerLink[j]+sOMNITURE+"<br><br>";
			}
		}
	}
	if (MainModule_offerTextA)
	{
		document.getElementById("MainModule_offerTextA").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerTextA").innerHTML = MainModule_offerTextA;
		document.getElementById("MainModule_offerBlurbA").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerBlurbA").innerHTML = MainModule_offerBlurbA+"<br>";
		document.getElementById("MainModule_offerLinkA").style.cssText = "display:inline;";
		document.getElementById("MainModule_offerLinkA").innerHTML = MainModule_offerLinkA+sOMNITURE+"<br><br>";
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
		document.getElementById("MainModule_callToActionLink").style.cssText = "display:inline;";
		if (MainModule_callToActionLink)
		{
			document.getElementById("MainModule_callToActionContent").innerHTML = MainModule_callToActionContent+"<br>";
			document.getElementById("MainModule_callToActionLink").innerHTML = MainModule_callToActionLink+sOMNITURE+"<br><br>";
		}
		else
		{
			document.getElementById("MainModule_callToActionContent").innerHTML = MainModule_callToActionContent+"<br>";
			document.getElementById("MainModule_callToActionLink").innerHTML = eyebrowLink+sOMNITURE+"<br><br>";
		}
	}
	
	// Show a Second Main Module if found
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
	
	// Third Main Module if found
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
	if (MainModule3_callToActionContent)
	{
		document.getElementById("MainModule3_callToActionContent").style.cssText = "display:inline;";
		document.getElementById("MainModule3_callToActionContent").innerHTML = MainModule3_callToActionContent+"<br>";
		document.getElementById("MainModule3_callToActionLink").style.cssText = "display:inline;";
		document.getElementById("MainModule3_callToActionLink").innerHTML = MainModule3_callToActionLink+"<br>";
	}
	
	// Show the Initial Offer Module
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
				document.getElementById("OfferModule_offerTitle"+ab).style.cssText = "display:inline;"
				document.getElementById("OfferModule_offerTitle"+ab).innerHTML = OfferModule_offerTitle[ab]+"<br>";
				document.getElementById("OfferModule_textLine"+ab).style.cssText = "display:inline;"
				document.getElementById("OfferModule_textLine"+ab).innerHTML = OfferModule_textLine[ab]+"<br>";
				if (OfferModule_textLineOneURL[ab])
				{
					document.getElementById("OfferModule_textLineOneURL"+ab).style.cssText = "display:inline;"
					document.getElementById("OfferModule_textLineOneURL"+ab).innerHTML = OfferModule_textLineOneURL[ab]+"<br><br>";
				}
				if (OfferModule_textLineBlurb[ab])
				{
					document.getElementById("OfferModule_textLineBlurb"+ab).style.cssText = "display:inline;"
					document.getElementById("OfferModule_textLineBlurb"+ab).innerHTML = OfferModule_textLineBlurb[ab]+"<br>";
					document.getElementById("OfferModule_textLineURL"+ab).style.cssText = "display:inline;"
					document.getElementById("OfferModule_textLineURL"+ab).innerHTML = OfferModule_textLineURL[ab]+"<br><br>";
				}
			}
		}
	}
	if (BannerAdAltText)
	{
		document.getElementById("BannerAdAltText").style.cssText = "display:inline;";
		document.getElementById("BannerAdLink").style.cssText = "display:inline;";
		document.getElementById("BannerAdAltText").innerHTML = BannerAdAltText+"<br>";
		document.getElementById("BannerAdLink").innerHTML = BannerAdLink+sOMNITURE+"<br><br>";
	}
	
	// Show Second Offer Module if it exists
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
				document.getElementById("OfferModule2_offerTitle"+ii).style.cssText = "display:inline;"
				document.getElementById("OfferModule2_offerTitle"+ii).innerHTML = OfferModule2_offerTitle[ii]+"<br>";
				document.getElementById("OfferModule2_textLine"+ii).style.cssText = "display:inline;"
				document.getElementById("OfferModule2_textLine"+ii).innerHTML = OfferModule2_textLine[ii]+"<br>";
				document.getElementById("OfferModule2_textLineBlurb"+ii).style.cssText = "display:inline;"
				document.getElementById("OfferModule2_textLineBlurb"+ii).innerHTML = OfferModule2_textLineBlurb[ii]+"<br>";
				document.getElementById("OfferModule2_textLineURL"+ii).style.cssText = "display:inline;"
				document.getElementById("OfferModule2_textLineURL"+ii).innerHTML = OfferModule2_textLineURL[ii]+"<br><br>";
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
		document.getElementById("OfferModule2_BannerAdLink").innerHTML = OfferModule2_BannerAdLink+"<br><br>";
	}
	
	// Third Offer Module if it exists
	if (OfferModule3_singleHeadline1)
	{
		document.getElementById("OfferModule3_singleHeadline1").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_singleHeadline1").innerHTML = OfferModule3_singleHeadline1+"<br><br>";
	}
	if (OfferModule3_mypara1)
	{
		document.getElementById("OfferModule3_mypara1").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_mypara1").innerHTML = OfferModule3_mypara1+"<br>";
		if (OfferModule2_myparaLink1)
		{
			document.getElementById("OfferModule3_myparaLink1").style.cssText = "display:inline;";
			document.getElementById("OfferModule3_myparaLink1").innerHTML = OfferModule3_myparaLink1+"<br><br>";
		}
	}
	if (OfferModule3_BannerAdAltText)
	{
		document.getElementById("OfferModule3_BannerAdAltText").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_BannerAdLink").style.cssText = "display:inline;";
		document.getElementById("OfferModule3_BannerAdAltText").innerHTML = "<br>"+OfferModule3_BannerAdAltText+"<br>";
		document.getElementById("OfferModule3_BannerAdLink").innerHTML = OfferModule3_BannerAdLink+sOMNITURE+"<br><br>";
	}
	
	// TERMS AND CONDITIONS
	document.getElementById("myMER_rule").innerHTML = myMER_rule;
	if (TermsAndConditions)
	{
		document.getElementById("TermsAndConditions").innerHTML = TermsAndConditions+"<br>";
		document.getElementById("TermsAndConditionsContent").innerHTML = TermsAndConditionsContent+"<br>";
		document.getElementById("TermsAndConditionsContentLink").innerHTML = TermsAndConditionsContentLink+"<br><br>";
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
	document.getElementById("ANoteAboutPrices").innerHTML = ANoteAboutPrices;
	document.getElementById("specialRulesPrices").innerHTML = specialRulesPrices;
	document.getElementById("specialRulesFinal").innerHTML = specialRulesFinal;
}
