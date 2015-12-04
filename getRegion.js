function getRegion(a,lat,lng) 
{
    var infobox = "<p><img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][0] + ".gif' style='border: solid 1px #000000;'> ";
    if (myFlags[a][1])
    {
        infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][1] + ".gif' style='border: solid 1px #000000;'> ";
    }
    if (myFlags[a][2])
    {
        infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][2] + ".gif' style='border: solid 1px #000000;'> ";
    }
    if (myFlags[a][3])
    {
        infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][3] + ".gif' style='border: solid 1px #000000;'> ";
    }
    if (myFlags[a][4])
    {
        infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][4] + ".gif' style='border: solid 1px #000000;'> ";
    }
    if (myFlags[a][5])
    {
        infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][5] + ".gif' style='border: solid 1px #000000;'> ";
    }
    if (myFlags[a][6])
    {
        infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][6] + ".gif' style='border: solid 1px #000000;'> ";
    }
    if (myFlags[a][7])
    {
        infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][7] + ".gif' style='border: solid 1px #000000;'> ";
    }
    if (myFlags[a][8])
    {
        infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][8] + ".gif' style='border: solid 1px #000000;'> ";
    }
    if (myFlags[a][9])
    {
        infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][9] + ".gif' style='border: solid 1px #000000;'> ";
    }
    if (myFlags[a][10])
    {
        infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][10] + ".gif' style='border: solid 1px #000000;'> ";
    }
    if (myFlags[a][11])
    {
        infobox += "<img src='http://whc.unesco.org/uploads/states/small/" + myFlags[a][11] + ".gif' style='border: solid 1px #000000;'>";
    }
    infobox += "</p><div id='PushpinBalloonContainer'><table border='0' cellpadding='0' cellspacing='0'><tr><td align='left' valign='top' style='font-family: arial; font-size: 1.0em; color: #000000; padding-right:6px; text-align:justify;'><strong style='font-family:arial;'>Brief Description</strong><br />" + descriptions[a] + "<td align='right' valign='top' style='padding-right:2px;'><img src='" + image_urls[a] + "'style='border: solid 1px #979797;' align='right'></td></table></div>";
    var customIcon = "<div><img src='http://whc.unesco.org/uploads/states/small/" + icons[a] + ".gif' style='border: solid 1px #000000;'></div>";
    var customTitle = "<span style='color:#de6600; font-size:1.2em;'>" + titles[a] + "</span>";
    var points = new VELatLong(lat,lng);
    
    map.LoadMap(points, 4, selStyle, fixed, selMode, showSwitch);
    map.ClearInfoBoxStyles();
    var shape = new VEShape(VEShapeType.Pushpin, points);
    shape.SetCustomIcon(customIcon);
    shape.SetTitle(customTitle);
    shape.SetDescription(infobox);
    map.AddShape(shape);
}