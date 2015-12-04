<?xml version="1.0"  encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-07-25T22:21:22">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>
<xsl:template match="email">
	<a name="top" /><xsl:if test="count(version)> 1">
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
<xsl:if test="version">
<xsl:for-each select="version">
<xsl:variable name="imgMailPath">http://media.expedia.com/media/content/expus/graphics/mail/</xsl:variable>
<xsl:variable name="issueID" select="ID/@issue" />
<xsl:variable name="headeroffersLink" select="headerOffer/@url" />
<xsl:variable name="headeroffersblurb" select="headerOffer/@blurb" />
<xsl:variable name="offersLink" select="Template/heroModule/@url"/>
<xsl:variable name="version_num"><xsl:number value="position()" format="A" /></xsl:variable>
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
				<tr>
					<td colspan="2" width="800" bgcolor="#FFFFFF">
					<xsl:comment>***************** START <xsl:value-of select="@name"/> 1_CONTENT_BODY*****************</xsl:comment>
<center><div style="text-align:right; width:800px; background-color: #206ba4; font-family: arial, helvetica, sans serif; color: #fbfbfb; font-size: 12px; padding-right:0px;">Ensure Expedia e-mails reach your inbox: Add usmail@expediamail.com to your address book.</div></center> 
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
							<td align="left" valign="bottom"><a href="http://www.expedia.com/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>cm_cruise_expe_<xsl:value-of select="Template/@color" />.gif</xsl:attribute> <xsl:attribute name="width">258</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="height">37</xsl:attribute><xsl:attribute name="align">absmiddle</xsl:attribute><xsl:attribute name="alt">Expedia.com</xsl:attribute></img></a></td><td width="542" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;">
					<xsl:if test="Template/headerOffer[@state='yes']">
					<xsl:for-each select="Template/headerOffer">
						<a><xsl:attribute name="href"><xsl:value-of select="@url" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">font-family: arial, helvetica, sans serif; font-size: 12px; color: #<xsl:choose>
							<xsl:when test="../@color='669ad0'">ffffff</xsl:when>
							<xsl:when test="../@color='ffffff'">336699</xsl:when>
						</xsl:choose>; </xsl:attribute><xsl:value-of select="@blurb"  disable-output-escaping="yes" /></a>
					</xsl:for-each>
					</xsl:if></td></tr></table></td>
				</tr>
				<tr>
					<td colspan="3" height="10" valign="top"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="10" alt="" /></td>
				</tr>
				<tr>
					<td width="52" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
					<td width="530" height="24" align="left" valign="bottom" style="font-size: 12px; color: #31339A; text-decoration: none;">
					<xsl:if test="Template/navTabs">
					<xsl:for-each select="Template/navTabs">
					<table width="530" cellpadding="4" cellspacing="0" border="0">
					<tr>
							<xsl:choose>
							<xsl:when test="navigation[@state='flight']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='hotel']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='car']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"  bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='package']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='cruise']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='activity']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
							</xsl:when>
							<xsl:when test="navigation[@state='deal']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
							</xsl:when>
							<xsl:otherwise><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td></xsl:otherwise>
						</xsl:choose>
					</tr>
					</table>
					</xsl:for-each>
					</xsl:if></td>
					<td width="188" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="188" height="1" /></td>
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
										<a><xsl:attribute name="href"><xsl:value-of select="Template/heroModule/@url"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../ID/@issue" />_faresale_hero.jpg</xsl:attribute> <xsl:attribute name="width">525</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="Template/heroModule/@altText"/></xsl:attribute></img></a></td>
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
																				<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../../../../../ID/@issue" /><xsl:value-of select="." disable-output-escaping="yes"/></xsl:attribute> <xsl:attribute name="width">160</xsl:attribute> <xsl:attribute name="height">22</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"/></xsl:attribute></img></td></xsl:for-each>
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
															<td><xsl:comment>***************** END <xsl:value-of select="@name"/> 1_CONTENT_BODY*****************</xsl:comment> 
																<xsl:comment>***************** START <xsl:value-of select="@name"/> 2_PRICE_TABLE_DEFAULT *****************</xsl:comment>									
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
															<td colspan="3" bgcolor="#ffffff" style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;"><a><xsl:attribute name="href"><xsl:choose>
		<xsl:when test="@link != ''"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:when>
		<xsl:otherwise><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:otherwise>
	</xsl:choose></xsl:attribute>
																<img src="http://media.expedia.com/media/content/expus/graphics/mail/etm_shopper_arrow_2.gif" width="14" height="15" border="0" alt="" align="absmiddle" /></a>&#160;<a><xsl:attribute name="href"><xsl:choose>
		<xsl:when test="@link != ''"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:when>
		<xsl:otherwise><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:otherwise>
	</xsl:choose></xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><b><xsl:value-of select="@content"  disable-output-escaping="yes" /></b></a><br /></td>
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
												</table><xsl:comment>***************** END <xsl:value-of select="@name"/> 2_PRICE_TABLE_DEFAULT *****************</xsl:comment>
												</xsl:if></td>
										</tr>
										</table></td>
								</tr>
								</table></td>
						</tr>
						</table></td>
					<td width="258" valign="top" align="left" bgcolor="#f1f4f7">
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
															<td align="left"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img src="http://media.expedia.com/media/content/expus/graphics/mail/MMN_TR_03_search_fares.gif" width="90" height="75" border="0" alt="Find Low Fares!" /></a></td>
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
																		<xsl:comment>***************** START <xsl:value-of select="@name"/> 3_SEARCHWIZARD_COPY *****************</xsl:comment>
																		<xsl:if test="Template/my:wizard[@my:action='yes']">
																		<xsl:if test="Template/my:wizard/my:text">
																		<tr>
																			<td colspan="2" valign="top">
																				<table width="100%" align="left" cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td width="16" valign="top"><img src="http://media.expedia.com/media/content/expus/graphics/mail/email_info_icon_fffaee.gif" width="13" height="13" border="0" alt="information" /></td>
																					<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #cc6600; font-weight:bold;">
																						<xsl:for-each select="Template/my:wizard/my:text">
																						<xsl:value-of select="."  disable-output-escaping="yes" /><br/></xsl:for-each></td></tr></table></td>
																		</tr>
																		<tr>
																			<td height="10" colspan="2"></td>
																		</tr>
																		</xsl:if>
																		</xsl:if>
																		<xsl:comment>***************** END <xsl:value-of select="@name"/> 3_SEARCHWIZARD_COPY *****************</xsl:comment>
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
								<table width="256" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="256" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="254" bgcolor="#d7dce8">
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
						<xsl:if test="Template/offersModule/bannerAd[@show='yes']">
						<xsl:for-each select="Template/offersModule/bannerAd">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td width="250" align="left" valign="top">
								<a><xsl:attribute name="href"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="align">left</xsl:attribute><xsl:attribute name="width">250</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></a></td>
						</tr>
						<tr>
									<td height="5" bgcolor="#f1f4f7"></td>
						</tr>
						</table>
						</xsl:for-each>
						</xsl:if>
						<!--table width="256" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="256" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="256" bgcolor="#d7dce8">
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
								</table-->
						</td>
				</tr>
				</table></td>
		</tr>
		</table>
		<xsl:comment>*****************START <xsl:value-of select="@name"/> 4_TERMS_CONDITIONS*****************</xsl:comment>	
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
			<td colspan="3" height="13" valign="top" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="100%" height="13" alt="" /></td>
		</tr>
		<tr>
			<td width="52" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
			<td width="538" bgcolor="#ffffff" >
				<table cellpadding="4" cellspacing="0" border="0">
				<tr>
<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
				</tr>
				</table></td>
			<td width="170" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="170" height="1" /></td>
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
					You are receiving this email because you subscribed to receive promotional emails on Expedia.com.<br/>
					This is a daily email you qualified for based on your email preferences.
					<br /><br />
					<xsl:if test="specialRules[@action='yes']">
					TERMS AND CONDITIONS<br />
					</xsl:if>
					<xsl:for-each select="specialRules">
						<xsl:choose>
							<xsl:when test="@action='yes'">
								<xsl:value-of select="." disable-output-escaping="yes" /><br /><br />
							</xsl:when>
							</xsl:choose>
					</xsl:for-each>		
				UNSUBSCRIBE
				<br />
				If you do not wish to receive future e-mail advertisements from us, please <a href="http://expediamail.com/PUBLISH(sub_mgmt_page)?&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">click here</font></a>. Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, <a href="https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">click here</font></a> for personalized help. 
				<br /><br />
				CONTACT US
				<br /> 
				Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. To contact us or send feedback, please <a href="https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">click here</font></a> or contact us via postal mail at: Expedia, Inc., attn: EMC Team, 3150 139th Avenue SE, Bellevue, WA  98005. For additional assistance, visit the Expedia.com <a href="http://www.expedia.com/daily/service/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">Customer Support Center</font></a>, or call 1-800-Expedia. 
				<br /><br />
				A NOTE ABOUT PRICES
				<br />
				Prices are subject to availability and subject to change without notice.
				<br /><br />
				All prices were current at the time this e-mail was published.
				<br /><br />
				Hotel, vacation package, and cruise prices on Expedia.com are constantly updated. Please refer to the site for the most current pricing. Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city. Additional taxes, fees, and charges may apply. Airfare is subject to, without limitation: (1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip; (2) up to $18 per roundtrip in local airport charges; (3) Federal Excise Tax of $3.20 per U.S. domestic flight segment; (4) a Travel Facilities Tax of up to $14 per roundtrip for domestic flights beginning or ending in Alaska or Hawaii; and (5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking). A segment is defined as a takeoff and a landing.
			<br /><br />
			CST# 2029030-40
			<br /><br />
			&#169;2007 Expedia, Inc. All rights reserved.  Expedia, Expedia.com and the Airplane logo are registered trademarks, or trademarks, of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
          <br /><br />
			[+ "(EMID: CM_FS_01_<xsl:value-of select="../ID/@issue" />)(MD: " . VAR(TODAY) . ")(EPID: $p->{'profile_key'})(BIID: $p->{'mailing_id'}_$p->{'_WAVE_ID_'})" +]
			</font></td>
	</tr>
	</table>	
	</td>
	</tr>
	</table></td>
	</tr>
	</table>	
</body>
</html>
	<xsl:comment>***************** END <xsl:value-of select="@name"/>  4_TERMS_CONDITIONS *****************</xsl:comment> </td>
				</tr>
			</table></td>
	</tr>
</table>
	</xsl:for-each>
	</xsl:if>
</xsl:template>
</xsl:stylesheet>
