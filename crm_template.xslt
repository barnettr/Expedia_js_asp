<?xml version="1.0"  encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-04-14T20:07:29">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>
<xsl:template match="email">
<a name="top" />
<table width="600" cellpadding="0" cellspacing="0" border="0">
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
<xsl:if test="version">
<xsl:for-each select="version">
<xsl:variable name="imgCommon">http://media.expedia.com/media/content/shared/graphics/common/mail/</xsl:variable>
<xsl:variable name="imgPath">http://media.expedia.com/media/content/shared/images/</xsl:variable>
<xsl:variable name="imgMailPath">http://media.expedia.com/media/content/shared/graphics/mail/</xsl:variable>
<xsl:variable name="iconPath">http://media.expedia.com/media/content/expus/graphics/mail/</xsl:variable>
<xsl:variable name="iconsPath">http://media.expedia.com/media/content/expus/graphics/icons/</xsl:variable>
<xsl:variable name="issueID" select="ID/@issue" />
<xsl:variable name="offersLink" select="takeMe/@link" />
<table width="650" cellpadding="1" cellspacing="3" border="0" align="center">
	<tr>
		<td width="650" bgcolor="#A3C2E0">
			<table width="648" cellpadding="3" cellspacing="0" border="0">
				<tr>
					<td width="600" bgcolor="#336699"><font face="arial, helvetica, sans serif" size="2" color="#ffffff">
						<a><xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute></a><b>CRM Version:</b>&#160;&#160;<xsl:value-of select="@name" /><br />
						</font></td>
					<td width="48" bgcolor="#336699" align="right"><font face="arial, helvetica, sans serif" size="2" color="#ffffff"><a href="#top" style="color: #ffffff;">top</a> ^&#160;&#160;</font></td>
				</tr>
				<tr>
					<td colspan="2" width="648" bgcolor="#cccccc"><font face="arial, helvetica, sans serif" size="2" color="#000000">
						<b>Subject Line:</b>&#160;&#160;<xsl:if test="subjectText">
						<xsl:for-each select="subjectText">
								<xsl:value-of select="." /><br />
						</xsl:for-each>
					</xsl:if></font></td>
				</tr>
				<tr>
					<td colspan="2" width="648" bgcolor="#FFFFFF">
<xsl:comment>*****************START <xsl:value-of select="@name"/> CRM_TEMPLATE*****************</xsl:comment> 
 <html>
<head>
<title>Expedia.com</title>
<STYLE>
	td.offer{FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px; LINE-HEIGHT: 24px;}
</STYLE>
</head>
<body>
<table width="609" cellpadding="0" cellspacing="0" border="0" align="center" bgcolor="#FFFFFF">
<tr><td>
			<table width="600" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="3" height="51" align="left" valign="top" bgcolor="#FFFFFF">
					<a href="http://www.expedia.com/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img src="http://media.expedia.com/media/content/expus/graphics/mail/logo_exphorz_short.gif" alt="Expedia.com" width="247" height="51" border="0" /></a><img src="http://www.expedia.com/eta/spaceit.gif" width="353" height="1" /></td>
			</tr>
             <xsl:if test="navTabs">
			<xsl:for-each select="navTabs">
			<tr>
				<td width="52" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
				<td height="28" align="left" valign="bottom" bgcolor="#FFFFFF">
					<table width="378" cellpadding="4" cellspacing="0" border="0">
					<tr>
						<xsl:choose>
							<xsl:when test="Flights[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:when test="Hotels[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:when test="Cars[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"  bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:when test="VacaPack[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:when test="Cruises[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:when test="Activities[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:otherwise><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td></xsl:otherwise>
						</xsl:choose>
				</tr>
				</table></td>
				<td width="158" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="158" height="1" /></td>
		</tr>
		</xsl:for-each>
		</xsl:if>		
		</table>
		<table width="600" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td height="5" valign="top" bgcolor="#FFDF7B"><img src="http://www.expedia.com/eta/spaceit.gif" width="598" height="5" alt="" /></td>
		</tr>
		<tr>
			<td width="600" height="2" valign="top" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="600" height="2" alt="" /></td>
		</tr>
		</table>
		<xsl:choose>
			<xsl:when test="my:heroSection/@my:hide='no' and my:heroSection/@my:onCER='no'">
		<table width="609" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="213" border="0" /></td>
		<td width="5" bgcolor="#f1f5f8" valign="top"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="5" height="1" border="0" /><br /><img src="http://www.expedia.com/eta/spaceit.gif" width="5" /></td>
		<td>
		<table width="603" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="2" height="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="594" height="1" border="0" /></td>
		</tr>
		<tr>
			<td colspan="2" height="5">
			<table width="603" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="593" bgcolor="#f1f5f8"><img src="http://www.expedia.com/eta/spaceit.gif" width="593" height="5" /></td>
				<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="5" border="0" /></td>
				<td width="9" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="9" height="1" /></td>
			</tr>
			</table></td>
		</tr>
		<tr>
			<td colspan="2" height="1">
			<table width="603" cellpadding="0" cellspacing="0" border="0">
			<tr>
			<td width="588"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="588" height="1" border="0" /></td>
			<td height="1" width="5" bgcolor="#f1f5f8"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="1" /></td>
			<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="1" border="0" /></td>
			<td width="9" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="9" height="1" /></td>
			</tr>
			</table></td>
		</tr>
		<tr>
			<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="200" border="0" /></td>
			<td>
				<table width="593" cellpadding="0" cellspacing="0" border="0">
				<xsl:if test="heroImage">
				<xsl:for-each select="heroImage">
				<tr>
					<td rowspan="3">
						<a><xsl:attribute name="href"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src">http://media.expedia.com/media/content/expus/graphics/mail/<xsl:value-of select="../../ID/@issue" /><xsl:value-of select="." disable-output-escaping="yes" /><xsl:choose>
			<xsl:when test="@my:imgType='jpg'">.jpg</xsl:when><xsl:when test="@my:imgType='gif'">.gif</xsl:when></xsl:choose></xsl:attribute> <xsl:attribute name="width">409</xsl:attribute> <xsl:attribute name="height">200</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@text"/></xsl:attribute></img></a>
					</td>
					<td valign="top" align="left"><img><xsl:attribute name="src">http://media.expedia.com/media/content/expus/graphics/mail/<xsl:value-of select="../../ID/@issue" /><xsl:value-of select="." disable-output-escaping="yes" />_top.gif</xsl:attribute><xsl:attribute name="width">177</xsl:attribute> <xsl:attribute name="height">7</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></td>
					<td height="6"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="6" border="0" /></td>
					<td bgcolor="#f1f5f8" width="5"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="6" /></td>
					<td height="6"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="6" border="0" /></td>
				</tr>
				</xsl:for-each>											
				</xsl:if>
				<tr>
					<td colspan="4" width="184">
					<xsl:if test="searchWizard">
					<xsl:for-each select="searchWizard">
						<xsl:choose>
						<xsl:when test="@type='hotel'">
						<table width="184" cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td colspan="2" height="23" bgcolor="#336799" align="left">
								<table cellspacing="0" width="182" cellpadding="0" border="0">
								<tr>
									<td valign="middle" align="right"><font face="arial, helvetica, sans serif" size="2" color="#ffffff"><b>Find your hotel</b></font></td>
									<td align="right" valign="bottom" bgcolor="#336799"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="3" /><br /><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_hotel_icon_top.gif" width="63" height="20" border="0" /></td>
								</tr></table></td>
						</tr>
						<tr>
							<td width="1" bgcolor="#dee7ef"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="163" border="0" /></td>
							<td width="184" bgcolor="#fffaee" align="center">
								<table width="182" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="10"><img src="http://www.expedia.com/eta/spaceit.gif" width="10" height="1" border="0" /></td>
									<td align="center" valign="middle" bgcolor="#fffaee">
									<form method="GET" name="HotSearch" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
										<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td width="119"><font face="arial, helvetica, sans serif" size="1">Destination City:</font></td>
											<td width="63" valign="top" align="right"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_hotel_icon_btm.gif" width="63" height="16" border="0" /><br /><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="2" border="0" /></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="100" name="CityName" style="width:155px" value="" />
											</td>
										</tr>
										<tr>
											<td colspan="2" align="left">
												<font face="arial, helvetica, sans serif" size="1">Check-in date: (MM/DD/YY)</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="InDate" value="" size="9" style="width:70px" />
											</td>
										</tr>
										<tr>
											<td colspan="2" align="left">
												<font face="arial, helvetica, sans serif" size="1">Check-out date: (MM/DD/YY)</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="OutDate" value="" size="9" style="width:70px" />
											</td>
										</tr>
										<tr>
											<td height="5"><img src="http://www.expedia.com/eta/spaceit.gif" height="5" width="1" border="0" /></td>
										</tr>
										<tr>
											<td colspan="2" valign="top" align="left" type="NOWRAP"><table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="50%" align="left">
									<select name="NumAdult" style="width:70px;">
										<option value="1">1 adult</option>
										<option value="2">2 adults</option>
										<option value="3">3 adults</option>
										<option value="4">4 adults</option>
										<option value="5">5 adults</option>
										<option value="6">6 adults</option>
									</select>
												</td><td width="50%" align="right"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_search.gif" align="absmiddle" /></td></tr></table></td>	
										</tr>
										</table><input type="hidden" name="GOTO" value="HOTSEARCH" /></form></td>
								</tr>
								</table></td>		
						</tr>
						<tr>
							<td colspan="3" width="184"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="184" height="1" border="0" /></td></tr>
						</table>
						</xsl:when>
						<xsl:when test="@type='packages'">
						<table width="184" cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td colspan="2" height="23" bgcolor="#336799" align="left">
								<table cellspacing="0" width="182" cellpadding="0" border="0">
								<tr>
									<td align="center" valign="middle"><font face="arial, helvetica, sans serif" size="2" color="#ffffff"><b>Find flight+hotel</b></font></td>
									<td width="1"  height="23" align="right" bgcolor="#336799"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="23" /></td>
								</tr></table></td>
						</tr>
						<tr>
							<td width="1" bgcolor="#dee7ef"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="163" border="0" /></td>
							<td width="184" bgcolor="#fffaee" align="center">
								<table width="182" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="10"><img src="http://www.expedia.com/eta/spaceit.gif" width="10" height="1" border="0" /></td>
									<td align="center" valign="middle" bgcolor="#fffaee">
									<form method="GET" name="FT_Hot" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
										<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td colspan="2" align="left"><font face="arial, helvetica, sans serif" size="1">Departing from:</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="100" name="FrAirport" style="width:155px" value="" />
											</td>
										</tr>
										<tr>
											<td colspan="2" align="left">
												<font face="arial, helvetica, sans serif" size="1">Going to:</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="100" name="DestName" style="width:155px" value="" />
											</td>
										</tr>
										<tr>
											<td align="left">
												<font face="arial, helvetica, sans serif" size="1">Depart:</font></td>
												<td align="left">
												<font face="arial, helvetica, sans serif" size="1">Return:</font></td>
										</tr>
										<tr>
											<td align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="FromDate" size="9" style="width:70px" value="mm/dd/yy" />
											</td>
											<td align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="ToDate" size="9" style="width:70px" value="mm/dd/yy" />
											</td>
										</tr>
										<tr><td colspan="2"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="7" border="0" /></td></tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP"><table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="50%" align="left">
									<select name="Numadult">
										<option value="1">1 adult</option>
										<option value="2">2 adults</option>
										<option value="3">3 adults</option>
										<option value="4">4 adults</option>
										<option value="5">5 adults</option>
										<option value="6">6 adults</option>
									</select>
												</td><td width="50%" align="right"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_search.gif" align="absmiddle" /></td></tr></table></td>
										</tr>
										</table><input type="hidden" name="GOTO" value="PackageWiz"/></form>	</td>
								</tr>
								</table></td>		
						</tr>
						<tr>
							<td colspan="3" width="184"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="184" height="1" border="0" /></td></tr>
						</table></xsl:when>
						<xsl:when test="@type='flight'">
								<table width="184" cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td colspan="2" height="23" bgcolor="#336799" align="left">
								<table cellspacing="0" width="182" cellpadding="0" border="0">
								<tr>
									<td align="center" valign="middle"><font face="arial, helvetica, sans serif" size="2" color="#ffffff"><b>Find your flight</b></font></td>
									<td width="1"  height="23" align="right" bgcolor="#336799"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="23" /></td>
								</tr></table></td>
						</tr>
						<tr>
							<td width="1" bgcolor="#dee7ef"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="163" border="0" /></td>
							<td width="184" bgcolor="#fffaee" align="center">
								<table width="182" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="10"><img src="http://www.expedia.com/eta/spaceit.gif" width="10" height="1" border="0" /></td>
									<td align="center" valign="middle" bgcolor="#fffaee">
									<form method="GET" name="FT_Hot" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
										<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td colspan="2" align="left"><font face="arial, helvetica, sans serif" size="1">Departing from:</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="100" name="FrAirport" style="width:155px" value="" />
											</td>
										</tr>
										<tr>
											<td colspan="2" align="left">
												<font face="arial, helvetica, sans serif" size="1">Going to:</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="100" name="Toairport" style="width:155px" value="" />
											</td>
										</tr>
										<tr>
											<td align="left">
												<font face="arial, helvetica, sans serif" size="1">Depart:</font></td>
												<td align="left">
												<font face="arial, helvetica, sans serif" size="1">Return:</font></td>
										</tr>
										<tr>
											<td align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="FromDate" size="9" style="width:70px" value="mm/dd/yy" />
											</td>
											<td align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="ToDate" size="9" style="width:70px" value="mm/dd/yy" />
											</td>
										</tr>
										<tr><td colspan="2"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="7" border="0" /></td></tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP"><table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="50%" align="left">
									<select name="Numadult">
										<option value="1">1 adult</option>
										<option value="2">2 adults</option>
										<option value="3">3 adults</option>
										<option value="4">4 adults</option>
										<option value="5">5 adults</option>
										<option value="6">6 adults</option>
									</select>
												</td><td width="50%" align="right"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_search.gif" align="absmiddle" /></td></tr></table></td>
										</tr>
										</table><input type="hidden" name="GOTO" value="EXPFLTWIZ" /></form>	</td>
								</tr>
								</table></td>		
						</tr>
						<tr>
							<td colspan="3" width="184"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="184" height="1" border="0" /></td></tr>
						</table>
						</xsl:when>
				</xsl:choose>
				</xsl:for-each>
				</xsl:if>			
				</td>
				<td width="9"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_right_side_wiz.gif" width="9" height="187" border="0" /></td>	
			</tr>
			<xsl:if test="heroImage">
				<xsl:for-each select="heroImage">
			<tr>
				<td valign="top" align="left"><img><xsl:attribute name="src">http://media.expedia.com/media/content/expus/graphics/mail/<xsl:value-of select="../../ID/@issue" /><xsl:value-of select="." disable-output-escaping="yes" />_bottom.gif</xsl:attribute><xsl:attribute name="width">177</xsl:attribute> <xsl:attribute name="height">6</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></td>
				<td height="7"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="7" border="0" /></td>
				<td bgcolor="#f1f5f8" width="5"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="7" /></td>
				<td height="7"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="7" border="0" /></td>
			</tr>
			</xsl:for-each>
			</xsl:if>
			</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="1">
				<table width="603" cellpadding="0" cellspacing="0" border="0">
				<tr>
				<td width="588"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="588" height="1" border="0" /></td>
				<td height="1" width="5" bgcolor="#f1f5f8"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="1" /></td>
				<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="1" border="0" /></td>
				<td width="9" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="9" height="1" /></td>
				</tr>
				</table></td>
		</tr>
		<tr>
			<td colspan="2" height="5">
			<table width="603" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="593" bgcolor="#f1f5f8"><img src="http://www.expedia.com/eta/spaceit.gif" width="593" height="5" /></td>
				<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="5" border="0" /></td>
				<td width="9" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="9" height="1" /></td>
			</tr>
			</table>
			</td>
		</tr>
		</table></td>
	</tr>
	</table>
	<table width="600" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td width="1" bgcolor="#dee7ef"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" /></td>
		<td>
			<table width="598" cellpadding="5" cellspacing="0" border="0">
			<xsl:if test="offerBox">
			<xsl:for-each select="offerBox">
			<tr>	
				<td bgcolor="#f1f5f8">				
					<table width="588" cellpadding="1" cellspacing="0" border="0">
						<xsl:if test="@paraMessage='yes' and @destInfo='yes'">
						<tr>
							<td bgcolor="#dee7ef">
								<table width="586" cellpadding="10" cellspacing="0" border="0">
								<tr>
									<td bgcolor="#ffffff" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
										<xsl:if test="destOffer">
										<xsl:for-each select="destOffer">
											<a><xsl:attribute name="href"><xsl:value-of select="@link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">FONT-FAMILY: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 14px; </xsl:attribute><b><xsl:value-of select="@text"  disable-output-escaping="yes" /></b></a><xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br /><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="5" /><br />
												<table cellpadding="3" cellspacing="0" border="0" width="100%">		
												<xsl:if test="offer">
												<xsl:for-each select="offer">
												<tr>		
													<td width="100%" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar25.gif" alt="2 1/2 stars" width="33" height="10" border="0" />												</xsl:when>
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar45.gif" alt="4 1/2 stars" width="55" height="10" border="0" />												</xsl:when>
													<xsl:when test="@star='5_0'">
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar50.gif" alt="5 stars" width="55" height="10" border="0" />
													</xsl:when>
													<xsl:otherwise></xsl:otherwise>
												</xsl:choose>&#160;<xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br /></td>
												</tr></xsl:for-each>
												</xsl:if>
													</table>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="para">
									<xsl:for-each select="para">
										<xsl:value-of select="." disable-output-escaping="yes"/><br/><br/>	
									</xsl:for-each>
								</xsl:if></td>
								</tr>
								</table></td>
						</tr>
						</xsl:if>
						<xsl:if test="@paraMessage='yes' and @destInfo='no'">
						<tr>
						<td bgcolor="#dee7ef">
							<table width="586" cellpadding="10" cellspacing="0" border="0">
							<tr>
								<td style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;" bgcolor="#ffffff">
									<xsl:if test="para">
									<xsl:for-each select="para">
										<br/><xsl:value-of select="." disable-output-escaping="yes"/><br/>	
									</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
							</table></td>
						</tr>
						</xsl:if>
						<xsl:if test="@destInfo='yes' and @paraMessage='no'">
						<tr>
							<td bgcolor="#dee7ef">
								<table width="586" cellpadding="10" cellspacing="0" border="0">
								<tr>
									<td bgcolor="#ffffff" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
										<xsl:if test="destOffer">
										<xsl:for-each select="destOffer">
											<a><xsl:attribute name="href"><xsl:value-of select="@link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">FONT-FAMILY: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 14px; </xsl:attribute><b><xsl:value-of select="@text"  disable-output-escaping="yes" /></b></a><xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br /><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="5" /><br />
												<table cellpadding="3" cellspacing="0" border="0" width="100%">
												<!--xsl:if test="destOffer[@package='no']"-->			
												<xsl:if test="offer">
												<xsl:for-each select="offer">
												<tr>		
													<td width="100%" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar25.gif" alt="2 1/2 stars" width="33" height="10" border="0" />												</xsl:when>
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar45.gif" alt="4 1/2 stars" width="55" height="10" border="0" />												</xsl:when>
													<xsl:when test="@star='5_0'">
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar50.gif" alt="5 stars" width="55" height="10" border="0" />
													</xsl:when>
													<xsl:otherwise></xsl:otherwise>
												</xsl:choose>&#160;<xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br/></td></tr>
											</xsl:for-each>
										</xsl:if></table>
									</xsl:for-each>
								</xsl:if></td>
									</tr>
									</table></td>
							</tr>
							</xsl:if>
							</table></td>
				</tr>
				</xsl:for-each>
				</xsl:if>
				</table></td>
			<td width="1" bgcolor="#dee7ef"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" /></td>
	</tr>
	<tr>
			<td width="1" bgcolor="#dee7ef"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" /></td><td height="5" bgcolor="#f1f5f8"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="5" /></td><td width="1" bgcolor="#dee7ef"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" /></td>
	</tr>
	</table>
	</xsl:when>
	<xsl:when test="my:heroSection/@my:hide='yes'">
<table width="600" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td colspan="3" valign="top" width="600"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="600" height="1" border="0" /></td>
	</tr>
	<tr>
		<td width="1" bgcolor="#dee7ef"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" /></td>
		<td>
			<table width="598" cellpadding="5" cellspacing="0" border="0">
			<xsl:if test="offerBox">
			<xsl:for-each select="offerBox">
			<tr>	
				<td bgcolor="#f1f5f8">				
					<table width="588" cellpadding="1" cellspacing="0" border="0">
						<xsl:if test="@paraMessage='yes' and @destInfo='yes'">
						<tr>
							<td bgcolor="#dee7ef">
								<table width="586" cellpadding="10" cellspacing="0" border="0">
								<tr>
									<td bgcolor="#ffffff" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
										<xsl:if test="destOffer">
										<xsl:for-each select="destOffer">
											<a><xsl:attribute name="href"><xsl:value-of select="@link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">FONT-FAMILY: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 14px; </xsl:attribute><b><xsl:value-of select="@text"  disable-output-escaping="yes" /></b></a><xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br /><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="5" /><br />
												<table cellpadding="3" cellspacing="0" border="0" width="100%">		
												<xsl:if test="offer">
												<xsl:for-each select="offer">
												<tr>		
													<td width="100%" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar25.gif" alt="2 1/2 stars" width="33" height="10" border="0" />												</xsl:when>
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar45.gif" alt="4 1/2 stars" width="55" height="10" border="0" />												</xsl:when>
													<xsl:when test="@star='5_0'">
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar50.gif" alt="5 stars" width="55" height="10" border="0" />
													</xsl:when>
													<xsl:otherwise></xsl:otherwise>
												</xsl:choose>&#160;<xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br /></td>
												</tr></xsl:for-each>
												</xsl:if>
													</table>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="para">
									<xsl:for-each select="para">
										<xsl:value-of select="." disable-output-escaping="yes"/><br/><br/>	
									</xsl:for-each>
								</xsl:if></td>
								</tr>
								</table></td>
						</tr>
						</xsl:if>
						<xsl:if test="@paraMessage='yes' and @destInfo='no'">
						<tr>
						<td bgcolor="#dee7ef">
							<table width="586" cellpadding="10" cellspacing="0" border="0">
							<tr>
								<td style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;" bgcolor="#ffffff">
									<xsl:if test="para">
									<xsl:for-each select="para">
										<br/><xsl:value-of select="." disable-output-escaping="yes"/><br/>	
									</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
							</table></td>
						</tr>
						</xsl:if>
						<xsl:if test="@destInfo='yes' and @paraMessage='no'">
						<tr>
							<td bgcolor="#dee7ef">
								<table width="586" cellpadding="10" cellspacing="0" border="0">
								<tr>
									<td bgcolor="#ffffff" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
										<xsl:if test="destOffer">
										<xsl:for-each select="destOffer">
											<a><xsl:attribute name="href"><xsl:value-of select="@link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">FONT-FAMILY: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 14px; </xsl:attribute><xsl:value-of select="@text"  disable-output-escaping="yes" /></a><xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br /><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="5" /><br />
												<table cellpadding="3" cellspacing="0" border="0" width="100%">
												<xsl:if test="offer">
												<xsl:for-each select="offer">
												<tr>		
													<td width="100%" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar25.gif" alt="2 1/2 stars" width="33" height="10" border="0" />												</xsl:when>
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar45.gif" alt="4 1/2 stars" width="55" height="10" border="0" />												</xsl:when>
													<xsl:when test="@star='5_0'">
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar50.gif" alt="5 stars" width="55" height="10" border="0" />
													</xsl:when>
													<xsl:otherwise></xsl:otherwise>
												</xsl:choose>&#160;<xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br/></td></tr>
											</xsl:for-each>
										</xsl:if></table>
									</xsl:for-each>
								</xsl:if></td>
									</tr>
									</table></td>
							</tr>
							</xsl:if>
							</table></td>
				</tr>
				</xsl:for-each>
				</xsl:if>
				</table></td>
			<td width="1" bgcolor="#dee7ef"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" /></td>
	</tr>
	</table>	
	</xsl:when>
	<xsl:when test="my:heroSection/@my:onCER='yes'">
	<table width="600" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td colspan="3" valign="top" width="600"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="600" height="1" border="0" /></td>
	</tr>
	<tr>
		<td width="1" bgcolor="#dee7ef"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" /></td>
		<td>
			<table width="598" cellpadding="5" cellspacing="0" border="0">
			<xsl:if test="offerBox">
			<xsl:for-each select="offerBox">
			<tr>	
				<td bgcolor="#f1f5f8">				
					<table width="588" cellpadding="1" cellspacing="0" border="0">
						<xsl:if test="@paraMessage='yes' and @destInfo='yes'">
						<tr>
							<td bgcolor="#dee7ef">
								<table width="586" cellpadding="10" cellspacing="0" border="0">
								<tr>
									<td bgcolor="#ffffff" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
										<xsl:if test="destOffer">
										<xsl:for-each select="destOffer">
											<a><xsl:attribute name="href"><xsl:value-of select="@link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">FONT-FAMILY: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 14px; </xsl:attribute><b><xsl:value-of select="@text"  disable-output-escaping="yes" /></b></a><xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br /><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="5" /><br />
												<table cellpadding="3" cellspacing="0" border="0" width="100%">		
												<xsl:if test="offer">
												<xsl:for-each select="offer">
												<tr>		
													<td width="100%" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar25.gif" alt="2 1/2 stars" width="33" height="10" border="0" />												</xsl:when>
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar45.gif" alt="4 1/2 stars" width="55" height="10" border="0" />												</xsl:when>
													<xsl:when test="@star='5_0'">
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar50.gif" alt="5 stars" width="55" height="10" border="0" />
													</xsl:when>
													<xsl:otherwise></xsl:otherwise>
												</xsl:choose>&#160;<xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br /></td>
												</tr></xsl:for-each>
												</xsl:if>
													</table>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="para">
									<xsl:for-each select="para">
										<xsl:value-of select="." disable-output-escaping="yes"/><br/><br/>	
									</xsl:for-each>
								</xsl:if></td>
								</tr>
								</table></td>
						</tr>
						</xsl:if>
						<xsl:if test="@paraMessage='yes' and @destInfo='no'">
						<tr>
						<td bgcolor="#dee7ef">
							<table width="586" cellpadding="10" cellspacing="0" border="0">
							<tr>
								<td style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;" bgcolor="#ffffff">
									<xsl:if test="para">
									<xsl:for-each select="para">
										<br/><xsl:value-of select="." disable-output-escaping="yes"/><br/>	
									</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
							</table></td>
						</tr>
						</xsl:if>
						<xsl:if test="@destInfo='yes' and @paraMessage='no'">
						<tr>
							<td bgcolor="#dee7ef">
								<table width="586" cellpadding="10" cellspacing="0" border="0">
								<tr>
									<td bgcolor="#ffffff" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
										<xsl:if test="destOffer">
										<xsl:for-each select="destOffer">
											<a><xsl:attribute name="href"><xsl:value-of select="@link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:attribute name="style">FONT-FAMILY: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 14px; </xsl:attribute><b><xsl:value-of select="@text"  disable-output-escaping="yes" /></b></a><xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br /><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="5" /><br />
												<table cellpadding="3" cellspacing="0" border="0" width="100%">
												<!--xsl:if test="destOffer[@package='no']"-->			
												<xsl:if test="offer">
												<xsl:for-each select="offer">
												<tr>		
													<td width="100%" style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;">
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar25.gif" alt="2 1/2 stars" width="33" height="10" border="0" />												</xsl:when>
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
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar45.gif" alt="4 1/2 stars" width="55" height="10" border="0" />												</xsl:when>
													<xsl:when test="@star='5_0'">
														&#160;<img src="http://media.expedia.com/hotels/ratings/hotstar50.gif" alt="5 stars" width="55" height="10" border="0" />
													</xsl:when>
													<xsl:otherwise></xsl:otherwise>
												</xsl:choose>&#160;<xsl:value-of select="@blurb"  disable-output-escaping="yes" /><br/></td></tr>
											</xsl:for-each>
										</xsl:if></table>
									</xsl:for-each>
								</xsl:if></td>
									</tr>
									</table></td>
							</tr>
							</xsl:if>
							</table></td>
				</tr>
				</xsl:for-each>
				</xsl:if>
				</table></td>
			<td width="1" bgcolor="#dee7ef"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" /></td>
	</tr>
	</table>
	<table width="609" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="213" border="0" /></td>
		<td width="5" bgcolor="#f1f5f8" valign="bottom"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" /></td>
		<td>
		<table width="603" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="2" height="5">
			<table width="603" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="593" bgcolor="#f1f5f8"><img src="http://www.expedia.com/eta/spaceit.gif" width="593" height="5" /></td>
				<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="5" border="0" /></td>
				<td width="9" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="9" height="1" /></td>
			</tr>
			</table></td>
		</tr>
		<tr>
			<td colspan="2" height="1">
			<table width="603" cellpadding="0" cellspacing="0" border="0">
			<tr>
			<td width="588"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="588" height="1" border="0" /></td>
			<td height="1" width="5" bgcolor="#f1f5f8"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="1" /></td>
			<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="1" border="0" /></td>
			<td width="9" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="9" height="1" /></td>
			</tr>
			</table></td>
		</tr>
		<tr>
			<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="200" border="0" /></td>
			<td>
				<table width="593" cellpadding="0" cellspacing="0" border="0">
				<xsl:if test="heroImage">
				<xsl:for-each select="heroImage">
				<tr>
					<td rowspan="3">
						<a><xsl:attribute name="href"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src">http://media.expedia.com/media/content/expus/graphics/mail/<xsl:value-of select="../../ID/@issue" /><xsl:value-of select="." disable-output-escaping="yes" /><xsl:choose>
			<xsl:when test="@my:imgType='jpg'">.jpg</xsl:when><xsl:when test="@my:imgType='gif'">.gif</xsl:when></xsl:choose></xsl:attribute> <xsl:attribute name="width">409</xsl:attribute> <xsl:attribute name="height">200</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@text"/></xsl:attribute></img></a>
					</td>
					<td valign="top" align="left"><img><xsl:attribute name="src">http://media.expedia.com/media/content/expus/graphics/mail/<xsl:value-of select="../../ID/@issue" /><xsl:value-of select="." disable-output-escaping="yes" />_top.gif</xsl:attribute><xsl:attribute name="width">177</xsl:attribute> <xsl:attribute name="height">7</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></td>
					<td height="6"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="6" border="0" /></td>
					<td bgcolor="#f1f5f8" width="5"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="6" /></td>
					<td height="6"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="6" border="0" /></td>
				</tr>
				</xsl:for-each>											
				</xsl:if>
				<tr>
					<td colspan="4" width="184">
					<xsl:if test="searchWizard">
					<xsl:for-each select="searchWizard">
						<xsl:choose>
						<xsl:when test="@type='hotel'">
						<table width="184" cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td colspan="2" height="23" bgcolor="#336799" align="left">
								<table cellspacing="0" width="182" cellpadding="0" border="0">
								<tr>
									<td valign="middle" align="right"><font face="arial, helvetica, sans serif" size="2" color="#ffffff"><b>Find your hotel</b></font></td>
									<td align="right" valign="bottom" bgcolor="#336799"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="3" /><br /><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_hotel_icon_top.gif" width="63" height="20" border="0" /></td>
								</tr></table></td>
						</tr>
						<tr>
							<td width="1" bgcolor="#dee7ef"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="163" border="0" /></td>
							<td width="184" bgcolor="#fffaee" align="center">
								<table width="182" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="10"><img src="http://www.expedia.com/eta/spaceit.gif" width="10" height="1" border="0" /></td>
									<td align="center" valign="middle" bgcolor="#fffaee">
									<form method="GET" name="HotSearch" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
										<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td width="119"><font face="arial, helvetica, sans serif" size="1">Destination City:</font></td>
											<td width="63" valign="top" align="right"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_hotel_icon_btm.gif" width="63" height="16" border="0" /><br /><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="2" border="0" /></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="100" name="CityName" style="width:155px" value="" />
											</td>
										</tr>
										<tr>
											<td colspan="2" align="left">
												<font face="arial, helvetica, sans serif" size="1">Check-in date: (MM/DD/YY)</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="InDate" value="" size="9" style="width:70px" />
											</td>
										</tr>
										<tr>
											<td colspan="2" align="left">
												<font face="arial, helvetica, sans serif" size="1">Check-out date: (MM/DD/YY)</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="OutDate" value="" size="9" style="width:70px" />
											</td>
										</tr>
										<tr>
											<td height="5"><img src="http://www.expedia.com/eta/spaceit.gif" height="5" width="1" border="0" /></td>
										</tr>
										<tr>
											<td colspan="2" valign="top" align="left" type="NOWRAP"><table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="50%" align="left">
									<select name="NumAdult" style="width:70px;">
										<option value="1">1 adult</option>
										<option value="2">2 adults</option>
										<option value="3">3 adults</option>
										<option value="4">4 adults</option>
										<option value="5">5 adults</option>
										<option value="6">6 adults</option>
									</select>
												</td><td width="50%" align="right"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_search.gif" align="absmiddle" /></td></tr></table></td>	
										</tr>
										</table><input type="hidden" name="GOTO" value="HOTSEARCH" /></form></td>
								</tr>
								</table></td>		
						</tr>
						<tr>
							<td colspan="3" width="184"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="184" height="1" border="0" /></td></tr>
						</table>
						</xsl:when>
						<xsl:when test="@type='packages'">
						<table width="184" cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td colspan="2" height="23" bgcolor="#336799" align="left">
								<table cellspacing="0" width="182" cellpadding="0" border="0">
								<tr>
									<td align="center" valign="middle"><font face="arial, helvetica, sans serif" size="2" color="#ffffff"><b>Find flight+hotel</b></font></td>
									<td width="1"  height="23" align="right" bgcolor="#336799"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="23" /></td>
								</tr></table></td>
						</tr>
						<tr>
							<td width="1" bgcolor="#dee7ef"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="163" border="0" /></td>
							<td width="184" bgcolor="#fffaee" align="center">
								<table width="182" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="10"><img src="http://www.expedia.com/eta/spaceit.gif" width="10" height="1" border="0" /></td>
									<td align="center" valign="middle" bgcolor="#fffaee">
									<form method="GET" name="FT_Hot" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
										<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td colspan="2" align="left"><font face="arial, helvetica, sans serif" size="1">Departing from:</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="100" name="FrAirport" style="width:155px" value="" />
											</td>
										</tr>
										<tr>
											<td colspan="2" align="left">
												<font face="arial, helvetica, sans serif" size="1">Going to:</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="100" name="DestName" style="width:155px" value="" />
											</td>
										</tr>
										<tr>
											<td align="left">
												<font face="arial, helvetica, sans serif" size="1">Depart:</font></td>
												<td align="left">
												<font face="arial, helvetica, sans serif" size="1">Return:</font></td>
										</tr>
										<tr>
											<td align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="FromDate" size="9" style="width:70px" value="mm/dd/yy" />
											</td>
											<td align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="ToDate" size="9" style="width:70px" value="mm/dd/yy" />
											</td>
										</tr>
										<tr><td colspan="2"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="7" border="0" /></td></tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP"><table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="50%" align="left">
									<select name="Numadult">
										<option value="1">1 adult</option>
										<option value="2">2 adults</option>
										<option value="3">3 adults</option>
										<option value="4">4 adults</option>
										<option value="5">5 adults</option>
										<option value="6">6 adults</option>
									</select>
												</td><td width="50%" align="right"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_search.gif" align="absmiddle" /></td></tr></table></td>
										</tr>
										</table><input type="hidden" name="GOTO" value="PackageWiz"/></form>	</td>
								</tr>
								</table></td>		
						</tr>
						<tr>
							<td colspan="3" width="184"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="184" height="1" border="0" /></td></tr>
						</table></xsl:when>
						<xsl:when test="@type='flight'">
								<table width="184" cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td colspan="2" height="23" bgcolor="#336799" align="left">
								<table cellspacing="0" width="182" cellpadding="0" border="0">
								<tr>
									<td align="center" valign="middle"><font face="arial, helvetica, sans serif" size="2" color="#ffffff"><b>Find your flight</b></font></td>
									<td width="1"  height="23" align="right" bgcolor="#336799"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="23" /></td>
								</tr></table></td>
						</tr>
						<tr>
							<td width="1" bgcolor="#dee7ef"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="163" border="0" /></td>
							<td width="184" bgcolor="#fffaee" align="center">
								<table width="182" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="10"><img src="http://www.expedia.com/eta/spaceit.gif" width="10" height="1" border="0" /></td>
									<td align="center" valign="middle" bgcolor="#fffaee">
									<form method="GET" name="FT_Hot" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
										<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td colspan="2" align="left"><font face="arial, helvetica, sans serif" size="1">Departing from:</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="100" name="FrAirport" style="width:155px" value="" />
											</td>
										</tr>
										<tr>
											<td colspan="2" align="left">
												<font face="arial, helvetica, sans serif" size="1">Going to:</font></td>
										</tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP">
												<input maxlength="100" name="Toairport" style="width:155px" value="" />
											</td>
										</tr>
										<tr>
											<td align="left">
												<font face="arial, helvetica, sans serif" size="1">Depart:</font></td>
												<td align="left">
												<font face="arial, helvetica, sans serif" size="1">Return:</font></td>
										</tr>
										<tr>
											<td align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="FromDate" size="9" style="width:70px" value="mm/dd/yy" />
											</td>
											<td align="left" valign="top" type="NOWRAP">
												<input maxlength="8" name="ToDate" size="9" style="width:70px" value="mm/dd/yy" />
											</td>
										</tr>
										<tr><td colspan="2"><img src="http://www.expedia.com/eta/spaceit.gif" width="1" height="7" border="0" /></td></tr>
										<tr>
											<td colspan="2" align="left" valign="top" type="NOWRAP"><table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="50%" align="left">
									<select name="Numadult">
										<option value="1">1 adult</option>
										<option value="2">2 adults</option>
										<option value="3">3 adults</option>
										<option value="4">4 adults</option>
										<option value="5">5 adults</option>
										<option value="6">6 adults</option>
									</select>
												</td><td width="50%" align="right"><input name="GO" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_search.gif" align="absmiddle" /></td></tr></table></td>
										</tr>
										</table><input type="hidden" name="GOTO" value="EXPFLTWIZ" /></form>	</td>
								</tr>
								</table></td>		
						</tr>
						<tr>
							<td colspan="3" width="184"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="184" height="1" border="0" /></td></tr>
						</table>
						</xsl:when>
				</xsl:choose>
				</xsl:for-each>
				</xsl:if>			
				</td>
				<td width="9"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_right_side_wiz.gif" width="9" height="187" border="0" /></td>	
			</tr>
			<xsl:if test="heroImage">
				<xsl:for-each select="heroImage">
			<tr>
				<td valign="top" align="left"><img><xsl:attribute name="src">http://media.expedia.com/media/content/expus/graphics/mail/<xsl:value-of select="../../ID/@issue" /><xsl:value-of select="." disable-output-escaping="yes" />_bottom.gif</xsl:attribute><xsl:attribute name="width">177</xsl:attribute> <xsl:attribute name="height">6</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></td>
				<td height="7"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="7" border="0" /></td>
				<td bgcolor="#f1f5f8" width="5"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="7" /></td>
				<td height="7"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="7" border="0" /></td>
			</tr>
			</xsl:for-each>
			</xsl:if>
			</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="1">
				<table width="603" cellpadding="0" cellspacing="0" border="0">
				<tr>
				<td width="588"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="588" height="1" border="0" /></td>
				<td height="1" width="5" bgcolor="#f1f5f8"><img src="http://www.expedia.com/eta/spaceit.gif" width="5" height="1" /></td>
				<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="1" border="0" /></td>
				<td width="9" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="9" height="1" /></td>
				</tr>
				</table></td>
		</tr>
		<tr>
			<td colspan="2" height="5">
			<table width="603" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="593" bgcolor="#f1f5f8"><img src="http://www.expedia.com/eta/spaceit.gif" width="593" height="5" /></td>
				<td width="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" height="5" border="0" /></td>
				<td width="9" bgcolor="#ffffff"><img src="http://www.expedia.com/eta/spaceit.gif" width="9" height="1" /></td>
			</tr>
			</table>
			</td>
		</tr>
		</table></td>
	</tr>
	</table>		
	</xsl:when>
	</xsl:choose>
	
	<table width="600" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td width="1" bgcolor="#dee7ef"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" border="0" /></td>
		<td>
			<table width="598" cellpadding="0" cellspacing="0" border="0">
            <tr>
				<td width="52" height="28" align="left" bgcolor="#FFFFFF">
					<img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" alt="" /></td>
				<td width="388" height="28" align="left" valign="bottom" bgcolor="#FFFFFF">
				<xsl:if test="navTabs">
				<xsl:for-each select="navTabs">
					<table cellpadding="4" cellspacing="0" border="0">
					<tr>
						<xsl:choose>
							<xsl:when test="Flights[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:when test="Hotels[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:when test="Cars[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"  bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:when test="VacaPack[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:when test="Cruises[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:when test="Activities[@state='yes']">
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
							</xsl:when>
							<xsl:otherwise><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td></xsl:otherwise>
						</xsl:choose>
				</tr>
				</table></xsl:for-each>
	</xsl:if></td>
			<td width="148" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="148" height="1" /></td>
		</tr>
		<tr>
			<td colspan="3" width="598" height="5" valign="top" bgcolor="#FFDF7B"><img src="http://www.expedia.com/eta/spaceit.gif" width="598" height="5" alt="" /></td>
		</tr>
		<tr>
			<td colspan="3" width="598" height="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="598" height="1" border="0" /></td>
		</tr>
		</table></td>
		<td width="1" bgcolor="#dee7ef"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" border="0" /></td>
	</tr>
	</table>
    		    
	<table width="600" cellpadding="0" cellspacing="0" border="0">
	<tr>
			<td width="15" valign="top" bgcolor="#FFFFFF"></td>
			<td width="550" valign="top" bgcolor="#ffffff" style="border: 10px solid #ffffff;" ><br />
				<font face="arial, helvetica, sans serif" size="1" color="#666666" style="font-family: arial, helvetica, sans serif; font-size: 9px; line-height: 10px; font-weight: bold; color: #666666">
			<xsl:if test="SpecialTerms/@action='yes'">
			TERMS AND CONDITIONS<br /><br />
					<xsl:for-each select="SpecialTerms">
						<xsl:value-of select="." disable-output-escaping="yes" /><br /><br />										
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="SpecialTerms/@action='no'"></xsl:if>	
	UNSUBSCRIBE
				<br />
				<br /> 
				If you do not wish to receive future e-mail advertisements from us, please <a href="http://expediamail.com/PUBLISH(sub_mgmt_page)"><font color="#666666">click here</font></a>. Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, <a href="https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">click here</font></a> for personalized help. 
				<br />
				<br />
				CONTACT US
				<br />
				<br /> 
				To contact us or send feedback, please <a href="https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">click here</font></a> or contact us via postal mail at: Expedia, Inc., attn: PCC Team, 3150 139th avenue SE, Bellevue, WA  98005. For additional assistance, visit the Expedia.com <a href="http://www.expedia.com/daily/service/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><font color="#666666">Customer Support Center</font></a>. 
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
				Hotel, vacation package, and cruise prices on the Expedia Website are constantly updated.  Please refer to the site for the most current pricing.  Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city.  additional taxes, fees, and charges may apply. airfare is subject to, without limitation: (1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip; (2) up to $18 per roundtrip in local airport charges; (3) Federal Excise Tax of $3.20 per U.S. domestic flight segment; (4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in alaska or Hawaii; and (5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking).  a segment is defined as a takeoff and a landing.
				<br /><br />
	CST #2029030-40
	<br />
	<br />
	&#169;2006 Expedia, Inc. All rights reserved.  Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries.  Other product and company names mentioned herein may be trademarks of their respective owners.
	<br />
	<xsl:if test="../ID">
	<xsl:for-each select="../ID">
	[+ "(EMID: CRM_PE_01_<xsl:value-of select="@issue" />)(MD: " . VAR(TODAY) . ")(EPID: $p->{'profile_key'})(BIID: $p->{'mailing_id'}_$p->{'_WAVE_ID_'})" +]
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
<xsl:comment>*****************END <xsl:value-of select="@name"/> CRM_TEMPLATE*****************</xsl:comment>
					</td>
				</tr>
			</table></td>
	</tr>
</table>
</xsl:for-each>
	</xsl:if>
</xsl:template>
</xsl:stylesheet>
