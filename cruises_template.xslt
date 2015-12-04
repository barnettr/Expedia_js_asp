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
						<b>Subject Line:</b>&#160;&#160;<xsl:if test="subjectText">
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
<xsl:variable name="headeroffersLink" select="Template/headerOffer/@url" />
<xsl:variable name="headeroffersblurb" select="Template/headerOffer/@blurb" />
<xsl:variable name="txtNode" select="count(descendant::offer/textLine)" />
<xsl:variable name="offerNode" select="count(descendant::offer)" />
	<xsl:comment>*****************START CRUISE TEMPLATE*****************</xsl:comment> 
<html>
<head>
<title>Expedia.com</title>
</head>
<body><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute>
	<table><xsl:attribute name="width">800</xsl:attribute><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">1</xsl:attribute><xsl:attribute name="align">center</xsl:attribute><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute>
	<tr>
		<td valign="top">
		<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" valign="bottom">
				<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td colspan="3" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold;">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td align="left" valign="bottom"><a href="http://www.expedia.com/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>cm_cruise_expe_<xsl:value-of select="Template/@color" />.gif</xsl:attribute> <xsl:attribute name="width">258</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="height">37</xsl:attribute><xsl:attribute name="align">absmiddle</xsl:attribute><xsl:attribute name="alt">Expedia.com</xsl:attribute></img></a></td><td align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold;">
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
					<td width="30" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="30" height="1" /></td>
		</tr>	
		</table></td>
			<td align="right" width="198" valign="middle">
			<xsl:if test="Template[@color='669ad0'] or Template[@color='ffffff'] ">
			<xsl:choose>
				<xsl:when test="Template/my:topAd[@my:state='yes']">
				<a><xsl:attribute name="href"><xsl:value-of select="Template/my:topAd/@my:link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><!--xsl:value-of select="ID/@issue" /--><xsl:value-of select="Template/my:topAd/@my:imgName" /></xsl:attribute> <xsl:attribute name="width">186</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"><xsl:value-of select="Template/my:topAd/@my:altText"  disable-output-escaping="yes" /></xsl:attribute><xsl:attribute name="align">right</xsl:attribute></img></a>
				</xsl:when>
				<xsl:when test="Template/my:topAd[@my:state='no']">
					<img src="http://www.expedia.com/eta/spaceit.gif" width="186" height="1" border="0" />
				</xsl:when>
				<xsl:otherwise>
					<img src="http://www.expedia.com/eta/spaceit.gif" width="186" height="1" border="0" />
				</xsl:otherwise>
			</xsl:choose>
			</xsl:if></td>
	</tr>
	</table>
<xsl:choose>
<xsl:when test="Template[@type='hright']">
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="2" height="8" bgcolor="#FFDF7B" valign="top"></td>
		</tr>
		<tr>
			<td width="265" valign="top" bgcolor="#ffffff">
			<xsl:if test="Template/offersModule">
			<xsl:for-each select="Template/offersModule">
			<table cellpadding="0" cellspacing="5" border="0">
			<tr>
				<td width="265">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<xsl:if test="@subheadline='yes'">
					<tr>
						<td align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #336699; font-weight: bold;">
						<xsl:if test="OffersHeadline">
						<xsl:for-each select="OffersHeadline">
							<xsl:value-of select="."  disable-output-escaping="yes" /><br />
						</xsl:for-each>
						</xsl:if></td>
					</tr>
					</xsl:if>
					</table></td>
			</tr>
			<xsl:if test="logo='yes'">
				<xsl:for-each select="logo">
				<tr>
					<td width="265" align="left">
					<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../ID/@issue" /><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="align">left</xsl:attribute><xsl:attribute name="width">255</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></td>
				</tr>	
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="para">
			<xsl:for-each select="para">
			<tr>
				<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">
					<xsl:value-of select="."  disable-output-escaping="yes" />
				</td>
			</tr>
			</xsl:for-each>
			</xsl:if>
			</table>
			<table cellpadding="0" cellspacing="0" border="0">
			<tr><td width="265">
			<xsl:choose>
			<xsl:when test="@offerImages='yes'">
			<xsl:if test="offer">
			<xsl:for-each select="offer">
			<xsl:if test="position() mod 2 = 0">
				<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="265"></td></tr>
				</table>
			</xsl:if>
				<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="position() mod 2 = 0"><xsl:attribute name="bgcolor">#F8F7F7</xsl:attribute></xsl:if>
				<tr>
					<td width="87" valign="top">
						<a><xsl:attribute name="href"><xsl:if test="textLine"><xsl:for-each select="textLine"><xsl:if test="position() mod 2 = 0"><xsl:value-of select="@url"/></xsl:if></xsl:for-each></xsl:if>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../ID/@issue" /><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="width">87</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@title"/></xsl:attribute></img></a></td>						
					<td width="173" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="@title"/></b></font><br/>
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
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td></tr>
			</table>
			</xsl:for-each>
			</xsl:if></xsl:when>
			<xsl:when test="@offerImages='no'">
			<xsl:if test="offer">
			<xsl:for-each select="offer">
				<xsl:if test="position() mod 2 = 0">
				<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="265"></td></tr>
				</table>
				</xsl:if>
				<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="position() mod 2 = 0"><xsl:attribute name="bgcolor">#F8F7F7</xsl:attribute></xsl:if>
				<tr>
						<td width="265" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="@title"/></b></font><br/>
							<xsl:if test="textLine">
								<xsl:for-each select="textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
					</tr>
					</table>
			</xsl:for-each>
			</xsl:if></xsl:when>
				</xsl:choose>
				<table cellpadding="0" cellspacing="0" border="0">
				<xsl:if test="banner[@state='yes']">
				<xsl:for-each select="banner">
				<tr>
					<td height="5" bgcolor="#ffffff"></td>
				</tr>
				<tr>
					<td width="265" align="left" valign="top">
					<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="align">left</xsl:attribute><xsl:attribute name="width">260</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></a></td>
				</tr>	
				</xsl:for-each>
				</xsl:if>
				</table>
			</td></tr>
			</table>
			</xsl:for-each>
			</xsl:if></td>
		<!--td width="5" bgcolor="#ffffff"></td-->
		<td valign="top" width="525" bgcolor="#ffffff">
			<table cellpadding="0" cellspacing="5" border="0">
			<tr>
				<td align="left">
					<a><xsl:attribute name="href"><xsl:value-of select="Template/heroModule/@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="ID/@issue" />_cruise_hero.jpg</xsl:attribute> <xsl:attribute name="width">525</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="Template/heroModule/@altText"/></xsl:attribute></img></a></td>
			</tr>	
			<tr>
				<td>
						<table cellpadding="0" cellspacing="5" border="0">
	<xsl:if test="Template/heroModule/textCell2='yes'">
			<tr>
				<td align="left" bgcolor="#d3d2d2" height="1" width="525"></td>
			</tr>
			<tr>
				<td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;" align="left">
				<xsl:for-each select="Template/heroModule/para">
					<xsl:value-of select="."  disable-output-escaping="yes" /><br /><br />
				</xsl:for-each>
				</td>
			</tr>
			</xsl:if>
			</table>
			<xsl:if test="Template/heroModule[@offers='yes']">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#d3d2d2" width="525">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="525"></td>
				</tr>
				</table>
			<xsl:choose>
			<xsl:when test="Template/heroModule[@offerImages='yes']">
			<xsl:if test="Template/heroModule/offer_row">
			<xsl:for-each select="Template/heroModule/offer_row">
				<xsl:if test="position() mod 2 = 0">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#d3d2d2" width="525">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="525"></td>
				</tr>
				</table>
				</xsl:if>
				<table><xsl:attribute name="cellpadding">0</xsl:attribute> <xsl:attribute name="cellspacing">0</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:if test="position() mod 2 = 0"> <xsl:attribute name="bgcolor">#F8F7F7</xsl:attribute></xsl:if>
				<tr>
				<td valign="top" width="525">
					<table cellpadding="0" cellspacing="5" border="0">
					<tr>
						<td width="87">
								<a><xsl:attribute name="href"><xsl:if test="offerleft/textLine"><xsl:for-each select="offerleft/textLine"><xsl:if test="position() mod 2 = 0"><xsl:value-of select="@url"/></xsl:if></xsl:for-each></xsl:if>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../ID/@issue" /><xsl:value-of select="offerleft/@image"/></xsl:attribute> <xsl:attribute name="width">87</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="offerleft/@title"/></xsl:attribute></img></a></td>						
						<td width="173" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerleft/@title"/></b></font><br/>
							<xsl:if test="offerleft/textLine">
								<xsl:for-each select="offerleft/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
						<td width="87"><a><xsl:attribute name="href"><xsl:if test="offerright/textLine"><xsl:for-each select="offerright/textLine"><xsl:if test="position() mod 2 = 0"><xsl:value-of select="@url"/></xsl:if></xsl:for-each></xsl:if>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../ID/@issue" /><xsl:value-of select="offerright/@image"/></xsl:attribute> <xsl:attribute name="width">87</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="offerright/@title"/></xsl:attribute></img></a></td>
						<td width="173" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerright/@title"/></b></font><br/>
							<xsl:if test="offerright/textLine">
								<xsl:for-each select="offerright/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
					</tr>
					</table></td>
					</tr>
					</table>
			</xsl:for-each>
			</xsl:if></xsl:when>
			<xsl:when test="Template/heroModule[@offerImages='no']">
			<xsl:if test="Template/heroModule/offer_row">
			<xsl:for-each select="Template/heroModule/offer_row">
				<xsl:if test="position() mod 2 = 0">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#d3d2d2" width="525">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="525"></td></tr>
				</table>
				</xsl:if>
				<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="position() mod 2 = 0"><xsl:attribute name="bgcolor">#F8F7F7</xsl:attribute></xsl:if>
				<tr>
				<td valign="top" width="525">
					<table cellpadding="0" width="525" cellspacing="0" border="0">
					<tr>
						<td width="50%" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerleft/@title"/></b></font><br/>
							<xsl:if test="offerleft/textLine">
								<xsl:for-each select="offerleft/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
						<td width="50%" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerright/@title"/></b></font><br/>
							<xsl:if test="offerright/textLine">
								<xsl:for-each select="offerright/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
					</tr>
					</table>
					</td>
			</tr>
			</table>
			</xsl:for-each>
			</xsl:if></xsl:when>
			</xsl:choose></xsl:if>				
				</td>
			</tr></table>
		</td>
		</tr>
		</table>
</xsl:when>
<xsl:when test="Template[@type='hcenter']">
		<table width="800" cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff">
		<tr>
			<td height="8" bgcolor="#FFDF7B" valign="top"></td>
		</tr>
		<tr>
			<td valign="top">
			<table cellpadding="0" cellspacing="5" border="0">
			<tr>
				<td align="left">
					<a><xsl:attribute name="href"><xsl:value-of select="Template/heroModule/@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="ID/@issue" />_cruise_hero.jpg</xsl:attribute> <xsl:attribute name="width">789</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="Template/heroModule/@altText"/></xsl:attribute></img></a></td>
			</tr>	
			<tr>
				<td>
						<table cellpadding="0" cellspacing="5" border="0">
	<xsl:if test="Template/heroModule/textCell2='yes'">
			<tr>
				<td align="left" bgcolor="#d3d2d2" height="1" width="789"></td>
			</tr>
			<tr>
				<td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;" align="left">
				<xsl:for-each select="Template/heroModule/para">
					<xsl:value-of select="."  disable-output-escaping="yes" /><br /><br />
				</xsl:for-each>			
				</td>
			</tr>
			</xsl:if>
			</table>
			<xsl:if test="Template/heroModule[@offers='yes']">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#d3d2d2" width="789">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="789"></td>
				</tr>
				</table>
			<xsl:choose>
			<xsl:when test="Template/heroModule[@offerImages='yes']">
			<xsl:if test="Template/heroModule/offer_row">
			<xsl:for-each select="Template/heroModule/offer_row">
				<xsl:if test="position() mod 2 = 0">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#d3d2d2" width="789">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="789"></td>
				</tr>
				</table>
				</xsl:if>
				<table><xsl:attribute name="cellpadding">0</xsl:attribute> <xsl:attribute name="cellspacing">0</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:if test="position() mod 2 = 0"> <xsl:attribute name="bgcolor">#F8F7F7</xsl:attribute></xsl:if>
				<tr>
				<td valign="top" width="789">
					<table cellpadding="0" cellspacing="5" border="0">
					<tr>
						<td width="87">
								<a><xsl:attribute name="href"><xsl:if test="offerleft/textLine"><xsl:for-each select="offerleft/textLine"><xsl:if test="position() mod 2 = 0"><xsl:value-of select="@url"/></xsl:if></xsl:for-each></xsl:if>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../ID/@issue" /><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="width">87</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="offerleft/@title"/></xsl:attribute></img></a></td>						
						<td width="310" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerleft/@title"/></b></font><br/>
							<xsl:if test="offerleft/textLine">
								<xsl:for-each select="offerleft/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
						<td width="87"><a><xsl:attribute name="href"><xsl:if test="offerright/textLine"><xsl:for-each select="offerright/textLine"><xsl:if test="position() mod 2 = 0"><xsl:value-of select="@url"/></xsl:if></xsl:for-each></xsl:if>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../ID/@issue" /><xsl:value-of select="offerright/@image"/></xsl:attribute> <xsl:attribute name="width">87</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="offerright/@title"/></xsl:attribute></img></a></td>
						<td width="310" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerright/@title"/></b></font><br/>
							<xsl:if test="offerright/textLine">
								<xsl:for-each select="offerright/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
					</tr>
					</table></td>
					</tr>
					</table>
			</xsl:for-each>
			</xsl:if></xsl:when>
			<xsl:when test="Template/heroModule[@offerImages='no']">
			<xsl:if test="Template/heroModule/offer_row">
			<xsl:for-each select="Template/heroModule/offer_row">
				<xsl:if test="position() mod 2 = 0">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#d3d2d2" width="789">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="789"></td></tr>
				</table>
				</xsl:if>
				<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="position() mod 2 = 0"><xsl:attribute name="bgcolor">#F8F7F7</xsl:attribute></xsl:if>
				<tr>
				<td valign="top" width="789">
					<table cellpadding="0" width="789" cellspacing="0" border="0">
					<tr>
						<td width="50%" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerleft/@title"/></b></font><br/>
							<xsl:if test="offerleft/textLine">
								<xsl:for-each select="offerleft/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
						<td width="50%" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerright/@title"/></b></font><br/>
							<xsl:if test="offerright/textLine">
								<xsl:for-each select="offerright/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
					</tr>
					</table>
					</td>
			</tr>
			</table>
			</xsl:for-each>
			</xsl:if></xsl:when>
			</xsl:choose></xsl:if>				
				</td>
			</tr></table></td>
		</tr>
		</table>
</xsl:when>
<xsl:when test="Template[@type='hleft']">
<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="2" height="8" bgcolor="#FFDF7B" valign="top"></td>
		</tr>
		<tr>
		<td valign="top" width="525" bgcolor="#ffffff">
			<table cellpadding="0" cellspacing="5" border="0">
			<tr>
				<td align="left">
					<a><xsl:attribute name="href"><xsl:value-of select="Template/heroModule/@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="ID/@issue" />_cruise_hero.jpg</xsl:attribute> <xsl:attribute name="width">525</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="Template/heroModule/@altText"/></xsl:attribute></img></a></td>
			</tr>	
			<tr>
				<td>
			<xsl:if test="Template/heroModule/textCell2='yes'">
			<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td align="left" bgcolor="#d3d2d2" height="1" width="525"></td>
			</tr>
			</table>
			<table cellpadding="0" cellspacing="5" border="0">
			<tr>
				<td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;" align="left">
				<xsl:for-each select="Template/heroModule/para">
					<xsl:value-of select="."  disable-output-escaping="yes" /><br /><br />
				</xsl:for-each>
				<xsl:if test="Cruise/ship[@action='yes']">
					<xsl:value-of select="Cruise/ship/name"  disable-output-escaping="yes" /><br /><br />
				</xsl:if>
				</td>
			</tr>			
			</table>
			</xsl:if>
			<xsl:if test="Template/heroModule[@offers='yes']">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#d3d2d2" width="525">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="525"></td>
				</tr>
				</table>
			<xsl:choose>
			<xsl:when test="Template/heroModule[@offerImages='yes']">
			<xsl:if test="Template/heroModule/offer_row">
			<xsl:for-each select="Template/heroModule/offer_row">
				<xsl:if test="position() mod 2 = 0">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#d3d2d2" width="525">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="525"></td>
				</tr>
				</table>
				</xsl:if>
				<table><xsl:attribute name="cellpadding">0</xsl:attribute> <xsl:attribute name="cellspacing">0</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:if test="position() mod 2 = 0"> <xsl:attribute name="bgcolor">#F8F7F7</xsl:attribute></xsl:if>
				<tr>
				<td valign="top" width="525">
					<table cellpadding="0" cellspacing="5" border="0">
					<tr>
						<td width="87">
								<a><xsl:attribute name="href"><xsl:if test="offerleft/textLine"><xsl:for-each select="offerleft/textLine"><xsl:if test="position() mod 2 = 0"><xsl:value-of select="@url"/></xsl:if></xsl:for-each></xsl:if>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../ID/@issue" /><xsl:value-of select="offerleft/@image"/></xsl:attribute> <xsl:attribute name="width">87</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="offerleft/@title"/></xsl:attribute></img></a></td>
						<td width="173" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerleft/@title"/></b></font><br/>
							<xsl:if test="offerleft/textLine">
								<xsl:for-each select="offerleft/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each></xsl:if>
								</td>
						<td width="87"><a><xsl:attribute name="href"><xsl:if test="offerright/textLine"><xsl:for-each select="offerright/textLine"><xsl:if test="position() mod 2 = 0"><xsl:value-of select="@url"/></xsl:if></xsl:for-each></xsl:if>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../ID/@issue" /><xsl:value-of select="offerright/@image"/></xsl:attribute> <xsl:attribute name="width">87</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="offerright/@title"/></xsl:attribute></img></a></td>
						<td width="173" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerright/@title"/></b></font><br/>
							<xsl:if test="offerright/textLine">
								<xsl:for-each select="offerright/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
					</tr>
					</table></td>
					</tr>
					</table>
			</xsl:for-each>
			</xsl:if></xsl:when>
			<xsl:when test="Template/heroModule[@offerImages='no']">
			<xsl:if test="Template/heroModule/offer_row">
			<xsl:for-each select="Template/heroModule/offer_row">
				<xsl:if test="position() mod 2 = 0">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#d3d2d2" width="525">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="525"></td></tr>
				</table>
				</xsl:if>
				<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="position() mod 2 = 0"><xsl:attribute name="bgcolor">#F8F7F7</xsl:attribute></xsl:if>
				<tr>
				<td valign="top" width="525">
					<table cellpadding="0" width="525" cellspacing="0" border="0">
					<tr>
						<td width="50%" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerleft/@title"/></b></font><br/>
							<xsl:if test="offerleft/textLine">
								<xsl:for-each select="offerleft/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
						<td width="50%" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="offerright/@title"/></b></font><br/>
							<xsl:if test="offerright/textLine">
								<xsl:for-each select="offerright/textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
					</tr>
					</table>
					</td>
			</tr>
			</table>
			</xsl:for-each>
			</xsl:if></xsl:when>
			</xsl:choose></xsl:if>				
				</td>
			</tr></table>
			</td>
			<td width="265" valign="top" bgcolor="#ffffff">
			<xsl:if test="Template/my:cruiseWizard[@my:action='yes']">
			<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="3" height="5" bgcolor="#ffffff"></td>
			</tr>
			<tr>
				<td colspan="3" valign="top" align="left">
						<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#669ad0">
						<tr>
							<td width="10"></td>
							<td height="28" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Find your favorite Cruise Now</td>
							<td width="10"></td>
						</tr>
						</table>
				</td>
			</tr>
			<tr>
				<td width="20" bgcolor="#ffefbc"></td>
				<td bgcolor="#ffefbc" width="225">
						<form method="GET" name="etaExpress" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
							<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td valign="top">
								<table cellpadding="0" cellspacing="4" border="0">
								<tr>
									<td colspan="3" align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Top Destinations:<br /><select   name="Destination" maxlength="75" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; width:200px;"><option value="6023185">Africa</option><option value="203">Alaska</option><option value="6023099">Asia</option><option value="6023738">Australia-South Pacific</option><option value="13">Bahamas</option><option value="20">Bermuda</option><option value="6023742">Canada-New England-NY</option><option selected="selected" value="6022969">Caribbean</option><option value="6023743">Caribbean-Eastern</option><option value="6023744">Caribbean-Southern</option><option value="6023745">Caribbean-Western</option><option value="6022967">Europe</option><option value="213">Hawaii</option><option value="500010">India-Indian Ocean</option><option value="6023183">Mediterranean</option><option value="117">Mexico</option><option value="6023182">Middle East</option><option value="500001">North America</option><option value="6023756">North Pacific</option><option value="-2">Nowhere (no port stops)</option><option value="6023753">Panama Canal</option><option value="6023117">South America</option><option value="-3">Transatlantic</option><option value="-4">Transpacific</option><option value="-5">World</option></select></td>
								</tr>
								<tr>
									<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing in:<br /><select maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; width:100px;"><option value="1/1/4501">All dates</option><option value="5-2006">June</option><option value="6-2006" selected="selected">July</option><option value="7-2006">August</option><option value="8-2006">September</option><option value="9-2006">October</option><option value="10-2006">November</option><option value="11-2006">December</option><option value="0-2007">January 2007</option><option value="1-2007">February 2007</option><option value="2-2007">March 2007</option><option value="3-2007">April 2007</option><option value="4-2007">May 2007</option><option value="5-2007">June 2007</option><option value="6-2007">July 2007</option><option value="7-2007">August 2007</option><option value="8-2007">September 2007</option><option value="9-2007">October 2007</option><option value="10-2007">November 2007</option></select></td>
									<td width="5"></td>
									<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Cruise Length:<br /><select maxlength="8" name="CruiseLength" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; width:85px;"><option selected="selected" value="0">Any length</option><option value="1">1-2 nights</option><option value="2">3-5 nights</option><option value="3">6-9 nights</option><option value="4">10-14 nights</option><option value="5">15+ nights</option></select></td>
								</tr>
								<tr>
									<td colspan="3" align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Cruise line:<br /><select maxlength="75" name="CruiseLine" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; width:200px;"><option value="-1">Show all</option><option value="1">Carnival</option><option value="2">Celebrity</option><option value="4">Crystal</option><option value="6">Disney</option><option value="7">Holland America</option><option value="8">Norwegian</option><option value="9">Princess</option><option value="10">Royal Caribbean</option><option value="12">Windstar</option></select></td>
								</tr>
								<tr><td colspan="3" height="5"></td></tr>
								<tr>
									<td colspan="3" align="center" height="26">
										<table width="125" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/email_button_lf.gif" /></td>
											<td height="26" bgcolor="#4aa345">
												<table height="26" width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td width="100%"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/email_button_top.gif" width="100%" height="4" /></td>
												</tr>
												<tr>
													<td bgcolor="#4aa345"><input name="GO" type="submit" value="Search cruises" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:12px; font-family:arial, helvetica, sans serif; background-color:#4aa345; border-color:#4aa345; border: 0; height:16;" /></td>
												</tr>
												<tr>
													<td valign="top" width="100%"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/email_button_bot.gif" width="100%" height="6" /></td>
												</tr>
												</table></td>
											<td><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/email_button_rt.gif" /></td>
										</tr>
										</table>
									</td>
								</tr>
								</table></td>
							</tr>
							</table>
									<input type="hidden" name="GOTO" value="CRUISESEARCH" /></form>
				</td>
				<td width="20" bgcolor="#ffefbc"></td>
			</tr>
			</table>
			</xsl:if>
			<xsl:if test="Template/offersModule">
			<xsl:for-each select="Template/offersModule">
			<table cellpadding="0" cellspacing="5" border="0">
			<tr>
				<td width="265">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<xsl:if test="@subheadline='yes'">
					<tr>
						<td align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #336699; font-weight: bold;">
						<xsl:if test="OffersHeadline">
						<xsl:for-each select="OffersHeadline">
							<xsl:value-of select="."  disable-output-escaping="yes" /><br />
						</xsl:for-each>
						</xsl:if></td>
					</tr>
					</xsl:if>
					</table></td>
			</tr>
			<xsl:if test="logo='yes'">
				<xsl:for-each select="logo">
				<tr>
					<td width="265" align="left">
					<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../ID/@issue" /><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="align">left</xsl:attribute><xsl:attribute name="width">255</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></td>
				</tr>	
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="para">
			<xsl:for-each select="para">
			<tr>
				<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">
					<xsl:value-of select="."  disable-output-escaping="yes" />
				</td>
			</tr>	
			</xsl:for-each>
			</xsl:if>
			</table>
			<table cellpadding="0" cellspacing="0" border="0">
			<tr><td width="265">
			<xsl:choose>
			<xsl:when test="@offerImages='yes'">
			<xsl:if test="offer">
			<xsl:for-each select="offer">
			<xsl:if test="position() mod 2 = 0">
				<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="265"></td></tr>
				</table>
			</xsl:if>
				<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="position() mod 2 = 0"><xsl:attribute name="bgcolor">#F8F7F7</xsl:attribute></xsl:if>
				<tr>
					<td width="87" valign="top">
						<a><xsl:attribute name="href"><xsl:if test="textLine"><xsl:for-each select="textLine"><xsl:if test="position() mod 2 = 0"><xsl:value-of select="@url"/></xsl:if></xsl:for-each></xsl:if>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../ID/@issue" /><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="width">87</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@title"/></xsl:attribute></img></a></td>						
					<td width="173" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="@title"/></b></font><br/>
							<xsl:if test="textLine">
								<xsl:for-each select="textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each></xsl:if>
								</td></tr>
			</table>
			</xsl:for-each>
			</xsl:if></xsl:when>
			<xsl:when test="@offerImages='no'">
			<xsl:if test="offer">
			<xsl:for-each select="offer">
				<xsl:if test="position() mod 2 = 0">
				<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="left" bgcolor="#d3d2d2" height="1" width="265"></td></tr>
				</table>
				</xsl:if>
				<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="position() mod 2 = 0"><xsl:attribute name="bgcolor">#F8F7F7</xsl:attribute></xsl:if>
				<tr>
						<td width="265" valign="middle" align="left" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><font color="#336699"><b><xsl:value-of select="@title"/></b></font><br/>
							<xsl:if test="textLine">
								<xsl:for-each select="textLine">
									<xsl:choose>
										<xsl:when test="@type='italic'">
											<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
											<br />
										</xsl:when>
										<xsl:when test="@type='bold'">
											<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
											<br />
										</xsl:when>
										<xsl:when test="@type='link'">
											<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="." disable-output-escaping="yes" /></b></a>
											<br />
										</xsl:when>
										<xsl:when test="@type='bullet'">
											<li><xsl:value-of select="." disable-output-escaping="yes" /></li><br />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="." disable-output-escaping="yes" />
											<br />	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								</xsl:if></td>
					</tr>
					</table>
			</xsl:for-each>
			</xsl:if></xsl:when>
				</xsl:choose>
				<table cellpadding="0" cellspacing="0" border="0">
				<xsl:if test="banner[@state='yes']">
				<xsl:for-each select="banner">
				<tr>
					<td height="5" bgcolor="#ffffff"></td>
				</tr>
				<tr>
					<td width="265" align="right" valign="top">
					<a><xsl:attribute name="href"><xsl:value-of select="@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="align">right</xsl:attribute><xsl:attribute name="width">260</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></a></td>
				</tr>	
				</xsl:for-each>
				</xsl:if>
				</table>
			</td></tr>
			</table></xsl:for-each>
			</xsl:if></td>
		</tr>	
		</table>
</xsl:when>
</xsl:choose>
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
			<td colspan="3" height="13" valign="top" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="100%" height="13" alt="" /></td>
		</tr>
		<tr>
			<td width="52" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
			<td width="540" bgcolor="#ffffff"><table cellpadding="4" cellspacing="0" border="0">
					<tr>
<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
					</tr>
			</table></td>
			<td width="188" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="188" height="1" /></td>
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
				If you do not wish to receive future e-mail advertisements from us, please <a href="http://expediamail.com/p/EXPEDIA_US/sub_mgmt_page/preference.html&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">click here</font></a>. Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, <a href="https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">click here</font></a> for personalized help. 
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
			[+ "(EMID: CM_CZ_01_<xsl:value-of select="@issue" />)(MD: " . VAR(TODAY) . ")(EPID: $p->{'profile_key'})(BIID: $p->{'mailing_id'}_$p->{'_WAVE_ID_'})" +]
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
	<xsl:comment>*****************END CRUISE TEMPLATE*****************</xsl:comment> 
</xsl:template>
</xsl:stylesheet>
