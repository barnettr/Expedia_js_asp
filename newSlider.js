	//<![CDATA[
	var bg_timerlen = 5;
    var bg_slideAniLen = 500;
    var bg_timerID = new Array();
    var bg_startTime = new Array();
    var bg_obj = new Array();
    var bg_endHeight = new Array();
    var bg_moving = new Array();
    var bg_dir = new Array();
    
    function bg_slidedown(bg_objname)
    {
        if(bg_moving[bg_objname])
            return;
        
        if(document.getElementById(bg_objname).style.display != "none")
            return; // cannot slide down something that is already visible
     
        //setTimeout('document.getElementById("bg").style.cssText = "display:block; width:105px; height:105; position:absolute; z-index:2; right:-1px; bottom:-1px; background-color:#ffffff; border-top:1px solid #979797; border-left:1px solid #979797;"', 500);
        document.getElementById("mapDown").style.cssText = "display:block; border:0px;";
        document.getElementById("mapUp").style.cssText = "display:none;";
        bg_moving[bg_objname] = true;
        bg_dir[bg_objname] = "down";
        bg_startslide(bg_objname);
    }
     
    function bg_slideup(bg_objname)
    {
        if(bg_moving[bg_objname])
            return;
     
        if(document.getElementById(bg_objname).style.display == "none")
            return; // cannot slide up something that is already hidden
        
        //document.getElementById("bg").style.cssText = "display:none;";
        document.getElementById("mapDown").style.cssText = "display:none;";
        document.getElementById("mapUp").style.cssText = "display:block; border:0px;";
        bg_moving[bg_objname] = true;
        bg_dir[bg_objname] = "up";
        bg_startslide(bg_objname);
    }
    
    function bg_startslide(bg_objname)
    {
        bg_obj[bg_objname] = document.getElementById(bg_objname);
     
        bg_endHeight[bg_objname] = parseInt(bg_obj[bg_objname].style.height);
        bg_startTime[bg_objname] = (new Date()).getTime();
     
        if(bg_dir[bg_objname] == "down")
        {
            bg_obj[bg_objname].style.height = "1px";
        }
     
        bg_obj[bg_objname].style.display = "block";
     
        bg_timerID[bg_objname] = setInterval('bg_slidetick(\'' + bg_objname + '\');',bg_timerlen);
    }
    
    function bg_slidetick(bg_objname)
    {
        var bg_elapsed = (new Date()).getTime() - bg_startTime[bg_objname];
     
        if (bg_elapsed > bg_slideAniLen)
            bg_endSlide(bg_objname)
        else 
        {
            var bg_d =Math.round(bg_elapsed / bg_slideAniLen * bg_endHeight[bg_objname]);
            if(bg_dir[bg_objname] == "up")
                bg_d = bg_endHeight[bg_objname] - bg_d;
     
            bg_obj[bg_objname].style.height = bg_d + "px";
        }
     
        return;
    }
    
    function bg_endSlide(bg_objname)
    {
        clearInterval(bg_timerID[bg_objname]);
     
        if(bg_dir[bg_objname] == "up")
            bg_obj[bg_objname].style.display = "none";
     
        bg_obj[bg_objname].style.height = bg_endHeight[bg_objname] + "px";
     
        delete(bg_moving[bg_objname]);
        delete(bg_timerID[bg_objname]);
        delete(bg_startTime[bg_objname]);
        delete(bg_endHeight[bg_objname]);
        delete(bg_obj[bg_objname]);
        delete(bg_dir[bg_objname]);
     
        return;
    }
	//]]>