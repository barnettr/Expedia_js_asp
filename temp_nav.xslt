<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:my="http://www.w3.org/2001/XMLSchema">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>
<xsl:template match="navigation">
	<html>
		<head>
		<script type="text/javascript" src="idform/tabber.js"></script>
			<title></title>
			<style type="text/css">
	/*--------------------------------------------------
  REQUIRED to hide the non-active tab content.
  But do not hide them in the print stylesheet!
  --------------------------------------------------*/
.tabberlive .tabbertabhide {
 display:none;
}

/*--------------------------------------------------
  .tabber = before the tabber interface is set up
  .tabberlive = after the tabber interface is set up
  --------------------------------------------------*/
.tabber {
}
.tabberlive {
 margin-top:1em;
}

/*--------------------------------------------------
  ul.tabbernav = the tab navigation list
  li.tabberactive = the active tab
  --------------------------------------------------*/
ul.tabbernav
{
 margin:0;
 padding: 3px 0;
 border-bottom: 1px solid #778;
 font: bold 12px Verdana, sans-serif;
}

ul.tabbernav li
{
 list-style: none;
 margin: 0;
 display: inline;
}

ul.tabbernav li a
{
 padding: 3px 0.5em;
 margin-left: 3px;
 border: 1px solid #778;
 border-bottom: none;
 background: #DDE;
 text-decoration: none;
}

ul.tabbernav li a:link { color: #448; }
ul.tabbernav li a:visited { color: #667; }

ul.tabbernav li a:hover
{
 color: #000;
 background: #AAE;
 border-color: #227;
}

ul.tabbernav li.tabberactive a
{
 background-color: #fff;
 border-bottom: 1px solid #fff;
}

ul.tabbernav li.tabberactive a:hover
{
 color: #000;
 background: white;
 border-bottom: 1px solid white;
}

/*--------------------------------------------------
  .tabbertab = the tab content
  Add style only after the tabber interface is set up (.tabberlive)
  --------------------------------------------------*/
.tabberlive .tabbertab {
 padding:5px;
 border:1px solid #aaa;
 border-top:0;
}

/* If desired, hide the heading since a heading is provided by the tab */
.tabberlive .tabbertab h2 {
 display:none;
}
.tabberlive .tabbertab h3 {
 display:none;
}

/* If desired, set a height and add a scrollbar */
.tabberlive#tab2 .tabbertab{
 height:200px;
 overflow:auto;
}
			</style>
		</head>
		<body>
			<table width="300" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td>
							<table width="300" cellpadding="3" cellspacing="0" border="0">
								<tr>
									<td bgcolor="#ffffff" style="padding: 0; margin: 0;">
									<div class="tabber">
										<div class="tabbertab" title="CM">
											list CM templates
										</div>
										<div class="tabbertab" title="TR">
											list TR templates
										</div>
										<div class="tabbertab" title="MMP">
											list MMP templates
										</div>
										<div class="tabbertab" title="FS">
											list FS templates
										</div>
									</div>
								</td>
							</tr>
							</table>
						</td>
					</tr>
					<!--tr>
							<td bgcolor="#dcdce9"  style="padding: 1; margin: 0;">
								<table width="300" cellpadding="3" cellspacing="0" border="0">
								<tr>
										<td bgcolor="#ffffff">
												<xsl:choose>
													<xsl:when test="email[@type='CM']">
														<div class="tabbertab" title="CM"><xsl:value-of select="."/></div><br />
													</xsl:when>
													<xsl:when test="email[@type='TR']">
														<div class="tabbertab" title="TR"><xsl:value-of select="."/></div><br />
													</xsl:when>
													<xsl:when test="email[@type='MMP']">
														<div class="tabbertab" title="MMP"><xsl:value-of select="."/></div><br />
													</xsl:when>
													<xsl:when test="email[@type='FS']">
														<div class="tabbertab" title="FS"><xsl:value-of select="."/></div><br />
													</xsl:when>
													<xsl:otherwise/>
												</xsl:choose>
										</td>
								</tr>
								</table></td>
					</tr-->	
			</table>
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>
