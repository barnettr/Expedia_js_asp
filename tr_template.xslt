<?xml version="1.0"  encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2005-12-29T00:09:13">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>
<xsl:template match="email">
<xsl:if test="@my:type='MMN_TR_02_'">
<xsl:variable name="imgCommon">http://media.expedia.com/media/content/shared/graphics/common/mail/</xsl:variable>
<xsl:variable name="imgPath">http://media.expedia.com/media/content/shared/images/</xsl:variable>
<xsl:variable name="imgMailPath">http://media.expedia.com/media/content/shared/graphics/mail/</xsl:variable>
<xsl:variable name="iconPath">http://media.expedia.com/media/content/expus/graphics/mail/</xsl:variable>
<xsl:variable name="iconsPath">http://media.expedia.com/media/content/expus/graphics/icons/</xsl:variable>
<xsl:variable name="issueID" select="ID/@issue" />
	<table width="600" cellpadding="1" cellspacing="3" border="0" align="center">
	<tr>
		<td width="600" bgcolor="#A3C2E0">
			<table width="598" cellpadding="3" cellspacing="0" border="0">
				<tr>
					<td width="598" bgcolor="#FFFFFF"><font face="arial, helvetica, sans serif" size="2" color="#000000">
						<b>Subject Line:</b>&#160;&#160;<xsl:if test="subjectText">
						<xsl:for-each select="subjectText">
								<xsl:value-of select="." /><br />
						</xsl:for-each>
					</xsl:if></font></td><td valign="top" bgcolor="#ffffff" width="100" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 9pt;"><a href="#" style="color:#336699;" onclick="document.getElementById('AD').style.display = 'block'; document.getElementById('ADNP').style.display = 'none';document.getElementById('AD_1').style.display = 'block'; document.getElementById('ADNP_1').style.display = 'none';"><b>Ads</b></a>&#160;&#160;|&#160;&#160;<a href="#" style="color:#336699;" onclick="document.getElementById('ADNP').style.display = 'block'; document.getElementById('AD').style.display = 'none';document.getElementById('ADNP_1').style.display = 'block'; document.getElementById('AD_1').style.display = 'none';"><b>NP Ads</b></a></td>
				</tr>
			</table></td>
	</tr>
	</table>
	<html>
<head>
<title>Expedia.com</title>
</head>
<body>
	<table width="600" cellpadding="1" cellspacing="0" border="0" align="center" bgcolor="#FFFFFF">
	<tr>
		<td width="600" bgcolor="#A3C2E0">
			<table width="598" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="3" height="51" align="left" valign="top" bgcolor="#FFFFFF">
				<xsl:comment>*****************EdTest_0HEADER_OFFER_START*****************</xsl:comment> 
					<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td align="left">
							<a href="http://www.expedia.com/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/logo_exphorz_short.gif" alt="Expedia.com" width="247" height="51" border="0" /></a>
							</td>
							<td width="351" align="center"  valign="middle">
								<xsl:if test="my:headerOffer[@my:state='yes']">
								<xsl:for-each select="my:headerOffer">
									<a><xsl:attribute name="href"><xsl:value-of select="@my:url" />%%=OmnitureParams('')=%%</xsl:attribute><xsl:attribute name="style">font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold;</xsl:attribute><xsl:value-of select="@my:blurb"  disable-output-escaping="yes" /></a></xsl:for-each><br /></xsl:if>
							</td>
					</tr>
					</table><xsl:comment>*****************EdTest_0HEADER_OFFER_END*****************</xsl:comment></td>
			</tr>
			<tr>
				<td width="52" align="left"  bgcolor="#FFFFFF"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
				<td height="28" align="left" valign="bottom" bgcolor="#FFFFFF">
					<table width="376" cellpadding="4" cellspacing="0" border="0">
					<tr>
							<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
					</tr>
					</table></td>
				<td width="135" align="left" bgcolor="#FFFFFF"><img src="http://www.expedia.com/eta/spaceit.gif" width="135" height="1" /></td>
			</tr>
			</table>
			<table width="598" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="598" height="6" valign="top"><img src="http://media.expedia.com/media/content/expus/graphics/mail/top_blue_line.gif" width="598" height="6" alt="" /></td>
			</tr>
			<tr>
				<td width="598" height="5" valign="top" bgcolor="#ffffff"><img src="http://media.expedia.com/media/content/expus/graphics/mail/feature_top_buffer.gif" width="598" height="5" /></td>
			</tr>
			</table>
			<xsl:comment>*****************EdTest_0HEADLINE_START*****************</xsl:comment> 
			<table width="598" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td bgcolor="#FFFFFF" width="387" valign="top">
					<table width="387" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="10"><img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" height="1" width="10" /></td>
						<td valign="middle"><xsl:if test="header">
							<font face="arial, Helvetica, sans-serif" size="3" color="#336699"><b>
								<xsl:for-each select="header">
									<xsl:value-of select="."  disable-output-escaping="yes" /><br />
								</xsl:for-each>
								</b></font>
							</xsl:if>					
					<!-- MAIN HEADLINE ENDS -->
					<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_text_buffer.gif" width="1" height="5" alt="" /><br/>
					<!-- SUB HEADLINE STARTS -->
							<font face="arial, helvetica, sans serif" size="2" color="#CC0000">
							<xsl:if test="subHeader">
								<xsl:for-each select="subHeader">
									<xsl:value-of select="." disable-output-escaping="yes" /><br />
								</xsl:for-each>
							</xsl:if>
							</font>
					<!-- SUB HEADLINE ENDS -->
						</td>
					</tr>
					</table>
					<table width="387" cellpadding="10" cellspacing="0" border="0">
					<tr>
					<td valign="top">
					<xsl:comment>*****************EdTest_0HEADLINE_END*****************</xsl:comment> 
						<!--topimage-->
						<xsl:comment>*****************EdTest_1IMAGE_START*****************</xsl:comment> 
						<xsl:if test="topimage/@graphic=''">
						</xsl:if>
						<xsl:if test="topimage/@graphic != ''">
						<table align="left" width="164" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td align="left" valign="top" width="150">	
						<xsl:for-each select="topimage">
						<a><xsl:attribute name="href"><xsl:value-of select="@imagelink" />emlcid=progMMN-campTR-issu<xsl:value-of select="@issue" />-test96-segm[+PROFILE('SEG_SCORE','','')+]-sega[+PROFILE('SEG_STATE','','')+]-date[+CALC_DATE(0,'+0d','YYYYMMDDHHMISS')+]-vers02-link[+PROFILE('link_id','','')+]-paid[+PROFILE('profile_key','','')+]-dma[+PROFILE('ON_DMA_CODE','','')+]-wave{_WAVE_ID_}</xsl:attribute>
						<img><xsl:attribute name="src">http://media.expedia.com/media/content/expus/graphics/mail/<xsl:value-of select="@graphic" /></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@imagename"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="width">150</xsl:attribute><xsl:attribute name="height">101</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="align">left</xsl:attribute></img></a>
						</xsl:for-each></td>	
						</tr>
						</table>
						</xsl:if>
						<xsl:comment>*****************EdTest_1IMAGE_END*****************</xsl:comment> 
						<!--topimage-->
						<xsl:comment>*****************EdTest_3OFFER_LINKS_START*****************</xsl:comment> 
						<xsl:if test="specials">
							<font style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 9pt; LINE-HEIGHT: 20px;">
							<xsl:for-each select="specials">
								<a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="@url"/>%%=OmnitureParams('')=%%</xsl:attribute><xsl:value-of select="."  disable-output-escaping="yes" /></a><br />		
							</xsl:for-each>
							</font>
						</xsl:if>
						<xsl:comment>*****************EdTest_3OFFER_LINKS_END*****************</xsl:comment> 		
					<!-- WELCOME MESSAGE STARTS -->
					<xsl:comment>*****************EdTest_2MESSAGE_START*****************</xsl:comment> 
						<xsl:if test="para"><p>
						<font style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 9pt; color: #333333; LINE-HEIGHT: 16px;">
						<xsl:for-each select="para"><xsl:value-of select="."  disable-output-escaping="yes" /><br /><br />
						</xsl:for-each>
						</font></p>
						</xsl:if>					
					<xsl:comment>*****************EdTest_2MESSAGE_END*****************</xsl:comment>
					<!-- WELCOME MESSAGE ENDS -->	
						</td>
					</tr>
					</table></td>
					<td bgcolor="#FFFFFF" width="211" valign="top">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td width="200" valign="top" bgcolor="#ffffff"><br />
							<!-- start FLIGHT FINDER table -->	
								<table width="200" cellspacing="0" cellpadding="0" border="0">
								<tr>
									<td colspan="3" width="180"><img src="http://media.expedia.com/media/content/expus/graphics/mail/110105_ETM_PT1_border_bg.gif" width="200" height="1" border="0" /></td></tr>
								<tr>
									<td width="1" valign="top"><img src="http://media.expedia.com/media/content/expus/graphics/mail/110105_ETM_PT1_border_bg.gif" height="25" width="1" border="0" /></td>
									<td height="25" bgcolor="#3D6E9E" align="center" valign="middle">
										<font style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 14px; color: #ffffff;"><b>Search Fares Now</b></font></td>
									<td width="1" valign="top"><img src="http://media.expedia.com/media/content/expus/graphics/mail/110105_ETM_PT1_border_bg.gif" height="25" width="1" border="0" /></td>
								</tr>
								<tr>
									<td colspan="3" width="180"><img src="http://media.expedia.com/media/content/expus/graphics/mail/110105_ETM_PT1_border_bg.gif" width="200" height="1" border="0" /></td></tr>
								<tr>
									<td width="1" bgcolor="#FFDF7B"></td>
									<td width="178" bgcolor="#ffffff" align="center">
										<!-- start nested FLIGHT FINDER FORM table -->	
										<table width="178" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td width="10"><img src="http://www.expedia.com/eta/spaceit.gif" width="10" height="1" /></td>
											<td align="left" valign="middle" bgcolor="#FFFFFF">
												<form method="GET" name="etaExpress" action="http://www.expedia.com/pubspec/scripts/eap.asp?%%=OmnitureParams('')=%%"> 
												<input type="hidden" name="GOTO" value="EXPFLTWIZ" />
												<font face="arial, Helvetica, sans-serif" size="1" color="#000000">Departing from:</font>
												<br />
												<input maxlength="100" name="Frairport" size="24" value="" />
												<br />
												<font face="arial, Helvetica, sans-serif" size="1" color="#000000">Depart: (MM/DD/YY)</font>
												<br />
												<input maxlength="8" name="FromDate" value="" size="8" style="width:70px" />&#160;&#160;
												<select name="FromTime">
													<option selected="Morning">Morning</option>
													<option value="Afternoon">Afternoon</option>
													<option value="Evening">Evening</option>
												</select>
												<br />
												<font face="arial, Helvetica, sans-serif" size="1" color="#000000">Going to:</font>
												<br />
												<input maxlength="100" name="Toairport" size="24" value="" />
												<br />
												<font face="arial, Helvetica, sans-serif" size="1" color="#000000">Return: (MM/DD/YY)</font>
												<br />
												<input maxlength="8" name="ToDate" value="" size="8" style="width:70px" />&#160;&#160;
												<select name="ToTime">
													<option value="Morning">Morning</option>
													<option value="Afternoon">Afternoon</option>
													<option selected="Evening">Evening</option>
												</select>
												<font face="arial, Helvetica, sans-serif" size="1" color="#000000">
												<br />
												<br />
												</font>
												<nobr><select name="Numadult">
													<option selected="1">1 adult</option>
													<option value="2">2 adults</option>
													<option value="3">3 adults</option>
													<option value="4">4 adults</option>
													<option value="5">5 adults</option>
													<option value="6">6 adults</option>
												</select>&#160;&#160;
												<input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/btn_find_now.jpg" align="absmiddle" />&#160;&#160;</nobr>
												</form>
											</td>
										</tr>
										<tr>
											<td height="8"></td>
										</tr>
										</table></td>
									<td width="1" bgcolor="#FFDF7B"></td>
									<!-- end nested FLIGHT FINDER FORM table -->
								</tr>
								<tr>
									<td colspan="3" height="1" bgcolor="#FFDF7B"></td>
								</tr>
								</table>							
								<!-- END FLIGHT FINDER --></td>	
						</tr>
						</table></td>
				</tr> 
				</table>
				<xsl:comment>*****************DEALS_ALL_START*****************</xsl:comment>
				<table width="598" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td bgcolor="#FFFFFF" valign="top" width="411">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td height="15" width="411" valign="top"></td>
						</tr>
						<tr>
							<td width="411" height="3" valign="top"><img src="http://media.expedia.com/media/content/expus/graphics/mail/top_blue_line.gif" width="411" height="3" alt="" /></td>
						</tr>
						<tr>
							<td height="15" width="411" valign="top"></td>
						</tr>
						</table>
						<xsl:if test="deals">
						<xsl:for-each select="deals">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td width="10" valign="top">
								<img src="http://media.expedia.com/media/content/expus/graphics/mail/buffer_10px.gif" width="10" /></td>
							<td valign="top">
								<!-- DEALS MODULE IMAGE BUTTON STARTS HERE -->
								<a><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute>
								<img><xsl:attribute name="src"><xsl:value-of select="@image" /></xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a>									
								<!-- DEALS MODULE IMAGE BUTTON 2 ENDS HERE --></td>
							<td width="10" valign="top">
								<img src="http://media.expedia.com/media/content/expus/graphics/mail/buffer_10px.gif" width="10" /></td>
							<td valign="top">
								<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td colspan="2" valign="top">
										<font face="arial, Helvetica, sans-serif" size="2" color="#333333">
											<b><xsl:value-of select="@header"  disable-output-escaping="yes" /></b><br />
										</font>
										<font face="arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="@subheader"  disable-output-escaping="yes" /><br /></font>
									</td>
								</tr>
								<xsl:if test="offer">
								<xsl:for-each select="offer">
								<tr>
									<td valign="top">
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/bullet_blkonwht.gif" /></td>
									<td valign="top">
										<font face="arial, Helvetica, sans-serif" size="1" color="#333333">
										<a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute>
										<xsl:value-of select="@linktext"  disable-output-escaping="yes" /></a>&#160;<xsl:value-of select="."  disable-output-escaping="yes" /></font></td>
								</tr>
								</xsl:for-each>
								</xsl:if>
								</table>
							</td>
						</tr>
						</table>
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td height="15" width="411" valign="top"></td>
						</tr>
						</table>
						</xsl:for-each>
						</xsl:if>
						<table cellpadding="10" cellspacing="0" border="0">
							<tr>
							<td>
								<font face="arial, Helvetica, sans-serif" size="1" color="#333333">*NO PURCHASE NECESSARY. Open to legal residents of the 50 United States (and D.C.) 18 years or older. Ends 10/22/06. To play, and review Official Rules (including odds and prize descriptions), visit www.expediagiveaway.com. Void where prohibited.</font></td>
							</tr>
						</table>
					</td>
					<td bgcolor="#BBD2E8" valign="top" width="187">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td height="15" width="187" valign="top" bgcolor="#ffffff"></td>
						</tr>
						<tr>
							<td width="187" height="3" valign="top"><img src="http://media.expedia.com/media/content/expus/graphics/mail/top_blue_line.gif" width="187" height="3" alt=""/></td>
						</tr>
						</table>
							<xsl:comment>*****************DEALS_ALL_END*****************</xsl:comment>
								<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="4" bgcolor="#336699" valign="top">
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/drkblue_buffer_4px.gif" width="4" /></td>
									<td width="180" valign="top" bgcolor="#336699">
										<font face="arial, Helvetica, sans-serif" size="1" color="#FFFFFF">
											Sponsored by
										</font><br />
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/drkblue_hr_6px.gif" height="6" /></td>
									<td width="3" bgcolor="#336699" valign="top"><img src="http://media.expedia.com/media/content/expus/graphics/mail/drkblue_buffer_3px.gif" width="3" /></td>
								</tr>
						</table>
						<div style="display:none" id="ADNP_1">
						<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="4" bgcolor="#336699" valign="top">
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/drkblue_buffer_4px.gif" width="4" /></td>
									<td width="180" valign="top" bgcolor="#336699">										
										<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a><br />
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/drkblue_hr_6px.gif" width="180" height="6" /><br />
										<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a><br />
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/drkblue_hr_6px.gif" width="180" height="6" /><br /></td>
									<td width="3" bgcolor="#336699" valign="top">
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/drkblue_buffer_3px.gif" width="3" /></td>
								</tr>
						</table>
						</div>
						<div style="display:none" id="AD_1">
						<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="4" bgcolor="#336699" valign="top">
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/drkblue_buffer_4px.gif" width="4" /></td>
									<td width="180" valign="top" bgcolor="#336699">										
										<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a><br />
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/drkblue_hr_6px.gif" width="180" height="6" /><br />
										<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a><br />
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/drkblue_hr_6px.gif" width="180" height="6" /><br /></td>
									<td width="3" bgcolor="#336699" valign="top">
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/drkblue_buffer_3px.gif" width="3" /></td>
								</tr>
						</table>
						</div>
					<!--Bottom_NAVIGATION_begins -->
					</td>
				</tr>
				</table>
				<table width="598" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="598" height="28" align="center" class="bottom_links" bgcolor="#3D6E9E" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold; text-decoration: none;">
<a style="color:#FFFFFF; text-decoration:none;"><xsl:attribute name="href">http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>flights</a>&#160;&#160;|&#160;&#160;<a style="color:#FFFFFF; text-decoration:none;"><xsl:attribute name="href">http://www.expedia.com/daily/hotels/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>hotels</a>&#160;&#160;|&#160;&#160;<a style="color:#FFFFFF; text-decoration:none;"><xsl:attribute name="href">http://www.expedia.com/daily/cars/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>cars</a>&#160;&#160;|&#160;&#160;<a style="color:#FFFFFF; text-decoration:none;"><xsl:attribute name="href">http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>vacation packages</a>&#160;&#160;|&#160;&#160;<a style="color:#FFFFFF; text-decoration:none;"><xsl:attribute name="href">http://www.expedia.com/daily/cruise/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>cruises</a>&#160;&#160;|&#160;&#160;<a style="color:#FFFFFF; text-decoration:none;"><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>activities</a>&#160;&#160;|&#160;&#160;<a style="color:#FFFFFF; text-decoration:none;"><xsl:attribute name="href">http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>deals &amp; destinations</a></td>
				</tr>
			</table>
			<div style="display:none" id="ADNP">
			<table width="598" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td height="15"  valign="top" bgcolor="#ffffff"></td>
			</tr>
			<tr>
				<td width="598" align="center" bgcolor="#FFFFFF"><a href="http://ads.expedia.com/click.ng/TPID=1&amp;Location=EMAILTRNP&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;Location=EMAILTRNP&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a></td>
			</tr>
			</table>
			</div>
			<div style="display:none" id="AD">
			<table width="598" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td height="15"  valign="top" bgcolor="#ffffff"></td>
			</tr>
			<tr>
				<td width="598" align="center" bgcolor="#FFFFFF"><a href="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" NOSEND="1" /></a></td>
			</tr>
			</table>
			</div>
			<table width="598" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="10" valign="top" bgcolor="#FFFFFF"></td>
				<td width="578" valign="top" bgcolor="#FFFFFF">
				<br />
				<br />
				<font face="arial, helvetica, sans serif" size="1" color="#666666">
				UNSUBSCRIBE
				<br />
				<br /> 
				If you do not wish to receive future e-mail advertisements from Expedia, Inc., please <a><xsl:attribute name="href">http://expediamail.com/PUBLISH(sub_mgmt_page)&amp;%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">click here</font></a>. Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, <a><xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">click here</font></a> for personalized help. 
		<br />
		<br />
		CONTACT US
		<br />
		<br /> 
		To contact Expedia, Inc. or send feedback, please <a><xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">click here</font></a> or contact us via postal mail at: Expedia, Inc., Attn: PCC Team, 3150 139th Avenue SE, Bellevue, WA  98005. For additional assistance, visit the Expedia.com <a><xsl:attribute name="href">http://www.expedia.com/daily/service/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">Customer Support Center</font></a>. 
		<br />
		<br />
		A NOTE ABOUT PRICES 
		<br />
		<br />
		Prices are subject to availability and subject to change without notice. 
		<br />
		<br />
		All prices were current at the time this e-mail was published. 
		<br />
		<br />
		Hotel, vacation package, and cruise prices on Expedia.com are constantly updated. Please refer to the site for the most current pricing. Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city. Additional taxes, fees, and charges may apply. Airfare is subject to, without limitation: (1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip; (2) up to $18 per roundtrip in local airport charges; (3) Federal Excise Tax of $3.20 per U.S. domestic flight segment; (4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in Alaska or Hawaii; and (5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking). A segment is defined as a takeoff and a landing.  
		<br />
		<br />
		CST #2029030-40
		<br />
		<br />
		&#169;2006 Expedia, Inc. All rights reserved.  Expedia, Expedia.com and the Airplane logo are registered trademarks, or trademarks, of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
          <br />
		[+ "(EMID: <xsl:value-of select="../email/@my:type" /><xsl:value-of select="ID/@issue" />)(MD: " . VAR(TODAY) . ")(EPID: $p->{'profile_key'})(BIID: $p->{'mailing_id'}_$p->{'_WAVE_ID_'})" +]
		</font>
		<br />
		<br /></td>
		<td width="10" valign="top" bgcolor="#FFFFFF">&#160;</td>
	</tr>
	</table>
	</td>
</tr>
</table>
</body>
</html>
</xsl:if>
<xsl:if test="@my:type='MMN_TR_03_'">
<xsl:variable name="imgMailPath">http://media.expedia.com/media/content/expus/graphics/mail/</xsl:variable>
<xsl:variable name="issueID" select="ID/@issue" />
<xsl:variable name="headeroffersLink" select="headerOffer/@url" />
<xsl:variable name="headeroffersblurb" select="headerOffer/@blurb" />
<xsl:variable name="offersLink" select="Template/heroModule/@url"/>
<xsl:variable name="version_num"><xsl:number value="position()" format="A" /></xsl:variable>
<table width="800" cellpadding="1" cellspacing="3" border="0" align="center">
	<tr>
		<td width="800" bgcolor="#A3C2E0">
			<table width="798" cellpadding="3" cellspacing="0" border="0">
				<tr>
					<td width="798" bgcolor="#FFFFFF"><font face="arial, helvetica, sans serif" size="2" color="#000000">
						<b>Subject Line:</b>&#160;&#160;<xsl:if test="subjectText">
						<xsl:for-each select="subjectText">
								<xsl:value-of select="." /><br />
						</xsl:for-each>
					</xsl:if></font></td><td valign="top" bgcolor="#ffffff" width="300" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 9pt;"><a href="#" style="color:#336699;" onclick="document.getElementById('AD_2').style.display = 'block'; document.getElementById('ADNP_2').style.display = 'none';document.getElementById('AD_bot').style.display = 'block'; document.getElementById('ADNP_bot').style.display = 'none';document.getElementById('AD_3').style.display = 'block'; document.getElementById('ADNP_3').style.display = 'none';"><b>Ads</b></a>&#160;&#160;|&#160;&#160;<a href="#" style="color:#336699;" onclick="document.getElementById('ADNP_bot').style.display = 'block'; document.getElementById('AD_bot').style.display = 'none';document.getElementById('ADNP_2').style.display = 'block'; document.getElementById('AD_2').style.display = 'none'; document.getElementById('AD_3').style.display = 'none'; document.getElementById('ADNP_3').style.display = 'block';"><b>NP Ads</b></a><br/><a href="#" style="color:#336699;" onclick=" document.getElementById('msn').style.display = 'block'; document.getElementById('no_msn').style.display = 'none';"><b>Hotmail Wizard</b></a>&#160;&#160;|&#160;&#160;<a href="#" style="color:#336699;" onclick=" document.getElementById('no_msn').style.display = 'block'; document.getElementById('msn').style.display = 'none';"><b>Search Wizard</b></a></td>
				</tr>
			</table></td>
	</tr>
	</table>
<xsl:comment>*****************START 03_01Eyebrow Module*****************</xsl:comment> 	
<html>
<head>
<title>Expedia.com</title>
</head>
<body bgcolor="#ffffff">
	<table width="800" cellpadding="0" cellspacing="0" border="0" align="center" bgcolor="#ffffff">
	<tr>
		<td valign="top">
				<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td colspan="3" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold;">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
						<td align="left">
							<a href="http://www.expedia.com/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/logo_exphorz_short.gif" alt="Expedia.com" width="247" height="51" border="0" /></a>
							</td>
							<td width="518" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #cc6600;">
								<xsl:if test="my:headerOffer[@my:state='yes']">
								<xsl:for-each select="my:headerOffer">
									<b><xsl:value-of select="@my:shortText"  disable-output-escaping="yes" /></b>&#160;<a><xsl:attribute name="href"><xsl:value-of select="@my:url" />%%=OmnitureParams('')=%%</xsl:attribute><xsl:attribute name="style">font-family: arial, helvetica, sans serif; font-size: 12px; color:#cc6600;</xsl:attribute><xsl:value-of select="@my:blurb" disable-output-escaping="yes" /></a></xsl:for-each></xsl:if>
							</td>
							<td width="35"></td>
					</tr>
					</table></td>
				</tr>
				<xsl:comment>*****************END 03_01Eyebrow Module*****************</xsl:comment>
				<tr>
					<td colspan="3" height="9" valign="top"></td>
				</tr>
				<tr>
					<td colspan="3" height="1" valign="top"><img src="http://www.expedia.com/eta/spaceit.gif" width="800" height="1" alt="" /></td>
				</tr>
				<tr>
					<td width="52" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
					<td width="608" height="24" align="left" valign="bottom" style="font-size: 12px; color: #31339A; text-decoration: none;">
					 
						<table width="608" cellpadding="4" cellspacing="0" border="0">
						<tr>
							<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/business/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>business travel</nobr></a></td>
						</tr>
						</table></td>
					<td width="100" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="100" height="1" /></td>
		</tr>
		<tr>
			<td width="800" colspan="3" height="8" bgcolor="#FFDF7B" valign="top"></td>
		</tr>
		<tr>
			<td colspan="3" width="800" height="2" valign="top" bgcolor="#ffffff"></td>
		</tr>
		</table>
		<xsl:comment>*****************START 03_03Message Module*****************</xsl:comment> 
		<table width="800" cellpadding="1" cellspacing="0" border="0">
		<tr>
			<td width="800" bgcolor="#d7dce8">
				<table width="798" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td valign="top" width="525" bgcolor="#f1f4f7">
						<table cellpadding="0" cellspacing="5" border="0">
						<tr>
							<td align="left" valign="top">
								<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">									
										<table width="525" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="525" bgcolor="#d7dce8">
												<table width="523" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="523" bgcolor="#ffffff">											
														<table width="100%" cellpadding="0" cellspacing="10" border="0">
														<tr>
															<td valign="top" bgcolor="#ffffff">
																<table width="503" cellpadding="0" cellspacing="0" border="0">
																<xsl:for-each select="header">
																<tr>
																	<td valign="top" bgcolor="#ffffff" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;">
																			<xsl:value-of select="."  disable-output-escaping="yes" />											
																		</td>
																</tr>
																</xsl:for-each>
																<tr>
																	<td height="5"></td>
																</tr>
																<tr>
																	<td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold;">
																		<xsl:if test="subHeader">
																			<xsl:for-each select="subHeader">
																				<xsl:value-of select="." disable-output-escaping="yes" /><br />
																			</xsl:for-each>
																		</xsl:if>
																	</td>
																</tr>
																<tr>
																	<td height="10"></td>
																</tr>
																</table>
																<xsl:if test="my:message">
																<xsl:for-each select="my:message">
																<table width="503" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																		<xsl:if test="@my:show='yes'">
																		<xsl:if test="my:paradeal">
																		<xsl:for-each select="my:paradeal">
																		<xsl:value-of select="."  disable-output-escaping="yes" /><xsl:if test="not(position() = last())"><br /><br /></xsl:if>
																		</xsl:for-each>
																		</xsl:if>
																		</xsl:if>
																		<xsl:if test="@my:specials='yes'">
																		<table cellpadding="0" cellspacing="0" border="0">
																			<tr><td height="3"></td></tr>
																		</table>
																		<xsl:if test="my:deal">
																		<xsl:for-each select="my:deal">
																			<table cellpadding="0" cellspacing="0" border="0">
																			<tr>
																				<td valign="top"><li style="list-style-type: disc; color:#336699;" /></td>
																				<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																					<xsl:if test="@my:link != ''"><a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="@my:link" />%%=OmnitureParams('')=%%</xsl:attribute>
																					<b><xsl:value-of select="@my:linktext"  disable-output-escaping="yes" /></b></a></xsl:if><xsl:value-of select="."  disable-output-escaping="yes" /></td>
																			</tr>
																			<tr>
																				<td colspan="2" height="3"></td>
																			</tr>
																			</table>
																		</xsl:for-each>
																		</xsl:if></xsl:if>
																		</td>
																</tr>
																</table></xsl:for-each></xsl:if></td>
														</tr>
														</table></td>
												</tr>
												</table></td>
										</tr>
										</table></td>
							</tr>
							<tr>
								<td height="5" bgcolor="#f1f4f7"></td>
							</tr>	
							</table>
							<xsl:comment>*****************END 03_03Message Module*****************</xsl:comment>
							<xsl:comment>*****************START 03_04HotDeals Module*****************</xsl:comment>
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="525" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="525" bgcolor="#d7dce8">
												<table width="523" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="523" bgcolor="#ffffff" valign="top">											
													<xsl:if test="deals">
													<xsl:for-each select="deals">
														<table cellpadding="0" cellspacing="0" border="0" width="100%" >
															<tr><xsl:if test="position() = 1">
																<td width="50">
																	<table cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_icon_deals.gif</xsl:attribute><xsl:attribute name="width">50</xsl:attribute><xsl:attribute name="height">56</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></td>
																	</tr>
																	</table></td></xsl:if>
																<td><xsl:attribute name="align">left</xsl:attribute><xsl:attribute name="width"><xsl:if test="position() = 1">473</xsl:if>
																<xsl:if test="position() != 1">100%</xsl:if></xsl:attribute>
																<xsl:if test="position() = 1">
																	<table cellpadding="0" cellspacing="0" border="0" width="100%">
																	<tr>
																		<td bgcolor="#336699" width="10"></td><td bgcolor="#336699" valign="middle" height="28" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;"> <xsl:if test="@my:viewHeader='yes'"><xsl:if test="my:mainHeader"><xsl:for-each select="my:mainHeader"><xsl:value-of select="."  disable-output-escaping="yes" /></xsl:for-each></xsl:if></xsl:if></td>
																	</tr>
																	</table>
																</xsl:if>
																	<table cellpadding="0" cellspacing="0" border="0" width="100%">
																	<tr>
																		<td bgcolor="#d7dce8" width="10"></td><td bgcolor="#d7dce8" valign="middle" height="28" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #336699; font-weight: bold;">
																			<b><xsl:value-of select="@header"  disable-output-escaping="yes" /> 
																			<span style="font-size: 13px"><xsl:value-of select="@subheader"  disable-output-escaping="yes" /></span></b>
																		</td>
																	</tr>
																	</table></td>
															</tr>
															</table>
															<table cellpadding="0" cellspacing="10" border="0">
															<xsl:if test="@my:message='yes'">
															<tr>
																<td><xsl:if test="@image='yes'"><xsl:attribute name="colspan">2</xsl:attribute></xsl:if>
																	<table cellpadding="0" cellspacing="0" border="0">															
																		<tr>
																			<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																				<xsl:if test="my:para">
																				<xsl:for-each select="my:para">
																				<xsl:value-of select="."  disable-output-escaping="yes" />
																				<xsl:if test="not(position() = last())"><br/><br/></xsl:if></xsl:for-each></xsl:if></td>
																		</tr>
																		</table></td>
															</tr>
															</xsl:if>
															<tr>
																<xsl:if test="@image='yes'"><td valign="top" width="90">
																	<a><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute>
																	<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../@my:type" /><xsl:value-of select="../ID/@issue" />_deals<xsl:number value="position()" format="1" />.jpg</xsl:attribute> <xsl:attribute name="width">90</xsl:attribute> <xsl:attribute name="height">57</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td></xsl:if>
																<td><xsl:attribute name="valign">top</xsl:attribute> <xsl:if test="@image='yes'"><xsl:attribute name="width">403</xsl:attribute></xsl:if>
																<xsl:if test="@image='no'"><xsl:attribute name="width">503</xsl:attribute></xsl:if>
																	<xsl:if test="@my:deals='yes'">
																	<xsl:if test="offer">
																	<xsl:for-each select="offer">
																		<table cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td valign="top"><li style="list-style-type: disc; color:#336699;" /></td>
																			<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																				<a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute>
																				<b><xsl:value-of select="@linktext"  disable-output-escaping="yes" /></b></a>:&#160;<xsl:value-of select="."  disable-output-escaping="yes" /></td>
																		</tr>
																		<xsl:if test="not(position() = last())">
																		<tr>
																			<td colspan="2" height="3"></td>
																		</tr>
																		</xsl:if>
																		</table>
																	</xsl:for-each>
																	</xsl:if></xsl:if>
																	</td>
															</tr>
															<tr>
																<td colspan="2" valign="bottom" width="523">
																	<table cellpadding="0" cellspacing="0" border="0" align="right">
																	<tr>
																		<td height="22"><a><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_left.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td height="22" bgcolor="#0b8f46" valign="middle"><a><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; text-decoration:none; vertical-align: middle;">Search <xsl:if test="my:buttonText = ''"><xsl:value-of select="translate(@header, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" disable-output-escaping="yes"/></xsl:if><xsl:if test="my:buttonText != ''"><xsl:value-of select="my:buttonText" disable-output-escaping="yes"/></xsl:if></div></a></td>
																		<td height="22"><a><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_right.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>					
																	</tr>
																	</table><xsl:if test="@header ='Cruises'"><div style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699; font-weight: bold;">Call 1-888-249-3978 to speak with a Cruise Specialist.</div></xsl:if>
																</td>
															</tr>
															</table>
															</xsl:for-each>
															</xsl:if></td>
												</tr>
												</table></td>
										</tr>
										</table></td>
							</tr>
							<tr>
								<td height="5" bgcolor="#f1f4f7"></td>
							</tr>	
							</table>
							<xsl:comment>*****************END 03_04HotDeals Module*****************</xsl:comment>
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="525" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="525" bgcolor="#d7dce8">
												<table width="523" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="523" bgcolor="#ffffff" valign="top">											
														<table cellpadding="0" cellspacing="0" border="0" width="100%" >
															<tr>
																<td width="44" align="left">
																	<table cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_icon_act.gif</xsl:attribute> <xsl:attribute name="width">44</xsl:attribute> <xsl:attribute name="height">41</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></td>
																	</tr>
																	</table></td>
																<td><xsl:attribute name="align">left</xsl:attribute><xsl:attribute name="width">100%</xsl:attribute>
																	<table cellpadding="0" cellspacing="0" border="0" width="100%">
																	<tr>
																		<td bgcolor="#336699" width="10"></td><td bgcolor="#336699" valign="middle" height="28" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Discovering something new!</td>
																	</tr>
																	</table>
																	<table cellpadding="0" cellspacing="0" border="0" width="100%">
																	<tr>
																		<td bgcolor="#ffffff" height="13"></td>
																	</tr>
																	</table></td>
															</tr>
															</table>
															<table cellpadding="0" cellspacing="10" border="0" width="100%">
															<tr>
																<td valign="top" width="251">
																	<table cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td valign="top" align="left">
																			<a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_discover_1.jpg</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td width="5"></td>
																		<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 12px;">
																			<b>Tours &amp; Sightseeing</b><br />
																			<a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="color: #336699;">Places to go, things to see</a></td>
																	</tr>
																	<tr>
																		<td colspan="2" height="5"></td>
																	</tr>
																	<tr>
																		<td valign="top" align="left">
																			<a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_discover_2.jpg</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td width="5"></td>
																		<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 12px;">
																			<b>Events &amp; Shows</b><br />
																			<a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="color: #336699;">See the hottest shows!</a></td>
																	</tr>
																	</table></td>
																<td valign="top" align="left" width="252">																
																<div style="display:block" id="AD_3">
																	<table cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td valign="top" align="left">
																			<a><xsl:attribute name="href">http://www.expedia.com/daily/highlights/Home-And-Abroad/default.asp?emlcid=progCM-campP-issu076-test109-segm[+PROFILE('SEG_SCORE','','')+]-sega[+PROFILE('SEG_STATE','','')+]-date[+CALC_DATE(0,'+0d','YYYYMMDDHHMISS')+]-vers03-link[+PROFILE('link_id','','')+]-paid[+PROFILE('profile_key','','')+]-dma[+PROFILE('ON_DMA_CODE','','')+]-wave{_WAVE_ID_}</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_discover_3.gif</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td width="5"></td>
																		<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 12px;">
																			<b>Unique travel planning</b><br />
																			Get <a href="http://www.expedia.com/daily/highlights/Home-And-Abroad/default.asp?emlcid=progCM-campP-issu076-test109-segm[+PROFILE('SEG_SCORE','','')+]-sega[+PROFILE('SEG_STATE','','')+]-date[+CALC_DATE(0,'+0d','YYYYMMDDHHMISS')+]-vers03-link[+PROFILE('link_id','','')+]-paid[+PROFILE('profile_key','','')+]-dma[+PROFILE('ON_DMA_CODE','','')+]-wave{_WAVE_ID_}" style="color: #336699;">free, customized<br /> personal activity planning</a></td>
																	</tr>
																	<tr>
																		<td colspan="2" height="5"></td>
																	</tr>
																	</table>
																</div>
																<div style="display:none" id="ADNP_3">
																	<table cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td valign="top" align="left">
																			<a><xsl:attribute name="href">http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=TSHOPSDETAIL&amp;offeringid=6310&amp;locationid=178276&amp;%%=OmnitureParams('')=%%</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_discover_4.gif</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td width="5"></td>
																		<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 12px;">
																			<b>Get the inside scoop</b><br />
																			<i>Condé Nast Traveler </i><br />
																			<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=TSHOPSDETAIL&amp;offeringid=6310&amp;locationid=178276&amp;%%=OmnitureParams('')=%%" style="color: #336699;">12 issues for just $12</a></td>
																	</tr>
																	<tr>
																		<td colspan="2" height="5"></td>
																	</tr>
																	</table>
																</div>
																	<table cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td valign="top" align="left">
																			<a><xsl:attribute name="href">http://www.expedia.com/daily/highlights/Fun-Booths/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_discover_5.gif</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td width="5"></td>
																		<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 12px;">
																			<b>Activities abound</b><br />
																			Look for Expedia!fun<br/>
																			desks in <a href="http://www.expedia.com/daily/highlights/Fun-Booths/default.asp?%%=OmnitureParams('')=%%" style="color: #336699;">select cities</a></td>
																	</tr>
																	</table></td>
															</tr>
															</table>
															<table cellpadding="0" cellspacing="0" border="0" align="right">
															<tr>
																<td align="right" valign="bottom">
																	<table cellpadding="0" cellspacing="0" border="0" align="right">
																	<tr>
																		<td height="22"><a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_left.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td height="22" bgcolor="#0b8f46" valign="middle"><a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; text-decoration:none; vertical-align: middle; width:90;">Search activities</div></a></td>
																		<td height="22"><a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_right.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																	</tr>
																	</table></td>
																<td width="10"></td>
															</tr>
															<tr>
																<td colspan="2" height="10"></td>
															</tr>
															</table></td>
											</tr>
											</table></td>
									</tr>
									</table></td>
							</tr>
							<tr>
								<td height="5" bgcolor="#f1f4f7"></td>
							</tr>	
							</table>
							<div style="display:none" id="ADNP_2">
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="525" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="525" bgcolor="#d7dce8">
												<table width="523" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="523" bgcolor="#ffffff" valign="top">											
														<table cellpadding="0" cellspacing="10" border="0">
														<tr>
														<td width="180" valign="top" bgcolor="#ffffff">										
															<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a></td><td width="180" valign="top" bgcolor="#ffffff">
															<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a></td>
														</tr>
														</table></td>
												</tr>
												</table></td>
										</tr>
										</table></td>
							</tr>
							</table></div>
							<div style="display:block" id="AD_2">
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="525" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="525" bgcolor="#d7dce8">
												<table width="523" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="523" bgcolor="#ffffff" valign="top">	
							
														<table cellpadding="0" cellspacing="10" border="0">
														<tr>
															<td width="180" valign="top" bgcolor="#ffffff">										
																<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a></td>
															<td width="180" valign="top" bgcolor="#ffffff">										
																<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a></td>
														</tr>
														</table></td>
												</tr>
												</table></td>
										</tr>
										</table></td>
							</tr>
							</table>
							</div>
							<xsl:comment>*****************START 03_07 WIZARD HERO*****************</xsl:comment> 
							</td>
							<td width="260" valign="top" align="left" bgcolor="#f1f4f7">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
									<tr>
									<td valign="top">
										<table width="258" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
												<table width="258" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td>
														<table width="100%" cellpadding="0" cellspacing="0" border="0">
														<xsl:if test="topimage[@graphic='yes']">
														<xsl:for-each select="topimage">
														<tr>
															<td colspan="2"><a><xsl:attribute name="href"><xsl:value-of select="@imagelink" />%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../@my:type" /><xsl:value-of select="../ID/@issue" />_hero<xsl:number value="position()" format="1" />.jpg</xsl:attribute> <xsl:attribute name="width">258</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"><xsl:value-of select="topimage/@imagename"/></xsl:attribute></img></a></td>
														</tr>
														<tr>
															<td align="left" bgcolor="#f1f4f7">
																<table width="100%" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td colspan="2" align="left" height="28" bgcolor="#7694bf">
																		<table width="168" cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td width="153" align="right" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Search now:</td><td bgcolor="#7694bf" width="15"></td>
																		</tr>
																		</table></td>
																</tr>
																<tr>
																	<td width="1" bgcolor="#d7dce8"></td><td width="167" height="16" bgcolor="#fffaee"></td>
																</tr>
																</table></td>
															<td align="left"><a><xsl:attribute name="href"><xsl:value-of select="@imagelink" />%%=OmnitureParams('')=%%</xsl:attribute><img src="http://media.expedia.com/media/content/expus/graphics/mail/MMN_TR_03_search_fares2.jpg" width="90" height="44" border="0" alt="Find Low Fares!" /></a></td>
														</tr>
														</xsl:for-each>
														</xsl:if>
														<xsl:if test="topimage[@graphic='no']">
														<tr>
															<td align="left" bgcolor="#f1f4f7">
																<table width="100%" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td colspan="2" height="30" bgcolor="#f1f4f7"></td>
																</tr>
																<tr>
																	<td colspan="2" align="left" height="28" bgcolor="#7694bf">
																		<table width="168" cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td width="153" align="right" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Search now:</td><td bgcolor="#7694bf" width="15"></td>
																		</tr>
																		</table></td>
																</tr>
																<tr>
																	<td width="1" bgcolor="#d7dce8"></td><td width="167" height="17" bgcolor="#fffaee"></td>
																</tr>
																</table></td>
															<td align="left"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/MMN_TR_03_search_fares.gif" width="90" height="75" border="0" alt="Find Low Fares!" /></a></td>
														</tr>
														</xsl:if>
														</table></td>
												</tr>
												<xsl:comment>*****************END 03_07 WIZARD HERO*****************</xsl:comment> 
												<tr>
													<td align="left">
													<div style="display:block" id="no_msn">
														<table width="258" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="1" bgcolor="#d7dce8"></td>
															<td width="256" valign="top" bgcolor="#fffaee">
																<form method="GET" name="etaExpress" action="http://expediamail.com/p/EXPEDIA_US/TR_dual_button_wizard/default.html">
																<input type="hidden" name="GOTO" value="PackageWiz" />
																<input type="hidden" name="emlcid" value="%%=OmnitureParams('')=%%" />
																<input type="hidden" name="Airline" value="" />
																<table width="100%" align="left" cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td>
																		<table cellpadding="0" cellspacing="2" border="0">
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing from:<br /><input maxlength="75" name="FrAirport" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:150px" value="" />&#160;&#160;</td>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Depart Date:<br /><input maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:70px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Destination:<br /><input maxlength="75" name="DestName" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:150px" value="" />&#160;&#160;</td>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Return Date:<br /><input maxlength="8" name="ToDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:70px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td height="10" colspan="2"></td>
																		</tr>
																		<tr>
																			<td colspan="2" align="left">			
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr><td height="22"><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td><td align="left" height="22" bgcolor="#0b8f46" valign="middle"><input name="GOFlight" type="submit" value="Search flight" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:75;"/></td><td height="22"><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td></tr>
																						</table></td>
																				</tr>
																				<tr>
																					<td height="10" colspan="2"></td>
																				</tr>
																				<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td height="22"><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td><td align="left" height="22" bgcolor="#0b8f46" valign="middle"><input name="GOPackage" type="submit" value="Search flight + hotel" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:115;" /></td><td height="22"><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td>					
																						</tr>
																						</table></td>
																				</tr>
																				</table></td>	
																</tr>
																</table></td>
														</tr>
														<tr>
															<td align="center" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Flexible travel dates? Look here</a></td>
														</tr>
														</table>
														<input type="hidden" name="Numadult" value="1" />
														<input type="hidden" name="Numroom" value="1" />
														</form></td>	
														<td width="1" bgcolor="#d7dce8"></td>						
														</tr>
														<tr>
															<td colspan="3" height="1" bgcolor="#d7dce8"></td>
														</tr>				
														</table></div>
														<div style="display:none" id="msn">
															<table width="258" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="1" bgcolor="#d7dce8"></td>
															<td width="256" valign="top" bgcolor="#fffaee">
																<table width="100%" align="left" cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td>
																		<table cellpadding="0" cellspacing="2" border="0">
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing from:<br /><input maxlength="75" name="FrAirport" style="font-family: arial, helvetica, sans serif; background-color: #f1f4f7; width:150px;" readonly="readonly" />&#160;&#160;</td>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Depart Date:<br /><input maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; background-color: #f1f4f7; width:70px" readonly="readonly" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Destination:<br /><input maxlength="75" name="DestName" style="font-family: arial, helvetica, sans serif; background-color: #f1f4f7; width:150px" readonly="readonly" />&#160;&#160;</td>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Return Date:<br /><input maxlength="8" name="ToDate" style="font-family: arial, helvetica, sans serif; background-color: #f1f4f7; width:70px" readonly="readonly" /></td>
																		</tr>
																		<tr>
																			<td height="10" colspan="2"></td>
																		</tr>
																		<tr>
																			<td colspan="2" align="left">			
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr><td height="22"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" height="22" border="0" /></a></td><td align="left" height="22" bgcolor="#0b8f46" valign="middle"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%"><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:16; width:75; text-decoration:none;">Search flight</div></a></td><td height="22"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" height="22" border="0" /></a></td></tr>
																						</table></td>
																				</tr>
																				<tr>
																					<td height="10" colspan="2"></td>
																				</tr>
																				<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr><td height="22"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" height="22" border="0" /></a></td><td align="left" height="22" bgcolor="#0b8f46" valign="middle"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%"><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:16; width:115; text-decoration:none;">Search flight + hotel</div></a></td><td height="22"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" height="22" border="0" /></a></td></tr>
																						</table></td>
																				</tr>
																				</table></td>	
																</tr>
																</table></td>
														</tr>
														<tr>
															<td align="center" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Flexible travel dates? Look here</a></td>
														</tr>
														</table></td>	
														<td width="1" bgcolor="#d7dce8"></td>						
														</tr>
														<tr>
															<td colspan="3" height="1" bgcolor="#d7dce8"></td>
														</tr>				
														</table>	
														</div></td>									
												</tr>				
												</table></td>
										</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td height="5" bgcolor="#f1f4f7"></td>
								</tr>
								</table>
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="258" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="258" bgcolor="#d7dce8">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="100%" bgcolor="#ffffff">
														<table cellpadding="0" cellspacing="0" border="0" width="100%" >
															<tr>
																<td width="44" align="left">
																	<table cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_icon_air.gif</xsl:attribute> <xsl:attribute name="width">65</xsl:attribute> <xsl:attribute name="height">35</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></td>
																	</tr>
																	</table></td>
																<td><xsl:attribute name="align">left</xsl:attribute><xsl:attribute name="width">100%</xsl:attribute>
																	<table cellpadding="0" cellspacing="0" border="0" width="100%">
																	<tr>
																		<td bgcolor="#336699" width="10"></td><td bgcolor="#336699" valign="middle" height="28" style="font-family: arial, helvetica, sans serif; font-size: 13px; color: #ffffff; font-weight: bold;">Personalized flight details</td>
																	</tr>
																	</table>
																	<table cellpadding="0" cellspacing="0" border="0" width="100%">
																	<tr>
																		<td bgcolor="#ffffff" height="7"></td>
																	</tr>
																	</table></td>
															</tr>
															</table>
															<table width="100%" cellpadding="0" cellspacing="0" border="0">
															<tr>
																<td colspan="2" height="10"></td>
															</tr>
															<tr>
																<td width="10"></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">Get a jump on deals and flights with personalized travel tools.</td>
															</tr>
															</table>
															<table width="100%" cellpadding="0" cellspacing="0" border="0">
															<tr>
																<td height="10"></td>
															</tr>
															<tr>
																<td width="10"></td><td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #cc6600; font-weight: bold;">Here are your favorite routes:</td>
															</tr>
															<tr>
																<td height="10"></td>
															</tr>
															</table>
															<table width="100%" cellpadding="10" cellspacing="0" border="0">
															<tr bgcolor="#fffaee">
																<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																	<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Portland to Sacramento</a><br/>
																	<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2006</span></td>
																<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$103+</a></td>
															</tr>
															<tr bgcolor="#ffffff">
																<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																	<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Chicago to Los Angeles</a><br/>
																	<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2006</span>
																</td>
																<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$203+</a></td>
															</tr>
															<tr bgcolor="#fffaee">
																<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																	<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Providence to San Francisco</a><br/>
																	<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2006</span>
																</td>
																<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$163+</a></td>
															</tr>
															<tr bgcolor="#ffffff">
																<td colspan="2" align="left" >
																	<table width="100%" cellpadding="0" cellspacing="0" border="0">
																	<tr><td align="left" valign="top"><a href="https://www.expedia.com/pub/agent.dll?qscr=moda&amp;%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/etm_shopper_arrow_2.gif" width="14" height="15" border="0" align="absmiddle" /></a></td><td align="left" style="font-family: arial, helvetica, sans serif; font-size: 11px;"><a href="https://www.expedia.com/pub/agent.dll?qscr=moda&amp;%%=OmnitureParams('')=%%" style="color:#336699">Add/update your favorite routes</a></td></tr></table></td>
															</tr>
															</table>
															<table width="100%" cellpadding="0" cellspacing="0" border="0">
															<tr>
																<td height="10"></td>
															</tr>
															<tr>
																<td width="10"></td><td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #cc6600; font-weight: bold;">Top picks from <b style="color: #000000;">Seattle (SEA)</b> to:
																</td>
															</tr>
															<tr>
																<td height="10"></td>
															</tr>
															</table>
															<table width="100%" cellpadding="10" cellspacing="0" border="0">
															<tr bgcolor="#fffaee">
																<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																	<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Sacramento</a><br/>
																	<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2006</span></td>
																<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$103+</a></td>
															</tr>
															<tr bgcolor="#ffffff">
																<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																	<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Los Angeles</a><br/>
																	<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2006</span>
																</td>
																<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$203+</a></td>
															</tr>
															<tr bgcolor="#fffaee">
																<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																	<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">San Francisco</a><br/>
																	<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2006</span>
																</td>
																<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$163+</a></td>
															</tr>
															<tr bgcolor="#ffffff">
																<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																	<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Los Angeles</a><br/>
																	<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2006</span>
																</td>
																<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$193+</a></td>
															</tr>
															<tr bgcolor="#fffaee">
																<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																	<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">San Francisco</a><br/>
																	<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2006</span>
																</td>
																<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$305+</a></td>
															</tr>
															<tr bgcolor="#ffffff">
																<td colspan="2">
																	<table width="100%" cellpadding="0" cellspacing="0" border="0">
																	<tr><td align="left" valign="top">	
																	<a href="https://www.expedia.com/pub/agent.dll?qscr=moda&amp;%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/etm_shopper_arrow_2.gif" width="14" height="15" border="0"  align="absmiddle" /></a>&#160;</td><td align="left" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000;">Receive the most relevant destinations: <a href="https://www.expedia.com/pub/agent.dll?qscr=moda&amp;%%=OmnitureParams('')=%%" style="color:#336699">Update your home airport</a></td></tr></table></td>
															</tr>
															</table>
															<table cellpadding="0" cellspacing="10" border="0">
															<tr>
																<td align="left" valign="top" width="258">
																<table cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 13px; color: #cc6600; font-weight: bold;">
																	Travel tools and Customer Support:
																	</td>
																</tr>
																<tr>
																	<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																	<li style="list-style-type: disc; color:#336699; line-height:18px;"><font color="#cc0000">New!</font>&#160;<a href="http://www.expedia.com/daily/service/visa.asp?%%=OmnitureParams('')=%%" style="color:#336699">2007 Passport requirements</a></li>
																	<li style="list-style-type: disc; color:#336699; line-height:18px;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Use our Fare Calendar</a></li>
					<li style="list-style-type: disc; color:#336699; line-height:18px;"><a href="http://www.expedia.com/daily/outposts/rss/expedia_rss.asp?%%=OmnitureParams('')=%%" style="color:#336699">Get personalized deals via RSS</a></li>
					<li style="list-style-type: disc; color:#336699; line-height:18px;"><a href="http://www.expediaguides.com/farealert/farealert.aspx?direct=1&amp;%%=OmnitureParams('')=%%" style="color:#336699">Fare updates, delivered to your desktop</a></li>
					<li style="list-style-type: disc; color:#336699; line-height:18px;"><a href="http://www.expedia.com/pub/agent.dll?qscr=info&amp;%%=OmnitureParams('')=%%" style="color:#336699">Access "My Account"</a></li>
					<li style="list-style-type: disc; color:#336699; line-height:18px;"><a href="http://www.expedia.com/daily/service/default.asp?%%=OmnitureParams('')=%%" style="color:#336699">Visit our Customer Support Center</a></li>
																	</td>
																</tr>
																</table>
															</td>
														</tr>
														</table>
													</td>
												</tr>
												</table></td>
										</tr>
										</table></td>
								</tr>
								<tr>
									<td height="5" bgcolor="#f1f4f7"></td>
								</tr>
								</table>
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td align="left" width="258">
										<a><xsl:attribute name="href">http://www.expedia.com/daily/highlights/best-rate-guarantee/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>CM_CRM_01_email_bpg.jpg</xsl:attribute> <xsl:attribute name="alt">Best Price Guaranteed.</xsl:attribute> <xsl:attribute name="width">258</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></a></td>
								</tr>
								</table></td>
						</tr>		
						</table></td>
				</tr>
				</table></td>
		</tr>
		</table>
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
			<td colspan="3" height="12" valign="top" bgcolor="#ffffff"></td>
		</tr>
		<tr>
			<td colspan="3" height="1" valign="top"><img src="http://www.expedia.com/eta/spaceit.gif" width="800" height="1" alt="" /></td>
		</tr>
		<tr>
			<td width="52" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
			<td width="608"><table cellpadding="4" cellspacing="0" border="0">
					<tr>
<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/business/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>business travel</nobr></a></td>
					</tr>
			</table></td>
			<td width="100" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="100" height="1" /></td>
		</tr>
		<tr>
			<td colspan="3" height="13" valign="top" bgcolor="#FFDF7B"></td>
		</tr>
		</table>
		<div style="display:none" id="ADNP_bot">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td height="15" valign="top" bgcolor="#ffffff"></td>
			</tr>
			<tr>
				<td width="100%" align="center" bgcolor="#FFFFFF"><a href="http://ads.expedia.com/click.ng/TPID=1&amp;Location=EMAILTRNP&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;Location=EMAILTRNP&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a></td>
			</tr>
			</table>
			</div>
			<div style="display:block" id="AD_bot">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td height="15"  valign="top" bgcolor="#ffffff"></td>
			</tr>
			<tr>
				<td width="100%" align="center" bgcolor="#FFFFFF"><a href="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" NOSEND="1" /></a></td>
			</tr>
			</table>
			</div>
		<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff">
		<tr>
			<td valign="top" align="left" bgcolor="#ffffff" style="border: 25px solid #ffffff">
				<font face="arial, helvetica, sans serif" size="1" color="#666666" style="font-family: arial, helvetica, sans serif; font-size: 9px; line-height: 10px; font-weight: bold; color: #666666">
					You are receiving this email because you subscribed to receive promotional emails on Expedia.com.<br/>
					This is a weekly deals newsletter you qualified for based on your email preferences.
					<br /><br />
				<xsl:if test="my:specialRules[@my:action='yes']">
					TERMS AND CONDITIONS<br />
					</xsl:if>
					<xsl:for-each select="my:specialRules">
						<xsl:choose>
							<xsl:when test="@my:action='yes'">
								<xsl:value-of select="." disable-output-escaping="yes" /><br /><br />
							</xsl:when>
							</xsl:choose>
					</xsl:for-each>	
		UNSUBSCRIBE<br />
		If you do not wish to receive future e-mail advertisements from Expedia, Inc., please <a><xsl:attribute name="href">http://expediamail.com/PUBLISH(sub_mgmt_page)?&amp;%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">click here</font></a>. Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, <a><xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">click here</font></a> for personalized help. 
		<br />
		<br />
		CONTACT US<br />
		Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. To contact Expedia, Inc. or send feedback, please <a><xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">click here</font></a> or contact us via postal mail at: Expedia, Inc., Attn: EMC Team, 3150 139th Avenue SE, Bellevue, WA  98005. For additional assistance, visit the Expedia.com <a><xsl:attribute name="href">http://www.expedia.com/daily/service/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">Customer Support Center</font></a>, or call 1-800-Expedia.
		<br />
		<br />
		A NOTE ABOUT PRICES<br />
		Prices are subject to availability and subject to change without notice. 
		<br />
		<br />
		All prices were current at the time this e-mail was published. 
		<br />
		<br />
		Hotel, vacation package, and cruise prices on Expedia.com are constantly updated. Please refer to the site for the most current pricing. Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city. Additional taxes, fees, and charges may apply. Airfare is subject to, without limitation: (1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip; (2) up to $18 per roundtrip in local airport charges; (3) Federal Excise Tax of $3.20 per U.S. domestic flight segment; (4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in Alaska or Hawaii; and (5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking). A segment is defined as a takeoff and a landing.  
		<br />
		<br />
		CST #2029030-40
		<br />
		<br />
		&#169;2007 Expedia, Inc. All rights reserved.  Expedia, Expedia.com and the Airplane logo are registered trademarks, or trademarks, of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
          <br />
			[+ "(EMID: <xsl:value-of select="../email/@my:type" /><xsl:value-of select="ID/@issue" />)(MD: " . VAR(TODAY) . ")(EPID: $p->{'profile_key'})(BIID: $p->{'mailing_id'}_$p->{'_WAVE_ID_'})" +]
			</font></td>
	</tr>
	</table>	
	</td>
	</tr>
	</table>
</body>
</html>
</xsl:if>
<xsl:if test="@my:type='MMN_TR_04_'">
<xsl:variable name="imgMailPath">http://media.expedia.com/media/content/expus/graphics/mail/</xsl:variable>
<xsl:variable name="issueID" select="ID/@issue" />
<xsl:variable name="headeroffersLink" select="headerOffer/@url" />
<xsl:variable name="headeroffersblurb" select="headerOffer/@blurb" />
<xsl:variable name="offersLink" select="Template/heroModule/@url"/>
<xsl:variable name="version_num"><xsl:number value="position()" format="A" /></xsl:variable>
<table width="800" cellpadding="1" cellspacing="3" border="0" align="center">
	<tr>
		<td width="800" bgcolor="#A3C2E0">
			<table width="798" cellpadding="3" cellspacing="0" border="0">
				<tr>
					<td width="798" bgcolor="#cccccc">
						<table width="100%" cellpadding="0" cellspacing="5" border="0">
						<xsl:if test="subjectText">
						<xsl:for-each select="subjectText">
						<tr>
							<td style="font-family: arial, helvetica, sans serif;  font-size: 12px; color: #000000;"><b>Subject Line 
								[<xsl:choose>
									<xsl:when test="(string-length(.) &lt; 45 or string-length(.) = 45)"><span style="color:#006600;"><xsl:value-of select="(string-length(.))" /></span></xsl:when>
									<xsl:when test="(string-length(.) &gt; 45 and string-length(.) &lt; 56)"><span style="color:#993300;"><xsl:value-of select="(string-length(.))" /></span></xsl:when>
									<xsl:otherwise><span style="color:#ff0000;"><xsl:value-of select="(string-length(.))" /></span></xsl:otherwise>
								</xsl:choose>]</b>:&#160;&#160;<xsl:value-of select="." /></td>
						</tr>
						</xsl:for-each>
						</xsl:if>
						</table></td>
					<td bgcolor="#cccccc" valign="top" width="300" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 9pt;"><a href="#" style="color:#336699;" onclick="document.getElementById('AD_2').style.display = 'block'; document.getElementById('ADNP_2').style.display = 'none';document.getElementById('AD_bot').style.display = 'block'; document.getElementById('ADNP_bot').style.display = 'none';document.getElementById('AD_3').style.display = 'block'; document.getElementById('ADNP_3').style.display = 'none';"><b>Ads</b></a>&#160;&#160;|&#160;&#160;<a href="#" style="color:#336699;" onclick="document.getElementById('ADNP_bot').style.display = 'block'; document.getElementById('AD_bot').style.display = 'none';document.getElementById('ADNP_2').style.display = 'block'; document.getElementById('AD_2').style.display = 'none'; document.getElementById('AD_3').style.display = 'none'; document.getElementById('ADNP_3').style.display = 'block';"><b>NP Ads</b></a><br/><a href="#" style="color:#336699;" onclick=" document.getElementById('msn').style.display = 'block'; document.getElementById('no_msn').style.display = 'none';"><b>Hotmail Wizard</b></a>&#160;&#160;|&#160;&#160;<a href="#" style="color:#336699;" onclick=" document.getElementById('no_msn').style.display = 'block'; document.getElementById('msn').style.display = 'none';"><b>Search Wizard</b></a></td>
				</tr>
			</table></td>
	</tr>
	</table>
<xsl:comment>*****************START 04_01Eyebrow Module*****************</xsl:comment>
<html>
<head>
<title>Expedia.com</title>
</head>
<body bgcolor="#206ba4">
<div style="font-family: arial, helvetica, sans serif; color: #939393; font-size: 12px;"><a href="%%view_email_url%%" style="font-family: arial, helvetica, sans serif; color: #939393; font-size: 12px;">View this e-mail as a web page</a></div>
		<table width="814" cellpadding="1" cellspacing="0" border="0">
		<tr>
			<td width="812" bgcolor="#87a3cb">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="left" valign="top" height="64">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td bgcolor="#7093b9" align="left" height="64" width="204">
								<a href="http://www.expedia.com/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif;  font-size: 12px; color: #ffffff;"><img src="http://media.expedia.com/media/content/expus/graphics/mail/expedia_email_logo.jpg" alt="Expedia.com" width="204" height="64" border="0" /></a>
							</td><td bgcolor="#7093b9" width="547" height="64" background="http://media.expedia.com/media/content/expus/graphics/mail/expedia_header_wave.jpg"><table cellpadding="0" cellspacing="2" border="0">
								<tr>
									<td width="547" align="right" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff;">
										<xsl:if test="my:headerOffer[@my:state='yes']">
										<xsl:for-each select="my:headerOffer">
										<b><xsl:value-of select="@my:shortText"  disable-output-escaping="yes" /></b>&#160;<a><xsl:attribute name="href"><xsl:value-of select="@my:url" />%%=OmnitureParams('')=%%</xsl:attribute><xsl:attribute name="style">font-family: arial, helvetica, sans serif; font-size: 12px; color:#ffffff;</xsl:attribute><xsl:value-of select="@my:blurb" disable-output-escaping="yes" /></a></xsl:for-each></xsl:if></td>
								</tr>
								<xsl:comment>*****************END 04_01Eyebrow Module*****************</xsl:comment>	
								<tr>
									<td width="547" align="right" valign="middle">
										<table cellpadding="0" cellspacing="4" border="0">
										<tr><td><a href="http://www.expedia.com/pub/agent.dll?qscr=info&amp;%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #ffffff;">My Account</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #ffffff;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/service/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #ffffff;">Customer Support</a></td></tr></table></td>
								</tr></table>
							</td><td width="64" height="64" bgcolor="#7093b9"></td>
					</tr>
					</table>
					<table cellpadding="0" cellspacing="0" border="0" width="814">
					<tr>
						<td align="left" bgcolor="#f0f4f7" width="100%">
							<table cellpadding="0" cellspacing="5" border="0">
							<tr>
								<td width="5"></td>
<td valign="bottom"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Flights</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/hotels/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Hotels</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/cars/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Cars</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Vacation Packages</nobr></a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/cruise/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Cruises</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;  text-decoration: none;">Activities</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Deals &amp; Destinations</nobr></a></td>
<td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/business/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Business Travel</nobr></a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/highlights/rewards/Thank-You-Network.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>ThankYou <xsl:text disable-output-escaping="yes">&amp;#174;</xsl:text></nobr></a></td>
						</tr>
						</table></td>
				</tr>
				</table>
				<table width="812" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td valign="top" width="525" bgcolor="#f0f4f7">
						<table cellpadding="0" cellspacing="5" border="0">
						<tr>
							<td align="left" valign="top">
								<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
									<xsl:comment>*****************START 04_02MsgDeals Modules*****************</xsl:comment> 								
										<table width="525" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="525" bgcolor="#809cc3">
												<table width="523" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="523" bgcolor="#ffffff">											
														<table width="100%" cellpadding="0" cellspacing="2" border="0">
														<tr>
															<td valign="top" bgcolor="#ffffff">
																<table width="100%" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td width="8" bgcolor="#bfcbe3"></td>
																	<td  bgcolor="#bfcbe3" height="35" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 16px; color: #336699; font-weight: bold;"><xsl:for-each select="header">
																		<xsl:value-of select="."  disable-output-escaping="yes" /><br/>											
																		</xsl:for-each></td>
																	<td rowspan="2" width="104"><a><xsl:attribute name="href"><xsl:value-of select="topimage/@imagelink" />%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>TR_email_postit_deals.jpg</xsl:attribute><xsl:attribute name="width">104</xsl:attribute><xsl:attribute name="height">63</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt">Spotlight Deal!</xsl:attribute></img></a></td>
																</tr>
																<tr>
																	<td width="8" bgcolor="#ffffff"></td>
																	<td valign="middle" height="28" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold;"><xsl:if test="subHeader">
																			<xsl:for-each select="subHeader">
																				<xsl:value-of select="." disable-output-escaping="yes" /><br />
																			</xsl:for-each>
																		</xsl:if>
																	</td>
																</tr>
																</table>
																<table width="503" cellpadding="0" cellspacing="8" border="0">
																<xsl:if test="my:message">
																<xsl:for-each select="my:message">
																<tr>
																	<td style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																		<xsl:if test="@my:show='yes'">
																		<xsl:if test="my:paradeal">
																		<xsl:for-each select="my:paradeal">
																		<xsl:value-of select="."  disable-output-escaping="yes" /><xsl:if test="not(position() = last())"><br /><br /></xsl:if>
																		</xsl:for-each>
																		</xsl:if>
																		</xsl:if>
																		<xsl:if test="@my:specials='yes'">
																		<table cellpadding="0" cellspacing="0" border="0">
																			<tr><td height="3"></td></tr>
																		</table>
																		<xsl:if test="my:deal">
																		<xsl:for-each select="my:deal">
																			<table cellpadding="0" cellspacing="0" border="0">
																			<tr>
																				<td valign="top"><li style="list-style-type: disc; color:#336699;" /></td>
																				<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																					<xsl:if test="@my:link != ''"><a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="@my:link" />%%=OmnitureParams('')=%%</xsl:attribute>
																					<b><xsl:value-of select="@my:linktext"  disable-output-escaping="yes" /></b></a></xsl:if><xsl:value-of select="."  disable-output-escaping="yes" /></td>
																			</tr>
																			<tr>
																				<td colspan="2" height="3"></td>
																			</tr>
																			</table>
																		</xsl:for-each>
																		</xsl:if></xsl:if>
																		</td>
																</tr>
																</xsl:for-each></xsl:if></table></td>
														</tr>
														</table></td>
												</tr>
												</table></td>
										</tr>
										</table></td>
							</tr>
							<tr>
								<td height="5" bgcolor="#f0f4f7"></td>
							</tr>	
							</table>
							<table cellpadding="0" cellspacing="0" border="0" width="525">
								<tr>
									<td valign="top">
										<table width="525" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="525" bgcolor="#809cc3">
												<table width="523" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="523" bgcolor="#ffffff" valign="top">											
													<xsl:if test="deals">
													<xsl:for-each select="deals">
														<table cellpadding="0" cellspacing="0" border="0" width="100%">
														<tr>
															<td>
																<table cellpadding="0" cellspacing="0" border="0" width="100%">
																<xsl:if test="position() != 1">
																<tr>
																	<td colspan="3" height="5"></td>
																</tr>
																<tr>
																	<td width="8"></td><td bgcolor="#809cc3" style="line-height: 1px; color: #809cc3;"></td><td width="8"></td>
																</tr>
																</xsl:if>
																<tr>
																	<td width="8"></td><td valign="bottom" height="24" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;">
																		<xsl:value-of select="@header" disable-output-escaping="yes" />&#160;<span style="font-size: 12px; color: #000000;"><xsl:value-of select="@subheader" disable-output-escaping="yes" /></span>
																	</td><td width="8"></td>
																</tr>
																</table></td>
														</tr>
														</table>
														<table cellpadding="0" cellspacing="10" border="0">
														<xsl:if test="@my:message='yes'">
														<tr>
															<td>
																<table cellpadding="0" cellspacing="0" border="0">															
																<tr>
																	<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																		<xsl:if test="my:para">
																		<xsl:for-each select="my:para">
																		<xsl:value-of select="."  disable-output-escaping="yes" />
																		<xsl:if test="not(position() = last())"><br/><br/></xsl:if></xsl:for-each></xsl:if></td>
																</tr>
																</table></td>
														</tr>														
														</xsl:if>
														<tr>
															<td align="left" width="100%">
																<table cellpadding="0" cellspacing="0" border="0">															
																<tr><xsl:if test="@image='yes'">
																	<td valign="top" width="114">
																	<a><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute>
																	<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../@my:type" /><xsl:value-of select="../ID/@issue" />_deals<xsl:number value="position()" format="1" />.jpg</xsl:attribute> <xsl:attribute name="width">114</xsl:attribute>  <xsl:attribute name="border">0</xsl:attribute></img></a></td></xsl:if>
																	<td width="389"><xsl:attribute name="valign">top</xsl:attribute>
																		<table cellpadding="0" cellspacing="0" border="0">
																		<xsl:if test="@my:deals='yes'">
																		<xsl:if test="offer">
																		<xsl:for-each select="offer">
																		<tr>
																			<td width="9" align="center" valign="middle"><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_04_bullet.jpg</xsl:attribute> <xsl:attribute name="width">9</xsl:attribute> <xsl:attribute name="height">3</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></td>
																			<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #000000; font-size: 12px;">
																				<a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute>
																				<b><xsl:value-of select="@linktext"  disable-output-escaping="yes" /></b></a>:&#160;<xsl:value-of select="."  disable-output-escaping="yes" /></td>
																		</tr>
																		<xsl:if test="not(position() = last())">
																		<tr>
																			<td colspan="2" height="5"></td>
																		</tr>
																		</xsl:if>
																		<xsl:if test="position() = last()">
																		<tr>
																			<td colspan="2" height="20"></td>
																		</tr>
																		</xsl:if>
																		</xsl:for-each>
																		</xsl:if></xsl:if>
																		<tr>
																			<td colspan="2" valign="bottom" width="389">
																				<table cellpadding="0" cellspacing="0" border="0" align="right">
																				<tr>
																					<td height="22"><a><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_left.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																				<td height="22" bgcolor="#0b8f46" valign="middle"><a><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; text-decoration:none; vertical-align: middle;">Search <xsl:if test="my:buttonText = ''"><xsl:value-of select="translate(@header, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" disable-output-escaping="yes"/></xsl:if><xsl:if test="my:buttonText != ''"><xsl:value-of select="my:buttonText" disable-output-escaping="yes"/></xsl:if></div></a></td>
																					<td height="22"><a><xsl:attribute name="href"><xsl:value-of select="@link" />%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_right.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td></tr>
																				</table><xsl:if test="@header ='Cruises'"><div style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; font-weight: bold;">For a Cruise Specialist call 1-888-249-3978.</div></xsl:if></td>
																				</tr>
																				</table></td>
																		</tr>
																		</table></td>
																</tr>
																</table>
															</xsl:for-each>
															</xsl:if>
															<xsl:comment>*****************END  04_02MsgDeals Modules*****************</xsl:comment>
															<table cellpadding="0" cellspacing="0" border="0" width="523">
															<tr>
																<td colspan="4" height="5"></td>
															</tr>
															<tr>
																<td height="61">
																	<table cellpadding="0" cellspacing="0" border="0" width="169">
																	<tr>
																		<td height="30"></td>
																	</tr>
																	<tr>
																		<td width="8"></td><td bgcolor="#809cc3" style="line-height: 1px; color: #809cc3"></td>
																	</tr>
																	<tr>
																		<td width="8"></td><td height="30" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;">Let Expedia Help...</td>
																	</tr>
																	</table></td>
																<td>
																	<table cellpadding="0" cellspacing="0" border="0" width="84">
																	<tr>
																		<td height="61">
																			<a href="http://www.expedia.com/daily/tools/default.asp?%%=OmnitureParams('')=%%"><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>TR_email_postit_tools.jpg</xsl:attribute><xsl:attribute name="width">84</xsl:attribute><xsl:attribute name="height">61</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt">Handy Tools!</xsl:attribute></img></a></td>
																	</tr>
																	</table></td>
																<td height="61">
																	<table cellpadding="0" cellspacing="0" border="0" width="9">
																	<tr>
																		<td colspan="2" height="30"></td>
																	</tr>
																	<tr>
																		<td colspan="2" bgcolor="#809cc3" style="line-height: 1px; color: #809cc3"></td>
																	</tr>
																	<tr>
																		<td colspan="2" height="8"></td>
																	</tr>
																	<tr>
																		<td width="8"></td><td bgcolor="#809cc3" height="22" style="width: 1px; line-height: 22px; color: #809cc3"></td>
																	</tr>
																	</table>
																</td>
																<td height="61">
																	<table cellpadding="0" cellspacing="0" border="0" width="261">
																	<tr>
																		<td colspan="3" height="30"></td>
																	</tr>
																	<tr>
																		<td colspan="2" bgcolor="#809cc3" style="line-height: 1px; color: #809cc3"></td><td width="8"></td>
																	</tr>
																	<tr>
																		<td width="8"></td><td height="30" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;">Book the perfect activity</td><td width="8"></td>
																	</tr>
																	</table></td>	
														</tr>
														</table>
														<table cellpadding="0" cellspacing="0" border="0" width="523">
														<tr>
															<td width="3"></td><td width="258" align="left" valign="top">
																<table cellpadding="0" cellspacing="10" border="0">
																	<tr>
																		<td><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_04_tools1.jpg</xsl:attribute><xsl:attribute name="width">39</xsl:attribute><xsl:attribute name="height">36</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"></xsl:attribute></img></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">Get a 360-degree view of hotels with our <a href="http://www.expedia.com/daily/tools/default.asp?%%=OmnitureParams('')=%%" style="font-weight: bold; color: #336699;">Virtual Tours</a>.</td>
																	</tr>
																	<tr>
																		<td><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_04_tools2.jpg</xsl:attribute><xsl:attribute name="width">39</xsl:attribute><xsl:attribute name="height">36</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"></xsl:attribute></img></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">Find the best price and dates for your trip with our <a href="http://www.expedia.com/pub/agent.dll?qscr=cmpf&amp;airp=&amp;dair=&amp;zz=1164154818594&amp;%%=OmnitureParams('')=%%" style="font-weight: bold; color: #336699;">Fare Calendar</a>.</td>
																	</tr>
																	<tr>
																		<td><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_04_tools3.jpg</xsl:attribute><xsl:attribute name="width">39</xsl:attribute><xsl:attribute name="height">36</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"></xsl:attribute></img></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">Let us send the best fares right to your desktop with <a href="http://www.expediaguides.com/farealert/default.aspx?%%=OmnitureParams('')=%%" style="font-weight: bold; color: #336699;">Fare Alert</a>.</td>
																	</tr>
																	<tr>
																		<td><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_04_tools4.jpg</xsl:attribute><xsl:attribute name="width">39</xsl:attribute><xsl:attribute name="height">36</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"></xsl:attribute></img></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">Use <a href="http://www.expedia.com/daily/highlights/traveler-opinions/default.asp?%%=OmnitureParams('')=%%" style="font-weight: bold; color: #336699;">Hotel Travel Opinions</a> for your inside scoop and user ratings.</td>
																	</tr>
																	<tr>
																		<td><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_04_tools5.jpg</xsl:attribute><xsl:attribute name="width">39</xsl:attribute><xsl:attribute name="height">36</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"></xsl:attribute></img></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">Find the best hotel prices with our <a href="http://www.expedia.com/daily/promos/tools/hotelratecalendar/default.asp?%%=OmnitureParams('')=%%" style="font-weight: bold; color: #336699;">Hotel Rate Calendar</a>.</td>
																	</tr>
																	<tr>
																	<td colspan="2" height="10"></td>
																</tr>
																<tr>
																	<td colspan="2" width="100%">
																		<table cellpadding="0" cellspacing="0" border="0" align="right">
																				<tr><td valign="top"><a href="http://www.expedia.com/daily/tools/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/etm_shopper_arrow_2.gif" width="14" height="15" border="0" align="absmiddle" /></a></td><td width="2"></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px;"><a href="http://www.expedia.com/daily/tools/default.asp?%%=OmnitureParams('')=%%" style="color:#336699; font-weight:bold;">See all tools</a></td><td width="5"></td></tr></table>
																	</td>
																</tr>
																</table>
															</td>
															<td width="1" bgcolor="#809cc3" style="line-height: 1px; color: #809cc3"></td>
															<td width="6"></td>
															<td width="255" valign="top">
																<table cellpadding="0" cellspacing="5" border="0" width="100%">
																<tr>
																	<td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">Concerts, shows, sporting events, and more--book now to save time later.</td>
																</tr>
																</table>
																<table cellpadding="0" cellspacing="5" border="0" width="100%">
																<tr>
																	<td width="70"><a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_discover_1.jpg</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																	<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;"><b>Tours &amp; Sightseeing</b><br />
																			<a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="color: #336699;">Places to go, things to see</a></td>
																</tr>
																<tr>
																	<td width="70"><a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_discover_2.jpg</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																	<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;"><b>Events &amp; Shows</b><br /><a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="color: #336699;">See the hottest shows!</a></td>
																</tr>
																<tr>
																	<td width="70"><a><xsl:attribute name="href">http://www.razorgator.com/expedia/?c=97-0-0-0-0-0-6&amp;%%=OmnitureParams('')=%%</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_04_discover_3.gif</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																	<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;"><b>Hard-To-Get<sup style="font-size: 8px;">SM</sup> tickets</b><br />
																			Sports, theatre, and more—<br /><a href="http://www.razorgator.com/expedia/?c=97-0-0-0-0-0-6&amp;%%=OmnitureParams('')=%%" style="color: #336699;">Find tickets with RazorGator</a></td>
																</tr>
																</table>
																<table cellpadding="0" cellspacing="0" border="0" align="right">
																<tr>
																	<td height="10"></td>
																</tr>
																<tr>
																	<td valign="top"><a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/etm_shopper_arrow_2.gif" width="14" height="15" border="0" align="absmiddle" /></a></td><td width="2"></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px;"><a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="color:#336699; font-weight:bold;">Search activities</a></td><td width="15"></td></tr></table></td>
														</tr>
														</table>
														<table cellpadding="0" cellspacing="0" border="0" width="100%">
														<tr>
															<td height="13"></td>
														</tr>
														</table></td>	
												</tr>
												</table></td>
										</tr>
										</table></td>
							</tr>
							</table>
							</td>
							<td width="274" valign="top" align="center">
								<table width="274" cellpadding="5" cellspacing="0" border="0">
								<tr>
									<td valign="top" bgcolor="#5c84b7">
										<table cellpadding="0" cellspacing="0" border="0"> 
										<tr>
											<td bgcolor="#89a5cc" width="100%">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<xsl:if test="topimage[@graphic='yes']">
												<xsl:for-each select="topimage">
												<tr>
													<td align="center"><a><xsl:attribute name="href"><xsl:value-of select="@imagelink" />%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../@my:type" /><xsl:value-of select="../ID/@issue" />_hero<xsl:number value="position()" format="1" /><xsl:if test="@my:gif='yes'"><xsl:text>.gif</xsl:text></xsl:if><xsl:if test="@my:gif='no'"><xsl:text>.jpg</xsl:text></xsl:if> </xsl:attribute> <xsl:attribute name="width">258</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"><xsl:value-of select="topimage/@imagename"/></xsl:attribute></img></a></td>
												</tr>
												</xsl:for-each>
												</xsl:if>
												</table></td>
										</tr>
										<tr>
											<td align="left">
												<div style="display:block" id="no_msn">
												<table width="264" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td width="2" bgcolor="#89a5cc"></td>
													<td align="left" bgcolor="#ffe77b">
														<table width="100%" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 16px; color: #336699; font-weight: bold;">Build your trip</td>
														</tr>
														</table></td>
													<td width="2" bgcolor="#89a5cc"></td>
												</tr>
												<tr>
													<td width="2" bgcolor="#89a5cc"></td>
													<td width="260" valign="top" bgcolor="#ffffff">
														<form method="GET" name="etaExpress" action="http://expediamail.com/p/EXPEDIA_US/TR_dual_button_wizard/default.html">
														<input type="hidden" name="GOTO" value="PackageWiz" />
														<input type="hidden" name="emlcid" value="%%=OmnitureParams('')=%%" />
														<input type="hidden" name="Airline" value="" />
														<table width="100%" align="left" cellpadding="0" cellspacing="10" border="0">
														<tr>
															<td>
																<table cellpadding="0" cellspacing="2" border="0">
																<tr>
																	<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing from:<br /><input maxlength="75" name="FrAirport" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:150px" value="" />&#160;&#160;</td>
																	<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Depart Date:<br /><input maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:70px" value="mm/dd/yy" /></td>
																</tr>
																<tr>
																	<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Destination:<br /><input maxlength="75" name="DestName" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:150px" value="" />&#160;&#160;</td>
																	<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Return Date:<br /><input maxlength="8" name="ToDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:70px" value="mm/dd/yy" /></td>
																</tr>
																<tr>
																	<td height="10" colspan="2"></td>
																</tr>
																<tr>
																	<td colspan="2" align="left">			
																		<table cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td align="left" height="22">
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr><td height="22"><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td><td align="left" height="22" bgcolor="#0b8f46" valign="middle"><input name="GOFlight" type="submit" value="Search flight" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:75;"/></td><td height="22"><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td></tr>
																						</table></td>
																		</tr>
																		<tr>
																			<td height="10" colspan="2"></td>
																		</tr>
																		<tr>
																			<td align="left" height="22">
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td height="22"><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td><td align="left" height="22" bgcolor="#0b8f46" valign="middle"><input name="GOPackage" type="submit" value="Search flight + hotel" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:115;" /></td><td height="22"><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td>					
																				</tr>
																				</table></td>
																		</tr>
																		</table></td>	
																</tr>
																</table></td>
														</tr>
														<tr>
															<td align="center" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Flexible travel dates? Look here</a><br/><br/></td>
														</tr>
														<tr>
															<td bgcolor="#ffffff"><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr>
															<td width="5"></td><td><img src="http://media.expedia.com/media/content/expus/graphics/mail/email_telewizard.jpg" alt="Expedia Customer Support" border="0" width="225" height="21"/></td><td></td>
														</tr></table></td>
														</tr>
														</table>
														<input type="hidden" name="Numadult" value="1" />
														<input type="hidden" name="Numroom" value="1" />
														</form></td>	
														<td width="2" bgcolor="#89a5cc"></td>						
														</tr>
														</table></div>
														<div style="display:none" id="msn">
															<table width="264" cellpadding="0" cellspacing="0" border="0">
															<tr>
															<td width="2" bgcolor="#89a5cc"></td>
															<td align="left" bgcolor="#ffe77b">
																<table width="100%" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #336699; font-weight: bold;">Build your trip</td>
																</tr>
																</table></td>
															<td width="2" bgcolor="#89a5cc"></td>
															</tr>
															<tr>
															<td width="2" bgcolor="#89a5cc"></td>
															<td width="260" valign="top" bgcolor="#ffffff">
																<table width="100%" align="left" cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td>
																		<table cellpadding="0" cellspacing="2" border="0">
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing from:<br /><input maxlength="75" name="FrAirport" style="font-family: arial, helvetica, sans serif; background-color: #f1f4f7; width:150px;" readonly="readonly" />&#160;&#160;</td>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Depart Date:<br /><input maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; background-color: #f1f4f7; width:70px" readonly="readonly" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Destination:<br /><input maxlength="75" name="DestName" style="font-family: arial, helvetica, sans serif; background-color: #f1f4f7; width:150px" readonly="readonly" />&#160;&#160;</td>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Return Date:<br /><input maxlength="8" name="ToDate" style="font-family: arial, helvetica, sans serif; background-color: #f1f4f7; width:70px" readonly="readonly" /></td>
																		</tr>
																		<tr>
																			<td height="10" colspan="2"></td>
																		</tr>
																		<tr>
																			<td colspan="2" align="left">			
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr><td height="22"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" height="22" border="0" /></a></td><td align="left" height="22" bgcolor="#0b8f46" valign="middle"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%"><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:16; width:75; text-decoration:none;">Search flight</div></a></td><td height="22"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" height="22" border="0" /></a></td></tr>
																						</table></td>
																				</tr>
																				<tr>
																					<td height="10" colspan="2"></td>
																				</tr>
																				<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr><td height="22"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" height="22" border="0" /></a></td><td align="left" height="22" bgcolor="#0b8f46" valign="middle"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%"><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:16; width:115; text-decoration:none;">Search flight + hotel</div></a></td><td height="22"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" height="22" border="0" /></a></td></tr>
																						</table></td>
																				</tr>
																				</table></td>	
																</tr>
																</table></td>
														</tr>
														<tr>
															<td align="center" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Flexible travel dates? Look here</a><br/><br/></td>
														</tr>
														<tr>
															<td bgcolor="#ffffff"><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr>
															<td width="5"></td><td><img src="http://media.expedia.com/media/content/expus/graphics/mail/email_telewizard.jpg" alt="Expedia Customer Support" border="0" width="225" height="21"/></td><td></td>
														</tr></table></td>
														</tr>
														</table></td>	
														<td width="2" bgcolor="#89a5cc"></td>						
														</tr>			
														</table>	
														</div>
														<!--table width="264" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td colspan="3" height="5" bgcolor="#89a5cc"></td>
														</tr>
														<tr>
															<td width="2" bgcolor="#89a5cc"></td>	
															<td width="260" valign="top">
																<img src="http://media.expedia.com/media/content/expus/graphics/mail/800.gif" width="260" height="56" border="0" align="absmiddle" alt="Customer Support" /></td>
															<td width="2" bgcolor="#89a5cc"></td>	
														</tr>
														</table-->
														<table width="264" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="2" bgcolor="#89a5cc"></td>	 
															<td valign="top">
																<table width="100%" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td colspan="2" bgcolor="#89a5cc" height="11"></td><td valign="top" rowspan="3" width="74" bgcolor="#bfcbe3"><a href="https://www.expedia.com/pub/agent.dll?qscr=moda&amp;%%=OmnitureParams('')=%%"><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>TR_email_postit_lastmin.jpg</xsl:attribute><xsl:attribute name="width">74</xsl:attribute><xsl:attribute name="height">56</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt">Act Fast!</xsl:attribute></img></a></td>
																</tr>
																<tr>
																	<td width="10" bgcolor="#bfcbe3"></td>
																	<td bgcolor="#bfcbe3" height="30" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 13px; color: #336699; font-weight: bold;">Upcoming fare deals</td>
																	
																</tr>
																<tr>
																	<td colspan="2" bgcolor="#ffffff" height="15"></td>
																</tr>													
																</table>
																<table width="260" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td width="260" bgcolor="#ffffff">
																		<table width="100%" cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td width="10"></td><td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">Here are your favorite routes:</td>
																		</tr>
																		<tr>
																			<td height="10"></td>
																		</tr>
																		</table>
																		<table width="100%" cellpadding="10" cellspacing="0" border="0">
																		<tr bgcolor="#f0f4f7">
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																				<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Portland to Sacramento</a><br/>
																				<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2007</span></td>
																			<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$103+</a></td>
																		</tr>
																		<tr bgcolor="#ffffff">
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																				<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Chicago to Los Angeles</a><br/>
																				<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2007</span></td>
																			<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$203+</a></td>
																		</tr>
																		<tr bgcolor="#f0f4f7">
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																				<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Providence to San Francisco</a><br/>
																				<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2007</span></td>
																			<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$163+</a></td>
																		</tr>
																		<tr bgcolor="#ffffff">
																			<td colspan="2" align="left" >
																				<table width="100%" cellpadding="0" cellspacing="0" border="0">
																				<tr><td align="left" valign="top"><a href="https://www.expedia.com/pub/agent.dll?qscr=moda&amp;%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/etm_shopper_arrow_2.gif" width="14" height="15" border="0" align="absmiddle" /></a></td><td align="left" style="font-family: arial, helvetica, sans serif; font-size: 11px;"><a href="https://www.expedia.com/pub/agent.dll?qscr=moda&amp;%%=OmnitureParams('')=%%" style="color:#336699">Add/update your favorite routes</a></td></tr></table></td>
																				</tr>
																				</table>
																				<table width="100%" cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td height="10"></td>
																				</tr>
																				<tr>
																					<td width="10"></td><td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">Top picks from <b style="color: #000000;">Seattle (SEA)</b> to:</td>
																				</tr>
																				<tr>
																					<td height="10"></td>
																				</tr>
																				</table>
																				<table width="100%" cellpadding="10" cellspacing="0" border="0">
																				<tr bgcolor="#f0f4f7">
																					<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																						<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Sacramento</a><br/>
																						<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2007</span></td>
																					<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$103+</a></td>
																				</tr>
																				<tr bgcolor="#ffffff">
																					<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																						<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Los Angeles</a><br/>
																						<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2007</span></td>
																					<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$203+</a></td>
																				</tr>
																				<tr bgcolor="#f0f4f7">
																					<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																						<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">San Francisco</a><br/>
																						<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2007</span></td>
																					<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$163+</a></td>
																				</tr>
																				<tr bgcolor="#ffffff">
																					<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																						<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">Los Angeles</a><br/>
																						<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2007</span></td>
																					<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$193+</a></td>
																				</tr>
																				<tr bgcolor="#f0f4f7">
																					<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
																						<a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color:#336699">San Francisco</a><br/>
																						<span style="font-size: 11px; color: #000000;">11/4 - 11/8/2007</span></td>
																					<td align="right" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP&amp;%%=OmnitureParams('')=%%" style="color: #cc6600;">$305+</a></td>
																				</tr>
																				<tr bgcolor="#ffffff">
																					<td colspan="2">
																						<table width="100%" cellpadding="0" cellspacing="0" border="0">
																						<tr><td align="left" valign="top">	
																							<a href="https://www.expedia.com/pub/agent.dll?qscr=moda&amp;%%=OmnitureParams('')=%%"><img src="http://media.expedia.com/media/content/expus/graphics/mail/etm_shopper_arrow_2.gif" width="14" height="15" border="0"  align="absmiddle" /></a>&#160;</td><td align="left" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000;">Get relevant destinations by <a href="https://www.expedia.com/pub/agent.dll?qscr=moda&amp;%%=OmnitureParams('')=%%" style="color:#336699">updating your home airport</a>.</td></tr></table></td>
																						</tr>
																						</table>
																						<table width="100%" cellpadding="0" cellspacing="0" border="0">
																						<tr>
																								<td height="10" bgcolor="#89a5cc"></td>
																						</tr>
																						</table>
																						<table cellpadding="0" cellspacing="10" border="0">
																						<tr>
																							<td align="left" valign="top" width="260">
																								<table cellpadding="0" cellspacing="0" border="0">
																								<tr>
																									<td valign="middle"><a><xsl:attribute name="href">http://www.expedia.com/daily/highlights/best-rate-guarantee/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>TR_email_v04_bpg_logo.jpg</xsl:attribute> <xsl:attribute name="width">82</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt">Best Price Guarantee</xsl:attribute></img></a></td>
																									<td width="5"></td>
																									<td style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000;">Get the lowest price with our<br/>
																									<a href="http://www.expedia.com/daily/highlights/best-rate-guarantee/default.asp?%%=OmnitureParams('')=%%" style="color:#336699;">BEST PRICE GUARANTEE</a>&#160;<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_04_blue_arrow_tick.jpg</xsl:attribute> <xsl:attribute name="width">9</xsl:attribute> <xsl:attribute name="height">11</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="align">absmiddle</xsl:attribute></img></td>
																								</tr>
																								<tr>
																									<td colspan="2" height="15"></td>
																								</tr>
																								<tr>
																									<td valign="middle"><a><xsl:attribute name="href">http://www.expedia.com/daily/highlights/rewards/Thank-You-Network.asp?%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>TR_email_v04_TY_logo.jpg</xsl:attribute> <xsl:attribute name="width">81</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt">Thank You</xsl:attribute></img></a></td>
																									<td width="5"></td>
																									<td style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000;">Earn valuable <b style="color:#336699;">ThankYou&#174;<br/>Points</b> when you book!<br/>
																									<a href="http://www.expedia.com/daily/highlights/rewards/Thank-You-Network.asp?%%=OmnitureParams('')=%%" style="color:#336699;">Learn more now</a>&#160;<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_04_blue_arrow_tick.jpg</xsl:attribute> <xsl:attribute name="width">9</xsl:attribute> <xsl:attribute name="height">11</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="align">absmiddle</xsl:attribute></img></td>
																								</tr>
																								</table></td>
																						</tr>
																						</table>
																						<table width="100%" cellpadding="5" cellspacing="0" border="0">
																						<tr>
																								<td height="10" bgcolor="#89a5cc"></td>
																						</tr>
																						</table>
																						<table width="100%" cellpadding="0" cellspacing="0" border="0">
																						<tr>
																						<td height="10" bgcolor="#89a5cc" align="center">
																						<div style="display:none" id="ADNP_2">
																						<table cellpadding="0" cellspacing="5" border="0">																							<tr>
																								<td style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #ffffff;">Sponsored by:</td>
																						</tr>
																						<tr>
																							<td width="180" valign="top">										
																								<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a></td>				
																						</tr>
																						<tr>
																							<td width="180" valign="top">
																								<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTRNP&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a></td>
																						</tr>
																						</table>
																						</div>
																						<div style="display:block" id="AD_2">	
																						<table cellpadding="0" cellspacing="5" border="0">																							<tr>
																								<td style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #ffffff;">Sponsored by:</td>
																						</tr>
																						<tr>
																							<td width="180" valign="top">										
																								<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a></td>
																						</tr>
																						<tr>
																							<td width="180" valign="top">										
																								<a HREF="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILACOL2&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a></td>
																						</tr>
																						</table>
																						</div>
																						</td>
																						</tr>
																						</table>
																					</td>
																				</tr>
																				</table></td><td width="2" bgcolor="#89a5cc"></td>	
																		</tr>
																		</table></td>
																</tr>
																</table></td>
														</tr>
														</table></td>
												</tr>		
												</table>
												<table cellpadding="0" cellspacing="0" border="0" width="812">
												<tr>
													<td align="left" bgcolor="#f0f4f7" width="100%">
														<table cellpadding="0" cellspacing="5" border="0">
														<tr>
															<td width="5"></td>
<td valign="bottom"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Flights</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/hotels/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Hotels</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/cars/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Cars</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Vacation Packages</nobr></a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/cruise/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Cruises</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;  text-decoration: none;">Activities</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Deals &amp; Destinations</nobr></a></td>
<td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/business/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Business Travel</nobr></a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/highlights/rewards/Thank-You-Network.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>ThankYou <xsl:text disable-output-escaping="yes">&amp;#174;</xsl:text></nobr></a></td>
						</tr>
						</table></td>
				</tr>
				</table></td>
		</tr>
		</table>
		</td>
		</tr>
		</table>
			
	</td>
	</tr>
	</table><div style="display:none" id="ADNP_bot">
			<table width="816" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="816" align="center" bgcolor="#ffffff"><br/><a href="http://ads.expedia.com/click.ng/TPID=1&amp;Location=EMAILTRNP&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;Location=EMAILTRNP&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" /></a><br/></td>
			</tr>
			</table>
			</div>
			<div style="display:block" id="AD_bot">
			<table width="816" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="816" align="center" bgcolor="#ffffff"><br/><a href="http://ads.expedia.com/click.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]"><IMG SRC="http://ads.expedia.com/image.ng/TPID=1&amp;LOCATION=EMAILTR&amp;PLACEMENT=EMAILBODY&amp;transactionid=[+PROFILE('profile_key','','')+]" BORDER="0" NOSEND="1" /></a><br/></td>
			</tr>
			</table>
			</div>
		<table width="816" cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff">
		<tr>
			<td bgcolor="#ffffff" colspan="3" height="20"></td>
		</tr>
		<tr>
			<td width="20" bgcolor="#ffffff"></td>
			<td valign="top" align="left" bgcolor="#ffffff" style="font-family: arial, helvetica, sans serif; font-size: 9px; color: #666666; font-weight: bold;">
					You are receiving this email because you subscribed to receive promotional emails on Expedia.com.<br/>
					This is a weekly deals newsletter you qualified for based on your email preferences.
					<br /><br />
				<xsl:if test="my:specialRules[@my:action='yes']">
					TERMS AND CONDITIONS<br />
					</xsl:if>
					<xsl:for-each select="my:specialRules">
						<xsl:choose>
							<xsl:when test="@my:action='yes'">
								<xsl:value-of select="." disable-output-escaping="yes" /><br /><br />
							</xsl:when>
							</xsl:choose>
					</xsl:for-each>	
		UNSUBSCRIBE<br />
		If you do not wish to receive future e-mail advertisements from Expedia, Inc., please <a><xsl:attribute name="href">http://www.expedia-email.com/Unsub/Unsubscribe.aspx?m=%%memberid%%&amp;s=%%subscriberid%%&amp;%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">click here</font></a>. Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, <a><xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">click here</font></a> for personalized help. 
		<br />
		<br />
		CONTACT US<br />
		Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. To contact Expedia, Inc. or send feedback, please <a><xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">click here</font></a> or contact us via postal mail at: Expedia, Inc., Attn: EMC Team, 3150 139th Avenue SE, Bellevue, WA  98005. For additional assistance, visit the Expedia.com <a><xsl:attribute name="href">http://www.expedia.com/daily/service/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">Customer Support Center</font></a>, or call 1-800-Expedia.
		<br />
		<br />
		A NOTE ABOUT PRICES<br />
		Prices are subject to availability and subject to change without notice. 
		<br />
		<br />
		All prices were current at the time this e-mail was published. 
		<br />
		<br />
		Hotel, vacation package, and cruise prices on Expedia.com are constantly updated. Please refer to the site for the most current pricing. Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city. Additional taxes, fees, and charges may apply. Airfare is subject to, without limitation: (1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip; (2) up to $18 per roundtrip in local airport charges; (3) Federal Excise Tax of $3.20 per U.S. domestic flight segment; (4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in Alaska or Hawaii; and (5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking). A segment is defined as a takeoff and a landing.  
		<br />
		<br />
		CST #2029030-40
		<br />
		<br />
		&#169;2007 Expedia, Inc. All rights reserved.  Expedia, <a><xsl:attribute name="href">http://www.expedia.com/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">Expedia.com</font></a> and the Airplane logo are registered trademarks, or trademarks, of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
        <br />
    <br />
    ThankYou&#174; is a service mark of Citigroup Inc. ThankYou Design is a registered service mark of Citigroup Inc.
    <br />
    <br />
		(EMID: <xsl:value-of select="../email/@my:type" /><xsl:value-of select="ID/@issue" />) (MD: %%=Format(Now(),"yyyyMMddhhmms")=%%)(EPID: %%sub_PAID%%)(ETID: %%jobid%%)</td><td bgcolor="#ffffff" width="20"></td>
	</tr>
			<tr>
			<td bgcolor="#ffffff" colspan="3" height="20"></td>
		</tr>
	</table>
</body>
</html>
</xsl:if>
</xsl:template>
</xsl:stylesheet>
