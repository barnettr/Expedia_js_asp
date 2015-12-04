<?xml version="1.0"  encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-05-01T21:37:54">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>
<xsl:template match="email">
	<table width="800" cellpadding="1" cellspacing="3" border="0" align="center">
	<tr>
		<td width="800" bgcolor="#A3C2E0">
			<table width="798" cellpadding="3" cellspacing="0" border="0">
				<tr>
					<td width="798" bgcolor="#FFFFFF"><font face="arial, helvetica, sans serif" size="2" color="#000000">
						<b>Subject Line: </b> <xsl:if test="subjectText">
						<xsl:for-each select="subjectText">
								<xsl:value-of select="." disable-output-escaping="yes" /><br />
						</xsl:for-each>
					</xsl:if></font></td>
				</tr>
			</table></td>
	</tr>
	</table>
<xsl:variable name="imgMailPath">http://media.expedia.com/media/content/expus/graphics/mail/</xsl:variable>
<xsl:variable name="issueID" select="ID/@issue" />
<xsl:variable name="headeroffersLink" select="headerOffer/@url" />
<xsl:variable name="headeroffersblurb" select="headerOffer/@blurb" />
<xsl:variable name="offersLink" select="Template/heroModule/@url"/>
	<xsl:comment>*****************START FARE SALE TEMPLATE*****************</xsl:comment> 
<html>
<head>
<title>Expedia.com</title>
</head>
<body><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute>
	<table><xsl:attribute name="width">800</xsl:attribute><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">0</xsl:attribute><xsl:attribute name="align">center</xsl:attribute><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute>
	<tr>
		<td valign="top">
				<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td colspan="3" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold;">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td align="left" valign="bottom"><a href="http://www.expedia.com/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>cm_cruise_expe_<xsl:value-of select="Template/@color" />.gif</xsl:attribute> <xsl:attribute name="width">258</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="height">37</xsl:attribute><xsl:attribute name="align">absmiddle</xsl:attribute><xsl:attribute name="alt">Expedia.com</xsl:attribute></img></a></td><td width="542" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold;">
					<xsl:if test="Template/headerOffer[@state='yes']">
					<xsl:for-each select="Template/headerOffer">
						<a><xsl:attribute name="href"><xsl:value-of select="@url" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">font-family: arial, helvetica, sans serif; font-size: 12px; color: #<xsl:choose>
							<xsl:when test="../@color='669ad0'">ffffff</xsl:when>
							<xsl:when test="../@color='ffffff'">000000</xsl:when>
						</xsl:choose>; font-weight: bold;</xsl:attribute><xsl:value-of select="@blurb"  disable-output-escaping="yes" /></a>
					</xsl:for-each>
					</xsl:if></td></tr></table></td>
				</tr>
				<tr>
					<td colspan="3" height="10" valign="top"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="10" alt="" /></td>
				</tr>
				<tr>
					<td width="52" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
					<td width="520" height="24" align="left" valign="bottom" style="font-size: 12px; color: #31339A; text-decoration: none;">
					<xsl:if test="Template/navTabs">
					<xsl:for-each select="Template/navTabs">
					<table width="520" cellpadding="4" cellspacing="0" border="0">
					<tr>
							<xsl:choose>
							<xsl:when test="navigation[@state='flight']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">vacation packages</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">deals &amp; destinations</a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='hotel']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">vacation packages</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">deals &amp; destinations</a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='car']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"  bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">vacation packages</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">deals &amp; destinations</a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='package']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">vacation packages</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">deals &amp; destinations</a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='cruise']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">vacation packages</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">deals &amp; destinations</a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='activity']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">vacation packages</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">deals &amp; destinations</a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='deal']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">vacation packages</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">deals &amp; destinations</a></td>
							</xsl:when>
							<xsl:otherwise><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">vacation packages</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">deals &amp; destinations</a></td></xsl:otherwise>
						</xsl:choose>
					</tr>
					</table>
					</xsl:for-each>
					</xsl:if></td>
					<td width="198" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="198" height="1" /></td>
		</tr>
		<tr>
			<td width="800" colspan="3" height="8" bgcolor="#FFDF7B" valign="top"></td>
		</tr>
		<tr>
			<td colspan="3" width="800" height="2" valign="top" bgcolor="#ffffff"></td>
		</tr>
		</table>
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
									<td>
										<a><xsl:attribute name="href"><xsl:value-of select="Template/heroModule/@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="ID/@issue" />_faresale_hero.jpg</xsl:attribute> <xsl:attribute name="width">525</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="Template/heroModule/@altText"/></xsl:attribute></img></a></td>
								</tr>
								<tr>
									<td height="5" bgcolor="#f1f4f7"></td>
								</tr>
								<tr>
									<td valign="top">
										<table width="525" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="525" bgcolor="#d7dce8">
												<xsl:if test="Template/messageModule">
												<table width="523" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="523" bgcolor="#ffffff">											
														<table width="100%" cellpadding="0" cellspacing="10" border="0">
														<tr>
															<td valign="top" bgcolor="#ffffff">
																<table width="503" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td valign="top" bgcolor="#ffffff">
																		<xsl:if test="Template/messageModule/headline">
																		<xsl:for-each select="Template/messageModule/headline">
																		<xsl:choose>
																		<xsl:when test="logo[@show='yes']">
																		<table width="503" cellpadding="0" cellspacing="0" border="0">		
																		<tr>
																			<td width="100%" bgcolor="#ffffff" style="font-family: arial, helvetica, sans serif; font-size: 16px; color: #336699; font-weight: bold;">
																				<xsl:value-of select="@content"  disable-output-escaping="yes" /></td>
																				<xsl:for-each select="logo">
																			<td width="160" valign="middle" align="right">
																				<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../../ID/@issue" /><xsl:value-of select="." disable-output-escaping="yes"/></xsl:attribute> <xsl:attribute name="width">160</xsl:attribute> <xsl:attribute name="height">22</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"/></xsl:attribute></img></td></xsl:for-each>
																		</tr>
																		</table>
																		</xsl:when>
																		<xsl:when test="logo[@show='no']">
																		<table width="503" cellpadding="0" cellspacing="0" border="0">		
																		<tr>
																			<td width="100%" bgcolor="#ffffff" style="font-family: arial, helvetica, sans serif; font-size: 16px; color: #336699; font-weight: bold;">
																				<xsl:value-of select="@content"  disable-output-escaping="yes" /></td>
																		</tr>
																		</table>
																		</xsl:when>
																		</xsl:choose>												
																		</xsl:for-each>
																		</xsl:if></td>
																</tr>
																<xsl:if test="Template/messageModule/para">
																<xsl:for-each select="Template/messageModule/para">
																<tr>
																	<td style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																	<br /><xsl:value-of select="."  disable-output-escaping="yes" /></td>
																</tr>
																</xsl:for-each>
																</xsl:if>
																</table></td>
														</tr>
														</table></td>
												</tr>
												</table></xsl:if></td>
										</tr>
										</table></td>
							</tr>
							<tr>
								<td height="5" bgcolor="#f1f4f7"></td>
							</tr>
							<tr>
							<td valign="top">
								<table width="525" cellpadding="1" cellspacing="0" border="0">
								<tr>
									<td width="525" bgcolor="#d7dce8">
										<table width="523" cellpadding="0" cellspacing="0" border="0">
										<tr>	
											<td width="523" bgcolor="#ffffff">
											<xsl:if test="Template/priceModule">											
												<table width="100%" cellpadding="0" cellspacing="10" border="0">
												<tr>
													<td>
														<xsl:if test="Template/priceModule/priceTable">
														<table width="100%" cellpadding="0" cellspacing="0" border="0">
														<xsl:for-each select="Template/priceModule/priceTable">
														<tr>
															<td align="left" height="30"><font style="font-family: arial, helvetica, sans serif; font-size: 14px; font-weight: bold; color: #cc6600;"><xsl:value-of select="@header" disable-output-escaping="yes"/></font></td>
														</tr>
														</xsl:for-each>
														<tr>	
															<td>											
																<table width="100%" cellpadding="0" cellspacing="0" border="0">
																<tr>	
																	<td valign="top">
																		<xsl:if test="Template/priceModule/priceTable/flightRoute">
																		<xsl:for-each select="Template/priceModule/priceTable/flightRoute">
																		<table><xsl:attribute name="width">100%</xsl:attribute><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">2</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="position() mod 2 = 1"><xsl:attribute name="bgcolor">#fffaee</xsl:attribute></xsl:if>	
																		<tr>
																			<td width="2%"></td>
																			<td align="left" width="78%" style="font-family: arial, helvetica, sans serif; font-size: 12px;"><a><xsl:attribute name="href"><xsl:choose>
																				<xsl:when test="@link != ''"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:when>
																				<xsl:otherwise><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:otherwise>
																				</xsl:choose></xsl:attribute>
																				<xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:value-of select="@text" disable-output-escaping="yes"/></a></td><td width="20%" align="center" style="font-family: arial, helvetica, sans serif; font-size: 12px;"><a><xsl:attribute name="href"><xsl:choose>
																				<xsl:when test="@link != ''"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:when>
																				<xsl:otherwise><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:otherwise>
																				</xsl:choose></xsl:attribute>
																			<xsl:attribute name="style">color: #cc6600;</xsl:attribute><b>$<xsl:value-of select="@price" disable-output-escaping="yes"/>+</b></a></td>
																		</tr>
																		</table>
																		</xsl:for-each>
																		</xsl:if></td>
																</tr>
																</table></td>
														</tr>
														<xsl:if test="Template/priceModule/callToAction">
														<xsl:for-each select="Template/priceModule/callToAction">
														<tr>
															<td colspan="3" height="10"></td>
														</tr>
														<tr>
															<td colspan="3" bgcolor="#ffffff" style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																<a><xsl:attribute name="href"><xsl:choose>
		<xsl:when test="@link != ''"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:when>
		<xsl:otherwise><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:otherwise>
	</xsl:choose></xsl:attribute>
																<xsl:attribute name="style">color: #336699;</xsl:attribute><img src="http://media.expedia.com/media/content/expus/graphics/mail/etm_shopper_arrow.gif" width="13" height="13" border="0" alt="" align="absmiddle" /> <b><xsl:value-of select="@content"  disable-output-escaping="yes" /></b></a><br /></td>
														</tr>
														</xsl:for-each>
														</xsl:if>
														<xsl:if test="Template/priceModule/para[@show='yes']">
														<xsl:for-each select="Template/priceModule/para">
														<tr>
															<td colspan="2" bgcolor="#ffffff" style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																<br /><xsl:value-of select="."  disable-output-escaping="yes" /><br /></td>
														</tr>
														</xsl:for-each>
														</xsl:if>
														</table>
														</xsl:if></td>
												</tr>
												</table>
												</xsl:if></td>
										</tr>
										</table></td>
								</tr>
								</table></td>
						</tr>
								</table></td>
							<td width="258" valign="top" align="left" bgcolor="#f1f4f7">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
								<table width="256" cellpadding="1" cellspacing="0" border="0">
								<tr>
									<td bgcolor="#d7dce8">
									<xsl:if test="Template/offersModule/flightwizard[@action='on']">
										<table width="256" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
												<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#7694bf">
												<tr>
													<td width="10"></td>
													<td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Get 'em now: Great rates</td>
													<td width="10"></td>
												</tr>
												</table></td>
										</tr>
										<tr>
											<td align="left">
												<table width="256" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td width="35" valign="top" bgcolor="#ffefbc"></td>
													<td width="186" valign="top" bgcolor="#ffefbc">
														<form method="GET" name="etaExpress" action="http://expediamail.com/p/EXPEDIA_US/dual_button_wizard/default.html">
														<input type="hidden" name="GOTO" value="PackageWiz" />
														<input type="hidden" name="emlcid" value="[+GET_LINK_CONST('OMNITURE_VAR')+]" />
														<input type="hidden" name="Airline"><xsl:attribute name="value"><xsl:value-of select="@code" /></xsl:attribute></input>
														<table width="186" align="center" cellpadding="0" cellspacing="10" border="0">
														<tr>
															<td>
																<table cellpadding="0" cellspacing="2" border="0">
																<tr>
																	<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing from:<br /><input maxlength="75" name="FrAirport" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; width:160px" value="" /></td>
																</tr>
																<tr>
																	<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Depart Date:<br /><input maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; width:100px" value="mm/dd/yy" /></td>
																</tr>
																<tr>
																	<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Destination:<br /><input maxlength="75" name="DestName" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; width:160px" value="" /></td>
																</tr>
																<tr>
																	<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Return Date:<br /><input maxlength="8" name="ToDate" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; width:100px" value="mm/dd/yy" /></td>
																</tr>
																<tr>
																	<td align="left" valign="top" type="NOWRAP">
																		<table width="100%" cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td width="60%" align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Adults:<br />
																				<select name="Numadult" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">
																				<option value="1">1 adult</option>
																				<option value="2" selected="selected">2 adults</option>
																				<option value="3">3 adults</option>
																				<option value="4">4 adults</option>
																				<option value="5">5 adults</option>
																				<option value="6">6 adults</option></select>
																			</td>
																			<td width="40%" align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Rooms:<br />
																				<select name="Numroom" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">
																				<option value="1">1 room</option>
																				<option value="2">2 rooms</option>
																				<option value="3">3 rooms</option>
																				<option value="4">4 rooms</option>
																				<option value="5">5 rooms</option>
																				<option value="6">6 rooms</option></select>
																			</td>
																		</tr>
																		</table></td>
																</tr>
																<tr>
																	<td height="10"></td>
																</tr>
																<tr>
																	<td align="center" height="29">
																		<table cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/etm_ps_button_left.jpg" /></td>
																			<td height="29" bgcolor="#459b44">
																				<table height="29" cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td width="100%"><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/etm_ps_button_top.jpg" width="100%" height="5" /></td>
																				</tr>
																				<tr>
																					<td bgcolor="#459b44"><input name="GOPackage" type="submit" value="Search Flight + Hotel" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:12px; font-family:arial, helvetica, sans serif; background-color:#459b44; border-color:#459b44; border: 0; height:16; width:125;" /></td>
																				</tr>
																				<tr>
																					<td valign="top" width="100%"><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/etm_ps_button_bottom.jpg" width="100%" height="7" /></td>
																				</tr>
																				</table></td>
																			<td><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/etm_ps_button_right.jpg" /></td>
																		</tr>
																		</table></td>
																</tr>
																<tr><td align="center" height="5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><b>or</b></td></tr>
																<tr>
																	<td align="center" height="28">
																		<table cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/etm_ps_button_left.jpg" /></td>
																			<td height="29" bgcolor="#459b44">
																				<table height="29" width="100%" cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td width="100%"><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/etm_ps_button_top.jpg" width="100%" height="5" /></td>
																				</tr>
																				<tr>
																					<td bgcolor="#459b44"><input name="GOFlight" type="submit" value="Search Flight" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:12px; font-family:arial, helvetica, sans serif; background-color:#459b44; border-color:#459b44; border: 0; height:16; width:92;" /></td>
																				</tr>
																				<tr>
																					<td valign="top" width="100%"><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/etm_ps_button_bottom.jpg" width="100%" height="7" /></td>
																				</tr>
																				</table></td>
																			<td><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/etm_ps_button_right.jpg" /></td>
																		</tr>
																		</table></td>
																</tr>
																</table></td>
														</tr>
														</table></form></td>
													<td width="35" valign="top" bgcolor="#ffefbc"></td>									
												</tr>				
												</table></td>									
										</tr>				
										</table></xsl:if></td>
								</tr><tr>
									<td height="5" bgcolor="#f1f4f7"></td>
								</tr>
								<xsl:if test="Template/offersModule/bannerAd[@show='yes']">
								<xsl:for-each select="Template/offersModule/bannerAd">
								<tr>
									<td width="250" align="left" valign="top">
										<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td align="left">
												<a><xsl:attribute name="href"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="align">left</xsl:attribute><xsl:attribute name="width">250</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></a></td>
										</tr>
										</table></td>
								</tr>	
								</xsl:for-each>
								</xsl:if></table></td>
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
			<td colspan="3" height="13" valign="top" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="100%" height="13" alt="" /></td>
		</tr>
		<tr>
			<td width="52" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
			<td width="530"><table cellpadding="4" cellspacing="0" border="0">
					<tr>
<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
					</tr>
			</table></td>
			<td width="188" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="198" height="1" /></td>
		</tr>
		<tr>
			<td colspan="3" height="13" valign="top" bgcolor="#FFDF7B"><img src="http://www.expedia.com/eta/spaceit.gif" width="100%" height="13" alt=""/></td>
		</tr>
		</table>
		<table><xsl:attribute name="width">100%</xsl:attribute><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">0</xsl:attribute><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute>
		<tr>
			<td><xsl:attribute name="valign">top</xsl:attribute><xsl:attribute name="align">left</xsl:attribute><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute><xsl:attribute name="style">border: 25px solid #<xsl:value-of select="Template/@color" /></xsl:attribute>
				<br />
				<font face="arial, helvetica, sans serif" size="1" color="#666666" style="font-family: arial, helvetica, sans serif; font-size: 9px; line-height: 10px; font-weight: bold; color: #666666">
					<xsl:if test="specialRules[@action='yes']">
					TERMS AND CONDITIONS<br /><br />
					</xsl:if>
					<xsl:for-each select="specialRules">
						<xsl:choose>
							<xsl:when test="@action='yes'">
								<xsl:value-of select="." disable-output-escaping="yes" /><br /><br />
							</xsl:when>
							</xsl:choose>
					</xsl:for-each>		
				UNSUBSCRIBE
				<br /><br /> 
				If you do not wish to receive future e-mail advertisements from us, please <a href="http://expediamail.com/PUBLISH(sub_mgmt_page)"><font color="#666666">click here</font></a>. Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, <a href="https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">click here</font></a> for personalized help. 
				<br /><br />
				CONTACT US
				<br /><br /> 
				To contact us or send feedback, please <a href="https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">click here</font></a> or contact us via postal mail at: Expedia, Inc., attn: PCC Team, 3150 139th avenue SE, Bellevue, WA  98005. For additional assistance, visit the Expedia.com <a href="http://www.expedia.com/daily/service/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">Customer Support Center</font></a>. 
				<br /><br />
				A NOTE ABOUT PRICES
				<br /><br />
				Prices are subject to availability and subject to change without notice.
				<br /><br />
				All prices were current at the time this e-mail was published.
				<br /><br />
				Hotel, vacation package, and cruise prices on the Expedia Website are constantly updated.  Please refer to the site for the most current pricing.  Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city.  additional taxes, fees, and charges may apply. airfare is subject to, without limitation: (1) Sept. 11 Security Fee of $2.50 for each flight segment 
originating at a U.S. airport, up to $5 per one way or $10 per roundtrip; (2) up to $18 per roundtrip in local airport charges; (3) Federal Excise Tax of $3.20 per U.S. domestic flight segment; (4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in alaska or Hawaii; and (5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking).  a segment is defined as a takeoff and a landing.
			<br /><br />
			CST# 2029030-40
			<br /><br />
			&#169;2006 Expedia, Inc. All rights reserved.  Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
			<br /><br />
			<xsl:if test="ID">
			<xsl:for-each select="ID">
			[+ "(EMID: CM_FS_01_<xsl:value-of select="@issue" />)(MD: " . VAR(TODAY) . ")(EPID: $p->{'profile_key'})(BIID: $p->{'mailing_id'}_$p->{'_WAVE_ID_'})" +]
			</xsl:for-each>
			</xsl:if>
			</font></td>
	</tr>
	</table>	
	</td>
	</tr>
	</table>
</body>
</html>
	<xsl:comment>*****************END FARE SALE TEMPLATE*****************</xsl:comment> 
</xsl:template>
</xsl:stylesheet>
