<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-03-31T20:32:03">
	<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
	<!--xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template-->
	<xsl:template match="/email">
		<html>
			<head>
				<title>Expedia.com</title>
				<meta content="NOINDEX" name="ROBOTS"/>
				<meta name="description">
					<xsl:if test="subjectText">
						<xsl:for-each select="subjectText">
							<xsl:attribute name="content"><xsl:value-of select="."/></xsl:attribute>
						</xsl:for-each>
					</xsl:if>
				</meta>
			</head>
			<xsl:variable name="imgCommon">http://media.expedia.com/media/content/shared/graphics/common/mail/</xsl:variable>
			<xsl:variable name="imgPath">http://media.expedia.com/media/content/shared/images/</xsl:variable>
			<xsl:variable name="imgMailPath">http://media.expedia.com/media/content/shared/graphics/mail/</xsl:variable>
			<xsl:variable name="iconPath">http://media.expedia.com/media/content/expus/graphics/mail/</xsl:variable>
			<xsl:variable name="iconsPath">http://media.expedia.com/media/content/expus/graphics/icons/</xsl:variable>
			<xsl:variable name="issueID" select="ID/@issue"/>
			<xsl:variable name="offersLink" select="offersModule/callToAction/@link"/>
			<body>
			<table width="610" cellpadding="1" cellspacing="3" border="0" align="center">
			<tr>
				<td width="610" bgcolor="#A3C2E0">
					<table width="608" cellpadding="3" cellspacing="0" border="0">
					<tr>
						<td width="608" bgcolor="#FFFFFF"><font face="arial, helvetica, sans serif" size="2" color="#000000">
							<b>Subject Line:</b>&#160;&#160;<xsl:if test="subjectText">
							<xsl:for-each select="subjectText">
								<xsl:value-of select="." /><br />
							</xsl:for-each>
						</xsl:if></font></td>
					</tr>
					</table></td>
			</tr>
			</table>
<table align="center" cellpadding="0" cellspacing="5" border="0" width="610">
<tr>
	<td valign="top">
			<table width="610" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="247" height="51" align="left" valign="top" rowspan="2" bgcolor="#FFFFFF">
					<a href="http://www.expedia.com/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img src="http://media.expedia.com/media/content/expus/graphics/mail/logo_exphorz_short.gif" alt="Expedia.com" width="247" height="51" border="0" /></a></td>
				<td width="363" height="23" valign="top" bgcolor="#FFFFFF" align="right">&#160;</td>
			</tr>
			<tr>
				<td height="28" align="center" valign="middle" bgcolor="#FFFFFF">
					<table width="363" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a>&#160;&#160;</td>
						<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">|&#160;&#160;<a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a>&#160;&#160;</td>
						<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">|&#160;&#160;<a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a>&#160;&#160;</td>
						<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">|&#160;&#160;<a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">packages</a>&#160;&#160;</td>
						<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">|&#160;&#160;<a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a>&#160;&#160;</td>
						<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">|&#160;&#160;<a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
						<td width="100%" align="left">&#160;&#160;</td>
				</tr>
				</table></td>
			</tr>
			</table>
	</td>
</tr>
<xsl:if test="offersModule">
<xsl:for-each select="offersModule">
<tr><xsl:comment>*****************START FS_HERO_IMAGE*****************</xsl:comment>
	<td colspan="3"><a><xsl:attribute name="href"><xsl:choose>
		<xsl:when test="@link != ''"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:when>
		<xsl:otherwise><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:otherwise>
	</xsl:choose></xsl:attribute><img><xsl:attribute name="src">http://media.expedia.com/media/content/expus/graphics/mail/<xsl:value-of select="@image"/>_A.jpg</xsl:attribute> <xsl:attribute name="width">610</xsl:attribute> <xsl:attribute name="height">150</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt">Fare Sale Alert</xsl:attribute></img></a>
	</td>
	<xsl:comment>*****************END FS_HERO_IMAGE*****************</xsl:comment>
</tr>
<tr>
	<td width="375" valign="top">
	<xsl:comment>*****************START FS_OFFER_MODULE*****************</xsl:comment>
		<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>	
				<table cellpadding="0" cellspacing="0" border="0" height="425">
				<tr>
					<td height="340" bgcolor="#F1F4F7" valign="top">
						<table cellpadding="10" cellspacing="0" border="0">
						<tr>
							<td style="font-family: arial, helvetica, sans serif; font-size: 13px; color: #000000;">
								<font style="font-family: arial, helvetica, sans serif; font-size: 16px; font-weight: bold; color: #000000;">
								<!-- MAIN HEADLINE STARTS -->
								<xsl:if test="headline">
								<xsl:for-each select="headline">
									<xsl:value-of select="." disable-output-escaping="yes"/><br />
								</xsl:for-each>
								</xsl:if>
								</font>
								<!-- MAIN HEADLINE ENDS -->
								<img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="10" alt=""/><br/>				
								<xsl:if test="para">
								<xsl:for-each select="para">
									<xsl:value-of select="." disable-output-escaping="yes"/><br/><br/>	
								</xsl:for-each>
								</xsl:if>
								<!-- START PRICE TABLE -->
								<xsl:if test="priceTable">
									<table width="100%" cellpadding="0" cellspacing="0" border="0" style="font-family: arial, helvetica, sans serif; font-size: 13px; color: #000000;">
									<tr>
										<td align="left"><b><xsl:value-of select="priceTable/@header" disable-output-escaping="yes"/></b></td>
										<td align="right" bgcolor="#F1F4F7"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="10" alt="" /></td>
									</tr>
									<tr>
										<td colspan="2" height="5"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="5" alt="" /></td>
									</tr>
									<xsl:if test="priceTable/flightRoute">
									<xsl:for-each select="priceTable/flightRoute">
									<tr bgcolor="#cdd9e9">
										<td align="left"><a><xsl:attribute name="href"><xsl:choose>
		<xsl:when test="@link != ''"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:when>
		<xsl:otherwise><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:otherwise>
	</xsl:choose></xsl:attribute>
										<xsl:attribute name="style">color: #31339A;</xsl:attribute><xsl:value-of select="@text" disable-output-escaping="yes"/></a></td><td align="right"><a><xsl:attribute name="href"><xsl:choose>
		<xsl:when test="@link != ''"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:when>
		<xsl:otherwise><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:otherwise>
	</xsl:choose></xsl:attribute>
										<xsl:attribute name="style">color: #cc0000; font-weight:bold;</xsl:attribute>$<xsl:value-of select="@price" disable-output-escaping="yes"/>+</a></td>
									</tr>
									<xsl:choose>
									<xsl:when test="position()&lt; 5">
									<tr>
										<td colspan="2" height="2"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="2" alt="" /></td>
									</tr>
									</xsl:when>
									<xsl:otherwise>
									<tr>
										<td colspan="2" height="10"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="10" alt="" /></td>
									</tr>
									</xsl:otherwise>
									</xsl:choose>
									</xsl:for-each>
								</xsl:if>
								</table><br />
								</xsl:if>						
								<!-- END PRICE TABLE -->
								<xsl:if test="callToAction/@content != ''">
								<xsl:for-each select="callToAction">
									<a><xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
									<xsl:attribute name="style">color: #cc0000;</xsl:attribute><xsl:value-of select="@content" disable-output-escaping="yes"/></a><br />		
								</xsl:for-each>
								</xsl:if><br/>
								<!-- START BANNER AD-->
								<xsl:if test="bannerAd">
									<xsl:value-of select="bannerAd/@content" disable-output-escaping="yes"/><br />
								</xsl:if><br />
								<!-- END BANNER AD -->
								</td>
					</tr>
					</table><xsl:comment>*****************END FS_OFFER_MODULE*****************</xsl:comment></td>
		</tr>
		<tr>
			<td height="5" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="5" alt="" /></td>
		</tr>
		<tr>
			<td height="79">
				<xsl:if test="bannerAd">
					<a><xsl:attribute name="href"><xsl:value-of select="bannerAd/@link" disable-output-escaping="yes"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src">http://media.expedia.com/media/content/expus/graphics/mail/<xsl:value-of select="bannerAd/@image"/>.jpg</xsl:attribute> <xsl:attribute name="width">375</xsl:attribute> <xsl:attribute name="height">79</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="bannerAd/@altText" disable-output-escaping="yes"/></xsl:attribute></img></a>
				</xsl:if></td>
		</tr>
		</table>
	</td>
	<td width="5" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="1" alt="" /></td>
	<td width="235" valign="top" bgcolor="#D7DCE8">
		<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td valign="top" bgcolor="#FFDF7B">
				<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td colspan="3"><img src="http://media.expedia.com/media/content/expus/graphics/mail/fs_flight_wiz_header.gif" width="230" height="71" border="0" /></td>
				</tr>
				<tr>
					<td width="8"></td>
					<td width="212"><form method="GET" name="etaExpress" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
<input type="hidden" name="GOTO" value="EXPFLTWIZ" />
<input type="hidden" name="FromTime" value="Morning" />
<input type="hidden" name="ToTime" value="Evening" />
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td valign="top">	
								<font face="arial, Helvetica, sans-serif" size="1" color="#000000">Leaving from:</font><br />
								<input maxlength="100" name="Frairport" size="16" value="" /></td>
							<td width="5"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="1" alt="" /></td>
							<td valign="top">
								<font face="arial, Helvetica, sans-serif" size="1" color="#000000">Depart: </font><font style="font-family: arial, helvetica, sans serif; font-size: 8px; font-weight: bold; color: #000000;">(MM/DD/YY)</font><br />
								<input maxlength="8" name="FromDate" value="" size="9" />
								</td>
						</tr>
						<tr><td colspan="3" height="7"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="7" alt="" /></td></tr>
						<tr>
							<td valign="top"><font face="arial, Helvetica, sans-serif" size="1" color="#000000">Going to:</font><br /><input maxlength="100" name="Toairport" size="16" value="" />
							</td>
							<td width="5"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="1" alt="" /></td>
							<td valign="top">
								<font face="arial, Helvetica, sans-serif" size="1" color="#000000">Return: </font><font style="font-family: arial, helvetica, sans serif; font-size: 8px; font-weight: bold; color: #000000;">(MM/DD/YY)</font><br /><input maxlength="8" name="ToDate" value="" size="9" /><br />
							</td>
						</tr>
						<tr>
							<td colspan="3" height="10"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="10" alt="" /></td>
						</tr>
						<tr>
							<td colspan="3" valign="top">
								<font face="arial, Helvetica, sans-serif" size="1" color="#000000">
								<select name="Numadult">
								<option selected="1">1 adult</option>
								<option value="2">2 adults</option>
								<option value="3">3 adults</option>
								<option value="4">4 adults</option>
								<option value="5">5 adults</option>
								<option value="6">6 adults</option>
								</select>&#160;&#160;
								<input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/fs_search_for_flights.gif" align="absmiddle" /></font></td>
						</tr>
						</table></form>
					</td>
					<td width="10"></td>
				</tr>
				</table></td>
		</tr>
		<tr>
			<td height="5" bgcolor="#ffffff"></td>
		</tr>
		<tr>
			<td valign="top" bgcolor="#D7DCE8">
				<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="8" bgcolor="#BFC6D9"></td>
					<td colspan="2" height="58" bgcolor="#BFC6D9" valign="middle">
								<font style="font-family: arial, helvetica, sans serif; font-size: 16px; font-weight: bold; color: #000000;">Save an average of <font color="#CC6600">$220</font></font><br />
								<font style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">when you book a hotel with your flight!</font></td>
				</tr>
				<tr>
				<tr><td colspan="3"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="12" alt="" /></td></tr>
					<td width="8"></td>
					<td width="212"><form method="GET" name="etaExpress" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
<input type="hidden" name="GOTO" value="PackageWiz" />
<input type="hidden" name="PackageType" value="4" />
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td valign="top">	
								<font face="arial, Helvetica, sans-serif" size="1" color="#000000">Leaving from:</font><br />
								<input maxlength="100" name="Frairport" size="16" value="" /></td>
							<td width="5"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="1" alt="" /></td>
							<td valign="top">
								<font face="arial, Helvetica, sans-serif" size="1" color="#000000">Depart: </font><font style="font-family: arial, helvetica, sans serif; font-size: 8px; font-weight: bold; color: #000000;">(MM/DD/YY)</font><br />
								<input maxlength="8" name="FromDate" value="" size="9" />
								</td>
						</tr>
						<tr><td colspan="3" height="7"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="7" alt="" /></td></tr>
						<tr>
							<td valign="top"><font face="arial, Helvetica, sans-serif" size="1" color="#000000">Going to:</font><br /><input maxlength="100" name="DestName" size="16" value="" /></td>
							<td width="5"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="1" alt="" /></td>
							<td valign="top">
								<font face="arial, Helvetica, sans-serif" size="1" color="#000000">Return: </font><font style="font-family: arial, helvetica, sans serif; font-size: 8px; font-weight: bold; color: #000000;">(MM/DD/YY)</font><br /><input maxlength="8" name="ToDate" value="" size="9" /><br /></td>
						</tr>
						<tr>
							<td colspan="3" height="10"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="10" alt="" /></td>
						</tr>
						<tr>
							<td colspan="3" valign="top">
								<select name="Numadult">
								<option value="1">1 adult</option>
								<option selected="2">2 adults</option>
								<option value="3">3 adults</option>
								<option value="4">4 adults</option>
								<option value="5">5 adults</option>
								<option value="6">6 adults</option>
								</select>&#160;&#160;<input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/fs_find_now.gif" align="absmiddle" /></td>
						</tr>
						</table></form></td>
					<td width="10"></td>
				</tr>
				</table></td>
		</tr>
		</table></td>
		</tr>
</table></td>
</tr>
</xsl:for-each>
</xsl:if>
<xsl:if test="experience[@my:show='yes']">
<tr>
	<td colspan="3" bgcolor="#BFC6D9" valign="top">
		<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td width="5"></td>
			<td colspan="4" height="25" valign="bottom"><font style="font-family: arial, helvetica, sans serif; font-size: 14px; font-weight: bold; color: #000000;"><xsl:value-of select="experience/@title" disable-output-escaping="yes"/></font></td>
		</tr>
		<tr>
		<td width="30"></td>
		<td>
		<table cellpadding="5" cellspacing="0" border="0">
		<tr>
		<xsl:if test="experience/expOffer">
		<xsl:for-each select="experience/expOffer">
			<td align="center" valign="top">
				<a><xsl:attribute name="href"><xsl:value-of select="@link" disable-output-escaping="yes"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src">http://media.expedia.com/media/content/expus/graphics/mail/<xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="width">140</xsl:attribute> <xsl:attribute name="height">50</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@linkText" disable-output-escaping="yes"/></xsl:attribute></img></a><br/><font style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000;"><a><xsl:attribute name="href"><xsl:value-of select="@link" disable-output-escaping="yes"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #31339A;</xsl:attribute><b><xsl:value-of select="@linkText" disable-output-escaping="yes"/></b></a><br /><xsl:value-of select="@blurb" disable-output-escaping="yes"/></font>
			</td>
			</xsl:for-each>
			</xsl:if>
		</tr>
		</table></td>
		<td width="5"></td>
		</tr>
		</table>
	</td>
</tr>
</xsl:if>
<xsl:if test="experience[@my:show='no']">
		<tr>
			<td height="5" bgcolor="#ffffff"></td>
		</tr>
</xsl:if>
<tr>
	<td>
		<table width="610" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td height="28" align="center"><font style="font-size: 12px; color: #31339A; font-weight: bold; text-decoration: none;">
<a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #31339A; font-weight: bold; text-decoration: none;">flights</a>&#160;&#160;|&#160;&#160;<a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #31339A; font-weight: bold; text-decoration: none;">hotels</a>&#160;&#160;|&#160;&#160;<a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #31339A; font-weight: bold; text-decoration: none;">cars</a>&#160;&#160;|&#160;&#160;<a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #31339A; font-weight: bold; text-decoration: none;">packages</a>&#160;&#160;|&#160;&#160;<a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #31339A; font-weight: bold; text-decoration: none;">cruises</a>&#160;&#160;|&#160;&#160;<a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #31339A; font-weight: bold; text-decoration: none;">activities</a></font></td>
		</tr>
		</table>
	</td>
</tr>
<tr>
<td valign="top" style="border: 25px solid #ffffff;" bgcolor="#ffffff">
<font face="arial, helvetica, sans serif" size="1" color="#666666">
<xsl:comment>*****************START FS_T&amp;C_MODULE*****************</xsl:comment>
	<xsl:if test="specialRules/@action='yes'">
		TERMS AND CONDITIONS<br/><br/>
		<xsl:for-each select="specialRules">
			<xsl:value-of select="." disable-output-escaping="yes"/><br/><br/>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="specialRules/@action='no'"></xsl:if>
	<xsl:comment>*****************END FS_T&amp;C_MODULE*****************</xsl:comment>
	UNSUBSCRIBE
	<br />
	<br /> 
	If you do not wish to receive future e-mail advertisements from us, please <a href="http://expediamail.com/PUBLISH(sub_mgmt_page)"><font color="#666666">click here</font></a>. Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, <a href="https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">click here</font></a> for personalized help. 
	<br />
	<br />
	CONTACT US
	<br />
	<br /> 
	To contact us or send feedback, please <a href="https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">click here</font></a> or contact us via postal mail at: Expedia, Inc., Attn: PCC Team, 3150 139th Avenue SE, Bellevue, WA  98005. For additional assistance, visit the Expedia.com <a href="http://www.expedia.com/daily/service/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">Customer Support Center</font></a>. 
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
	Hotel, vacation package, and cruise prices on the Expedia Website are constantly updated.  Please refer to the site for the most current pricing.  Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city.  Additional taxes, fees, and charges may apply. Airfare is subject to, without limitation: (1) Sept. 11 Security Fee of $2.50 for each flight segment 
	originating at a U.S. airport, up to $5 per one way or $10 per roundtrip; (2) up to $18 per roundtrip in local airport charges; (3) Federal Excise Tax of $3.20 per U.S. domestic flight segment; (4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in Alaska or Hawaii; and (5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking).  A segment is defined as a takeoff and a landing.
	<br />
	<br />
	CST #2029030-40
	<br />
	<br />
	&#169;2006 Expedia, Inc. All rights reserved.  Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
	<br />
	<xsl:if test="ID">
		<xsl:for-each select="ID">
	[+"(EMID: CM_C_02_<xsl:value-of select="@issue"/>)(MD: ".VAR(TODAY).")(EPID: $p->{'profile_key'})(BIID: $p->{'mailing_id'}_$p->{'_WAVE_ID_'})"+]
		</xsl:for-each>
	</xsl:if>
</font></td>
</tr>
</table>
</body>
</html>
	</xsl:template>
</xsl:stylesheet>
