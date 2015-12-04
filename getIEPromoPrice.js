var region = "";
var location = "";
var expediapick = "";
var name = "";
var starRating = "";
var priceCol1 = "";
var priceCol2 = "";
var priceCol3 = "";
var priceCol1_offer = "";
var priceCol2_offer = "";
var priceCol3_offer = "";
var address = "";
var image = "";
var PageSize = 4;
var ButtonCount = "";
var sTemp = "";
var jsData = new Array();
 
function getIEPromoPrice()
{
    rowNodes = xmlObj.childNodes;
    
//    sTemp = "<table class='sorted regroup' cellpadding='2' cellspacing='2' border='0' style='width:586px;'>";
//    sTemp += "<tr style='background-color:#fff799;'>";
//    sTemp += "<td align='center' valign='top' style='width:10%; color:#336699;'><a href='javascript:sortTable(0, hotel_location);'>Location</a></td>";
//    sTemp += "<td colspan='2' align='left' valign='top' style='width:50%; color:#336699;'><a href='javascript:sortTable(1, hotel_location);'>Hotel Name</a></td>";
//    sTemp += "<td align='center' valign='top' style='width:10%; color:#336699;'><a href='javascript:sortTable(2, hotel_location);'>Star Rating</a></td>";
//    sTemp += "<td align='center' valign='top' style='width:10%; color:#336699;'><a href='javascript:sortTable(2, hotel_location);'>Price</a></td>";
//    sTemp += "<td align='center' valign='top' style='width:10%; color:#336699;'><a href='javascript:sortTable(2, hotel_location);'>Price</a></td>";
//    sTemp += "<td align='center' valign='top' style='width:10%; color:#336699;'><a href='javascript:sortTable(2, hotel_location);'>Price</a></td>";
//    sTemp += "</tr>";
    
    for (var a = 0; a < rowNodes.length; a++)
    {
        if (rowNodes[a].tagName == "row")
        {
            //var jsData = new Array();
            region = rowNodes[a].getAttribute("region");
            location = rowNodes[a].getAttribute("location");
            expediapick = rowNodes[a].getAttribute("expediapicks");
            name = rowNodes[a].childNodes[0].text;
            description = rowNodes[a].childNodes[1].text;
            image = rowNodes[a].childNodes[2].text;
            starRating = rowNodes[a].childNodes[3].text;
            switch (starRating)
			    {
				    case "0":
				    starRating = "";
				    break;
				    case "20":
				    starRating = " (2 stars) - ";
				    break;
				    case "25":
				    starRating = " (2 1/2 stars) - ";
				    break;
				    case "30":
				    starRating = "http://ctoohey02/email/previewer_test/numbers/3stars.gif";
				    break;
				    case "35":
				    starRating = " (3 1/2 stars) - ";
				    break;
				    case "40":
				    starRating = " (4 stars) - ";
				    break;
				    case "45":
				    starRating = " (4 1/2 stars) - ";
				    break;
				    case "50":
				    starRating = "http://ctoohey02/email/previewer_test/numbers/5stars.gif";
				    break;
			    }
            priceCol1 = rowNodes[a].childNodes[4].text;
            priceCol1_offer = rowNodes[a].childNodes[4].getAttribute("offer");
            priceCol2 = rowNodes[a].childNodes[5].text;
            priceCol2_offer = rowNodes[a].childNodes[5].getAttribute("offer");
            priceCol3 = rowNodes[a].childNodes[6].text;
            priceCol3_offer = rowNodes[a].childNodes[6].getAttribute("offer");
            address = rowNodes[a].childNodes[8].text;
            lat = parseFloat(rowNodes[a].childNodes[9].text);
            lng = parseFloat(rowNodes[a].childNodes[10].text);
            points = new VELatLong(lat,lng);
            //infobox = "</p><div id='PushpinBalloonContainer'><table border='0' cellpadding='0' cellspacing='0'><tr><td align='left' valign='top' style='font-family: arial; font-size: 1.0em; color: #000000; padding-right:6px; text-align:justify;'><strong style='font-family:arial;'>Brief Description</strong><br /><br />" + description + "</td><td align='right' valign='top' style='padding-right:2px;'><img src='" + image + "' style='border: solid 1px #979797;' align='right'></td></tr></table></div>";
            var customIcon = "<div style='border:0px; border-style:hidden !important;'><img src='http://ctoohey02/email/previewer_test/numbers/" + (a+1) + "b.gif' style='border:0px; border-style:hidden !important;'></div>";
          
            var pin = map.AddPushpin(points);
            pin.SetCustomIcon(customIcon);
            //pin.SetTitle(name);
            //pin.SetDescription(infobox);
            
            jsData[a] = {location:location, a:a, lat:lat, lng:lng, hotelimage:image, hotelname:name, description:description, starrating:starRating, price1:priceCol1, price1offer:priceCol1_offer, price2:priceCol2, price2offer:priceCol2_offer, price3:priceCol3, price3offer:priceCol3_offer};
            
            drawTable('bowlData');
            
//            sTemp += "<tr style='background-color:#fdfbf8; height:70px;' id='hotel_location'>";
//            sTemp += "<td align='center' valign='top' style='width:10%; color:#336699; vertical-align:top;'>" + location + "</td>";
//            sTemp += "<td align='left' valign='top' style='width:70px; height:70px; color:#336699; vertical-align:top;'><a href='javascript:getHotel(" + a + ","+ lat +","+ lng +")'><img src='" + image + "' style='border:0px; width:70px;'></a></td>";
//            sTemp += "<td align='left' valign='top' style='width:100%; color:#336699; vertical-align:top;'><a href='javascript:getHotel(" + a + ","+ lat +","+ lng +")'><img src='http://ctoohey02/email/previewer_test/numbers/" + (a+1) + "bsm.gif' style='border:0px; border-style:hidden !important;'></a> <a href='javascript:getHotel(" + a + ","+ lat +","+ lng +")'><strong style='vertical-align:top;'>" + name + "</strong></a><br />" + description + "</td>";
//            sTemp += "<td align='center' valign='top' style='color:#336699; vertical-align:top;'>" + starRating + "</td>";
//            sTemp += "<td align='center' valign='top' style='color:#336699; vertical-align:top;'><span style='font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;'>" + priceCol1 + "</span><br />" + priceCol1_offer + "</td>";
//            sTemp += "<td align='center' valign='top' style='color:#336699; vertical-align:top;'><span style='font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;'>" + priceCol2 + "</span><br />" + priceCol2_offer + "</td>";
//            sTemp += "<td align='center' valign='top' style='color:#336699; vertical-align:top;'><span style='font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;'>" + priceCol3 + "</span><br />" + priceCol3_offer + "</td>";
//            sTemp += "</tr>";
        }
    }
    
    //sTemp += "</table>";
    //var Table_array = new Array();
    //Table_array = sTemp;
    //alert(Table_array);
    //document.getElementById("hotel_list").innerHTML = sTemp;
    
    // Sorting functions (invoked by sortTable())
            function sortByLocation(a, b) {
                return a.location - b.location;
            }
            function sortByHotelName(a, b) {
                return b.hotelname - a.hotelname;
            }
            function sortByStarRating(a, b) {
                return b.starrating - a.starrating;
            }
            function sortByPrice1(a, b) {
                return a.price1 - b.price1;
            }
            function sortByPrice2(a, b) {
                return a.price2 - b.price2;
            }
            function sortByPrice3(a, b) {
                return a.price3 - b.price3;
            }
            
            // Sorting function dispatcher (invoked by table column links)
            function sortTable(link) {
                alert("inside");
                switch (link.firstChild.nodeValue) {
                    case "Location" :
                        jsData.sort(sortByLocation);
                        break;
                    case "Hotel Name" :
                        jsData.sort(sortByHotelName);
                        break;
                    case "Star Rating" :
                        jsData.sort(sortByStarRating);
                        break;
                    case "Price" :
                        jsData.sort(sortByPrice1);
                        break;
                    case "Price" :
                        jsData.sort(sortByPrice2);
                        break;
                    case "Price" :
                        jsData.sort(sortByPrice3);
                        break;
                }
                drawTable("hotel_list")
            }
            
            // Remove existing content of an element
            function clearChildNodes(elemID) {
                var elem = document.getElementById(elemID);
                while (elem.childNodes.length > 0) {
                    elem.removeChild(elem.firstChild);
                }
            }
            
            // Complete the reconstruction of the sorted table
            function finishDrawTable(tbodyID) {
                var tr, td, txt, txt2, txt_a, txt_lat, txt_lng, link, link2, image, strong;
                tbody = document.getElementById(tbodyID);
                // create holder for accumulated tbody elements and text nodes
                var frag = document.createDocumentFragment();
                // loop through data source
                             
                for (var i = 0; i < jsData.length; i++) {
    	            tr = document.createElement("tr");
                	
    	            td = document.createElement("td");
    	            td.style.cssText = "width:10%; color:#336699; vertical-align:top;'";
    	            td.setAttribute("align", "center");
    	            td.setAttribute("valign", "top");
    	            txt = document.createTextNode(jsData[i].location);
    	            td.appendChild(txt);
    	            tr.appendChild(td);
                	
       	            td = document.createElement("td");
       	            td.style.cssText = "width:70px; height:70px; color:#336699; vertical-align:top;";
       	            td.setAttribute("align", "left");
    	            td.setAttribute("valign", "top");
    	            link = document.createElement("a");
    	            link.href = "javascript:getHotel(" + jsData[i].a + ","+ jsData[i].lat +","+ jsData[i].lng +")";
    	            image = document.createElement("img");
    	            image.setAttribute("src", jsData[i].hotelimage);
    	            image.style.cssText = "border:0px; width:70px;";
    	            link.appendChild(image);
    	            td.appendChild(link);
    	            tr.appendChild(td);
                	
       	            td = document.createElement("td");
       	            td.style.cssText = "width:100%; color:#336699; vertical-align:top;";
       	            td.setAttribute("align", "left");
    	            td.setAttribute("valign", "top");
    	            txt = document.createTextNode(jsData[i].hotelname);
    	            txt2 = document.createTextNode(jsData[i].description);
    	            link = document.createElement("a");
    	            link.href = "javascript:getHotel(" + jsData[i].a + ","+ jsData[i].lat +","+ jsData[i].lng +")";
    	            image = document.createElement("img");
    	            image.setAttribute("src", "http://ctoohey02/email/previewer_test/numbers/" + (jsData[i].a+1) + "bsm.gif");
    	            image.style.cssText = "border:0px; border-style:hidden !important;";
    	            link2 = document.createElement("a");
    	            link2.href = "javascript:getHotel(" + jsData[i].a + ","+ jsData[i].lat +","+ jsData[i].lng +")";
    	            strong = document.createElement("strong");
    	            strong.style.cssText = "vertical-align:top;";
    	            //var break_el = document.createElement("<br>");
    	            //break_el.appendChild(txt2);
    	            strong.appendChild(txt);
    	            link2.appendChild(strong);
    	            link.appendChild(image);
    	            td.appendChild(link);
    	            td.appendChild(link2);
    	            //td.appendChild(break_el);
    	            tr.appendChild(td);
                	
       	            td = document.createElement("td");
       	            td.style.cssText = "color:#336699; vertical-align:top;";
       	            td.setAttribute("align", "center");
    	            td.setAttribute("valign", "top");
    	            image = document.createElement("img");
    	            image.setAttribute("src", jsData[i].starrating);
    	            image.style.cssText = "border:0px; border-style:hidden !important;";
    	            //txt = document.createTextNode(jsData[i].starrating);
    	            td.appendChild(image);
    	            tr.appendChild(td);
                	
                    td = document.createElement("td");
                    td.style.cssText = "color:#336699; vertical-align:top;";
                    td.setAttribute("align", "center");
    	            td.setAttribute("valign", "top");
    	            var span = document.createElement("span");
    	            span.style.cssText = "font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;";
                    txt = document.createTextNode(jsData[i].price1);
                    span.appendChild(txt);
                    var break_el = document.createElement("<br>");
                    txt2 = document.createTextNode(jsData[i].price1offer);
                    //break_el.appendChild(txt2);
                    td.appendChild(span);
                    //td.appendChild(break_el);
                    tr.appendChild(td);
                    
                    td = document.createElement("td");
                    td.style.cssText = "color:#336699; vertical-align:top;";
                    td.setAttribute("align", "center");
    	            td.setAttribute("valign", "top");
    	            var span = document.createElement("span");
    	            span.style.cssText = "font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;";
                    txt = document.createTextNode(jsData[i].price2);
                    span.appendChild(txt);
                    var break_el = document.createElement("<br>");
                    txt2 = document.createTextNode(jsData[i].price2offer);
                    //break_el.appendChild(txt2);
                    td.appendChild(span);
                    //td.appendChild(break_el);
                    tr.appendChild(td);
                    
                    td = document.createElement("td");
                    td.style.cssText = "color:#336699; vertical-align:top;";
                    td.setAttribute("align", "center");
    	            td.setAttribute("valign", "top");
    	            var span = document.createElement("span");
    	            span.style.cssText = "font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;";
                    txt = document.createTextNode(jsData[i].price3);
                    span.appendChild(txt);
                    var break_el = document.createElement("<br>");
                    txt2 = document.createTextNode(jsData[i].price3offer);
                    //break_el.appendChild(txt2);
                    td.appendChild(span);
                    //td.appendChild(break_el);
                    tr.appendChild(td);
                    
                    frag.appendChild(tr);
                }
                if (!tbody.appendChild(frag)) {
    	            alert("This browser doesn't support dynamic tables.");
                }
            }
            
            // Draw table from 'jsData' array of objects
            function drawTable(tbodyID) {
                if (document.getElementById) {
    	            clearChildNodes(tbodyID);
                    // assure bug-free redraw in Geck engine by
                    // letting window show cleared table
                    if (navigator.product && navigator.product == "Gecko") {
                        setTimeout("finishDrawTable('" + tbodyID + "')", 0);
                    } else {
                        finishDrawTable(tbodyID);
                    }
                 } else {
                     alert("Sorry, dynamic table feature works with IE5 or later for Windows, and Netscape 6 or later.");
                 }
            }
 }

  