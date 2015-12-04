<?xml version="1.0"  encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2005-12-29T00:09:13">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>
<xsl:template match="email">
<xsl:if test="@type='CM_M_01_'">
<xsl:variable name="imgCommon">http://media.expedia.com/media/content/shared/graphics/common/mail/</xsl:variable>
<xsl:variable name="imgPath">http://media.expedia.com/media/content/shared/images/</xsl:variable>
<xsl:variable name="imgMailPath">http://media.expedia.com/media/content/expus/graphics/mail/</xsl:variable>
<xsl:variable name="iconPath">http://media.expedia.com/media/content/expus/graphics/mail/</xsl:variable>
<xsl:variable name="iconsPath">http://media.expedia.com/media/content/expus/graphics/icons/</xsl:variable>
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
					<td width="800" bgcolor="#FFFFFF"><font face="arial, helvetica, sans serif" size="2" color="#000000">
						<b>Subject Line:</b>&#160;&#160;<xsl:if test="subjectText">
						<xsl:for-each select="subjectText">
								<xsl:value-of select="." /><br />
						</xsl:for-each>
					</xsl:if></font></td>
				</tr>
			</table></td>
	</tr>
	</table>
<xsl:comment>***************** START COPY DEALS TEMPLATE*****************</xsl:comment> 
<html>
<head>
<title>Expedia.com</title>
</head>
<body bgcolor="#206ba4">
<div style="font-family: arial, helvetica, sans serif; color: #939393; font-size: 12px;"><a href="%%view_email_url%%" style="font-family: arial, helvetica, sans serif; color: #939393; font-size: 12px;">View this e-mail as a web page</a></div>
		<table width="804" cellpadding="1" cellspacing="0" border="0">
		<tr>
			<td width="802" bgcolor="#87a3cb">
			<table width="802" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="left" valign="top" height="64">
						<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td bgcolor="#7093b9" align="left" height="64" width="204">
								<a href="http://www.expedia.com/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif;  font-size: 12px; color: #ffffff;"><img src="http://media.expedia.com/media/content/expus/graphics/mail/expedia_email_logo.jpg" alt="Expedia.com" width="204" height="64" border="0" /></a>
							</td><td bgcolor="#7093b9" width="547" height="64" background="http://media.expedia.com/media/content/expus/graphics/mail/expedia_header_wave.jpg"><table cellpadding="0" cellspacing="2" border="0">
								<tr>
									<td width="547" align="right" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff;">
										<b>Act now for great rates on</b>&#160;<a style="color: #ffffff;" href="http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%"><b>last-minute getaways</b></a></td>
								</tr>
								<tr>
									<td width="547" align="right" valign="middle">
										<table cellpadding="0" cellspacing="4" border="0">
										<tr><td><a href="http://www.expedia.com/pub/agent.dll?qscr=info&amp;%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #ffffff;">My Account</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #ffffff;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/service/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #ffffff;">Customer Support</a></td></tr></table></td>
								</tr></table>
							</td><td width="51" height="64" bgcolor="#7093b9"></td>
					</tr>
					</table>
					<table cellpadding="0" cellspacing="0" border="0" width="802">
					<tr>
						<td align="left" bgcolor="#f0f4f7" width="100%">
							<table cellpadding="0" cellspacing="5" border="0">
							<tr>
								<td width="5"></td>
<td valign="bottom"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Flights</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/hotels/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Hotels</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/cars/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Cars</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Vacation Packages</nobr></a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/cruise/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Cruises</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;  text-decoration: none;">Activities</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Deals &amp; Destinations</nobr></a></td>
<td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/business/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Business Travel</nobr></a></td>
						</tr>
						</table></td>
				</tr>
				</table>
				<table width="802" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td valign="top" width="525" bgcolor="#f0f4f7">
						<table cellpadding="0" cellspacing="5" border="0">
						<tr>
							<td align="left" valign="top">
								<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">								
										<table width="525" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="525" bgcolor="#809cc3">
												<table width="523" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="523" bgcolor="#ffffff">											
														<table width="100%" cellpadding="0" cellspacing="2" border="0">
														<tr>
															<td valign="top" bgcolor="#ffffff">
																<table width="100%" cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;">No plans? No problem. </td>
																</tr>
																<tr>
																	<td valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 16px; color: #cc6600; font-weight: bold;">Save with our last-minute deals</td>
																</tr>
																<tr>
																	<td valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">For best availability and the <a style="color:#000000;" href="http://www.expedia.com/daily/highlights/best-rate-guarantee/default.asp?%%=OmnitureParams('')=%%"><u>Best Price Guarantee</u></a>, book now on Expedia.</td>
																</tr>
																</table></td>
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
												<table width="523" cellpadding="10" cellspacing="0" border="0">
												<tr>	
													<td width="503" bgcolor="#ffffff" valign="top" align="center">
													<xsl:if test="Destination[@DestPick='yes']">
													<xsl:for-each select="Destination[@DestPick='yes']">
													<!--xsl:if test="@DestPick='yes'"-->
														<table cellpadding="0" cellspacing="0" border="0">
														<xsl:if test="position()!= 1">
														<tr>
															<td height="1" bgcolor="#809cc3" style="line-height: 1px; color: #809cc3"></td>
														</tr>
														</xsl:if>
														<tr>
															<td valign="top">
																<table cellpadding="0" cellspacing="2" border="0" width="503">
																<tr>
																	<td height="22" width="218" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;"><xsl:value-of select="@Name" disable-output-escaping="yes" /></td>
																	<td width="60" align="left" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold;">Rating</td>
																	<td width="95" align="left" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold;"><nobr>Travel between</nobr></td>														
																	<td width="50" align="left" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; line-height: 11px;">Hotel<br/>&#160;<font style="font-size: 10px;">from</font></td>
																	<td width="80" align="left" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #cc6600; font-weight: bold;">Package</td>
																</tr>
																</table>
																<xsl:if test="Hotel">
																<xsl:for-each select="Hotel">
																<table><xsl:attribute name="cellpadding">0</xsl:attribute> <xsl:attribute name="cellspacing">2</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute> <xsl:attribute name="width">503</xsl:attribute><xsl:if test="position()mod 2 = 1"><xsl:attribute name="bgcolor">#f1f5f8</xsl:attribute></xsl:if>
																<tr>
																	<td width="218" valign="top" style="font-family: arial, helvetica, sans serif; font-size: 12px;"><a><xsl:attribute name="href">http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=HotDetails<xsl:value-of select="strURL" disable-output-escaping="yes" />&amp;%%=OmnitureParams('')=%%</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute><xsl:value-of select="@Name" disable-output-escaping="yes" /></a></td>
																	<td width="60" align="left" valign="middle">
																	<xsl:choose>
																		<xsl:when test="StarRating='10'">
																		<img src="http://media.expedia.com/hotels/ratings/hotstar10.gif" alt="1 star" width="11" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="StarRating='15'">
																			<img src="http://media.expedia.com/hotels/ratings/hotstar15.gif" alt="1 1/2 star" width="22" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="StarRating='20'">
																			<img src="http://media.expedia.com/hotels/ratings/hotstar20.gif"  alt="2 stars" width="22" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="StarRating='25'">
																			<img src="http://media.expedia.com/hotels/ratings/hotstar25.gif" alt="2 1/2 stars" width="33" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="StarRating='30'">
																			<img src="http://media.expedia.com/hotels/ratings/hotstar30.gif" alt="3 stars" width="33" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="StarRating='35'">
																			<img src="http://media.expedia.com/hotels/ratings/hotstar35.gif" alt="3 1/2 stars" width="44" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="StarRating='40'">
																			<img src="http://media.expedia.com/hotels/ratings/hotstar40.gif" alt="4 stars" width="44" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="StarRating='45'">
																			<img src="http://media.expedia.com/hotels/ratings/hotstar45.gif" alt="4 1/2 stars" width="55" height="10" border="0" />
																		</xsl:when>
																		<xsl:when test="StarRating='50'">
																			<img src="http://media.expedia.com/hotels/ratings/hotstar50.gif" alt="5 stars" width="55" height="10" border="0" />
																		</xsl:when>
																		<xsl:otherwise></xsl:otherwise></xsl:choose>
																	</td>
																	<td width="95" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><nobr><xsl:value-of select="TravelStartDate" disable-output-escaping="yes" /> - <xsl:value-of select="TravelEndDate" disable-output-escaping="yes" /></nobr></td>														
																	<td width="50" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-weight: bold; font-size: 12px;"><a><xsl:attribute name="href">http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=HotDetails<xsl:value-of select="strURL" disable-output-escaping="yes" />&amp;%%=OmnitureParams('')=%%</xsl:attribute><xsl:attribute name="style">color: #cc6600;</xsl:attribute>$<xsl:value-of select="Price" disable-output-escaping="yes" /></a></td>
																	<td width="80" align="" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 12px;"><a><xsl:attribute name="href">http://www.expedia.com/pubspec/scripts/eap.asp?GOTO=PkgHotDetails&amp;DestID=<xsl:value-of select="../@DestinationID" disable-output-escaping="yes" /><xsl:value-of select="strURL" disable-output-escaping="yes" />&amp;%%=OmnitureParams('')=%%</xsl:attribute><xsl:attribute name="style">color: #336699;</xsl:attribute>Hotel + Flight</a></td>
																</tr>
																</table>
																</xsl:for-each>
																</xsl:if>
																</td>
														</tr>
														<tr>
															<td colspan="5" height="15"></td>
														</tr>
														<xsl:if test="position()= last()">
														<tr>
															<td align="left">
																<table cellpadding="0" cellspacing="0" border="0" align="left">
																<tr>
																	<td height="22"><a><xsl:attribute name="href">http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_left.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																	<td height="22" bgcolor="#0b8f46" valign="middle"><a><xsl:attribute name="href">http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; text-decoration:none; vertical-align: middle;">See all last-minute getaways</div></a></td>
																	<td height="22"><a><xsl:attribute name="href">http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_right.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td></tr>
																</table>
															</td>
														</tr>
														</xsl:if>
														</table><!--/xsl:if-->
													</xsl:for-each>
													</xsl:if></td>	
											</tr>
											</table></td>
									</tr>
									</table></td>
							</tr>
							</table>
							</td>
							<td width="262" valign="top" align="center">
								<table width="262" cellpadding="5" cellspacing="0" border="0">
								<tr>
									<td width="262" valign="top" bgcolor="#5c84b7">
										<table width="252" cellpadding="2" cellspacing="0" border="0"> 
										<tr>
											<td width="252" bgcolor="#89a5cc">
												<table width="248" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="center">	
													<a><xsl:attribute name="href">http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>DNL_CM_M_01_Hero_1.jpg</xsl:attribute> <xsl:attribute name="width">248</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt">last-minute deals</xsl:attribute></img></a></td>
												</tr>
												</table>
												<table width="248" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="left" bgcolor="#ffe77b">
														<table cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="10"></td><td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 16px; color: #336699; font-weight: bold;">Build your trip</td>
														</tr>
														</table></td>
												</tr>
												<tr>
													<td width="248" valign="top" bgcolor="#ffffff">
																<table align="center" cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td><form style="margin-bottom:0;" method="GET" name="etaExpress" action="http://expediamail.com/p/EXPEDIA_US/master_package/default.html">
																<input type="hidden" name="GOTO" value="PackageWiz" />
																<input type="hidden" name="emlcid" value="%%=OmnitureParams('')=%%" />
																<input type="hidden" name="Numadult" value="1" />
																<input type="hidden" name="Numroom" value="1" />
																	<table cellpadding="0" cellspacing="2" border="0">
																	<tr>
																		<td colspan="3" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Select your choice(s) below:</td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType1" value="fl"/>flights</td>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" checked="checked" name="PackageType2" value="hot"/>hotels</td>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;"><input type="checkbox" name="PackageType3" value="car"/>cars</td>
																		</tr>	
																		</table>
																		<table cellpadding="0" cellspacing="2" border="0">
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing from:<br /><input maxlength="75" name="FrAirport" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:150px" value="" />&#160;&#160;</td>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Depart date:<br /><input maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:65px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Destination:<br /><input maxlength="75" name="DestName" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:150px" value="" />&#160;&#160;</td>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Return date:<br /><input maxlength="8" name="ToDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:65px" value="mm/dd/yy" /></td>
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
																		</table></form></td>								
																</tr>				
																</table></td>							
														</tr>
														</table>
														<table width="248" cellpadding="0" cellspacing="0" border="0">
														<tr> 
															<td valign="top" bgcolor="#ffffff">
																<table width="248" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td colspan="2" bgcolor="#89a5cc" height="5"></td><td valign="top" rowspan="3" width="99" bgcolor="#ffffff"><a href="http://www.expedia.com/daily/tools/default.asp?%%=OmnitureParams('')=%%"><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>TR_email_postit_helpfultool.gif</xsl:attribute><xsl:attribute name="width">99</xsl:attribute><xsl:attribute name="height">64</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt">Helpful Tools!</xsl:attribute></img></a></td>
																</tr>
																<tr>
																	<td colspan="2" bgcolor="#ffffff" height="19"></td>
																</tr>
																<tr>
																	<td width="10" bgcolor="#ffffff"></td>
																	<td height="40" align="left" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #cc6600; font-weight: bold;">Let Expedia Help...</td>
																</tr>											
																</table>
																<table cellpadding="0" cellspacing="10" border="0">
																	<tr>
																		<td><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_04_tools1.jpg</xsl:attribute><xsl:attribute name="width">39</xsl:attribute><xsl:attribute name="height">36</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"></xsl:attribute></img></td><td width="209" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">Get a 360-degree view of hotels with our <a href="http://www.expedia.com/daily/tools/default.asp?%%=OmnitureParams('')=%%" style="font-weight: bold; color: #336699;">Virtual Tours</a>.</td>
																	</tr>
																	<tr>
																		<td><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>MMN_TR_04_tools2.jpg</xsl:attribute><xsl:attribute name="width">39</xsl:attribute><xsl:attribute name="height">36</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="alt"></xsl:attribute></img></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;">Find the best price and dates for your trip with our <a href="http://www.expedia.com/pub/agent.dll?qscr=cmpf&amp;airp=&amp;dair=&amp;&amp;zz=1164154818594&amp;%%=OmnitureParams('')=%%" style="font-weight: bold; color: #336699;">Fare Calendar</a>.</td>
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
																		<td colspan="2" width="100%">
																			<table cellpadding="0" cellspacing="0" border="0" align="left">
																				<tr>
																					<td height="22"><a><xsl:attribute name="href">http://www.expedia.com/daily/tools/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_left.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
																				<td height="22" bgcolor="#0b8f46" valign="middle"><a><xsl:attribute name="href">http://www.expedia.com/daily/tools/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><div style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; text-decoration:none; vertical-align: middle;">See all tools</div></a></td>
																					<td height="22"><a><xsl:attribute name="href">http://www.expedia.com/daily/tools/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/>global_email_btn_01_right.gif</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td></tr>
																			</table>
																		</td>
																	</tr>
																	</table></td>
															</tr>
															</table></td>	
													</tr>
													</table></td>
											</tr>
											</table></td>
									</tr>
									</table></td>
							</tr>		
							</table>
							<table cellpadding="0" cellspacing="0" border="0" width="802">
							<tr>
								<td align="left" bgcolor="#f0f4f7" width="100%">
									<table cellpadding="0" cellspacing="5" border="0">
									<tr>
										<td width="5"></td>
<td valign="bottom"><a href="http://www.expedia.com/daily/flights/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Flights</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/hotels/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Hotels</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/cars/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Cars</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/packages/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Vacation Packages</nobr></a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/cruise/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;">Cruises</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/activities/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;  text-decoration: none;">Activities</a></td><td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/deals/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Deals &amp; Destinations</nobr></a></td>
<td style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699;">|</td><td valign="bottom"><a href="http://www.expedia.com/daily/business/default.asp?%%=OmnitureParams('')=%%" style="font-family: arial, helvetica, sans serif; font-size: 12px; font-weight: bold; color: #336699; text-decoration: none;"><nobr>Business Travel</nobr></a></td>
						</tr>
						</table></td>
				</tr>
				</table></td>
		</tr>
		</table>
		</td>
		</tr>
		</table>	
		<table width="802" cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff">
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
		&#169;2007 Expedia, Inc. All rights reserved.  Expedia, <a><xsl:attribute name="href">http://www.expedia.com/default.asp?%%=OmnitureParams('')=%%</xsl:attribute><font color="#666666">Expedia.com</font></a>  and the Airplane logo are registered trademarks, or trademarks, of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
        <br />
    <br />
			(EMID: <xsl:value-of select="../email/@type" /><xsl:value-of select="ID/@issue" />)(MD: %%=Format(Now(),"yyyyMMddhhmms")=%%)(EPID: %%sub_PAID%%)(ETID: %%jobid%%)</td><td bgcolor="#ffffff" width="20"></td>
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
