function getIENodes()
{
    rowNodes = xmlObj.childNodes;
    for (var a = 0; a < 16; a++)
    {
        b++
        if (rowNodes[a].tagName == "row" || rowNodes[a].tagName == "Region_Africa")
        {
            image_url = rowNodes[a].childNodes[5].text;
            icon = rowNodes[a].childNodes[6].text.substring(0,2);
            flags = rowNodes[a].childNodes[6].text.split(",");
            lat = parseFloat(rowNodes[a].childNodes[7].text);
            lng = parseFloat(rowNodes[a].childNodes[9].text);
            description = rowNodes[a].childNodes[13].text;
            title = rowNodes[a].childNodes[14].text;
            states = rowNodes[a].childNodes[15].text;
            points = new VELatLong(lat,lng);
            var infobox = "<p><img src='http://whc.unesco.org/uploads/states/small/" + flags[0] + ".gif' style='border: solid 1px #000000;'> ";
            if (flags[1])
            {
                infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + flags[1] + ".gif' style='border: solid 1px #000000;'> ";
            }
            if (flags[2])
            {
                infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + flags[2] + ".gif' style='border: solid 1px #000000;'> ";
            }
            if (flags[3])
            {
                infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + flags[3] + ".gif' style='border: solid 1px #000000;'> ";
            }
            if (flags[4])
            {
                infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + flags[4] + ".gif' style='border: solid 1px #000000;'> ";
            }
            if (flags[5])
            {
                infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + flags[5] + ".gif' style='border: solid 1px #000000;'> ";
            }
            if (flags[6])
            {
                infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + flags[6] + ".gif' style='border: solid 1px #000000;'> ";
            }
            if (flags[7])
            {
                infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + flags[7] + ".gif' style='border: solid 1px #000000;'> ";
            }
            if (flags[8])
            {
                infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + flags[8] + ".gif' style='border: solid 1px #000000;'> ";
            }
            if (flags[9])
            {
                infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + flags[9] + ".gif' style='border: solid 1px #000000;'> ";
            }
            if (flags[10])
            {
                infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + flags[10] + ".gif' style='border: solid 1px #000000;'> ";
            }
            if (flags[11])
            {
                infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + flags[11] + ".gif' style='border: solid 1px #000000;'>";
            }
            infobox += "</p><div id='PushpinBalloonContainer'><table border='0' cellpadding='0' cellspacing='0'><tr><td align='left' valign='top' style='font-family: arial; font-size: 1.0em; color: #000000; padding-right:6px; text-align:justify;'><strong style='font-family:arial;'>Brief Description</strong><br />" + description + "</td><td align='right' valign='top' style='padding-right:2px;'><img src='" + image_url + "' style='border: solid 1px #979797;' align='right'></td></tr></table></div>";
            var customIcon = "<div><img src='http://whc.unesco.org/uploads/states/small/" + icon + ".gif' style='border: solid 1px #000000;'></div>";
          
            var pin = map.AddPushpin(points);
            pin.SetCustomIcon(customIcon);
            pin.SetTitle(title);
            pin.SetDescription(infobox);
            
            myFlags[a] = flags;
            icons[a] = icon;
            titles[a] = title;
            descriptions[a] = description;
            image_urls[a] = image_url;
         
            var region_Table = document.getElementById("side_bar");
            var row = region_Table.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            cell1.innerHTML = '<strong>'+ (b) +')</strong>';
            cell1.setAttribute("valign", "top");
            cell1.setAttribute("width", "5%");
            cell1.setAttribute("align", "left");
            cell1.className = "sideBar_Number";
            if (a == 129)
            {
                cell2.innerHTML = '<strong><a href="javascript:getRegion(' + a + ','+ lat +','+ lng +')">' + states + '</a></strong><br /><br />';
            }
            else
            {
                cell2.innerHTML = '<strong><a href="javascript:getRegion(' + a + ','+ lat +','+ lng +')">' + states + '</a></strong>';
            }
            cell2.className = "sideBar";
            cell2.className = "sideBar";
            cell2.setAttribute("align", "left");
            document.getElementById("wrapperTable").style.cssText = "width:650px;";
            document.getElementById("wrapperCell").style.cssText = "width:150px; border-right: solid 1px #979797; border-top: solid 1px #979797; border-bottom: solid 1px #979797;";
            document.getElementById("sideBarWrapper").style.cssText = "height:400px; width:150px;" 
        }
    }
    if (g_isIE = true)
    {
        document.getElementById("MSVE_zoomDiv").style.cssText = "margin-right:0px;";     
    }
 }
