<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:my="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
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
					<tr>
						<td>
							<table width="600" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td colspan="3" height="51" align="left" valign="top" bgcolor="#FFFFFF">
										<a href="http://www.expedia.com/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
											<img src="http://media.expedia.com/media/content/expus/graphics/mail/logo_exphorz_short.gif" alt="Expedia.com" width="247" height="51" border="0"/>
										</a>
										<img src="http://www.expedia.com/eta/spaceit.gif" width="353" height="1"/>
									</td>
								</tr>
								<xsl:if test="navTabs">
									<xsl:for-each select="navTabs">
										<tr>
											<td width="52" align="left">
												<img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1"/>
											</td>
											<td height="28" align="left" valign="bottom" bgcolor="#FFFFFF">
												<table width="378" cellpadding="4" cellspacing="0" border="0">
													<tr>
														<xsl:choose>
															<xsl:when test="Flights[@state='yes']">
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B">
																	<a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a>
																</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">
																		<nobr>vacation packages</nobr>
																	</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a>
																</td>
															</xsl:when>
															<xsl:when test="Hotels[@state='yes']">
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a>
																</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B">
																	<a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a>
																</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">
																		<nobr>vacation packages</nobr>
																	</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a>
																</td>
															</xsl:when>
															<xsl:when test="Cars[@state='yes']">
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a>
																</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B">
																	<a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a>
																</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">
																		<nobr>vacation packages</nobr>
																	</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a>
																</td>
															</xsl:when>
															<xsl:when test="VacaPack[@state='yes']">
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a>
																</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B">
																	<a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">
																		<nobr>vacation packages</nobr>
																	</a>
																</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a>
																</td>
															</xsl:when>
															<xsl:when test="Cruises[@state='yes']">
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">
																		<nobr>vacation packages</nobr>
																	</a>
																</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B">
																	<a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a>
																</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a>
																</td>
															</xsl:when>
															<xsl:when test="Activities[@state='yes']">
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">
																		<nobr>vacation packages</nobr>
																	</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a>
																</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;" bgcolor="#FFDF7B">
																	<a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a>
																</td>
															</xsl:when>
															<xsl:otherwise>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">
																		<nobr>vacation packages</nobr>
																	</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a>
																</td>
																<td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td>
																<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">
																	<a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a>
																</td>
															</xsl:otherwise>
														</xsl:choose>
													</tr>
												</table>
											</td>
											<td width="158" align="left">
												<img src="http://www.expedia.com/eta/spaceit.gif" width="158" height="1"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<table width="600" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td height="5" valign="top" bgcolor="#FFDF7B">
											<img src="http://www.expedia.com/eta/spaceit.gif" width="598" height="5" alt=""/>
										</td>
									</tr>
									<tr>
										<td width="600" height="2" valign="top" bgcolor="#ffffff">
											<img src="http://www.expedia.com/eta/spaceit.gif" width="600" height="2" alt=""/>
										</td>
									</tr>
								</table>
								<table width="600" cellpadding="0" cellspacing="0" border="0">
									<tr>
<td colspan="3" valign="top" width="600"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="600" height="1" border="0"/></td>
</tr><tr>
										<td width="1" bgcolor="#dee7ef">
											<img src="http://www.expedia.com/eta/spaceit.gif" width="1"/>
										</td>
										<td>
											<table width="598" cellpadding="5" cellspacing="0" border="0">
												<tr>
													<td bgcolor="#f1f5f8">
														<table width="588" cellpadding="1" cellspacing="0" border="0">
															<tr>
																<td bgcolor="#dee7ef">
																	<table width="586" cellpadding="10" cellspacing="0" border="0">
																		<tr>
																			<xsl:if test="emergencyType">
																				<xsl:for-each select="emergencyType">
																					<xsl:choose>
																						<xsl:when test="weather[@state='true']">
																							<td style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;" bgcolor="#ffffff">
																								<br/>
																								<img src="\\Ctoohey02\graphics\CRM\02_travelalert_header.gif" width="566" height="76" border="0" alt="Traveler Alert"/>
																								<br/>
																								<br/>Our records indicate you have travel plans that <xsl:value-of select="../wording"/> affected by the <xsl:value-of select="../issue"/> in <xsl:value-of select="../region"/>.
<br/>
																								<br/>
Be assured we are here for you <xsl:value-of select="../available"></xsl:value-of> at <xsl:value-of select="../callUs"></xsl:value-of>. <!--[If not Expedia, please enter company's customer service availability (e.g. 24 hours a day) and phone number(s)]/-->
<br/>
																								<br/>
Your airline has exclusive, up-to-the minute ticket information and will be able to assist you. For a list of toll-free airline numbers, click here: <a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="../urlTollFreeAirlineNumbers" /></xsl:attribute><xsl:value-of select="../urlTollFreeAirlineNumbers" /></a>  <!--[If not Expedia, please delete and enter an available url for correct company. If there is no url with helpful numbers available, delete this paragraph.]/-->
																								<br/>
																								<br/>
Check the status of your flight at Expedia's Arrivals and Departures page: <a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="../urlArrivalsDepartures" /></xsl:attribute><xsl:value-of select="../urlArrivalsDepartures" /></a> <!--[If not Expedia, please delete and enter an available url for correct company. If there is no url with helpful numbers available, delete this paragraph.]/-->
<br/><br/>
If you have other questions, call us <xsl:value-of select="../available"></xsl:value-of> at <xsl:value-of select="../callUs"></xsl:value-of>. <!--[If not Expedia, please enter company's customer service availability (e.g. 24 hours a day) and phone number(s)]/-->
																							</td>
																						</xsl:when>
																						<xsl:when test="world[@state='true']">
																							<td style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;" bgcolor="#ffffff">
																								<br/>
																								<img src="\\Ctoohey02\graphics\CRM\02_travelalert_header.gif" width="566" height="76" border="0" alt="Traveler Alert"/>
																								<br/>
																								<br/>Our records indicate you have travel plans that have been affected by the  <xsl:value-of select="../issue"/> in <xsl:value-of select="../region"/>. 
<br/>
																								<br/>
Be assured we are here for you <xsl:value-of select="../available"></xsl:value-of> at <xsl:value-of select="../callUs"></xsl:value-of>. <!--[If not Expedia, please enter company's customer service availability (e.g. 24 hours a day) and phone number(s)]/-->
																								<br/>
																								<br/>
Your airline has exclusive, up-to-the minute ticket information and will be able to assist you. For a list of toll-free airline numbers, click here: <a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="../urlTollFreeAirlineNumbers" /></xsl:attribute><xsl:value-of select="../urlTollFreeAirlineNumbers" /></a>  <!--[If not Expedia, please delete and enter an available url for correct company. If there is no url with helpful numbers available, delete this paragraph.]/-->
																								<br/>
																								<br/>
Check the status of your flight at Expedia's Arrivals and Departures page: <a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="../urlArrivalsDepartures" /></xsl:attribute><xsl:value-of select="../urlArrivalsDepartures" /></a>
<br/><br/>
If you have other questions, call us <xsl:value-of select="../available"></xsl:value-of> at <xsl:value-of select="../callUs"></xsl:value-of>. <!--[If not Expedia, please enter company's customer service availability (e.g. 24 hours a day) and phone number(s)]/--></td>
																						</xsl:when>
																						<xsl:when test="industry[@state='true']">
																							<td style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;" bgcolor="#ffffff">
																								<br/>
																								<img src="\\Ctoohey02\graphics\CRM\02_travelalert_header.gif" width="566" height="76" border="0" alt="Traveler Alert"/>
																								<br/>
																								<br/>
																								<xsl:value-of select="../company"/> has announced cancellation of service to these airports:
																								<ul>
																								<xsl:apply-templates select="../airportsEffected/airport"/> <br/></ul>
																								 We are contacting you because our records indicate that your travel plans could be affected by the  <xsl:value-of select="../issue"/>.
<br/>
																								<br/>
If you have a flight reservation on one of these routes, contact your airline to assist you with your plans. <!--[Assuming that the airline will be handling reaccommodation. All reaccommodation info should go here]/-->
<br/>
																								<br/>

You can reach <xsl:value-of select="../company"/> at:
<ul>
																									<xsl:apply-templates select="../companyContact/info"/>
																								</ul>
																								<br/>
																								<br/>
If you have a paper ticket, <xsl:value-of select="../refundInfo/paperTicket"/>
																								<br/>
																								<br/>
If you have an e-ticket,  <xsl:value-of select="../refundInfo/eTicket"/>.
<xsl:if test="../refundInfo/other">
																									<br/>
																									<br/>
																									<xsl:value-of select="../refundInfo/other"/>
																								</xsl:if>
																								<br/><br/>Be assured we are here for you <xsl:value-of select="../available"></xsl:value-of> at <xsl:value-of select="../callUs"></xsl:value-of>. <!--[If not Expedia, please enter company's customer service availability (e.g. 24 hours a day) and phone number(s)]/-->
																							</td>
																						</xsl:when>
																					</xsl:choose>
																				</xsl:for-each>
																			</xsl:if>
																		</tr>
																		<tr>
																		<td style="FONT-FAMILY: arial, helvetica, sans serif; FONT-SIZE: 12px;" bgcolor="#ffffff">
Helping customers is our top priority. During this critical time, call volumes may be high, and we appreciate your patience.
<br/><br/>
<xsl:value-of select="from"></xsl:value-of><br/>
<a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href">http://<xsl:value-of select="fromURL" /></xsl:attribute><xsl:value-of select="fromURL" /></a></td></tr>
																	</table>
																	

																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
										<td width="1" bgcolor="#dee7ef">
											<img src="http://www.expedia.com/eta/spaceit.gif" width="1"/>
										</td>
									</tr>
									</table>
									<table width="600" cellpadding="0" cellspacing="0" border="0">
	<tr>
	<td width="1" bgcolor="#dee7ef"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" border="0"/></td>
	<td>
		<table width="598" cellpadding="0" cellspacing="0" border="0">
		<tr>
		<td width="52" height="28" align="left" bgcolor="#FFFFFF"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" alt=""/></td>
		<td width="388" height="28" align="left" valign="bottom" bgcolor="#FFFFFF">
			<table cellpadding="4" cellspacing="0" border="0">
			<tr>
			<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
			</tr>
			</table></td>
		<td width="148" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="148" height="1"/></td>
		</tr>
		<tr>
		<td colspan="3" width="598" height="5" valign="top" bgcolor="#FFDF7B"><img src="http://www.expedia.com/eta/spaceit.gif" width="598" height="5" alt=""/></td>
		</tr>
		<tr>
		<td colspan="3" width="598" height="1"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="598" height="1" border="0"/></td>
		</tr>
		</table>
	</td>
	<td width="1" bgcolor="#dee7ef"><img src="http://media.expedia.com/media/content/expus/graphics/mail/crm_gen_dee7ef.gif" width="1" border="0"/></td>
</tr>
</table>
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
	
	<xsl:template match="info">
		<li>
			<xsl:value-of select="."/>
		</li>
	</xsl:template>
		<xsl:template match="airport">
		<li>
			<xsl:value-of select="."/>
		</li>
	</xsl:template>
</xsl:stylesheet>
