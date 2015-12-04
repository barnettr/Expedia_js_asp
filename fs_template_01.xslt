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
						</xsl:if></font></td>
					</tr>
					</table></td>
			</tr>
			</table>
			<table width="600" cellpadding="1" cellspacing="0" border="0" align="center" bgcolor="#FFFFFF">
			<tr>
				<td width="600" bgcolor="#A3C2E0">
					<table width="598" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="247" height="44" align="left" valign="top" rowspan="2" bgcolor="#FFFFFF">
							<a href="http://www.expedia.com/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"><img src="http://media.expedia.com/media/content/expus/graphics/mail/top_left_logo_v2.gif" alt="Expedia.com" width="247" height="44" border="0" /></a></td>
						<td width="351" height="21" valign="top" bgcolor="#FFFFFF" align="right"></td>
					</tr>
					<tr>
						<td height="23" align="center" valign="middle" bgcolor="#FFFFFF">
							<table width="351" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a>&#160;&#160;</td>
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">|&#160;&#160;<a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a>&#160;&#160;</td>
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">|&#160;&#160;<a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a>&#160;&#160;</td>
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">|&#160;&#160;<a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">packages</a>&#160;&#160;</td>
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">|&#160;&#160;<a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a>&#160;&#160;</td>
								<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;">|&#160;&#160;<a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td>
								<td width="100%" align="left"></td>
							</tr>
						</table></td>
					</tr>
					<tr>
						<td colspan="2" width="598" height="6" valign="top"><img src="http://media.expedia.com/media/content/expus/graphics/mail/top_blue_line.gif" width="598" height="6" alt="" /></td>
					</tr>
					</table>
					<table width="598" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td height="31" colspan="5" bgcolor="#FFFFFF">
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="1" height="31" border="0"/>
									</td>
								</tr>
								<tr>
									<td width="19" height="1" valign="top" bgcolor="#FFFFFF">
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="19" height="1" border="0"/>
									</td>
									<td width="329" height="1" align="center" valign="top" bgcolor="#FFFFFF">
										<xsl:comment>*****************START FS_1_OFFER_MODULE*****************</xsl:comment>
										<xsl:if test="offersModule">
											<xsl:for-each select="offersModule">
												<table width="329" cellpadding="0" cellspacing="0" border="0">
													<tr>
														<td colspan="5" width="329" valign="top" bgcolor="#FFFFFF">
															<a>
																<xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																<xsl:choose>
																	<xsl:when test="@image='generic1'">
																		<img src="http://media.expedia.com/media/content/expus/graphics/mail/095_fs_midwest_header.jpg" width="329" height="91" border="0"/>
																	</xsl:when>
																	<xsl:when test="@image='generic2'">
																		<img src="http://media.expedia.com/media/content/expus/graphics/mail/102_fs_united_header.jpg" width="329" height="91" border="0"/>
																	</xsl:when>
																	<xsl:when test="@image='generic3'">
																		<img src="http://media.expedia.com/media/content/expus/graphics/mail/177_united_versC.jpg" width="329" height="91" border="0"/>
																	</xsl:when>
																	<xsl:when test="@image='generic4'">
																		<img src="http://media.expedia.com/media/content/expus/graphics/mail/182_20060409_Canada_hero.jpg" width="329" height="91" border="0"/>
																	</xsl:when>
																	<xsl:when test="@image='generic5'">
																		<img src="http://media.expedia.com/media/content/expus/graphics/mail/187_aa_hero_C.jpg" width="329" height="91" border="0"/>
																	</xsl:when>
																	<xsl:when test="@image='generic6'">
																		<img src="http://media.expedia.com/media/content/expus/graphics/mail/192_AAChicago_FareSale_header.jpg" width="329" height="91" border="0"/>
																	</xsl:when>
																	<xsl:otherwise/>
																</xsl:choose>
															</a>
														</td>
													</tr>
													<tr>
														<td width="2" valign="top" bgcolor="#336799">
															<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_blue_border.gif" width="2" height="100%"/>
														</td>
														<td width="11">
															<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="11" height="1" border="0"/>
														</td>
														<td width="303" valign="top" bgcolor="#FFFFFF">
															<table width="303" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td height="14">
																		<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="1" height="14" border="0"/>
																	</td>
																</tr>
																<tr>
																	<td valign="top" bgcolor="#FFFFFF" align="left">
																		<!-- MAIN HEADLINE STARTS -->
																		<font face="Arial" style="font-size:17px" color="#336699">
																			<xsl:if test="header">
																				<xsl:for-each select="header">
																					<b>
																						<xsl:value-of select="." disable-output-escaping="yes"/><br/>
																					</b>
																				</xsl:for-each>
																			</xsl:if>
																		</font>
																		<!-- MAIN HEADLINE ENDS -->
																		<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_text_buffer.gif" width="1" height="5" alt=""/>
																		<br/>
																		<!-- SUB HEADLINE STARTS -->
																		<font face="Arial" style="font-size:13px" color="#000000">
																			<xsl:if test="subHeader">
																				<xsl:for-each select="subHeader">
																					<b>
																						<xsl:value-of select="." disable-output-escaping="yes"/><br/>
																					</b>
																				</xsl:for-each>
																			</xsl:if>
																			<!-- SUB HEADLINE ENDS -->
																		</font>
																		<p>
																			<font face="Arial" style="font-size:12px" color="#000000">
																				<xsl:if test="para">
																					<xsl:for-each select="para">
																						<xsl:value-of select="." disable-output-escaping="yes"/>
																						<br/>
																						<br/>
																					</xsl:for-each>
																				</xsl:if>
																				<xsl:if test="callToAction/@content != ''">
																					<xsl:for-each select="callToAction">
																						<img src="http://www.expedia.com/daily/common/images/goldbullet.gif" width="6" height="6" border="0" valign="absmiddle"/>&#160;&#160;<a>
																							<xsl:attribute name="href"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																							<font color="#CC0000">
																								<b>
																									<xsl:value-of select="@content" disable-output-escaping="yes"/>
																								</b>
																							</font>
																						</a>
																					</xsl:for-each>
																				</xsl:if>
																				<xsl:if test="callToAction/@content=''">
									
								</xsl:if>
																			</font>
																		</p>
																	</td>
																</tr>
																<xsl:if test="airlinelogo/@name != ''">
																	<tr>
																		<td height="29">
																			<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="1" height="29" border="0"/>
																		</td>
																	</tr>
																	<tr>
																		<td bgcolor="#FFDF7B">
																			<img src="http://www.expedia.com/eta/spaceit.gif" width="2" height="2" border="0"/>
																		</td>
																	</tr>
																	<tr>
																		<td height="10">
																			<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="1" height="10" border="0"/>
																		</td>
																	</tr>
																	<tr>
																		<td height="50" align="left" valign="top">
																			<table width="100%" cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td align="center">
																						<xsl:choose>
																							<xsl:when test="airlinelogo[@name='AK']">
																								<a>
																									<xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																									<img src="http://media.expedia.com/media/content/expus/graphics/mail/182_20060409_Canada_logo.gif" width="264" height="50" border="0" alt="Alaska Airlines"/>
																								</a>
																							</xsl:when>
																							<xsl:when test="airlinelogo[@name='American']">
																								<a>
																									<xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																									<img src="http://media.expedia.com/media/content/expus/graphics/mail/AA_email_264x50.gif" width="264" height="50" border="0" alt="American Airlines"/>
																								</a>
																							</xsl:when>
																							<xsl:when test="airlinelogo[@name='British']">
																								<a>
																									<xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																									<img src="http://media.expedia.com/media/content/expus/graphics/mail/BA_email_264x50.gif" width="264" height="50" border="0" alt="British Airways"/>
																								</a>
																							</xsl:when>
																							<xsl:when test="airlinelogo[@name='Continental']">
																								<a>
																									<xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																									<img src="http://media.expedia.com/media/content/expus/graphics/mail/CO_email_264x50.gif" width="264" height="50" border="0" alt="ContinentalAirlines"/>
																								</a>
																							</xsl:when>
																							<xsl:when test="airlinelogo[@name='Delta']">
																								<a>
																									<xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																									<img src="http://media.expedia.com/media/content/expus/graphics/mail/Delta_email_264x50.gif" width="264" height="50" border="0" alt="Delta Airlines"/>
																								</a>
																							</xsl:when>
																							<xsl:when test="airlinelogo[@name='Frontier']">
																								<a>
																									<xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																									<img src="http://media.expedia.com/media/content/expus/graphics/mail/FR_email_264x50.gif" width="264" height="50" border="0" alt="Frontier Airlines"/>
																								</a>
																							</xsl:when>
																							<xsl:when test="airlinelogo[@name='Hawaiian']">
																								<a>
																									<xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																									<img src="http://media.expedia.com/media/content/expus/graphics/mail/HA_email_264x50.gif" width="264" height="50" border="0" alt="Hawaiian Airlines"/>
																								</a>
																							</xsl:when>
																							<xsl:when test="airlinelogo[@name='Midwest']">
																								<a>
																									<xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																									<img src="http://media.expedia.com/media/content/expus/graphics/mail/Midwest_email_264x50.gif" width="264" height="50" border="0" alt="Midwest Airlines"/>
																								</a>
																							</xsl:when>
																							<xsl:when test="airlinelogo[@name='Northwest']">
																								<a>
																									<xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																									<img src="http://media.expedia.com/media/content/expus/graphics/mail/NWA_email_264x50.gif" width="264" height="50" border="0" alt="Northwest Airlines"/>
																								</a>
																							</xsl:when>
																							<xsl:when test="airlinelogo[@name='United']">
																								<a>
																									<xsl:attribute name="href"><xsl:value-of select="$offersLink"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
																									<img src="http://media.expedia.com/media/content/expus/graphics/mail/UA_email_264x50.gif" width="264" height="50" border="0" alt="United Airlines"/>
																								</a>
																							</xsl:when>
																							<xsl:otherwise/>
																						</xsl:choose>
																					</td>
																				</tr>
																			</table>
																		</td>
																	</tr>
																</xsl:if>
																<xsl:if test="airlinelogo/@name=''">
									
								</xsl:if>
															</table>
														</td>
														<td width="11">
															<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="11" height="1" border="0"/>
														</td>
														<td width="2" valign="top" bgcolor="#336799">
															<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_blue_border.gif" width="2" height="100%"/>
														</td>
													</tr>
													<tr>
														<td colspan="5" width="329" valign="bottom" bgcolor="#FFFFFF">
															<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/offer_bot.gif" width="329" height="17"/>
														</td>
													</tr>
												</table>
											</xsl:for-each>
										</xsl:if>
										<xsl:comment>*****************END FS_1_OFFER_MODULE*****************</xsl:comment>
									</td>
									<td width="29" height="1" valign="top" bgcolor="#FFFFFF">
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="29" height="1" border="0"/>
									</td>
									<td width="202" height="1" align="left" valign="top" bgcolor="#FFFFFF">
										<!--start FareFinder module-->
										<xsl:if test="flightwizard">
											<xsl:for-each select="flightwizard">
												<table width="202" cellpadding="0" cellspacing="0" border="0">
													<tr>
														<td colspan="3" width="202" height="16" valign="top">
															<table width="202" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td width="10">
																		<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/wizbar_left.gif" height="19" width="10"/>
																	</td>
																	<td width="182" bgcolor="#3B6D9C" align="center">
																		<font face="arial" style="font-size:12px" color="#ffffff">
																			<b>FIND GREAT FARES</b>
																		</font>
																	</td>
																	<td width="10">
																		<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/wizbar_right.gif" height="19" width="10"/>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td height="6" colspan="3">
															<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="1" height="6" border="0"/>
														</td>
													</tr>
													<tr>
														<td height="2" width="2" bgcolor="#FFDF7B">
															<img src="http://www.expedia.com/eta/spaceit.gif" width="2" height="1" border="0"/>
														</td>
														<td height="2" bgcolor="#FFDF7B">
															<img src="http://www.expedia.com/eta/spaceit.gif" width="2" height="2" border="0"/>
														</td>
														<td height="2" width="2" bgcolor="#FFDF7B">
															<img src="http://www.expedia.com/eta/spaceit.gif" width="2" height="1" border="0"/>
														</td>
													</tr>
													<tr>
														<td bgcolor="#FFDF7B" width="2" valign="top">
															<img src="http://www.expedia.com/eta/spaceit.gif" width="2" height="100%" border="0"/>
														</td>
														<td width="198">
															<table width="198" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td width="10" valign="top">
																		<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="10"/>
																	</td>
																	<td bgcolor="#FFFFFF" align="center" valign="top" width="178">
																		<br/>
																		<table cellpadding="0" cellspacing="0" border="0">
																			<tr>
																				<td align="left">
																					<form method="GET" name="etaExpress" action="http://www.expedia.com/pubspec/scripts/eap.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]">
																						<input type="hidden" name="GOTO" value="EXPFLTWIZ"/>
																						<xsl:if test="airline">
																							<xsl:for-each select="airline">
																								<input type="hidden" name="Airline"><xsl:attribute name="value"><xsl:value-of select="@code" /></xsl:attribute></input>
																							</xsl:for-each>
																						</xsl:if>
																						<font face="Arial, Helvetica, sans-serif" size="1" color="#000000">Departing from:</font>
																						<br/>
																						<xsl:if test="origin/@multiple='no'">
																							<input maxlength="100" name="Frairport" size="24" value=""/>
																						</xsl:if>
																						<xsl:if test="origin/@multiple='yes'">
																							<select name="Frairport" style="width: 164px">
																								<xsl:if test="origin/code">
																									<xsl:for-each select="origin/code">
																										<option>
																											<xsl:attribute name="value"><xsl:value-of select="@name"/></xsl:attribute>
																											<xsl:value-of select="."/>
																										</option>
																									</xsl:for-each>
																								</xsl:if>
																							</select>
																						</xsl:if>
																						<br/>
																						<font face="Arial, Helvetica, sans-serif" size="1" color="#000000">Depart: (MM/DD/YY)</font>
																						<br/>
																						<xsl:if test="ddate/@multiple='no'">
																							<input maxlength="12" name="FromDate" value="" size="9" style="width:70px"/>&#160;&#160;
										<select name="FromTime">
																								<option selected="Morning">Morning</option>
																								<option value="Afternoon">Afternoon</option>
																								<option value="Evening">Evening</option>
																							</select>
																						</xsl:if>
																						<xsl:if test="ddate/@multiple='yes'">
																							<select name="FromDate" style="width: 164px">
																								<xsl:if test="ddate/code">
																									<xsl:for-each select="ddate/code">
																										<option>
																											<xsl:attribute name="value"><xsl:value-of select="@name"/></xsl:attribute>
																											<xsl:value-of select="."/>
																										</option>
																									</xsl:for-each>
																								</xsl:if>
																							</select>
																						</xsl:if>
																						<br/>
																						<font face="Arial, Helvetica, sans-serif" size="1" color="#000000">Going to:</font>
																						<br/>
																						<xsl:if test="destination/@multiple='no'">
																							<input maxlength="100" name="Toairport" size="24" value=""/>
																						</xsl:if>
																						<xsl:if test="destination/@multiple='yes'">
																							<select name="Toairport" style="width: 164px">
																								<xsl:if test="destination/code">
																									<xsl:for-each select="destination/code">
																										<option>
																											<xsl:attribute name="value"><xsl:value-of select="@name"/></xsl:attribute>
																											<xsl:value-of select="."/>
																										</option>
																									</xsl:for-each>
																								</xsl:if>
																							</select>
																						</xsl:if>
																						<br/>
																						<font face="Arial, Helvetica, sans-serif" size="1" color="#000000">Return: (MM/DD/YY)</font>
																						<br/>
																						<xsl:if test="rdate/@multiple='no'">
																							<input maxlength="12" name="ToDate" value="" size="9" style="width:70px"/>&#160;&#160;
										<select name="ToTime">
																								<option value="Morning">Morning</option>
																								<option value="Afternoon">Afternoon</option>
																								<option selected="Evening">Evening</option>
																							</select>
																						</xsl:if>
																						<xsl:if test="rdate/@multiple='yes'">
																							<select name="ToDate" style="width: 164px">
																								<xsl:if test="rdate/code">
																									<xsl:for-each select="rdate/code">
																										<option>
																											<xsl:attribute name="value"><xsl:value-of select="@name"/></xsl:attribute>
																											<xsl:value-of select="."/>
																										</option>
																									</xsl:for-each>
																								</xsl:if>
																							</select>
																						</xsl:if>
																						<font face="Arial, Helvetica, sans-serif" size="1" color="#000000">
																							<br/>
									&#160;&#160;
									<br/>
																						</font>
																						<select name="NumAdult">
																							<option selected="1">1 adult</option>
																							<option value="2">2 adults</option>
																							<option value="3">3 adults</option>
																							<option value="4">4 adults</option>
																							<option value="5">5 adults</option>
																							<option value="6">6 adults</option>
																						</select>
									&#160;&#160;<input name="GO" type="image" src="http://media.expedia.com/media/content/shared/graphics/common/mail/wizard_button.gif" align="absbottom"/>
																					</form>
																				</td>
																			</tr>
																		</table>
																	</td>
																	<td width="10" valign="top">
																		<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="10"/>
																	</td>
																</tr>
															</table>
														</td>
														<td bgcolor="#FFDF7B" width="2" valign="top">
															<img src="http://www.expedia.com/eta/spaceit.gif" width="2" height="100%" border="0"/>
														</td>
													</tr>
													<tr>
														<td colspan="3" width="202" valign="top">
															<table cellpadding="0" cellspacing="0" border="0">
																<tr valign="bottom">
																	<td width="202">
																		<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/wizard_bot.gif" width="202" border="0"/>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</xsl:for-each>
										</xsl:if>
										<!--end FareFinder module-->
									</td>
									<td width="19" height="1" valign="top" bgcolor="#FFFFFF">
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="19" height="1" border="0"/>
									</td>
								</tr>
								<tr>
									<td colspan="5" bgcolor="#ffffff">
										<img src="http://media.expedia.com/media/content/expus/graphics/mail/wiz_white_1px.gif" width="1" height="32" border="0"/>
									</td>
								</tr>
							</table>
							<table width="598" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td height="28" align="center" bgcolor="#3D6E9E"><font style="font-size: 12px; color: #000000; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold; text-decoration: none;">flights</a>&#160;&#160;|&#160;&#160;<a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"  style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold; text-decoration: none;">hotels</a>&#160;&#160;|&#160;&#160;<a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold; text-decoration: none;">cars</a>&#160;&#160;|&#160;&#160;<a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"  style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold; text-decoration: none;">packages</a>&#160;&#160;|&#160;&#160;<a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold; text-decoration: none;">cruises</a>&#160;&#160;|&#160;&#160;<a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"  style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold; text-decoration: none;">activities</a>&#160;&#160;|&#160;&#160;<a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]"  style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #ffffff; font-weight: bold; text-decoration: none;">deals &amp; destinations</a></font></td>
							</tr>
							</table>
							<table width="598" cellpadding="0" cellspacing="0" border="0">
							<tr>
									<td width="598" valign="top" style="border: 25px solid #A3C2E0;" bgcolor="#A3C2E0">
									<br/><font face="arial" size="1" color="#666666">
								<xsl:comment>*****************START FS_3_T&amp;C_MODULE*****************</xsl:comment>
								<xsl:if test="specialRules/@action='yes'">
											TERMS AND CONDITIONS<br/><br/>
												<xsl:for-each select="specialRules">
													<xsl:value-of select="." disable-output-escaping="yes"/><br/><br/>
												</xsl:for-each>

								</xsl:if>
								<xsl:if test="specialRules/@action='no'"></xsl:if>

<xsl:comment>*****************END FS_3_T&amp;C_MODULE*****************</xsl:comment>
	UNSUBSCRIBE
	<br/>
											<br/> 
	If you do not wish to receive future e-mail advertisements from us, please <a>
												<xsl:attribute name="href">http://expediamail.com/PUBLISH(sub_mgmt_page)&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
												<font color="#666666">click here</font>
											</a>. Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, <a>
												<xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
												<font color="#666666">click here</font>
											</a> for personalized help. 
	<br/>
											<br/>
	CONTACT US
	<br/>
											<br/> 
	To contact us or send feedback, please <a>
												<xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
												<font color="#666666">click here</font>
											</a> or contact us via postal mail at: Expedia, Inc., Attn: PCC Team, 3150 139th Avenue SE, Bellevue, WA  98005. For additional assistance, visit the Expedia.com <a>
												<xsl:attribute name="href">http://www.expedia.com/daily/service/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
												<font color="#666666">Customer Support Center</font>
											</a>. 
	<br/>
											<br/>
	A NOTE ABOUT PRICES 
	<br/>
											<br/>
	Prices are subject to availability and subject to change without notice. 
	<br/>
											<br/>
	All prices were current at the time this e-mail was published. 
	<br/>
											<br/>
	Hotel, vacation package, and cruise prices on the Expedia Website are constantly updated. Please refer to the site for the most current pricing. Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city. Additional taxes, fees, and charges may apply. Airfare is subject to, without limitation: (1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip; (2) up to $18 per roundtrip in local airport charges; (3) Federal Excise Tax of $3.20 per U.S. domestic flight segment; (4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in Alaska or Hawaii; and (5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking). A segment is defined as a takeoff and a landing.  
	<br/>
											<br/>
	&#169;2006 Expedia, Inc. All rights reserved.  Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
	<br/>
											<xsl:if test="ID">
												<xsl:for-each select="ID">
	[+ "(EMID: CM_C_02_<xsl:value-of select="@issue"/>)(MD: " . VAR(TODAY) . ")(EPID: $p->{'profile_key'})(BIID: $p->{'mailing_id'}_$p->{'_WAVE_ID_'})" +]
	</xsl:for-each>
											</xsl:if>
										</font>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
