function getHotel(a,lat,lng) 
{
    
    //var infobox = "</p><div id='PushpinBalloonContainer'><table border='0' cellpadding='0' cellspacing='0'><tr><td align='left' valign='top' style='font-family: arial; font-size: 1.0em; color: #000000; padding-right:6px; text-align:justify;'><strong style='font-family:arial;'>Brief Description</strong><br />" + descriptions[a] + "<td align='right' valign='top' style='padding-right:2px;'><img src='" + image_urls[a] + "'style='border: solid 1px #979797;' align='right'></td></table></div>";
    var customIcon = "<div style='border:0px; border-style:hidden !important;'><img src='http://ctoohey02/email/previewer_test/numbers/" + (a+1) + "b.gif' style='border:0px; border-style:hidden !important;'></div>";
    //var customTitle = "<span style='color:#de6600; font-size:1.2em;'>" + titles[a] + "</span>";
    var points = new VELatLong(lat,lng);
    
    map.LoadMap(points, 15, selStyle, fixed, selMode, showSwitch);
    map.ClearInfoBoxStyles();
    var shape = new VEShape(VEShapeType.Pushpin, points);
    shape.SetCustomIcon(customIcon);
    //shape.SetTitle(customTitle);
    //shape.SetDescription(infobox);
    map.AddShape(shape);
}
