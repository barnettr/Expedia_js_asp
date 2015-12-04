var icons = [];
var titles = [];
var descriptions = [];
var image_urls = [];
var myFlags = [];

var map = null;
var pinID = 1;
var selStyle = "r";
var selMode = VEMapMode.Mode2D;
var zoom = 2;
var latLon = new VELatLong(35.491939, -93.44970000000001);
//var latLon = new VELatLong(34.0960, -118.3715);
var fixed = 0;
var showSwitch = 1;
 
var rowNodes = "";
var pin = "";
var points = "";
var lat = "";
var lng = "";
var title = "";
var description = "";
var image_url = "";
var regex = /\,/i;
var states = "";
var showLocations = "";
var icon = "";
var flags = "";
var b = 0;
 
function getBrowser()
{
  if (navigator.userAgent.indexOf("MSIE") != -1)
  {
    g_isIE = true;
    if (navigator.userAgent.indexOf("MSIE 7") != -1)
      g_isIE7 = true;
  }
  else if (navigator.userAgent.indexOf("Firefox") != -1)
    g_isFirefox = true;
  }


function GetMap()
{
    map = new VEMap('myMap');
    //map.SetDashboardSize(VEDashboardSize.Normal);
    map.LoadMap(latLon, zoom, selStyle, fixed, selMode, showSwitch);
    map.SetScaleBarDistanceUnit(VEDistanceUnit.Miles);
    map.ClearInfoBoxStyles();
    //map.ShowMiniMap(76, 26);
    loadXML();
}

function loadHandler () {
  xmlProcessor(this);
}
 
function loadXML() 
{
    // code for IE
    if (window.ActiveXObject) 
    {
        xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
 	    xmlDoc.async=false;
	    //xmlDoc.load("sample_promoprice_mod.xml");
	    xmlDoc.load("Planet.xml");
	    xmlObj = xmlDoc.documentElement;
	    //getIEPromoPrice();
	    getIENodes();
    }
    // code for Mozilla, Firefox, Opera, etc.
    else if (document.implementation && document.implementation.createDocument) 
    {
 	    xmlDoc = document.implementation.createDocument("","",null);
 	    //xmlDoc.load("sample_promoprice_mod.xml");
 	    xmlDoc.load("Planet.xml");
 	    xmlDoc.addEventListener('load', loadHandler, false);
    }
    else 
    {
 	    alert('Your browser is not able to process this script to run the map. You can upload a current version of your browser @ MS or Firefox.');
    }
}