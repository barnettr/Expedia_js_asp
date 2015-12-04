<%@ LANGUAGE="VBScript" %>
<%
    '//////////////////////////////////////////////////////
    '// Link Checker Application for the ECS email group //
    '//////////////////////////////////////////////////////
	Option Explicit
	Response.Buffer = True
	Response.Expires = 0
	
	Dim strHTML, linkURL, fileName, newLinkPath
	linkURL = Request.Querystring("Path")
	newLinkPath = LEFT(linkURL, INSTR(linkURL, "docs")+4)
	fileName = RIGHT(linkURL,INSTR(linkURL, "docs/")-1)
	response.Write(fileName & "<br />")
	response.Write(linkURL)
	
	Function loadXMLFile(strXMLFile, strXSLFile)
	Dim objXML, objXSL 
	
		Set objXML = Server.CreateObject("Microsoft.XMLDOM")
	
		objXML.async = False
		objXML.load(strXMLFile)
	
		Set objXSL = Server.CreateObject("Microsoft.XMLDOM")
	
		objXSL.async = False
		objXSL.load(strXSLFile)
		
		strHTML = objXML.transformNode(objXSL)
		'Response.Write(strHTML)
	
	End Function
	
	function MapURL(path)
		dim rootPath, url
		rootPath = Server.MapPath("/")
		url = Right(path, Len(path) - Len(rootPath))
		MapURL = Replace(url, "\", "/")
		'response.Write(path)
	end function
	
	loadXMLFile Server.MapPath(linkURL), Server.MapPath("hybrid_template.xslt")

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
		if (window.ActiveXObject)
  	    {
  		    xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
  		    xmlDoc.async=false;
		    xmlDoc.load("<%= linkURL %>");
		    xmlObj = xmlDoc.documentElement;
		    //sHTML = document.getElementById("HTML").value;
		    //getURLLinks();
  	    }
	    // code for Mozilla, Firefox, Opera, etc.
	    else if (document.implementation && document.implementation.createDocument)
  	    {
  		    xmlDoc=document.implementation.createDocument("","",null);
  		    xmlDoc.load("<%= linkURL %>");
  		    xmlObj = xmlDoc.documentElement;
  		    xmlDoc.onload = getURLLinks;
  	    }
	    else
  	    {
  		    alert('Your browser cannot handle this script');
  	    }
		
		var j = 0;
		var h = 0;
		var strLink = " ";
		var strTotal = "<br>";
		
		sHTML = document.getElementById("HTML").value;
		var all_links = sHTML.match(/(?!.*\.gif)http\:\/\/[^\"|>]+/g);
		//http\://(?![^\x22|>]*?(\.(gif|jpg)|media\.expedia\.com|schemas\.microsoft\.com|www\.w3\.org))[^\x22|>]+
		//http\://(?![^\(x22\)|>]*?(\.(gif|jpg)|media\.expedia\.com|schemas\.microsoft\.com|www\.w3\.org))[^\(x22\)|>]+
        //^(?!.*?(//media\.expedia\.com|//schemas\.microsoft\.com|//www\.w3\.org ))http\:\/\/[^\"]+
        //http\://(?![^\x22|>]*?(\.(gif|jpg)|media\.expedia\.com|schemas\.microsoft\.com|www\.w3\.org))[^\x22|>]+
        //(?!.*?(\.gif|\.jpg|media\.expedia\.com|schemas\.microsoft\.com|www\.w3\.org))http\:\/\/[^\"|>]+
		
		/* ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// The Regular Expressions below are the logic to identify the link anomalies and other unwanted characteristics //
		//  in URL's in the email that is currently in view                                                              //
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// */
		
		var rg = /\?\?/g;
		//var rg2 = /\?\&/g;
		var rg3 = /Check1\&/g;
		var rg4 = /\&\&/g;
		var rg5 = /mcicid/g;
		var rg6 = /(?!.*\/\/www\.expedia\.com)http\:\/\/[^\"]+/g;
		var rg7 = /\s/g;
		var rg8 = /(?!.*\[\+GET\_LINK\_CONST\(\'OMNITURE\_VAR'\)\+\])http\:\/\/[^\"]+/g;
		//var rg9 = /rfrr\=\d\d\d|rfrr\=\d\d\d\d|rfrr\=\d\d\d\d\d|rfrr\=\d\d\d\d\d\d/g;
		var rg9 = /rfrr\=[\d{2,9}]/g;
		
		
		/* /////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Begin iteratation through all the elements in the all_links array and apply the test method of all RE's to each one.  
		// Any element for which the test returns true will be copied to the foundlink array and the
		// foundlinkerror array
		//////////////////////////////////////////////////////////////////////////////////////////////////////////// */
		
		
		for (var i = 0; i < all_links.length; i++)
		{
			 v_totallinks[h] = all_links[i];
			 h++;
			if (rg.test(all_links[i]) || rg3.test(all_links[i]) || rg4.test(all_links[i]) || rg5.test(all_links[i]) || rg6.test(all_links[i]) || rg7.test(all_links[i]) || rg8.test(all_links[i]) || rg9.test(all_links[i]))
			{
				v_foundlinkarray[j] = all_links[i];
				v_foundlinkerror[j] = all_links[i].match(rg) || all_links[i].match(rg3) || all_links[i].match(rg4) || all_links[i].match(rg5) || all_links[i].match(rg6) || all_links[i].match(rg7) || all_links[i].match(rg8) || all_links[i].match(rg9);
				j++;
			}
		}
		for (k = 0; k < v_foundlinkarray.length; k++)
		{
			document.getElementById("Errors").style.cssText = "display:inline;";
			document.getElementById("Errors").innerHTML = "<br><font color=red><b>There are " + (k+1) + " Link Errors on this page:</b></font><br><br>";
			if (v_foundlinkarray[k])
			{
				document.getElementById("Error"+k).style.cssText = "display:inline;";
				document.getElementById("Error"+k).innerHTML = "<font color=red>" + k + " <b>[<a href='RepairLink.aspx?error=" + escape(v_foundlinkarray[k]) + "' style='text-decoration: underline; color: #448;'>" + v_foundlinkerror[k] + "</a>]</b> " + v_foundlinkarray[k] + "</font><br>";
			}
			document.getElementById("End").style.cssText = "display:inline;";
			document.getElementById("End").innerHTML = "<br><br>";
		}
//		for (var n = 0; n < v_totallinks.length; n++)
//		{
//			if (n % 2 == 0)
//			{
//				strTotal += "<span class='alt'><font color=green>" + n + " " + v_totallinks[n] + "</font></span><br>";
//			}
//			else
//			{
//				strTotal += "<span><font color=green>" + n + " " + v_totallinks[n] + "</font></span><br>";
//			}
//			document.all.totalvals.style.cssText = "display:block;";
//			document.all.totalvals.innerHTML = strTotal;
//			
//		}
	}
	function getURLLinks()
	{
	    var omniture = "[+GET_LINK_CONST('OMNITURE_VAR')+]";
	    var nodes = xmlObj.childNodes[1].childNodes[1].childNodes;
	    for (var a = 0; a < nodes.length; a++)
	    {
	        var cNodes = nodes[a];
	        if (cNodes.tagName == "eyebrowOffer")
		    {
			    if (cNodes.getAttribute("link"))
			    {
			        var eyebrowLink = cNodes.getAttribute("link");
			        document.getElementById("eyebrowLink").innerHTML = eyebrowLink+omniture+"[LINK_NAME=eyebrow][LINK_TAG=Header]";
			        document.getElementById("eyebrowLink001").value = eyebrowLink+omniture+"[LINK_NAME=eyebrow][LINK_TAG=Header]";
			        document.getElementById("LinkName1").innerHTML = "eyebrow";
			        document.getElementById("LinkTag1").innerHTML = "Header";
//			        document.getElementById("LinkName001").value = "eyebrow";
//			        document.getElementById("LinkTag001").value = "Header";
			    }	
		    }
		    if (cNodes.tagName == "heroModule")
		    {
		        if (cNodes.getAttribute("url"))
		        {
		            var heroModuleURL  = cNodes.getAttribute("url");
		            document.getElementById("heroImage").style.cssText = "display:table-row;";
		            document.getElementById("heroModuleURL").innerHTML = heroModuleURL+omniture+"[LINK_NAME=image][LINK_TAG=Hero]";
		            document.getElementById("heroModuleURL001").value = heroModuleURL+omniture+"[LINK_NAME=image][LINK_TAG=Hero]";
		            document.getElementById("LinkName10").innerHTML = "image";
		            document.getElementById("LinkTag10").innerHTML = "Hero";
		            document.getElementById("LinkName010").value = "image";
		            document.getElementById("LinkTag010").value = "Hero";
		        }
			    var HeroModule_paragraph = new Array();
			    var HeroModule_paragraphLink = new Array();
			    var cNodes2 = cNodes.childNodes;
			    for (z = 0; z < cNodes2.length; z++)
			    {
				    var subcNodes = cNodes2[z];
				    if (subcNodes.tagName == "para" && subcNodes.text != "Lorem ipsum dolar quia voluptas")
				    {
					    HeroModule_paragraph[z] = subcNodes.text;
					    HeroModule_paragraphLink[z] = HeroModule_paragraph[z].match(/http\:\/\/[^\"]+/g) || HeroModule_paragraph[z].match(/https\:\/\/[^\"]+/g);
				        if (HeroModule_paragraphLink[z])
				        {
				            for (var c = 0; c < HeroModule_paragraphLink[z].length; c++)
				            {
				                if (HeroModule_paragraphLink[z][c])
				                {
				                    document.getElementById("Message_1_"+z+""+c).style.cssText = "display:table-row;";
				                    document.getElementById("Message_001_"+z+""+c).style.cssText = "display:table-row;";
	                                document.getElementById("HeroLink_1_"+z+""+c).innerHTML = HeroModule_paragraphLink[z][c]+"[LINK_NAME=Link_"+((z+c)-1)+"][LINK_TAG=Message_1]";
	                                document.getElementById("HeroLink_001_"+z+""+c).value = HeroModule_paragraphLink[z][c]+"[LINK_NAME=Link_"+((z+c)-1)+"][LINK_TAG=Message_1]";
                                    document.getElementById("LinkName1_"+z+""+c).innerHTML = "Link_"+((z+c)-1);
                                    document.getElementById("LinkTag1_"+z+""+c).innerHTML = "Message_1";
                                    document.getElementById("LinkName001_"+z+""+c).value = "Link_"+((z+c)-1);
                                    document.getElementById("LinkTag001_"+z+""+c).value = "Message_1";    
				                }
				            }
				            //document.getElementById("Message_1_"+z).style.cssText = "display:table-row;";
	                        //document.getElementById("HeroLink_1_"+z).innerHTML = HeroModule_paragraphLink[z]+"[LINK_NAME=Link_"+z+"][LINK_TAG=Message_1]";
                            //document.getElementById("LinkName1_"+z).innerHTML = "Link_"+z;
                            //document.getElementById("LinkTag1_"+z).innerHTML = "Message_1";
				        }
				    }
			    }
		    }
	    }
	    if (xmlObj.childNodes[1].childNodes[1].childNodes[3].tagName == "mainModule")
	    {
	        var Siblings = xmlObj.childNodes[1].childNodes[1].childNodes[3].childNodes;
	        var MainModule_paragraph = new Array();
	        var MainModule_paragraphLink = new Array();
	        var MainModule_paragraphLinks = new Array();
	        var MainModule_destOffer = new Array();
		    var MainModule_destOfferBlurb = new Array();
		    var MainModule_destOfferLink = new Array();
		    var MainModule_offerText = new Array();
		    var MainModule_offerStar = new Array();
		    var MainModule_offerBlurb = new Array();
		    var MainModule_offerLink = new Array();
	        for (var i = 0; i < Siblings.length; i++)
	        {
	            if (Siblings[i].tagName == "para" && Siblings[i].text != "Lorem ipsum dolar quia ma")
		        {
			        MainModule_paragraph[i] = Siblings[i].text;
			        MainModule_paragraphLink[i] = MainModule_paragraph[i].match(/http\:\/\/[^\"]+/g) || MainModule_paragraph[i].match(/https\:\/\/[^\"]+/g);
		            if (MainModule_paragraphLink[i])
		            {
		                for (var g = 0; g < MainModule_paragraphLink[i].length; g++)
		                {
		                    if (MainModule_paragraphLink[i][g])
		                    {
		                        document.getElementById("Message_2_0_"+i+""+g).style.cssText = "display:table-row;";
		                        document.getElementById("MainParagraphLink_"+i+""+g).innerHTML = MainModule_paragraphLink[i][g]+"[LINK_NAME=Link_"+(i-1)+"][LINK_TAG=Message_2]";
		                        MainModule_paragraphLink[i][g] = MainModule_paragraphLink[i][g]+"[LINK_NAME=Link_"+(i-1)+"][LINK_TAG=Message_2]";
		                        document.getElementById("LinkName_"+i+""+g).innerHTML = "Link_"+((i+g)-1);
                                document.getElementById("LinkTag_"+i+""+g).innerHTML = "Message_2";
		                    }
		                }
		                //document.getElementById("Message_2_0"+i).style.cssText = "display:table-row;";
                        //document.getElementById("MainParagraphLink_0"+i).innerHTML = MainModule_paragraphLink[i]+"[LINK_NAME=Link_"+(i-1)+"][LINK_TAG=Message_2]";
                        //document.getElementById("LinkName13_"+i).innerHTML = "Link_"+(i-1);
                        //document.getElementById("LinkTag13_"+i).innerHTML = "Message_2";
		            }
		        }
		        if (Siblings[i].tagName == "offerGroup")
			    {
				    if (Siblings[i].childNodes[0].getAttribute("my:blurb") != "lorem ipsum and stuff")
				    {
					    var MainModule_destGroup = Siblings[i].childNodes[0].getAttribute("my:blurb");
				    }
				    if (Siblings[i].childNodes[0].getAttribute("my:destination") != "Lorem ipsum city name")
				    {
					    MainModule_destOffer[i] = Siblings[i].childNodes[0].getAttribute("my:destination");
					    MainModule_destOfferBlurb[i] = Siblings[i].childNodes[0].getAttribute("my:blurb");
					    MainModule_destOfferLink[i] = Siblings[i].childNodes[0].getAttribute("my:link");
					    if (MainModule_destOfferLink[i] != "URL Here")
					    {
					        document.getElementById("Message_2_1_"+i).style.cssText = "display:table-row;";
					        document.getElementById("MainModule_destOfferLink"+i).innerHTML = MainModule_destOfferLink[i]+omniture+"[LINK_NAME=Link_"+i+"][LINK_TAG=Message_2]";
					        MainModule_destOfferLink[i] = MainModule_destOfferLink[i]+omniture+"[LINK_NAME=Link_"+i+"][LINK_TAG=Message_2]";
					        document.getElementById("LinkName2_1_"+i).innerHTML = "Link_"+(i-1);
                            document.getElementById("LinkTag2_1_"+i).innerHTML = "Message_2";
					    }
				    }
				    var tempBlurbLink = new Array();
				    //alert(Siblings[i].childNodes.length);
				    if (Siblings[i].childNodes.length == 2)
				    {
				    if (Siblings[i].childNodes[1].getAttribute("blurb"))
				    {
				        tempBlurbLink[i] = Siblings[i].childNodes[1].getAttribute("blurb").match(/http\:\/\/[^\"]+/g);
				        
				        if (tempBlurbLink[i])
				        {
				            document.getElementById("MainModule_tempOfferLink_"+i).style.cssText = "display:table-row;";
				            document.getElementById("MainModule_tempOfferLink1_"+i).innerHTML = tempBlurbLink[i]+"[LINK_NAME=Link_"+i+"][LINK_TAG=Message_2]";
                            tempBlurbLink[i] = tempBlurbLink[i]+"[LINK_NAME=Link_"+i+"][LINK_TAG=Message_2]";
                            document.getElementById("LinkNameOL"+i).innerHTML = "Link_"+i;
                            document.getElementById("LinkTagOL"+i).innerHTML = "Message_2";
				        }
				    }
				    }
				    if (Siblings[i].childNodes.length == 2 || Siblings[i].childNodes.length == 3 || Siblings[i].childNodes.length == 4 || Siblings[i].childNodes.length == 6)
				    {
					    if (Siblings[i].childNodes[1].getAttribute("text") == "Lorem ipsum" || Siblings[i].childNodes[1].getAttribute("text") == "lorem ipsum")
					    {
					    }
					    else
					    {
						    MainModule_offerText[i] = Siblings[i].childNodes[1].getAttribute("text");
						    MainModule_offerLink[i] = Siblings[i].childNodes[1].getAttribute("link");
						    if (MainModule_destOfferLink[i])
						    {
						    }
						    else
						    {
						        if (MainModule_offerLink[i])
						        {
						            document.getElementById("Message_2_"+i).style.cssText = "display:table-row;";
                                    document.getElementById("MainOfferLink_2_"+i).innerHTML = MainModule_offerLink[i]+omniture+"[LINK_NAME=Link_"+(i-1)+"][LINK_TAG=Message_2]";
                                    //alert(MainModule_offerLink[i]);
                                    document.getElementById("LinkName12"+i).innerHTML = "Link_"+(i-1);
                                    document.getElementById("LinkTag12"+i).innerHTML = "Message_2";
						        }
    						}
						    var siblings = Siblings[i].childNodes;
						    for (var ee = 0; ee < siblings.length; ee++)
						    {
							    if (ee == 2)
							    {
								    var MainModule_offerTextA = Siblings[i].childNodes[2].getAttribute("text");
								    var MainModule_offerBlurbA = Siblings[i].childNodes[2].getAttribute("blurb");
								    var MainModule_offerLinkA = Siblings[i].childNodes[2].getAttribute("link");
							    }
							    if (ee == 3)
							    {
								    var MainModule_offerTextB = Siblings[i].childNodes[3].getAttribute("text");
								    var MainModule_offerBlurbB = Siblings[i].childNodes[3].getAttribute("blurb");
								    var MainModule_offerLinkB = Siblings[i].childNodes[3].getAttribute("link");
							    }
							    if (ee == 4)
							    {
								    var MainModule_offerTextC = Siblings[i].childNodes[4].getAttribute("text");
								    var MainModule_offerBlurbC = Siblings[i].childNodes[4].getAttribute("blurb");
								    var MainModule_offerLinkC = Siblings[i].childNodes[4].getAttribute("link");
							    }
							    if (ee == 5)
							    {
								    var MainModule_offerTextD = Siblings[i].childNodes[5].getAttribute("text");
								    var MainModule_offerBlurbD = Siblings[i].childNodes[5].getAttribute("blurb");
								    var MainModule_offerLinkD = Siblings[i].childNodes[5].getAttribute("link");
							    }
							    if (ee == 6)
							    {
								    var MainModule_offerTextE = Siblings[i].childNodes[6].getAttribute("text");
								    var MainModule_offerBlurbE = Siblings[i].childNodes[6].getAttribute("blurb");
								    var MainModule_offerLinkE = Siblings[i].childNodes[6].getAttribute("link");
							    }
						    }
					    }
				    }
				}
				if (Siblings[i].tagName == "callToAction" && Siblings[i].getAttribute("show") == "yes")
			    {
				    var MainModule_callToActionContent = Siblings[i].getAttribute("content");
				    var MainModule_callToActionLink = Siblings[i].getAttribute("link");
				    if (MainModule_callToActionContent)
				    {
				        if (MainModule_callToActionLink == "")
				        {
				            MainModule_callToActionLink = xmlObj.childNodes[1].childNodes[1].childNodes[0].getAttribute("link");
				        }
				        document.getElementById("Message_2_Action").style.cssText = "display:table-row;";
			            document.getElementById("MainModule_CallToActionLink").innerHTML = MainModule_callToActionLink+omniture+"[LINK_NAME=Link_action][LINK_TAG=Message_2]";
			            document.getElementById("ActionName1").innerHTML = "Link_action";
			            document.getElementById("ActionTag1").innerHTML = "Message_2";
				    }	
			    }
	        }
	    }
	    for (var a = 0; a < nodes.length; a++)
	    {
	        if (a == 4)
	        {
	            if (xmlObj.childNodes[1].childNodes[1].childNodes[4].tagName == "mainModule")
	            {
	                var Children = xmlObj.childNodes[1].childNodes[1].childNodes[4].childNodes;
	                var MainModule2_paragraph = new Array();
				    var MainModule2_paragraphLink = new Array();
				    var MainModule2_offerText = new Array();
				    var MainModule2_offerStar = new Array();
				    var MainModule2_offerBlurb = new Array();
				    var MainModule2_offerLink = new Array();
	                for (var t = 0; t < Children.length; t++)
	                {
	                    if(Children[t].tagName == "para" && Children[t].text != "Lorem ipsum dolar quia ma")
	                    {
						    MainModule2_paragraph[t] = Children[t].text;
						    MainModule2_paragraphLink[t] = MainModule2_paragraph[t].match(/http\:\/\/[^\"]+/g)  || MainModule2_paragraph[t].match(/https\:\/\/[^\"]+/g);
	                        if (MainModule2_paragraphLink[t])
	                            for (var r = 0; r < MainModule2_paragraphLink[t].length; r++)
	                            {
	                                if (MainModule2_paragraphLink[t][r])
	                                {
	                                    document.getElementById("Message_4_"+t+""+r).style.cssText = "display:table-row;";
                                        document.getElementById("MainModule2_paragraphLink_4_"+t+""+r).innerHTML = MainModule2_paragraphLink[t]+"[LINK_NAME=Link_"+(t+r)+"][LINK_TAG=Message_3]";
                                        document.getElementById("LinkName4"+t+""+r).innerHTML = "Link_"+(t+r);
                                        document.getElementById("LinkTag4"+t+""+r).innerHTML = "Message_3";    
	                                }
	                            }
	                        {
	                            //document.getElementById("Message_4_"+t).style.cssText = "display:table-row;";
                                //document.getElementById("MainModule2_paragraphLink_4_"+t).innerHTML = MainModule2_paragraphLink[t]+"[LINK_NAME=Link_"+t+"][LINK_TAG=Message_3]";
                                //document.getElementById("LinkName4"+t).innerHTML = "Link_"+t;
                                //document.getElementById("LinkTag4"+t).innerHTML = "Message_3";
	                        }
	                    }
	                    if (Children[t].childNodes.length == 2 || Children[t].childNodes.length == 5)
					    {
						    if (Children[t].childNodes[1].getAttribute("text") == "Lorem ipsum" || Children[t].childNodes[1].getAttribute("text") == "lorem ipsum")
						    {
						    }
						    else
						    {
							    MainModule2_offerText[t] = Children[t].childNodes[1].getAttribute("text");
							    MainModule2_offerStar[t] = Children[t].childNodes[1].getAttribute("star");
							    switch(MainModule2_offerStar[t])
							    {
								    case "0":
								    MainModule2_offerStar[t] = "";
								    break;
								    case "2_0":
								    MainModule2_offerStar[t] = " (2 stars) - ";
								    break;
								    case "2_5":
								    MainModule2_offerStar[t] = " (2 1/2 stars) - ";
								    break;
								    case "3_0":
								    MainModule2_offerStar[t] = " (3 stars) - ";
								    break;
								    case "3_5":
								    MainModule2_offerStar[t] = " (3 1/2 stars) - ";
								    break;
								    case "4_0":
								    MainModule2_offerStar[t] = " (4 stars) - ";
								    break;
								    case "4_5":
								    MainModule2_offerStar[t] = " (4 1/2 stars) - ";
								    break;
								    case "5_0":
								    MainModule2_offerStar[t] = " (5 stars) - ";
								    break;
							    }
							    MainModule2_offerBlurb[t] = Children[t].childNodes[1].getAttribute("blurb");
							    MainModule2_offerLink[t] = Children[t].childNodes[1].getAttribute("link");
							    if (MainModule2_offerLink[t])
	                            {
	                                document.getElementById("Message_3_"+t).style.cssText = "display:table-row;";
                                    document.getElementById("MainModule2_offerLink_3_"+t).innerHTML = MainModule2_offerLink[t]+"[LINK_NAME=Link_"+(t-1)+"][LINK_TAG=Message_3]";
                                    document.getElementById("LinkName13"+t).innerHTML = "Link_"+(t-1);
                                    document.getElementById("LinkTag13"+t).innerHTML = "Message_3";
	                            }
    							
							    // TODO: This is the area where new code may be needed for completion
							    var o_siblings = Children[t].childNodes;
							    for (var kb = 0; kb < o_siblings.length; kb++)
							    {
								    if (kb == 2)
								    {
									    var MainModule2_offerTextA = Children[t].childNodes[2].getAttribute("text");
									    var MainModule2_offerBlurbA = Children[t].childNodes[2].getAttribute("blurb");
									    var MainModule2_offerLinkA = Children[t].childNodes[2].getAttribute("link");
								    }
								    if (kb == 3)
								    {
									    var MainModule2_offerTextB = Children[t].childNodes[3].getAttribute("text");
									    var MainModule2_offerBlurbB = Children[t].childNodes[3].getAttribute("blurb");
									    var MainModule2_offerLinkB = Children[t].childNodes[3].getAttribute("link");
								    }
								    if (kb == 4)
								    {
									    var MainModule2_offerTextC = Children[t].childNodes[4].getAttribute("text");
									    var MainModule2_offerBlurbC = Children[t].childNodes[4].getAttribute("blurb");
									    var MainModule2_offerLinkC = Children[t].childNodes[4].getAttribute("link");
								    }
							    }
						    }
					    }
					    if (Children[t].tagName == "callToAction" && Children[t].getAttribute("show") == "yes")
					    {
						    var MainModule2_callToActionContent = Children[t].getAttribute("content");
						    var MainModule2_callToActionLink = Children[t].getAttribute("link");
						    if (MainModule2_callToActionLink)
						    {
						        document.getElementById("Message_3_x").style.cssText = "display:table-row;";
                                document.getElementById("MainModule2_callToActionLink_3_x").innerHTML = MainModule2_callToActionLink+"[LINK_NAME=Link_action][LINK_TAG=Message_3]";
                                document.getElementById("LinkName13x").innerHTML = "Link_action";
                                document.getElementById("LinkTag13x").innerHTML = "Message_3";
						    }
					    }
	                }
	            }
	        }
	        if (a == 5)
	        {
	            if (xmlObj.childNodes[1].childNodes[1].childNodes[5].tagName == "offerModule")
	            {
	                var ff = xmlObj.childNodes[1].childNodes[1].childNodes[5].childNodes;
				    var OfferModule2_offerTitle = new Array();
				    var OfferModule2_textLine = new Array();
				    var OfferModule2_textLineBlurb = new Array();
				    var OfferModule2_textLineURL1 = new Array();
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
						    OfferModule2_textLineURL1[aa] = ff[aa].childNodes[0].getAttribute("url");
						    if (ff[aa].childNodes.length == 1)
						    {
						        OfferModule2_textLineURL[aa] = ff[aa].childNodes[0].getAttribute("url");
						        document.getElementById("Offers_1_"+aa).style.cssText = "display:table-row;";
						        document.getElementById("OfferModule2_textLineURL_1_"+aa).innerHTML = OfferModule2_textLineURL[aa]+omniture+"[LINK_NAME=Link_"+(aa-1)+"][LINK_TAG=Offers_1]";
						        document.getElementById("LinkName_4_"+aa).innerHTML = "Link_"+(aa-1);
                                document.getElementById("LinkTag_4_"+aa).innerHTML = "Offers_1";
						    }
					    }
					    if (ff[aa].tagName == "my:singleOffer" && ff[aa].childNodes[0].text != "lorem ipsum" && ff[aa].childNodes[0].text != "orem ipsum")
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
	    }
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
				    if (TermsAndConditionsContentLink)
				    {
				        document.getElementById("TandCLinkOne").style.cssText = "display:table-row;";
				        document.getElementById("TandC1").innerHTML = TermsAndConditionsContentLink+"[LINK_NAME=terms_1][LINK_TAG=TandC]";
				        document.getElementById("tc_1").innerHTML = "terms_1";
                        document.getElementById("LinkTag_One").innerHTML = "TandC"; 
				    }
			    }
			    if (TC_nodes.getAttribute("type") == "" && TC_nodes.getAttribute("show") == "yes")
			    {
			        var TermsAndConditionsTwo = TC_nodes.text;
			        var TermsAndConditionsTwoLink = TermsAndConditionsTwo.match(/http\:\/\/[^\"]+/i);
			        if (TermsAndConditionsTwoLink)
			        {
			            document.getElementById("TandCLinkTwo").style.cssText = "display:table-row;";
				        document.getElementById("TandC2").innerHTML = TermsAndConditionsTwoLink+"[LINK_NAME=terms_2][LINK_TAG=TandC]";
				        document.getElementById("tc_2").innerHTML = "terms_2";
                        document.getElementById("LinkTag_Two").innerHTML = "TandC";
			        }
			    }
			    if (TC_nodes.getAttribute("type") == "UNSUBSCRIBE")
			    {
				    var Unsubscribe = TC_nodes.getAttribute("type");
				    var UnsubscribeContent1 = "If you do not wish to receive future e-mail advertisements from us, please click here.";
				    var UnsubscribeContent1Link = "http://expediamail.com/PUBLISH(sub_mgmt_page)?&[+GET_LINK_CONST('OMNITURE_VAR')+]";
				    var UnsubscribeContent2 = "Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, click here for personalized help.";
				    var UnsubscribeContent2Link = "https://www.expedia.com/pub/agent.dll?qscr=fbak&[+GET_LINK_CONST('OMNITURE_VAR')+]";
			        
			        document.getElementById("UnsubscribeContent1Link").style.cssText = "display:table-row;";
			        document.getElementById("Unsub1").innerHTML = UnsubscribeContent1Link+"[LINK_NAME=unsub_1][LINK_TAG=TandC]";
			        document.getElementById("unsub_1").innerHTML = "unsub_1";
                    document.getElementById("Unsub_One").innerHTML = "TandC";
                    
                    document.getElementById("UnsubscribeContent2Link").style.cssText = "display:table-row;";
			        document.getElementById("Unsub2").innerHTML = UnsubscribeContent2Link+"[LINK_NAME=unsub_2][LINK_TAG=TandC]";
			        document.getElementById("unsub_2").innerHTML = "unsub_2";
                    document.getElementById("Unsub_Two").innerHTML = "TandC";
			    }
			    if (TC_nodes.getAttribute("type") == "CONTACT US")
			    {
				    var ContactUs = TC_nodes.getAttribute("type");
				    var specialRulesContactUs = "Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address.<br>https://www.expedia.com/pub/agent.dll?qscr=fbak&[+GET_LINK_CONST('OMNITURE_VAR')+]<br><br>To contact us or send feedback, please click here or contact us via postal mail at:<br>Expedia, Inc.,<br>attn: EMC Team, 3150 139th Avenue SE,<br>Bellevue, WA 98005.<br>https://www.expedia.com/pub/agent.dll?qscr=fbak&[+GET_LINK_CONST('OMNITURE_VAR')+]<br><br>For additional assistance, visit the Expedia.com Customer Support Center, or call 1-800-Expedia.<br>http://www.expedia.com/daily/service/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]";
			        var specialRulesContactUsLinkOne = "https://www.expedia.com/pub/agent.dll?qscr=fbak&[+GET_LINK_CONST('OMNITURE_VAR')+]";
			        var specialRulesContactUsLinkTwo = "https://www.expedia.com/pub/agent.dll?qscr=fbak&[+GET_LINK_CONST('OMNITURE_VAR')+]";
			        var specialRulesContactUsLinkThree = "http://www.expedia.com/daily/service/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]";
			        
			        document.getElementById("specialRulesContactUsLinkOne").style.cssText = "display:table-row;";
			        document.getElementById("Contact1").innerHTML = specialRulesContactUsLinkOne+"[LINK_NAME=contact_1][LINK_TAG=TandC]";
			        document.getElementById("contact_1").innerHTML = "contact_1";
                    document.getElementById("Contact_One").innerHTML = "TandC";
                    
                    document.getElementById("specialRulesContactUsLinkTwo").style.cssText = "display:table-row;";
			        document.getElementById("Contact2").innerHTML = specialRulesContactUsLinkOne+"[LINK_NAME=contact_2][LINK_TAG=TandC]";
			        document.getElementById("contact_2").innerHTML = "contact_2";
                    document.getElementById("Contact_Two").innerHTML = "TandC";
                    
                    document.getElementById("specialRulesContactUsLinkThree").style.cssText = "display:table-row;";
			        document.getElementById("Contact3").innerHTML = specialRulesContactUsLinkOne+"[LINK_NAME=contact_3][LINK_TAG=TandC]";
			        document.getElementById("contact_3").innerHTML = "contact_3";
                    document.getElementById("Contact_Three").innerHTML = "TandC";
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
	    sHREF = "LinkChecker_Links.asp?eyebrowLink="+eyebrowLink+"&heroModuleURL="+heroModuleURL+"&HeroModule_paragraphLink="+HeroModule_paragraphLink+"&MainModule_paragraphLink="+MainModule_paragraphLink+"&MainModule_destOfferLink="+MainModule_destOfferLink+"&tempBlurbLink="+tempBlurbLink
	}
	window.onload = getErrorLinks;
	</script>
	</head>

	<body style="font:normal 0.8em/130%; font-family:Verdana, Verdana, Arial, sans-serif;">

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
			<!--<div id="totalvals" style="display:none;">
			<pre>
			</pre>
			</div>-->
			<br /><br />
			<!-- <a href="" style="text-decoration: none; color: #448;"><img src='../images/plus.jpg' width="11" height="11" border="0" align="absmiddle" align="left">&nbsp;<u>Get Links</u></a> -->
			<br /><br />
			<table width="90%" border="1" bordercolor="white" bgcolor="white" cellpadding="4" cellspacing="0" border="0">
			    <tr BorderColorDark="#F0F0F0" BorderColorlight="#999999">
			        <td bgcolor="#cccccc" style="font-family: verdana, helvetica, sans serif; font-size: 12px; color: #003471; font-weight: bold; text-decoration: none;">
			           # 
			        </td>
			        <td bgcolor="#cccccc" style="font-family: verdana, helvetica, sans serif; font-size: 12px; color: #003471; font-weight: bold; text-decoration: none;">
			           Link 
			        </td>
			        <td bgcolor="#cccccc" align="center" style="font-family: verdana, helvetica, sans serif; font-size: 12px; color: #003471; font-weight: bold; text-decoration: none;">
			            Link Name
			        </td>
			        <td bgcolor="#cccccc" align="center" style="font-family: verdana, helvetica, sans serif; font-size: 12px; color: #003471; font-weight: bold; text-decoration: none;">
			            Link Tag
			        </td>
			    </tr>
			    <tr BorderColorDark="#FCFCFC" BorderColorlight="#CCCCCC">
			        <td bgcolor="#F0F0F0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#F0F0F0" valign="top" id="headerLogo" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            http://www.expedia.com/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=logo][LINK_TAG=Header]
			        </td>
			        <td bgcolor="#F0F0F0" align="center" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            logo 
			        </td>
			        <td bgcolor="#F0F0F0" align="center" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            Header
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#F0F0F0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#F0F0F0" valign="top" id="eyebrowLink" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#F0F0F0" align="center" id="LinkName1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#F0F0F0" align="center" id="LinkTag1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="TopNav_flights" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=flights][LINK_TAG=TopNav]    			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            flights 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            TopNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="TopNav_hotels" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=hotels][LINK_TAG=TopNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            hotels 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            TopNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="TopNav_cars" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=cars][LINK_TAG=TopNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            cars 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            TopNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="TopNav_vacationpackages" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=packages][LINK_TAG=TopNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            vacation packages 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            TopNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="TopNav_cruise" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=cruises][LINK_TAG=TopNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName6" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            cruises 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag6" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            TopNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="TopNav_activities" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=activities][LINK_TAG=TopNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName7" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            activities 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag7" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            TopNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="TopNav_deals" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=deals][LINK_TAG=TopNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName8" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            deals & destinations 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag8" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            TopNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="TopNav_business" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/business/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=business][LINK_TAG=TopNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName9" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            business travel 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag9" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            TopNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="heroImage" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="heroModuleURL" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName10" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag10" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_1_20" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="HeroLink_1_20" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName1_20" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag1_20" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_1_1" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="HeroLink_1_1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName1_1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag1_1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_1_2" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="HeroLink_1_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName1_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag1_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_1_30" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="HeroLink_1_30" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName1_30" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag1_30" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_1_40" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="HeroLink_1_40" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName1_40" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag1_40" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_0_10" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainParagraphLink_10" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName_10" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag_10" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_0_11" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainParagraphLink_11" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName_11" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag_11" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_0_12" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainParagraphLink_12" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName_12" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag_12" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_0_20" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainParagraphLink_20" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName_20" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag_20" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_0s" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainParagraphLink_0s" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName13s" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag13s" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_1" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainOfferLink_2_1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName121" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag121" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_2" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainOfferLink_2_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName122" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag122" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_3" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainOfferLink_2_3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName123" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag123" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_4" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainOfferLink_2_4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName124" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag124" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_5" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainOfferLink_2_5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName125" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag125" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_6" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainOfferLink_2_6" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName126" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag126" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_7" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainOfferLink_2_7" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName127" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag127" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_8" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainOfferLink_2_8" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName128" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag128" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_1_2" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule_destOfferLink2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName2_1_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag2_1_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_1_3" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule_destOfferLink3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName2_1_3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag2_1_3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_1_4" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule_destOfferLink4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName2_1_4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag2_1_4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_1_5" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule_destOfferLink5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName2_1_5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag2_1_5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_1_6" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule_destOfferLink6" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName2_1_6" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag2_1_6" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="MainModule_tempOfferLink_2" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule_tempOfferLink1_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkNameOL2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTagOL2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="MainModule_tempOfferLink_3" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule_tempOfferLink1_3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkNameOL3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTagOL3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="MainModule_tempOfferLink_4" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule_tempOfferLink1_4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkNameOL4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTagOL4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="MainModule_tempOfferLink_5" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule_tempOfferLink1_5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkNameOL5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTagOL5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="MainModule_tempOfferLink_6" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule_tempOfferLink1_6" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkNameOL6" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTagOL6" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_2_Action" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule_CallToActionLink" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="ActionName1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="ActionTag1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_4_10" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule2_paragraphLink_4_10" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName410" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag410" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_4_11" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule2_paragraphLink_4_11" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName411" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag411" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_4_12" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule2_paragraphLink_4_12" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName412" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag412" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_4_20" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule2_paragraphLink_4_20" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName420" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag420" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
                <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_3_2" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule2_offerLink_3_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName132" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag132" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_3_3" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule2_offerLink_3_3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName133" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag133" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_3_4" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule2_offerLink_3_4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName134" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag134" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Message_3_x" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="MainModule2_callToActionLink_3_x" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName13x" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag13x" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Offers_1_0" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="OfferModule2_textLineURL_1_0" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName_4_0" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag_4_0" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Offers_1_1" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="OfferModule2_textLineURL_1_1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName_4_1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag_4_1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Offers_1_2" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="OfferModule2_textLineURL_1_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName_4_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag_4_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Offers_1_3" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="OfferModule2_textLineURL_1_3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName_4_3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag_4_3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="Offers_1_4" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="OfferModule2_textLineURL_1_4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkName_4_4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag_4_4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>			    
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="BottomNav_flights" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=flights][LINK_TAG=BottomNav]    			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            flights 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            BottomNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="Td3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=hotels][LINK_TAG=BottomNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td4" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            hotels 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            BottomNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="BottomNav_cars" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=cars][LINK_TAG=BottomNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td6" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            cars 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td7" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            BottomNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="BottomNav_vacationpackages" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=packages][LINK_TAG=BottomNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td8" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            vacation packages 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td9" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            BottomNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="BottomNav_cruise" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=cruises][LINK_TAG=BottomNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td10" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            cruises 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td11" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            BottomNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="BottomNav_activities" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=activities][LINK_TAG=BottomNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td12" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            activities 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td13" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            BottomNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="BottomNav_deals" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
						http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+][LINK_NAME=deals][LINK_TAG=BottomNav]
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td14" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            deals & destinations 
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Td15" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            BottomNav
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="TandCLinkOne" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="TandC1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="tc_1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag_One" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="TandCLinkTwo" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="TandC2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="tc_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="LinkTag_Two" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="UnsubscribeContent1Link" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="Unsub1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="unsub_1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Unsub_One" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="UnsubscribeContent2Link" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="Unsub2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="unsub_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Unsub_Two" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="specialRulesContactUsLinkOne" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="Contact1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="contact_1" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Contact_One" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="specialRulesContactUsLinkTwo" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="Contact2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="contact_2" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Contact_Two" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr BorderColorDark="#fcfcfc" BorderColorlight="#cccccc" id="specialRulesContactUsLinkThree" style="display:none;">
			        <td bgcolor="#f0f0f0" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            [&#149;]
			        </td>
			        <td bgcolor="#f0f0f0" valign="top" id="Contact3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #007236; font-weight: normal; text-decoration: none;">
			            			        
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="contact_3" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			             
			        </td>
			        <td bgcolor="#f0f0f0" align="center" id="Contact_Three" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: normal; text-decoration: none;">
			            
			        </td>
			    </tr>
			    <tr>
			        <td></td>
			    </tr>
			</table>
			
			
			<form id="Links" method="POST" action="processAdd.asp">
                <input type="text" id="eyebrowLink001" name="eyebrowLink001" /><br />
                <input type="text" id="heroModuleURL001" name="heroModuleURL001" /><br />
                <input type="hidden" id="linkURL" name="linkURL" value="<%= newLinkPath %>" />
			    <input type="hidden" id="fileName" name="fileName" value="<%= fileName %>" />
                <input type="submit" id="btnSub" name="Submit" value="Submit">
            </form>
			
			
			<span id="End" style="display:none;"></span>
			
			<table border="0" bgcolor="#FFFFFF">
				<tr>
					<td align="left" style="font-family: verdana; font-size: 11; color: #000000;"><b>HTML Code</b><br>
						<form method="GET" name="" action="">
						<TEXTAREA cols="95" rows="35" id="HTML"><%= strHTML %></TEXTAREA>	
						</form>
					</td>
				</tr>
				<tr>
					<td align="left" style="font-family: verdana; font-size: 11; color: #000000;"><b>Edited HTML Code</b><br>
						<form method="GET" name="" action="">
						<TEXTAREA cols="95" rows="35" id="newHTML"></TEXTAREA>	
						</form>
					</td>
				</tr>
			</table>
			<br>
			
			<!-- <span id="Double_qMark24">1</span> <span id="Double_qMarkLink24">1</span> 
			<span id="Double_qMark33">2</span> <span id="Double_qMarkLink33">2</span> -->
						
			
			<table border="0" bgcolor="#FFFFFF">
				<tr>
					<td align="left" style="font-family: verdana; font-size: 11; color: #000000;">
						<%= strHTML %>
					</td>
				</tr>
			</table>
			

	</body>
</html> 