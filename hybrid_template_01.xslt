<?xml version="1.0"  encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-08-04T21:17:17">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
  <!--xsl:template match="email">
    <xsl:apply-templates />
  </xsl:template-->
<xsl:template match="email">
	<a name="top" />
	<xsl:if test="count(version)> 1">
	<table width="800" cellpadding="0" cellspacing="0" border="0">
	<tr>
	<td bgcolor="#ffffff" valign="top" style="font-size: 12px; color: #336699; text-decoration: none;">
		<ol>
			<xsl:if test="version">
				<xsl:for-each select="version">
					<li><a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href">#<xsl:value-of select="@name" /></xsl:attribute><xsl:value-of select="@name" /></a></li>
				</xsl:for-each>
			</xsl:if></ol>
		</td>
	</tr>
</table>
</xsl:if>
<!--xsl:variable name="cruise_dest" select="document('../previewer/cruise_dest_wiz.xsl')" /-->
<xsl:if test="version">
<xsl:for-each select="version">
<xsl:variable name="imgMailPath">http://media.expedia.com/media/content/expus/graphics/mail/</xsl:variable>
<xsl:variable name="issueID" select="ID/@issue" />
<xsl:variable name="headeroffersLink" select="headerOffer/@url" />
<xsl:variable name="headeroffersblurb" select="headerOffer/@blurb" />
<xsl:variable name="offersLink" select="Template/heroModule/@url"/>
<xsl:variable name="version_num"><xsl:number value="position()" format="A" /></xsl:variable>
<xsl:variable name="version_num1"><xsl:number value="position()" format="1." /></xsl:variable>
<table width="802" cellpadding="1" cellspacing="3" border="0" align="center">
	<tr>
		<td width="802" bgcolor="#A3C2E0">
				<table width="800" cellpadding="3" cellspacing="0" border="0">
				<tr>
					<td width="800" bgcolor="#336699"><font face="arial, helvetica, sans serif" size="2" color="#ffffff">
						<a><xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute></a><b>Version:</b>&#160;&#160;<xsl:value-of select="@name" /><br />
						</font></td>
					<td width="48" bgcolor="#336699" align="right"><font face="arial, helvetica, sans serif" size="2" color="#ffffff"><a href="#top" style="color: #ffffff;">top</a> ^&#160;&#160;</font></td>
				</tr>
				<tr>
					<td colspan="2" width="800" bgcolor="#cccccc"><font face="arial, helvetica, sans serif" size="2" color="#000000">
						<b>Subject Line:</b>&#160;&#160;<xsl:if test="subjectText">
						<xsl:for-each select="subjectText">
								<xsl:value-of select="." /><br />
						</xsl:for-each>
					</xsl:if></font></td>
				</tr>
				</table></td>
	</tr>
</table>
				<!--tr>
					<td colspan="2" width="800" bgcolor="#FFFFFF"-->
	<xsl:comment>***************** START <xsl:value-of select="@name"/> TEMPLATE*****************</xsl:comment> 
<html>
<head>
<title>Expedia.com</title>
</head>
<body><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute>
	<table><xsl:attribute name="width"><xsl:if test="Template[@my:c_col='yes']">800</xsl:if><xsl:if test="Template[@my:c_col='no'] and Template/navTabs[@my:visible='no']">537</xsl:if></xsl:attribute><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">0</xsl:attribute><xsl:attribute name="align">center</xsl:attribute><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute>
	<tr>
		<td valign="top">
				<table cellpadding="0" cellspacing="0" border="0">
				<xsl:choose>
				<xsl:when test="Template/offerModule/searchWizard[@type='horizontal']">
				<tr>
					<td bgcolor="#ffffff" colspan="3" height="20" align="right" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
						<xsl:if test="Template/eyebrowOffer[@state='yes']">
						<xsl:for-each select="Template/eyebrowOffer">
						<b><xsl:value-of select="@eyebrowText" /></b>&#160;<a><xsl:attribute name="href"><xsl:value-of select="@link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">font-family: arial, helvetica, sans serif; font-size: 12px; color:  #336699;</xsl:attribute><xsl:value-of select="@eyebrowBlurb"  disable-output-escaping="yes" /></a><img src="http://www.expedia.com/eta/spaceit.gif" width="25" height="1" />
					</xsl:for-each></xsl:if>
					</td>
				</tr>
					<tr>
						<td bgcolor="#ffdf7b" colspan="3" align="left" valign="middle">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td align="left" valign="middle"><a href="http://www.expedia.com/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>cm_cruise_expe_ffffff.gif</xsl:attribute> <xsl:attribute name="width">258</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="height">37</xsl:attribute><xsl:attribute name="align">absmiddle</xsl:attribute><xsl:attribute name="alt">Expedia.com</xsl:attribute></img></a></td>
							<td width="542" align="left" valign="middle">
								<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="100%" valign="top">
										<form method="GET" name="etaExpress" action="http://expediamail.com/p/EXPEDIA_US/master_package/default.html">
											<input type="hidden" name="GOTO" value="PackageWiz" />
											<input type="hidden" name="emlcid" value="[+GET_LINK_CONST('OMNITURE_VAR')+]" />
											<input type="hidden" name="Numadult" value="1" />
											<input type="hidden" name="Numroom" value="1" />
										<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td height="3"></td>
										</tr>
										<tr>
											<td>
												<table cellpadding="0" cellspacing="2" border="0">
												<xsl:choose>
													<xsl:when test="Template/navTabs/navigation[@state='flight']">
													<tr>
													<td style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Select your choice(s):</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType1" value="fl"/>flights</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType2" value="hot"/>hotels</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType3" value="car"/>cars</td>
													</tr>
													</xsl:when>
													<xsl:when test="Template/navTabs/navigation[@state='hotel']">
													<tr>
													<td style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Select your choice(s):</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType1" value="fl"/>flights</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType2" value="hot"/>hotels</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType3" value="car"/>cars</td>
													</tr>													
													</xsl:when>
													<xsl:when test="Template/navTabs/navigation[@state='car']">
													<tr>
													<td style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Select your choice(s):</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType1" value="fl"/>flights</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType2" value="hot"/>hotels</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType3" value="car"/>cars</td>
													</tr>													
													</xsl:when>
													<xsl:when test="Template/navTabs/navigation[@state='package']">
													<tr>
													<td style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Select your choice(s):</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType1" value="fl"/>flights</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType2" value="hot"/>hotels</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType3" value="car"/>cars</td>
													</tr>													
													</xsl:when>
													<xsl:otherwise>
													<tr>
													<td style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Select your choice(s):</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType1" value="fl"/>flights</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType2" value="hot"/>hotels</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType3" value="car"/>cars</td>
													</tr>														
													</xsl:otherwise>
												</xsl:choose>
												</table>
												<table cellpadding="0" cellspacing="2" border="0">
												<tr>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing from:<br /><input maxlength="75" name="FrAirport" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:125px" value="" /></td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Depart Date:<br /><input maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:70px" value="mm/dd/yy" />&#160;&#160;</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Destination:<br /><input maxlength="75" name="DestName" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:125px" value="" /></td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Return Date:<br /><input maxlength="8" name="ToDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:70px" value="mm/dd/yy" />&#160;&#160;</td>
													<td valign="bottom">
														<table cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td>
															<td height="22" bgcolor="#0b8f46" valign="middle"><input name="GO" type="submit" value="Search" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:65;" /></td><td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td>														</tr>
														</table></td>
												</tr>
												</table></td>								
										</tr>				
										</table></form></td>									
								</tr>				
								</table>
						</td></tr></table></td>
					</tr>	
				</xsl:when>
				<xsl:otherwise>
					<tr>
					<td colspan="3" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold;">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td align="left" valign="bottom"><a href="http://www.expedia.com/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>cm_cruise_expe_<xsl:value-of select="Template/@color" />.gif</xsl:attribute> <xsl:attribute name="width">258</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="height">37</xsl:attribute><xsl:attribute name="align">absmiddle</xsl:attribute><xsl:attribute name="alt">Expedia.com</xsl:attribute></img></a></td><td width="100%" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
					<xsl:if test="Template/eyebrowOffer[@state='yes']">
					<xsl:for-each select="Template/eyebrowOffer">
						<b><xsl:value-of select="@eyebrowText" /></b>&#160;<a><xsl:attribute name="href"><xsl:value-of select="@link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">font-family: arial, helvetica, sans serif; font-size: 12px; color: #<xsl:choose>
							<xsl:when test="../@color='669ad0'">ffffff</xsl:when>
							<xsl:when test="../@color='ffffff'">336699</xsl:when>
						</xsl:choose>; </xsl:attribute><xsl:value-of select="@eyebrowBlurb"  disable-output-escaping="yes" /></a>
					</xsl:for-each></xsl:if></td></tr></table></td>
					</tr>
					<tr>
						<td colspan="3" height="10"></td>
					</tr>
				</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="Template/navTabs[@my:visible='yes']">	
				<tr>
					<td width="52" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
					<td><xsl:attribute name="width">530</xsl:attribute><xsl:attribute name="height">24</xsl:attribute><xsl:attribute name="align">left</xsl:attribute><xsl:if test="Template/offerModule/searchWizard[@type!='horizontal']"><xsl:attribute name="valign">bottom</xsl:attribute></xsl:if><xsl:if test="Template/offerModule/searchWizard[@type='horizontal']"><xsl:attribute name="valign">top</xsl:attribute></xsl:if><xsl:attribute name="style">font-size: 12px; color: #31339A; text-decoration: none;</xsl:attribute>
						<table width="628" cellpadding="4" cellspacing="0" border="0">
						<tr>
						<xsl:for-each select="Template/navTabs">
							<xsl:choose>
							<xsl:when test="navigation[@state='flight']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#ffdf7b"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/business/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>business travel</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='hotel']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#ffdf7b"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/business/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>business travel</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='car']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"  bgcolor="#ffdf7b"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/business/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>business travel</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='package']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#ffdf7b"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/business/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>business travel</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='cruise']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#ffdf7b"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/business/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>business travel</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='activity']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#ffdf7b"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/business/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>business travel</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='deal']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#ffdf7b"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/business/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>business travel</nobr></a></td>
							</xsl:when>
							<xsl:otherwise><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/business/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>business travel</nobr></a></td></xsl:otherwise>
					</xsl:choose>					
					</xsl:for-each>
					</tr></table></td>
					<td width="80" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="80" height="1" /></td>
		</tr>
		<xsl:if test="Template/offerModule/searchWizard[@type!='horizontal']">
		<tr>
			<td width="800" colspan="3" height="8" bgcolor="#ffdf7b" valign="top"></td>
		</tr>
		<tr>
			<td colspan="3" width="800" height="2" valign="top" bgcolor="#ffffff"></td>
		</tr>
		</xsl:if>
		<xsl:if test="Template/offerModule/searchWizard[@type='horizontal']">
		<tr>
			<td colspan="3" width="800" height="5" valign="top" bgcolor="#ffffff"></td>
		</tr>
		</xsl:if>
		</xsl:if>
		</table>
		<xsl:if test="Template/heroModule/@size='pc'">
		<table width="800" cellpadding="1" cellspacing="0" border="0">
		<tr>
			<td bgcolor="#d7dce8">
				<table width="798" cellpadding="0" cellspacing="0" border="0">
				<tr>
						<td width="798" bgcolor="#f1f4f7">
						<table cellpadding="0" cellspacing="5" border="0">
						<tr><td><a><xsl:attribute name="href"><xsl:value-of select="Template/heroModule/@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../@type" /><xsl:value-of select="../ID/@issue" />_hero_<xsl:value-of select="Template/heroModule/@size" />_<xsl:value-of select="$version_num1" /><xsl:value-of select="Template/heroModule/@imgType" /></xsl:attribute> <xsl:attribute name="width">788</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="Template/heroModule/@altText"/></xsl:attribute></img></a>
						<!--xsl:attribute name="valign">top</xsl:attribute><xsl:attribute name="width">788</xsl:attribute><xsl:attribute name="height">359</xsl:attribute><xsl:attribute name="background"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../@type" /><xsl:value-of select="../ID/@issue" />_hero_<xsl:value-of select="Template/heroModule/@size" />_<xsl:value-of select="$version_num1" /><xsl:value-of select="Template/heroModule/@imgType" /></xsl:attribute-->
						<!--start postcard test only-->
								<!--xsl:if test="$version_num1 = 1">
								<table cellpadding="0" cellspacing="0" border="0" width="788">
								<tr>
									<td colspan="3" height="170"></td>
								</tr>
								<tr>
									<td width="75"></td><td width="350" style="font-family: arial, helvetica, sans serif; color: #000000; font-size: 12px; line-height:20px;"><xsl:for-each select="Template/heroModule/para">
										<xsl:value-of select="."  disable-output-escaping="yes" /><xsl:if test="not(position() = last())"><br /></xsl:if></xsl:for-each></td><td width="353"></td>
								</tr>
								</table></xsl:if>
								<xsl:if test="$version_num1 = 2">
								<table cellpadding="0" cellspacing="0" border="0" width="788">
								<tr>
									<td colspan="3" height="115"></td>
								</tr>
								<tr>
									<td width="68"></td><td width="350" style="font-family: arial, helvetica, sans serif; color: #000000; font-size: 12px; line-height:20px;"><xsl:for-each select="Template/heroModule/para">
										<xsl:value-of select="."  disable-output-escaping="yes" /><xsl:if test="not(position() = last())"><br /></xsl:if></xsl:for-each></td><td width="360"></td>
								</tr>
								</table></xsl:if-->
						<!--end postcard test only--></td></tr></table></td></tr>
				</table></td>
				</tr>
		</table>
		</xsl:if>
		<xsl:if test="Template/heroModule/@size!='pc'">
		<table><xsl:attribute name="width"><xsl:if test="Template[@my:c_col='yes']">800</xsl:if><xsl:if test="Template[@my:c_col='no'] and Template/navTabs[@my:visible='no']">527</xsl:if></xsl:attribute><xsl:attribute name="cellpadding">1</xsl:attribute><xsl:attribute name="cellspacing">0</xsl:attribute><xsl:attribute name="border">0</xsl:attribute>
		<tr>
			<td><xsl:attribute name="width"><xsl:if test="Template[@my:c_col='yes']">800</xsl:if><xsl:if test="Template[@my:c_col='no'] and Template/navTabs[@my:visible='no']">527</xsl:if></xsl:attribute><xsl:attribute name="bgcolor">#d7dce8</xsl:attribute>
				<table><xsl:attribute name="width"><xsl:if test="Template[@my:c_col='yes']">798</xsl:if><xsl:if test="Template[@my:c_col='no'] and Template/navTabs[@my:visible='no']">525</xsl:if></xsl:attribute><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">0</xsl:attribute><xsl:attribute name="border">0</xsl:attribute>	
				<tr>
					<td valign="top" width="525" bgcolor="#f1f4f7">
						<table cellpadding="0" cellspacing="5" border="0">
						<tr>
							<td align="left" valign="top">
								<table cellpadding="0" cellspacing="0" border="0">
								<xsl:if test="Template[@my:show='yes']">
								<xsl:if test="Template[@crm='MER']">
								<xsl:if test="Template/heroModule">
								<xsl:for-each select="Template/heroModule">
								<!--start postcard test only-->
								<!--xsl:if test="@size='pclg'">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" border="0">
										<tr><td><xsl:attribute name="valign">top</xsl:attribute><xsl:attribute name="width">525</xsl:attribute><xsl:attribute name="height">359</xsl:attribute><xsl:attribute name="background"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../@type" /><xsl:value-of select="../../../ID/@issue" />_hero_<xsl:value-of select="@size" />_<xsl:value-of select="$version_num1" /><xsl:value-of select="@imgType" /></xsl:attribute>
										<table cellpadding="0" cellspacing="0" border="0" width="525">
										<tr>
											<td colspan="3" height="115"></td>
										</tr>
										<tr>
											<td width="35"></td><td width="350" style="font-family: arial, helvetica, sans serif; color: #000000; font-size: 12px; line-height:20px;"><xsl:for-each select="para">
											<xsl:value-of select="."  disable-output-escaping="yes" /><xsl:if test="not(position() = last())"><br /></xsl:if></xsl:for-each></td><td width="135"></td>
										</tr>
										</table></td>
										</tr>
										</table></td>
								</tr>
								<tr>
									<td height="5" bgcolor="#f1f4f7"></td>
								</tr>
								</xsl:if-->
								<!--end postcard test only-->
								<xsl:if test="@size='lg'">
								<tr>
									<td>
									
										<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../@type" /><xsl:value-of select="../../../ID/@issue" />_hero_<xsl:value-of select="@size" />_<xsl:value-of select="$version_num1" /><xsl:value-of select="@imgType" /></xsl:attribute> <xsl:attribute name="width">525</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"/></xsl:attribute></img></a></td>
								</tr>
								<tr>
									<td height="5" bgcolor="#f1f4f7"></td>
								</tr>
								</xsl:if>
								<xsl:if test="@size='sm'">
								<tr>
									<td>
									<xsl:if test="@my:align='aleft'">
										<table width="525" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td width="260" valign="top">
												<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../@type" /><xsl:value-of select="../../../ID/@issue" />_hero_<xsl:value-of select="@size" />_<xsl:value-of select="$version_num1" /><xsl:value-of select="@imgType" /></xsl:attribute> <xsl:attribute name="width">260</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"/></xsl:attribute></img></a></td><td width="5" bgcolor="#f1f4f7"></td>
											<td width="260" valign="top">
												<table width="260" cellpadding="1" cellspacing="0" border="0">
												<tr>
													<td width="258" bgcolor="#d7dce8">
														<table width="100%" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td bgcolor="#ffffff" valign="top" background="http://www.expedia.com/eta/spaceit.gif" height="192">
																<table cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td height="100%" valign="top">
																		<xsl:if test="@my:headline='yes'">
																		<div style="font-family: arial, helvetica, sans serif; font-size: 16px; color: #cc6600; font-weight: bold;">
																		<xsl:for-each select="headline"><xsl:value-of select="."  disable-output-escaping="yes" /><br/></xsl:for-each></div></xsl:if>
																		<xsl:if test="@my:subheadline='yes'">
																		<div style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;">
																		<xsl:for-each select="my:subheadline"><xsl:value-of select="."  disable-output-escaping="yes" /><br/></xsl:for-each></div></xsl:if>
																		<div style="font-family: arial, helvetica, sans serif; color: #000000; font-size: 12px;">
																		<xsl:if test="para">
																		<xsl:for-each select="para">
																			<xsl:value-of select="."  disable-output-escaping="yes" /><xsl:if test="not(position() = last())"><br /><br /></xsl:if>
																		</xsl:for-each>
																	</xsl:if>
																	</div></td>
																</tr>
																</table>
															</td>
														</tr>
														</table>
													</td>
												</tr>
												</table>
											</td>
										</tr>
										</table></xsl:if>
										<xsl:if test="@my:align='aright'">
										<table width="525" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td width="260" valign="top">
												<table width="260" cellpadding="1" cellspacing="0" border="0">
												<tr>
													<td width="258" bgcolor="#d7dce8">
														<table width="100%" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td bgcolor="#ffffff" valign="top" background="http://www.expedia.com/eta/spaceit.gif" height="192">
																<table cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td height="100%" valign="top">
																		<xsl:if test="@my:headline='yes'">
																		<span style="font-family: arial, helvetica, sans serif; font-size: 16px; color: #cc6600; font-weight: bold;">
																		<xsl:for-each select="headline"><xsl:value-of select="."  disable-output-escaping="yes" /><br/></xsl:for-each></span></xsl:if>
																		<xsl:if test="@my:subheadline='yes'">
																		<span style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;">
																		<xsl:for-each select="my:subheadline"><xsl:value-of select="."  disable-output-escaping="yes" /><br/></xsl:for-each></span></xsl:if>
																		<span style="font-family: arial, helvetica, sans serif; color: #000000; font-size: 12px;">
																		<xsl:if test="para"><br />
																		<xsl:for-each select="para">
																			<xsl:value-of select="."  disable-output-escaping="yes" /><xsl:if test="not(position() = last())"><br /><br /></xsl:if>
																		</xsl:for-each>
																	</xsl:if>
																	</span></td>
																</tr>
																</table>
															</td>
														</tr>
														</table>
													</td>
												</tr>
												</table></td><td width="5" bgcolor="#f1f4f7"></td>
											<td width="260" valign="top"><a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../@type" /><xsl:value-of select="../../../ID/@issue" />_hero_<xsl:value-of select="@size" />_<xsl:value-of select="$version_num1" /><xsl:value-of select="@imgType" /></xsl:attribute> <xsl:attribute name="width">260</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"/></xsl:attribute></img></a></td>
										</tr>
										</table></xsl:if>
										<xsl:if test="@my:align='split'">
										<table width="525" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td width="260" valign="top">
												<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../@type" /><xsl:value-of select="../../../ID/@issue" />_hero_<xsl:value-of select="@size" />_<xsl:value-of select="$version_num1" /><xsl:value-of select="@imgType" /></xsl:attribute> <xsl:attribute name="width">260</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"/></xsl:attribute></img></a></td><td width="5" bgcolor="#f1f4f7"></td>
											<td width="260" valign="top"><a><xsl:attribute name="href"><xsl:value-of select="my:heroGraphic2/@my:url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../@type" /><xsl:value-of select="../../../ID/@issue" />_hero_<xsl:value-of select="@size" />_<xsl:value-of select="$version_num1 + 1"/><xsl:text>.</xsl:text><xsl:value-of select="my:heroGraphic2/@my:imgType" /></xsl:attribute> <xsl:attribute name="width">260</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="my:heroGraphic2/@my:altText"/></xsl:attribute></img></a></td>
										</tr>
										</table></xsl:if></td>
								</tr>
								<tr>
									<td height="5" bgcolor="#f1f4f7"></td>
								</tr>
								</xsl:if>
								</xsl:for-each></xsl:if></xsl:if>
								</xsl:if>
								<xsl:if test="Template/mainModule">
								<xsl:for-each select="Template/mainModule">
								<tr>
									<td valign="top">
										<xsl:if test="@my:headerbar='yes' and @headlineText='yes'">
										<table width="525" cellpadding="0" cellspacing="0" border="0" bgcolor="#c1cfe2">
										<tr>
											<td width="10"></td>
											<td height="28" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #336699; font-weight: bold;"><xsl:value-of select="headline"  disable-output-escaping="yes" /></td>
											<td width="10"></td>
										</tr>
										</table>
										</xsl:if>
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
																<tr>
																	<td valign="top">
																	<xsl:if test="@my:logo='yes'">
																	<xsl:if test="my:logo">
																	<xsl:for-each select="my:logo">
																	<table align="right" cellpadding="0" cellspacing="0" border="0"><tr><td align="left" valign="top"><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="my:image" /></xsl:attribute> <xsl:attribute name="width"><xsl:value-of select="my:width" /></xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="my:altText"/></xsl:attribute></img></td></tr></table>
																	</xsl:for-each>
																	</xsl:if>
																</xsl:if>
																<xsl:if test="@headlineText='yes' and @my:headerbar='no'">
																<xsl:for-each select="headline">
																	<span style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;"><xsl:value-of select="."  disable-output-escaping="yes" /><br/></span>									
																</xsl:for-each>
																</xsl:if>
																<xsl:if test="@message='yes'">
																<xsl:if test="para"><span style="height:3px;"/>
																<xsl:for-each select="para">
																	<span style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																	<xsl:value-of select="."  disable-output-escaping="yes" /><xsl:if test="not(position() = last())"><br /><br /></xsl:if></span>
																</xsl:for-each>
																</xsl:if>
																</xsl:if></td>
																</tr></table>
																<xsl:if test="@offers='yes'">
																<table width="503" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td height="3"></td>
																</tr>
																<tr>
																	<td>
																<xsl:if test="offerGroup">
																<xsl:for-each select="offerGroup">
																<xsl:if test="@destOffer='yes'">
																<xsl:if test="my:destGroup">
																<xsl:for-each select="my:destGroup">
																<table width="100%" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td width="100%" style="FONT-FAMILY: arial, helvetica, sans serif;  FONT-SIZE: 12px;"><a><xsl:attribute name="href"><xsl:value-of select="@my:link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699; </xsl:attribute><b><xsl:value-of select="@my:destination"  disable-output-escaping="yes" /></b></a>&#160;<xsl:value-of select="@my:blurb"  disable-output-escaping="yes" /></td>
																</tr>	
																<tr>
																	<td height="3"></td>
																</tr>
																</table></xsl:for-each></xsl:if>
																</xsl:if>
																<xsl:if test="../@package='yes'">
																<xsl:if test="position()mod 2 = 1"></xsl:if>
																<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="position()mod 2 = 1"><xsl:attribute name="bgcolor">#fffaee</xsl:attribute></xsl:if>
																<tr>		
																	<td width="525">
																		<xsl:if test="offer">
																		<xsl:for-each select="offer">
																		<table width="100%" cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
																		<a><xsl:attribute name="href"><xsl:value-of select="@link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:value-of select="@text"  disable-output-escaping="yes" /></a>
																		<xsl:choose>
																		<xsl:when test="@star='1_0'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar10.gif" alt="1 star" width="11" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='1_5'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar15.gif" alt="1 1/2 star" width="22" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='2_0'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar20.gif"  alt="2 stars" width="22" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='2_5'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar25.gif" alt="2 1/2 stars" width="33" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='3_0'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar30.gif" alt="3 stars" width="33" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='3_5'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar35.gif" alt="3 1/2 stars" width="44" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='4_0'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar40.gif" alt="4 stars" width="44" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='4_5'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar45.gif" alt="4 1/2 stars" width="55" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='5_0'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar50.gif" alt="5 stars" width="55" height="10" border="0" />
																		</xsl:when>
																		<xsl:otherwise></xsl:otherwise>
																		</xsl:choose>&#160;<xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br /></td>
																<xsl:if test="../../@my:pricecol = 'yes'">
																	<td width="20%" align="center" style="font-family: arial, helvetica, sans serif; font-size: 12px;"><a><xsl:attribute name="href"><xsl:choose>
																				<xsl:when test="@link != ''"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:when>
																				<xsl:otherwise><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:otherwise>
																				</xsl:choose></xsl:attribute>
																			<xsl:attribute name="style">color: #cc6600;</xsl:attribute><b>$<xsl:value-of select="@my:price" disable-output-escaping="yes"/>+</b></a></td>
																</xsl:if></tr></table></xsl:for-each>
																</xsl:if></td>
																
																</tr>
																</table></xsl:if><xsl:if test="../@package='no'">	
																<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute>
																<tr>		
																	<td width="525">
																		<xsl:if test="offer">
																		<xsl:for-each select="offer">
																		<table width="100%" cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
																		<a><xsl:attribute name="href"><xsl:value-of select="@link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:value-of select="@text"  disable-output-escaping="yes" /></a> 
																		<xsl:choose>
																		<xsl:when test="@star='1_0'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar10.gif" alt="1 star" width="11" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='1_5'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar15.gif" alt="1 1/2 star" width="22" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='2_0'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar20.gif"  alt="2 stars" width="22" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='2_5'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar25.gif" alt="2 1/2 stars" width="33" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='3_0'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar30.gif" alt="3 stars" width="33" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='3_5'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar35.gif" alt="3 1/2 stars" width="44" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='4_0'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar40.gif" alt="4 stars" width="44" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='4_5'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar45.gif" alt="4 1/2 stars" width="55" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="@star='5_0'">
																			&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar50.gif" alt="5 stars" width="55" height="10" border="0" />
																		</xsl:when>
																		<xsl:otherwise></xsl:otherwise>
																		</xsl:choose>&#160;<xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br /></td>
																</tr></table></xsl:for-each>
																</xsl:if></td>
																</tr>
																</table></xsl:if></xsl:for-each>
																</xsl:if>
																</td>
																</tr>
																<tr>
																	<td height="3"></td>
																</tr>
																</table>
																</xsl:if>
																<xsl:if test="callToAction[@show='yes']">
																<xsl:for-each select="callToAction">
																<table width="503" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td colspan="2" height="3"></td>
																</tr>
																<tr>
																	<td bgcolor="#ffffff" style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																		<a><xsl:attribute name="href"><xsl:choose>
		<xsl:when test="@link != ''"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:when>
		<xsl:otherwise><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:otherwise>
	</xsl:choose></xsl:attribute>
																		<img src="http://media.expedia.com/media/content/expus/graphics/mail/etm_shopper_arrow_2.gif" width="14" height="15" border="0" alt="" align="absmiddle" /></a>&#160;<a><xsl:attribute name="href"><xsl:choose>
		<xsl:when test="@link != ''"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:when>
		<xsl:otherwise><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:otherwise>
	</xsl:choose></xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="@content"  disable-output-escaping="yes" /></b></a></td>
																</tr>
																</table>
																</xsl:for-each>
																</xsl:if>
																<xsl:if test="marketingXtras[@show='yes']">
																<table width="503" cellpadding="0" cellspacing="0" border="0">
																<xsl:for-each select="marketingXtras">
																<tr>
																	<td bgcolor="#ffffff" style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																		<br /><xsl:value-of select="."  disable-output-escaping="yes" /><br /></td>
																</tr>
																</xsl:for-each>
																</table>
																</xsl:if>
																</td>
														</tr>
														</table></td>
												</tr>
												</table></td>
										</tr>
										</table></td>
							</tr>
							<xsl:if test="not(position() = last())">
							<tr>
								<td height="5" bgcolor="#f1f4f7"></td>
							</tr>
							</xsl:if>
							</xsl:for-each>
							</xsl:if>
							<xsl:if test="Template[@crm='CER']">
								<xsl:if test="Template/heroModule[@size='lg']">
								<tr>
									<td height="5" bgcolor="#f1f4f7"></td>
								</tr>
								<tr>
									<td>
										<a><xsl:attribute name="href"><xsl:value-of select="Template/heroModule/@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../@type" /><xsl:value-of select="../ID/@issue" />_hero_<xsl:value-of select="Template/heroModule/@size" />_<xsl:number value="position()" format="1." /><xsl:value-of select="Template/heroModule/@imgType" /></xsl:attribute> <xsl:attribute name="width">525</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="Template/heroModule/@altText"/></xsl:attribute></img></a></td>
								</tr>
								</xsl:if></xsl:if>	
							</table></td>
							<xsl:if test="Template[@my:c_col='yes']">
							<td width="260" valign="top" align="left" bgcolor="#f1f4f7">
							<xsl:if test="Template/offerModule">
							<xsl:for-each select="Template/offerModule">
							<xsl:if test="@wizard='yes'">
							<xsl:if test="searchWizard">
							<xsl:for-each select="searchWizard">	
							<xsl:if test="@my:heroimage='yes'">
							<table width="258" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td><a><xsl:attribute name="href"><xsl:value-of select="@my:wiz_link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../../@type" /><xsl:value-of select="../../../../ID/@issue" />_wizhero_<xsl:number value="position()" format="1" />.jpg</xsl:attribute> <xsl:attribute name="width">258</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"><xsl:value-of select="@my:wiz_altText"/></xsl:attribute></img></a></td>
							</tr>
							</table>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="@type='dual_btn_ffh'">
									<table width="256" cellpadding="0" cellspacing="0" border="0">
									<tr>
									<td valign="top">
										<table width="256" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
												<table width="256" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td>
														<table width="100%" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td align="left" bgcolor="#f1f4f7">
																<table width="100%" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td colspan="2" height="30" bgcolor="#f1f4f7"></td>
																</tr>
																<tr>
																	<td colspan="2" align="left" height="28" bgcolor="#7694bf">
																		<table width="166" cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td width="151" align="right" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Search now:</td><td bgcolor="#7694bf" width="15"></td>
																		</tr>
																		</table></td>
																</tr>
																<tr>
																	<td width="1" bgcolor="#d7dce8"></td><td width="165" height="17" bgcolor="#fffaee"></td>
																</tr>
																</table></td>
															<td align="left"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img src="http://media.expedia.com/media/content/expus/graphics/mail/MMN_TR_03_search_fares.gif" width="90" height="75" border="0" alt="Find Low Fares!" /></a></td>
														</tr>
														</table></td>
												</tr>
												<tr>
													<td align="left">
														<table width="256" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="1" bgcolor="#d7dce8"></td>
															<td width="254" valign="top" bgcolor="#fffaee">
																<form method="GET" name="etaExpress" action="http://expediamail.com/p/EXPEDIA_US/TR_dual_button_wizard/default.html">
																<input type="hidden" name="GOTO" value="PackageWiz" />
																<input type="hidden" name="emlcid" value="[+GET_LINK_CONST('OMNITURE_VAR')+]" />
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
														</table>
														<input type="hidden" name="Numadult" value="1" />
														<input type="hidden" name="Numroom" value="1" />
														</form></td>	
														<td width="1" bgcolor="#d7dce8"></td>						
														</tr>
														<tr>
															<td colspan="3" height="1" bgcolor="#d7dce8"></td>
														</tr>				
														</table></td>									
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
								</xsl:when>
								<xsl:when test="@type='dual_btn_hfh'">
									<table width="256" cellpadding="0" cellspacing="0" border="0">
									<tr>
									<td valign="top">
										<table width="256" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
												<table width="256" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td>
														<table width="100%" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td align="left" bgcolor="#f1f4f7">
																<table width="100%" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td colspan="2" height="30" bgcolor="#f1f4f7"></td>
																</tr>
																<tr>
																	<td colspan="2" align="left" height="28" bgcolor="#7694bf">
																		<table width="166" cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td width="151" align="right" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Search now:</td><td bgcolor="#7694bf" width="15"></td>
																		</tr>
																		</table></td>
																</tr>
																<tr>
																	<td width="1" bgcolor="#d7dce8"></td><td width="165" height="17" bgcolor="#fffaee"></td>
																</tr>
																</table></td>
															<td align="left"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img src="http://media.expedia.com/media/content/expus/graphics/mail/MMN_TR_03_search_fares.gif" width="90" height="75" border="0" alt="Find Low Fares!" /></a></td>
														</tr>
														</table></td>
												</tr>
												<tr>
													<td align="left">
														<table width="256" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="1" bgcolor="#d7dce8"></td>
															<td width="254" valign="top" bgcolor="#fffaee">
																<form method="GET" name="etaExpress" action="http://expediamail.com/p/EXPEDIA_US/CM_dual_button_wizard/default.html">
																<input type="hidden" name="GOTO" value="PackageWiz" />
																<input type="hidden" name="emlcid" value="[+GET_LINK_CONST('OMNITURE_VAR')+]" />
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
																						<tr><td height="22"><input name="GOHotel" type="image" value="Search hotel" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td><td align="left" height="22" bgcolor="#0b8f46" valign="middle"><input name="GOHotel" type="submit" value="Search hotel" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:75;"/></td><td height="22"><input name="GOHotel" type="image" value="Search hotel" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td></tr>
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
														</table>
														<input type="hidden" name="Numadult" value="1" />
														<input type="hidden" name="Numroom" value="1" />
														</form></td>	
														<td width="1" bgcolor="#d7dce8"></td>						
														</tr>
														<tr>
															<td colspan="3" height="1" bgcolor="#d7dce8"></td>
														</tr>				
														</table></td>									
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
								</xsl:when>
								<xsl:when test="@type='flight'">
									<table width="258" cellpadding="0" cellspacing="0" border="0">
									<tr>
									<td valign="top">
										<table width="256" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td bgcolor="#d7dce8">
												<table width="256" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td>
														<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#7694bf">
														<tr>
															<td width="10"></td>
															<td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Find your flight</td>
															<td width="10"></td>
														</tr>
														</table></td>
												</tr>
												<tr>
													<td align="left">
														<table width="256" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="25" valign="top" bgcolor="#d7dce8"></td>
															<td width="206" valign="top" bgcolor="#d7dce8">
																<form method="GET" name="etaExpress" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
																<input type="hidden" name="GOTO" value="EXPFLTWIZ" />
																<input type="hidden" name="Airline"><xsl:attribute name="value"><xsl:value-of select="@clientCode" /></xsl:attribute></input>
																<table width="206" align="center" cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td>
																		<table cellpadding="0" cellspacing="2" border="0">
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing from:<br /><input maxlength="75" name="FrAirport" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:190px" value="" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Depart Date:<br /><input maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:90px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Destination:<br /><input maxlength="75" name="Toairport" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:190px" value="" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Return Date:<br /><input maxlength="8" name="ToDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:90px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" valign="top" type="NOWRAP">
																				<table width="206" cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Adult(s):<br />
																						<select name="Numadult" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:40px;">
																						<option selected="selected">1</option>
																						<option>2</option>
																						<option>3</option>
																						<option>4</option>
																						<option>5</option>
																						<option>6</option></select></td>
																					<td width="10"></td>
																					<td align="left" valign="bottom" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000;"><br />
																					<table cellpadding="0" cellspacing="0" border="0">
																					<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td>
																							<td height="22" bgcolor="#0b8f46" valign="middle"><input name="GO" type="submit" value="Search flight" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:95;" /></td><td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td>					
																						</tr>
																						</table></td>
																				</tr>
																					</table></td>
																				</tr>
																				</table></td>
																		</tr>
																		</table></td>
																</tr>
																</table></form></td>
															<td width="25" valign="top" bgcolor="#d7dce8"></td>									
														</tr>				
														</table></td>									
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
								</xsl:when>
								<xsl:when test="@type='hotel'">
									<table width="258" cellpadding="0" cellspacing="0" border="0">
									<tr>
									<td valign="top">
										<table width="256" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td bgcolor="#d7dce8">
												<table width="256" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td>
														<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#7694bf">
														<tr>
															<td width="10"></td>
															<td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Find your hotel</td>
															<td width="10"></td>
														</tr>
														</table></td>
												</tr>
												<tr>
													<td align="left">
														<table width="256" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="25" valign="top" bgcolor="#d7dce8"></td>
															<td width="206" valign="top" bgcolor="#d7dce8">
																<form method="GET" name="etaExpress" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
																<input type="hidden" name="GOTO" value="HOTSEARCH" />
																<input type="hidden" name="ChainName"><xsl:attribute name="value"><xsl:value-of select="@clientCode" /></xsl:attribute></input>
																<table width="206" align="center" cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td>
																		<table cellpadding="0" cellspacing="2" border="0">
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Destination City:<br /><input maxlength="75" name="CityName" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:180px" value="" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Check-in date:<br /><input maxlength="8" name="InDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:100px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Check-out date:<br /><input maxlength="8" name="OutDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:100px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" valign="top" type="NOWRAP">
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Room(s):<br />
																						<select name="NumRoom" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:40px;">
																						<option selected="selected">1</option>
																						<option>2</option>
																						<option>3</option>
																						<option>4</option>
																						<option>5</option>
																						<option>6</option></select></td>
																					<td width="10"></td>
																					<td align="left" valign="bottom" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000;"><br />
																					<table cellpadding="0" cellspacing="0" border="0">
																					<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td>
																							<td height="22" bgcolor="#0b8f46" valign="middle"><input name="GO" type="submit" value="Search hotel" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:95;" /></td><td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td>					
																						</tr>
																						</table></td>
																				</tr>
																					</table></td>
																				</tr>
																				</table></td>
																		</tr>
																		</table></td>
																</tr>
																</table></form></td>
															<td width="25" valign="top" bgcolor="#d7dce8"></td>									
														</tr>				
														</table></td>									
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
								</xsl:when>
								<xsl:when test="@type='car'">
									<table width="258" cellpadding="0" cellspacing="0" border="0">
									<tr>
									<td valign="top">
										<table width="256" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td bgcolor="#d7dce8">
												<table width="256" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td>
														<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#7694bf">
														<tr>
															<td width="10"></td>
															<td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Find your car</td>
															<td width="10"></td>
														</tr>
														</table></td>
												</tr>
												<tr>
													<td align="left">
														<table width="256" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="25" valign="top" bgcolor="#d7dce8"></td>
															<td width="206" valign="top" bgcolor="#d7dce8">
																<form method="GET" name="etaExpress" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
																<input type="hidden" name="GOTO" value="CARSEARCH" />
																<input type="hidden" name="Renter"><xsl:attribute name="value"><xsl:value-of select="@my:carCode" /></xsl:attribute></input>
																<table width="206" align="center" cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td>
																		<table cellpadding="0" cellspacing="2" border="0">
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Pick-up airport or city:<br /><input maxlength="75" name="PickUpLoc" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:180px" value="" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Pick-up date:<br /><input maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:100px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Drop-off airport or city:<br /><input maxlength="75" name="DropLoc" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:180px" value="" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Drop-off date:<br /><input maxlength="8" name="ToDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:100px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Car type:<br />
																				<select name="Class" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:100px;">
																				<option selected="selected">NoPreference</option>
																				<option>Economy</option>
																				<option>Compact</option>
																				<option>MidSize</option>
																				<option>Standard</option>
																				<option>FullSize</option>
																				<option>Premium</option>
																				<option>Luxury</option>
																				<option>Convertible</option>
																				<option>MiniVan</option>
																				<option>SUV</option>
																				<option>SportsCar</option></select></td>
																		</tr>
																		<tr>
																			<td align="left" valign="bottom" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000;"><br />
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td>
																							<td height="22" bgcolor="#0b8f46" valign="middle"><input name="GO" type="submit" value="Search car" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:90;" /></td><td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td>					
																						</tr>
																						</table></td>
																				</tr>
																				</table></td>
																		</tr>
																		</table></td>
																</tr>
																</table></form></td>
															<td width="25" valign="top" bgcolor="#d7dce8"></td>									
														</tr>				
														</table></td>									
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
								</xsl:when>
								<xsl:when test="@type='package'">
									<table width="258" cellpadding="0" cellspacing="0" border="0">
									<tr>
									<td valign="top">
										<table width="256" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td bgcolor="#d7dce8">
												<table width="256" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td>
														<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#7694bf">
														<tr>
															<td width="10"></td>
															<td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Build your trip</td>
															<td width="10"></td>
														</tr>
														</table></td>
												</tr>
												<tr>
													<td align="left">
														<table width="256" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="15" valign="top" bgcolor="#d7dce8"></td>
															<td width="226" valign="top" bgcolor="#d7dce8">
																<form method="GET" name="etaExpress" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
																<input type="hidden" name="GOTO" value="PackageWiz" />
																<table width="226" align="center" cellpadding="0" cellspacing="10" border="0">
																<tr>
																<td align="left">
																	<table cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="radio" name="PackageType" value="2" checked="checked"/>&#160;Flight + Hotel</td>
																		<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="radio" name="PackageType" value="5"/>&#160;Flight + Car</td>
																	</tr>
																	<tr>
																		<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="radio" name="PackageType" value="3"/>&#160;Hotel + Car</td>
																		<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="radio" name="PackageType" value="1"/>&#160;Flight + Hotel + Car</td>
																	</tr>
																	</table></td>
																</tr>
																<tr>
																	<td>
																		<table cellpadding="0" cellspacing="2" border="0">
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing from:<br /><input maxlength="75" name="FrAirport" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:190px" value="" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Depart Date:<br /><input maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:90px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Destination:<br /><input maxlength="75" name="DestName" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:190px" value="" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Return Date:<br /><input maxlength="8" name="ToDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:90px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" valign="top" type="NOWRAP">
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Adults:<br />
																						<select name="Numadult" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:40px;">
																						<option>1</option>
																						<option selected="selected">2</option>
																						<option>3</option>
																						<option>4</option>
																						<option>5</option>
																						<option>6</option></select>
																					</td>
																					<td width="10"></td>
																					<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Rooms:<br />
																						<select name="Numroom" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:40px;">
																						<option selected="selected">1</option>
																						<option>2</option>
																						<option>3</option>
																						<option>4</option>
																						<option>5</option>
																						<option>6</option></select>
																					</td>
																					<td width="10"></td>
																					<td align="right" valign="bottom" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000;">
																					<table cellpadding="0" cellspacing="0" border="0">
																					<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td>
																							<td height="22" bgcolor="#0b8f46" valign="middle"><input name="GO" type="submit" value="Search" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:65;" /></td><td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td>					
																						</tr>
																						</table></td>
																				</tr>
																				</table></td>																					
																				</tr>
																				</table></td>
																		</tr>
																		</table></td>
																</tr>
																</table></form></td>
															<td width="15" valign="top" bgcolor="#d7dce8"></td>									
														</tr>				
														</table></td>									
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
								</xsl:when>
									<xsl:when test="@type='allpackage'">
									<table width="258" cellpadding="0" cellspacing="0" border="0">
									<tr>
									<td valign="top">
										<table width="256" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td bgcolor="#d7dce8">
												<table width="256" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td>
														<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#7694bf">
														<tr>
															<td width="10"></td>
															<td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Build your trip</td>
															<td width="10"></td>
														</tr>
														</table></td>
												</tr>
												<tr>
													<td align="left">
														<table width="256" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="100%" valign="top" bgcolor="#d7dce8">
																<form method="GET" name="etaExpress" action="http://expediamail.com/p/EXPEDIA_US/master_package/default.html">
																<input type="hidden" name="GOTO" value="PackageWiz" />
																<input type="hidden" name="emlcid" value="[+GET_LINK_CONST('OMNITURE_VAR')+]" />
																<input type="hidden" name="Numadult" value="1" />
																<input type="hidden" name="Numroom" value="1" />
																<table align="center" cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td><table cellpadding="0" cellspacing="2" border="0">
																	<tr>
																		<td colspan="3" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Select your choice(s) below:</td>
																	</tr>
													<xsl:choose>
													<xsl:when test="../../navTabs/navigation[@state='flight']">
													<tr>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType1" value="fl"/>flights</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType2" value="hot"/>hotels</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType3" value="car"/>cars</td>
													</tr>
													</xsl:when>
													<xsl:when test="../../navTabs/navigation[@state='hotel']">
													<tr>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType1" value="fl"/>flights</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType2" value="hot"/>hotels</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType3" value="car"/>cars</td>
													</tr>													
													</xsl:when>
													<xsl:when test="../../navTabs/navigation[@state='car']">
													<tr>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType1" value="fl"/>flights</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType2" value="hot"/>hotels</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType3" value="car"/>cars</td>
													</tr>													
													</xsl:when>
													<xsl:when test="../../navTabs/navigation[@state='package']">
													<tr>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType1" value="fl"/>flights</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType2" value="hot"/>hotels</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType3" value="car"/>cars</td>
													</tr>													
													</xsl:when>
													<xsl:otherwise>
													<tr>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType1" value="fl"/>flights</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType2" value="hot"/>hotels</td>
													<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType3" value="car"/>cars</td>
													</tr>	
													</xsl:otherwise>
												</xsl:choose>
																	</table>
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
																			<td colspan="2" height="10"></td>
																		</tr>
																		<tr><td align="left">
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td>
																							<td height="22" bgcolor="#0b8f46" valign="middle"><input name="GO" type="submit" value="Search" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:65;" /></td><td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td>					
																						</tr>
																						</table></td>
																				</tr>
																				</table></td>
																		</tr>
																		</table></td>								
																</tr>				
																</table></form></td>									
														</tr>				
														</table></td>									
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
								</xsl:when>
								<xsl:when test="@type='cruise'">
									<table width="258" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td valign="top">
											<table width="256" cellpadding="1" cellspacing="0" border="0">
											<tr>
<td bgcolor="#d7dce8">
<table width="256" cellpadding="0" cellspacing="0" border="0">
<tr>
<td>
<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#7694bf">
<tr>
<td width="10"></td>
<td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Find your cruise</td>
<td width="10"></td>
</tr>
</table></td>
</tr>
<tr>
<td align="left">
<table width="256" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="20" valign="top" bgcolor="#d7dce8"></td>
<td width="216" valign="top" bgcolor="#d7dce8">
<form method="GET" name="etaExpress" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
<input type="hidden" name="GOTO" value="CRUISESEARCH"/>
<input type="hidden" name="Cruiseline"><xsl:attribute name="value"><xsl:value-of select="@my:cruiseCode" /></xsl:attribute></input>
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td valign="top">
<table cellpadding="0" cellspacing="4" border="0">
<tr>
<td colspan="3" align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Top Destinations:<br/>
<select name="Destination" maxlength="75" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:200px;">
<!--/xsl:template>
<xsl:value-of select="$cruise_dest" />
<xsl:include href="../previewer/cruise_dest_wiz.xsl" />
<xsl:template match="email"-->
<option value="6023184" >Africa</option>
<option value="203">Alaska</option>
<option value="6050677">Asia</option>
<option value="13">Bahamas</option>
<option value="20">Bermuda</option>
<option value="6023742">Canada - New England</option>
<option value="6022969" selected="selected">Caribbean</option>
<option value="6023743">Caribbean - Eastern</option>
<option value="6023744">Caribbean - Southern</option>
<option value="6023745">Caribbean - Western</option>
<option value="6022967">Europe</option>
<option value="213">Hawaii</option>
<option value="6023183">Mediterranean</option>
<option value="6023750">Mediterranean-Eastern</option>
<option value="6023751">Mediterranean-Western</option>
<option value="6050655">Mexico</option>
<option value="-2">Nowhere (no port stops)</option>
<option value="6049796">Northern Europe</option>
<option value="6023753">Panama Canal</option>
<option value="6050676">South America</option>
<option value="6023738">South Pacific</option>
<option value="-3">Transatlantic</option>
<option value="-4">Transpacific</option>
<option value="6050649">United States &amp; Canada</option>
<option value="6023746">US Pacific Coast</option>
<option value="-5">World</option>
</select>
	</td>
</tr>
<tr>
<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing (mm/dd/yy):<br/><input maxlength="10" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:95px;" name="fromdate" value="mm/dd/yy"/></td>
<td width="3"></td>
<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Cruise Length:<br/><select maxlength="8" name="CruiseLength" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:90px;"><option value="0">Any length</option><option value="1">1-2 nights</option><option value="2">3-5 nights</option><option value="3">6-9 nights</option><option value="4">10-14 nights</option><option value="5">15+ nights</option></select></td>
</tr>
<tr><td colspan="3" height="5"></td></tr>
<tr>
<td colspan="3" align="center" height="22">
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td align="left" height="22">
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td>
<td height="22" bgcolor="#0b8f46" valign="middle"><input name="GO" type="submit" value="Search cruises" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:95;"/></td><td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif"/></td>
</tr>
</table></td>
</tr>
</table>
</td>
</tr>
</table></td>
</tr>
</table></form></td>
<td width="20" valign="top" bgcolor="#d7dce8"></td>
</tr>
</table></td>
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
								</xsl:when>
								<xsl:when test="@type='deals'">
									<table width="258" cellpadding="0" cellspacing="0" border="0">
									<tr>
									<td valign="top">
										<table width="256" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td bgcolor="#d7dce8">
												<table width="256" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td>
														<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#7694bf">
														<tr>
															<td width="10"></td>
															<td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Find more last-minute deals</td>
															<td width="10"></td>
														</tr>
														</table></td>
												</tr>
												<tr>
													<td align="left">
														<table width="256" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="100%" valign="top" bgcolor="#d7dce8">
																<form method="GET" name="frmLM" action="http://expediamail.com/p/EXPEDIA_US/deals/default.html">
																<input type="hidden" name="emlcid" value="[+GET_LINK_CONST('OMNITURE_VAR')+]" />
																<table align="center" cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td><table cellpadding="0" cellspacing="2" border="0">
																	<tr>
																		<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="radio" name="deal_lob" value="fl"/>&#160;Flight</td>
																		<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="radio" name="deal_lob" value="hot"/>&#160;Hotel</td>
																		<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="radio"  checked="checked" name="deal_lob" value="pkg"/>&#160;Package</td>
																		<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="radio" name="deal_lob" value="car"/>&#160;Car</td>
																	</tr>
																	</table>
																		<table cellpadding="0" cellspacing="2" border="0">
																		<tr>
																			<td style="line-height: 20px;"></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000;"><select style="font-size: 9px; width: 200px;" name="tiid">
     <option value="">Choose a city</option>
     <option value="ABQ">Albuquerque</option>
     <option value="ATL">Atlanta</option>
     <option value="AUS">Austin</option>
     <option value="BWI">Baltimore</option>
	 <option value="BOS">Boston</option>
     <option value="CLT">Charlotte</option>
     <option value="CHI">Chicago</option>
     <option value="CVG">Cincinnati</option>
     <option value="CLE">Cleveland</option>
     <option value="CMH">Columbus</option>
     <option value="DFW">Dallas</option>
     <option value="DEN">Denver</option>
     <option value="DTW">Detroit</option>
     <option value="FLL">Fort Lauderdale</option>
     <option value="BDL">Hartford</option>
     <option value="IND">Indianapolis</option>
     <option value="JAX">Jacksonville</option>
     <option value="MCI">Kansas City</option>
     <option value="LAS">Las Vegas</option>
     <option value="LAX">Los Angeles</option>
     <option value="MHT">Manchester, NH</option>
     <option value="MIA">Miami</option>
     <option value="MKE">Milwaukee</option>
     <option value="MSP">Minneapolis</option>
     <option value="BNA">Nashville</option>
     <option value="JFK">New York (JFK)</option>
     <option value="LGA">New York (LGA)</option>
     <option value="EWR">Newark</option>
     <option value="OAK">Oakland (San Francisco)</option>
     <option value="OMA">Omaha, NE</option>
     <option value="SNA">Orange County/Anaheim</option>
     <option value="MCO">Orlando</option>
     <option value="PSP">Palm Springs</option>
     <option value="PHL">Philadelphia</option>
     <option value="PHX">Phoenix</option>
     <option value="PIT">Pittsburgh</option>
     <option value="PDX">Portland, OR</option>
     <option value="PVD">Providence</option>
     <option value="RDU">Raleigh-Durham</option>
     <option value="SMF">Sacramento</option>
     <option value="SLC">Salt Lake City</option>
     <option value="SAT">San Antonio</option>
     <option value="SAN">San Diego</option>
     <option value="SFO">San Francisco</option>
     <option value="SJC">San Jose</option>
     <option value="SEA">Seattle</option>
     <option value="STL">St. Louis</option>
     <option value="TPA">Tampa</option>
     <option value="WAS">Washington, D.C.</option></select></td>
																		</tr>
																		<tr>
																			<td height="10"></td>
																		</tr>
																		<tr><td align="left">
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td>
																							<td height="22" bgcolor="#0b8f46" valign="middle"><input name="GO" type="submit" value="Search" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:65;" /></td><td height="22"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td>					
																						</tr>
																						</table></td>
																				</tr>
																				</table></td>
																		</tr>
																		</table></td>								
																</tr>				
																</table></form></td>									
														</tr>				
														</table></td>									
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
								</xsl:when>
								</xsl:choose></xsl:for-each>
								</xsl:if>
								</xsl:if>
								<xsl:if test="@offers='yes'">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="258" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="258" bgcolor="#d7dce8">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td  height="28" width="100%" bgcolor="#ffffff">
														<xsl:if test="@offerHeadline='yes'">
														<table cellpadding="5" cellspacing="0" border="0" bgcolor="#7694bf">
														<tr>
															<td align="left" width="258">
																<xsl:for-each select="headline">
																<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#7694bf">
																<tr>
																	<td align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff;; font-weight: bold;"><xsl:value-of select="."  disable-output-escaping="yes" /></td>
																</tr>
																</table>
																</xsl:for-each></td>
														</tr>
														</table>
														</xsl:if>
														<xsl:if test="@my:offerMessage='yes'">
														<table cellpadding="0" cellspacing="5" border="0">
														<tr>
															<td align="left" width="100%" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">
																<xsl:for-each select="para">
																	<xsl:value-of select="."  disable-output-escaping="yes" />
																</xsl:for-each></td>
														</tr></table>
														</xsl:if>
														<table width="100%" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="100%">
																<xsl:choose>
																<xsl:when test="@offerImages='yes'">
																<xsl:if test="offer">
																<xsl:for-each select="offer">
																<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="count(../offer)> 1"><xsl:if test="position()mod 2 = 1"><xsl:attribute name="bgcolor">#fffaee</xsl:attribute></xsl:if></xsl:if>
																<tr>
																	<td width="87" valign="top">
																		<a><xsl:attribute name="href"><xsl:if test="textLine"><xsl:for-each select="textLine"><xsl:if test="@type='link'"><xsl:value-of select="@url"/></xsl:if></xsl:for-each></xsl:if>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="//email/@type" /><xsl:value-of select="//ID/@issue" />_offer_<xsl:number value="position()" format="1" />.jpg</xsl:attribute> <xsl:attribute name="width">87</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@title"/></xsl:attribute></img></a></td>						
																	<td width="171" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="@title"/></b></font><br/>
																		<xsl:if test="textLine">
																		<xsl:for-each select="textLine">
																		<xsl:choose>
																		<xsl:when test="@type='italic'">
																			<i><xsl:value-of select="."  disable-output-escaping="yes" /></i><br />
																		</xsl:when>
																		<xsl:when test="@type='bold'">
																			<b><xsl:value-of select="." disable-output-escaping="yes" /></b><br />
																		</xsl:when>
																		<xsl:when test="@type='link'">
																			<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:value-of select="." disable-output-escaping="yes" /></a><br />
																		</xsl:when>
																		<xsl:when test="@type='blink'">
																			<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a><br />
																		</xsl:when>
																		<xsl:when test="@type='bullet'">
																			<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="." disable-output-escaping="yes" /><br />
																		</xsl:otherwise>
																		</xsl:choose>
																		</xsl:for-each>
																		</xsl:if></td>
																</tr>
																</table>
															</xsl:for-each>
															</xsl:if></xsl:when>
															<xsl:when test="@offerImages='no'">
															<xsl:if test="offer">
															<xsl:for-each select="offer">
																<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="count(../offer)> 1"><xsl:if test="position()mod 2 = 1"><xsl:attribute name="bgcolor">#fffaee</xsl:attribute></xsl:if></xsl:if>
																<tr>
																	<td width="258" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="@title"/></b></font><br/>
																		<xsl:if test="textLine">
																		<xsl:for-each select="textLine">
																		<xsl:choose>
																		<xsl:when test="@type='italic'">
																			<i><xsl:value-of select="."  disable-output-escaping="yes" /></i><br />
																		</xsl:when>
																		<xsl:when test="@type='bold'">
																			<b><xsl:value-of select="." disable-output-escaping="yes" /></b><br />
																		</xsl:when>
																		<xsl:when test="@type='link'">
																			<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:value-of select="." disable-output-escaping="yes" /></a><br />	
																		</xsl:when>
																		<xsl:when test="@type='blink'">
																			<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a><br />
																		</xsl:when>
																		<xsl:when test="@type='bullet'">
																			<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="." disable-output-escaping="yes" /><br />
																		</xsl:otherwise>
																		</xsl:choose>
																		</xsl:for-each>
																		</xsl:if></td>
																</tr>
																</table>
																</xsl:for-each>
																</xsl:if></xsl:when>
																</xsl:choose>
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
								</xsl:if>
								<xsl:if test="@singleOffer='yes'">
								<xsl:if test="my:singleOffer">
								<xsl:for-each select="my:singleOffer">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="258" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="256" bgcolor="#d7dce8">
												<xsl:if test="my:singleHeadline != '' and @my:bar='yes'">
												<table width="256" cellpadding="0" cellspacing="0" border="0" bgcolor="#c1cfe2">
												<tr>
													<td width="10"></td>
													<td height="28" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #336699; font-weight: bold;"><xsl:value-of select="my:singleHeadline"  disable-output-escaping="yes" /></td>
													<td width="10"></td>
												</tr>
												</table>
												</xsl:if>
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="100%" bgcolor="#ffffff">
														<table cellpadding="0" cellspacing="10" border="0">
														<xsl:if test="my:singleHeadline != '' and @my:bar='no'" >
														<tr>
															<td align="left">
																<xsl:for-each select="my:singleHeadline">
																	<div style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #336699; font-weight: bold;">
																<xsl:value-of select="."  disable-output-escaping="yes" /><br /></div>
																</xsl:for-each>
															</td>
														</tr>
														</xsl:if>
														<xsl:if test="my:para">
														<xsl:for-each select="my:para">
														<tr>
															<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">
																<xsl:value-of select="."  disable-output-escaping="yes" />
															</td>
														</tr>
														</xsl:for-each>
														</xsl:if>
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
								</xsl:for-each>
								</xsl:if></xsl:if></xsl:for-each></xsl:if>
								<xsl:if test="Template/offerModule[@my:gwc='yes']">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="258" valign="top">
										<a href="http://www.expedia.com/daily/highlights/Expedia-Promise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img src="http://media.expedia.com/media/content/expus/graphics/mail/CM_CRM_01_email_gwc.jpg" width="258" border="0" align="absmiddle" alt="Expedia. Go with Confidence.(R)" /></a></td>
								</tr>
								<tr>
									<td height="5" bgcolor="#89a5cc"></td>
								</tr>
								</table>
								</xsl:if>
								<xsl:if test="Template/offerModule[@my:adtag='yes']">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="258" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td width="258">
												<a href="http://www.expedia.com/daily/promos/hotel/24_hour_sale/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img src="http://media.expedia.com/media/content/expus/graphics/mail/CM_email_24hourtag.gif" width="258" height="54" border="0" align="absmiddle" alt="24-hour Sale" /></a></td>
										</tr>
										</table></td>
								</tr>
								<tr>
									<td height="5" bgcolor="#f1f4f7"></td>
								</tr>
								</table>
								</xsl:if>
								<xsl:if test="Template/offerModule[@my:lmd='yes']">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="258" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="258" bgcolor="#d7dce8">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="100%" bgcolor="#ffffff">
														<table cellpadding="0" cellspacing="15" border="0">
														<tr>
															<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; line-height: 20px;">
																<b>Find the best deals in last-minute travel</b><br/><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img src="http://media.expedia.com/media/content/expus/graphics/mail/etm_shopper_arrow_2.gif" width="14" height="15" border="0" align="absmiddle" /></a>&#160;<a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="color:#336699;">Search now on Expedia</a> 									
															</td>
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
								</xsl:if>
								<xsl:if test="Template/offerModule[@show='yes']">
								<xsl:if test="Template/offerModule/bannerAd">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td align="left" width="258">
										<a><xsl:attribute name="href"><xsl:value-of select="Template/offerModule/bannerAd/@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="Template/offerModule/bannerAd/@image"/></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="Template/offerModule/bannerAd/@altText"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="width">258</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></a></td>
								</tr>
								<tr>
									<td height="5" bgcolor="#f1f4f7"></td>
								</tr>
								</table>
								</xsl:if>
								</xsl:if>
								<xsl:if test="Template/offerModule[@my:show2='yes']">
								<xsl:if test="Template/offerModule/my:bannerAd2">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td align="left" width="258">
										<a><xsl:attribute name="href"><xsl:value-of select="Template/offerModule/my:bannerAd2/@my:link2"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="Template/offerModule/my:bannerAd2/@my:image2"/></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="Template/offerModule/my:bannerAd2/@my:altText2"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="width">258</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></a></td>
								</tr>
								<tr>
									<td height="5" bgcolor="#f1f4f7"></td>
								</tr>
								</table>
								</xsl:if>
								</xsl:if>
								<xsl:if test="Template/offerModule[@my:passport='yes']">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="258" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="258" bgcolor="#d7dce8">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="100%" bgcolor="#fffaee">
														<table cellpadding="0" cellspacing="15" border="0">
														<tr>
															<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px;">
																<a href="http://www.expedia.com/daily/service/visa.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img src="http://media.expedia.com/media/content/expus/graphics/mail/email_action_arrow.jpg" width="18" height="21" border="0" align="absmiddle" /></a>&#160;<a href="http://www.expedia.com/daily/service/visa.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="color:#336699;">2007 Passport requirements</a> 									
															</td>
														</tr>
														</table></td>
												</tr>
												</table></td>
										</tr>
										</table></td>
								</tr>
								</table>
								</xsl:if>
								</td></xsl:if>
						</tr>		
						</table></td>
				</tr>
				</table></td>
		</tr>
		</table>
		</xsl:if>
		<xsl:if test="Template/navTabs[@my:visible='yes']">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
			<td colspan="3" height="12" valign="top" bgcolor="#ffffff"></td>
		</tr>
		<tr>
			<td colspan="3" height="1" valign="top"><img src="http://www.expedia.com/eta/spaceit.gif" width="800" height="1" alt="" /></td>
		</tr>
		<tr>
			<td width="52" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
			<td width="638"><table cellpadding="4" cellspacing="0" border="0">
					<tr>
<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/business/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>business travel</nobr></a></td>
					</tr>
			</table></td>
			<td width="70" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="70" height="1" /></td>
		</tr>
		<tr>
			<td colspan="3" height="13" valign="top" bgcolor="#ffdf7b"></td>
		</tr>
		</table>
		</xsl:if>
		<xsl:if test="Template/navTabs[@my:visible='no']">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td height="1" valign="top" bgcolor="#ffffff"></td>
			</tr>
			</table>
		</xsl:if>
		<table><xsl:attribute name="width">100%</xsl:attribute><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">0</xsl:attribute><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute>
		<tr>
			<td><xsl:attribute name="valign">top</xsl:attribute><xsl:attribute name="align">left</xsl:attribute><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute><xsl:attribute name="style">border: 25px solid #<xsl:value-of select="Template/@color" /></xsl:attribute>
				<font face="arial, helvetica, sans serif" size="1" color="#666666" style="font-family: arial, helvetica, sans serif; font-size: 9px; line-height: 10px; font-weight: bold; color: #666666">
				<xsl:if test="my:CER_rule/@my:cer_show='yes'">
					<xsl:value-of select="my:CER_rule" disable-output-escaping="yes" /><br /><br />
				</xsl:if>
				<xsl:if test="my:MER_rule/@my:mer_show='yes'">
					<xsl:value-of select="my:MER_rule" disable-output-escaping="yes" /><br /><br />
				</xsl:if>
				
					<xsl:for-each select="specialRules">
						<xsl:choose>
							<xsl:when test="@show='yes'">
							<xsl:value-of select="@type" disable-output-escaping="yes" /><br />
								<xsl:value-of select="." disable-output-escaping="yes" /><br /><br />
							</xsl:when>
							</xsl:choose>
					</xsl:for-each>		
			CST# 2029030-40
			<br /><br />
			&#169;2007 Expedia, Inc. All rights reserved.  Expedia, Expedia.com and the Airplane logo are registered trademarks, or trademarks, of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
          <br /><br />
			[+ "(EMID: <xsl:value-of select="../@type" /><xsl:value-of select="../ID/@issue" />)(MD: " . VAR(TODAY) . ")(EPID: $p->{'profile_key'})(BIID: $p->{'mailing_id'}_$p->{'_WAVE_ID_'})" +]
			</font></td>
	</tr>
	</table>	
	</td>
	</tr>
	</table>
</body>
</html>
	<xsl:comment>***************** END <xsl:value-of select="@name"/> TEMPLATE *****************</xsl:comment> <!--/td>
				</tr>
			</table></td>
	</tr>
</table-->
	</xsl:for-each>
	</xsl:if>
</xsl:template>
</xsl:stylesheet>
