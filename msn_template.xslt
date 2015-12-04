<?xml version="1.0"  encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2005-12-29T00:09:13">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>
<xsl:template match="email">
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
					</xsl:if></font></td>
				</tr>
			</table></td>
	</tr>
	</table>
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
							<a href="http://www.expedia.com/default.asp?"><img src="http://media.expedia.com/media/content/expus/graphics/mail/logo_exphorz_short.gif" alt="Expedia.com" width="247" height="51" border="0" /></a>
							</td>
							<td width="518" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #cc6600;">
								<xsl:if test="my:headerOffer[@my:state='yes']">
								<xsl:for-each select="my:headerOffer">
									<b><xsl:value-of select="@my:shortText"  disable-output-escaping="yes" /></b>&#160;<a><xsl:attribute name="href"><xsl:value-of select="@my:url" /></xsl:attribute><xsl:attribute name="style">font-family: arial, helvetica, sans serif; font-size: 12px; color:#cc6600;</xsl:attribute><xsl:value-of select="@my:blurb" disable-output-escaping="yes" /></a></xsl:for-each></xsl:if>
							</td>
							<td width="35"></td>
					</tr>
					</table></td>
				</tr>
				<tr>
					<td colspan="3" height="9" valign="top"></td>
				</tr>
				<tr>
					<td colspan="3" height="1" valign="top"><img src="http://www.expedia.com/eta/spaceit.gif" width="800" height="1" alt="" /></td>
				</tr>
				<tr>
					<td width="52" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
					<td width="538" height="24" align="left" valign="bottom" style="font-size: 12px; color: #31339A; text-decoration: none;">
					 
						<table width="538" cellpadding="4" cellspacing="0" border="0">
						<tr>
							<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
						</tr>
						</table></td>
					<td width="170" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="170" height="1" /></td>
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
																					<xsl:if test="@my:link != ''"><a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="@my:link" /></xsl:attribute>
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
																	<a><xsl:attribute name="href"><xsl:value-of select="@link" /></xsl:attribute>
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
																				<a><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="@link" /></xsl:attribute>
																				<b><xsl:value-of select="@linktext"  disable-output-escaping="yes" /></b></a>: <xsl:value-of select="."  disable-output-escaping="yes" /></td>
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
																		<td height="22"><a><xsl:attribute name="href"><xsl:value-of select="@link" /></xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_left.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td height="22" bgcolor="#0b8f46" valign="middle"><a><xsl:attribute name="href"><xsl:value-of select="@link" /></xsl:attribute><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; text-decoration:none; vertical-align: middle;">Search <xsl:if test="my:buttonText = ''"><xsl:value-of select="translate(@header, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" disable-output-escaping="yes"/></xsl:if><xsl:if test="my:buttonText != ''"><xsl:value-of select="my:buttonText" disable-output-escaping="yes"/></xsl:if></div></a></td>
																		<td height="22"><a><xsl:attribute name="href"><xsl:value-of select="@link" /></xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_right.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>					
																	</tr>
																	</table><xsl:if test="position() = last()and @header ='Cruises'"><div style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699; font-weight: bold;">Call 1-888-249-3978 to speak with a Cruise Specialist.</div></xsl:if>
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
																			<a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_discover_1.jpg</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td width="5"></td>
																		<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 12px;">
																			<b>Tours &amp; Sightseeing</b><br />
																			<a href="http://www.expedia.com/daily/activities/default.asp?" style="color: #336699;">Places to go, things to see</a></td>
																	</tr>
																	<tr>
																		<td colspan="2" height="5"></td>
																	</tr>
																	<tr>
																		<td valign="top" align="left">
																			<a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_discover_2.jpg</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td width="5"></td>
																		<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 12px;">
																			<b>Events &amp; Shows</b><br />
																			<a href="http://www.expedia.com/daily/activities/default.asp?" style="color: #336699;">See the hottest shows!</a></td>
																	</tr>
																	</table></td>
																<td valign="top" align="left" width="252">																
																	<table cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td valign="top" align="left">
																			<a><xsl:attribute name="href">http://www.expedia.com/daily/highlights/Home-And-Abroad/default.asp?</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_discover_3.gif</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td width="5"></td>
																		<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 12px;">
																			<b>Unique travel planning</b><br />
																			Get <a href="http://www.expedia.com/daily/highlights/Home-And-Abroad/default.asp?" style="color: #336699;">free, customized<br /> personal activity planning</a></td>
																	</tr>
																	<tr>
																		<td colspan="2" height="5"></td>
																	</tr>
																	</table>
																	<table cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td valign="top" align="left">
																			<a><xsl:attribute name="href">http://www.expedia.com/daily/highlights/Fun-Booths/default.asp?</xsl:attribute>
																			<img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_03_discover_5.gif</xsl:attribute> <xsl:attribute name="width">70</xsl:attribute> <xsl:attribute name="height">70</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td width="5"></td>
																		<td align="left" valign="top" style="font-family: arial, helvetica, sans serif; color: #336699; FONT-SIZE: 12px;">
																			<b>Activities abound</b><br />
																			Look for Expedia!fun<br/>
																			desks in <a href="http://www.expedia.com/daily/highlights/Fun-Booths/default.asp?" style="color: #336699;">select cities</a></td>
																	</tr>
																	</table></td>
															</tr>
															</table>
															<table cellpadding="0" cellspacing="0" border="0" align="right">
															<tr>
																<td align="right" valign="bottom">
																	<table cellpadding="0" cellspacing="0" border="0" align="right">
																	<tr>
																		<td height="22"><a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_left.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																		<td height="22" bgcolor="#0b8f46" valign="middle"><a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?</xsl:attribute><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; text-decoration:none; vertical-align: middle; width:90;">Search activities</div></a></td>
																		<td height="22"><a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_right.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
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
															<td colspan="2"><a><xsl:attribute name="href"><xsl:value-of select="@imagelink" /></xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="../@my:type" /><xsl:value-of select="../ID/@issue" />_hero<xsl:number value="position()" format="1" />.jpg</xsl:attribute> <xsl:attribute name="width">258</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"><xsl:value-of select="topimage/@imagename"/></xsl:attribute></img></a></td>
														</tr>
														<tr>
															<td align="left" bgcolor="#f1f4f7">
																<table width="100%" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td colspan="2" align="left" height="28" bgcolor="#7694bf">
																		<table width="168" cellpadding="0" cellspacing="0" border="0">
																		<tr>
																			<td width="153" align="right" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Search 'em now:</td><td bgcolor="#7694bf" width="15"></td>
																		</tr>
																		</table></td>
																</tr>
																<tr>
																	<td width="1" bgcolor="#d7dce8"></td><td width="167" height="16" bgcolor="#fffaee"></td>
																</tr>
																</table></td>
															<td align="left"><a><xsl:attribute name="href"><xsl:value-of select="@imagelink" /></xsl:attribute><img src="http://media.expedia.com/media/content/expus/graphics/mail/MMN_TR_03_search_fares2.jpg" width="90" height="44" border="0" alt="Find Low Fares!" /></a></td>
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
																			<td width="153" align="right" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Search 'em now:</td><td bgcolor="#7694bf" width="15"></td>
																		</tr>
																		</table></td>
																</tr>
																<tr>
																	<td width="1" bgcolor="#d7dce8"></td><td width="167" height="17" bgcolor="#fffaee"></td>
																</tr>
																</table></td>
															<td align="left"><a href="http://www.expedia.com/daily/flights/default.asp?"><img src="http://media.expedia.com/media/content/expus/graphics/mail/MMN_TR_03_search_fares.gif" width="90" height="75" border="0" alt="Find Low Fares!" /></a></td>
														</tr>
														</xsl:if>
														</table></td>
												</tr>
												<tr>
													<td align="left">
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
																						<tr><td height="22"><a href="http://www.expedia.com/daily/flights/default.asp?"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" height="22" border="0" /></a></td><td align="left" height="22" bgcolor="#0b8f46" valign="middle"><a href="http://www.expedia.com/daily/flights/default.asp?"><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:16; width:75; text-decoration:none;">Search flight</div></a></td><td height="22"><a href="http://www.expedia.com/daily/flights/default.asp?"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" height="22" border="0" /></a></td></tr>
																						</table></td>
																				</tr>
																				<tr>
																					<td height="10" colspan="2"></td>
																				</tr>
																				<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr><td height="22"><a href="http://www.expedia.com/daily/packages/default.asp?"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" height="22" border="0" /></a></td><td align="left" height="22" bgcolor="#0b8f46" valign="middle"><a href="http://www.expedia.com/daily/packages/default.asp?"><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:16; width:115; text-decoration:none;">Search flight + hotel</div></a></td><td height="22"><a href="http://www.expedia.com/daily/packages/default.asp?"><img src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" height="22" border="0" /></a></td></tr>
																						</table></td>
																				</tr>
																				</table></td>	
																</tr>
																</table></td>
														</tr>
														<tr>
															<td align="center" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #336699;"><a href="http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=FARECMP" style="color:#336699">Flexible travel dates? Look here</a></td>
														</tr>
														</table></td>	
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
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td align="left" width="258">
										<a><xsl:attribute name="href">http://www.expedia.com/daily/highlights/best-rate-guarantee/default.asp?</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>CM_CRM_01_email_bpg.jpg</xsl:attribute> <xsl:attribute name="alt">Best Price Guaranteed.</xsl:attribute> <xsl:attribute name="width">258</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></a></td>
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
			<td width="538"><table cellpadding="4" cellspacing="0" border="0">
					<tr>
<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
					</tr>
			</table></td>
			<td width="170" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="170" height="1" /></td>
		</tr>
		<tr>
			<td colspan="3" height="13" valign="top" bgcolor="#FFDF7B"></td>
		</tr>
		</table>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td height="15"  valign="top" bgcolor="#ffffff"></td>
			</tr>
			</table>
		<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff">
		<tr>
			<td valign="top" align="left" bgcolor="#ffffff" style="border: 25px solid #ffffff">
				<font face="arial, helvetica, sans serif" size="1" color="#666666" style="font-family: arial, helvetica, sans serif; font-size: 9px; line-height: 10px; font-weight: bold; color: #666666">
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
		If you do not wish to receive future e-mail advertisements from Expedia, Inc., please <a><xsl:attribute name="href">http://expediamail.com/PUBLISH(sub_mgmt_page)?&amp;</xsl:attribute><font color="#666666">click here</font></a>. Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, <a><xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;</xsl:attribute><font color="#666666">click here</font></a> for personalized help. 
		<br />
		<br />
		CONTACT US<br />
		To contact Expedia, Inc. or send feedback, please <a><xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;</xsl:attribute><font color="#666666">click here</font></a> or contact us via postal mail at: Expedia, Inc., Attn: EMC Team, 3150 139th Avenue SE, Bellevue, WA  98005. For additional assistance, visit the Expedia.com <a><xsl:attribute name="href">http://www.expedia.com/daily/service/default.asp?</xsl:attribute><font color="#666666">Customer Support Center</font></a>. 
		<br />
		<br />
		A NOTE ABOUT PRICES<br />
		Prices are subject to availability and subject to change without notice. 
		<br />
		<br />
		All prices were current at the time this e-mail was published. 
		<br />
		<br />
		Hotel, vacation package, and cruise prices on the Expedia Website are constantly updated. Please refer to the site for the most current pricing. Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city. Additional taxes, fees, and charges may apply. Airfare is subject to, without limitation: (1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip; (2) up to $18 per roundtrip in local airport charges; (3) Federal Excise Tax of $3.20 per U.S. domestic flight segment; (4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in Alaska or Hawaii; and (5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking). A segment is defined as a takeoff and a landing.  
		<br />
		<br />
		CST #2029030-40
		<br />
		<br />
		&#169;2007 Expedia, Inc. All rights reserved.  Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
		<br />
			</font></td>
	</tr>
	</table>	
	</td>
	</tr>
	</table>
</body>
</html>
</xsl:if>
</xsl:template>
</xsl:stylesheet>
