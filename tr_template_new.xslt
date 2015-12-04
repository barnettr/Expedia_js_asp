<?xml version="1.0"  encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2006-08-04T21:17:17">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>
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
						<a><xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute></a><b>FS Version:</b>&#160;&#160;<xsl:value-of select="@name" /><br />
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
	<xsl:comment>***************** START <xsl:value-of select="@name"/> TEMPLATE*****************</xsl:comment> 
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
					<xsl:if test="Template/eyebrowOffer[@state='yes']">
					<xsl:for-each select="Template/eyebrowOffer">
						<b><xsl:value-of select="@eyebrowText" /></b>&#160;<a><xsl:attribute name="href"><xsl:value-of select="@link" />emlcid=<xsl:choose>
							<xsl:when test="../../../../email[@type='CM_P_01_']">progCM-campP</xsl:when>
							<xsl:when test="../../../../email[@type='CM_CZ_01_']">progCM-campCZ</xsl:when>
							<xsl:when test="../../../../email[@type='CM_M_01_']">progCM-campM</xsl:when>
							<xsl:when test="../../../../email[@type='CM_O_01_']">progCM-campO</xsl:when>
							<xsl:when test="../../../../email[@type='CRM_PE_01_']">progCRM-campPE</xsl:when>
							<xsl:when test="../../../../email[@type='CRM_R_01_']">progCRM-campR</xsl:when>
						</xsl:choose>-issu<xsl:value-of select="../../../ID/@issue" />-test96<xsl:if test="count(../../../version)> 1"><xsl:value-of select="$version_num"/></xsl:if>-segm[+PROFILE('SEG_SCORE','','')+]-sega[+PROFILE('SEG_STATE','','')+]-date[+CALC_DATE(0,'+0d','YYYYMMDDHHMISS')+]-vers01-link[+PROFILE('link_id','','')+]-paid[+PROFILE('profile_key','','')+]-dma[+PROFILE('ON_DMA_CODE','','')+]-wave{_WAVE_ID_}</xsl:attribute><xsl:attribute name="style">font-family: arial, helvetica, sans serif; font-size: 12px; color: #<xsl:choose>
							<xsl:when test="../@color='669ad0'">ffffff</xsl:when>
							<xsl:when test="../@color='ffffff'">336699</xsl:when>
						</xsl:choose>; </xsl:attribute><xsl:value-of select="@eyebrowBlurb"  disable-output-escaping="yes" /></a>
					</xsl:for-each></xsl:if></td></tr></table></td>
				</tr>
				<tr>
					<td colspan="3" height="9" valign="top"></td>
				</tr>
				<tr>
					<td colspan="3" height="1" valign="top"><img src="http://www.expedia.com/eta/spaceit.gif" width="800" height="1" alt="" /></td>
				</tr>
				<tr>
					<td width="52" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="52" height="1" /></td>
					<td width="530" height="24" align="left" valign="bottom" style="font-size: 12px; color: #31339A; text-decoration: none;">
						<table width="530" cellpadding="4" cellspacing="0" border="0">
						<tr>
							<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
						</tr>
						</table></td>
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
																	<td style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #cc6600; font-weight: bold;">
																		<xsl:if test="subHeader">
																			<xsl:for-each select="subHeader">
																				<xsl:value-of select="." disable-output-escaping="yes" /><br />
																			</xsl:for-each>
																		</xsl:if>
																	</td>
																</tr>
																<tr>
																	<td height="5"></td>
																</tr>
																</table>
																<xsl:if test="@message='yes'">
																<table width="503" cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td style="font-family: arial, helvetica, sans serif; color: #000000; FONT-SIZE: 12px;">
																<xsl:if test="para">
																<xsl:for-each select="para">
																
																	<xsl:value-of select="."  disable-output-escaping="yes" /><xsl:if test="not(position() = last())"><br /><br /></xsl:if>
																</xsl:for-each>
																</xsl:if>
																<xsl:if test="topimage/@graphic=''">
																</xsl:if></td>
																<xsl:if test="topimage/@graphic != ''"><td valign="top">
																	<table align="left" width="164" cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td align="left" valign="top" width="150">	
																			<xsl:for-each select="topimage">
																				<a><xsl:attribute name="href"><xsl:value-of select="@imagelink" />emlcid=progMMN-campTR-issu<xsl:value-of select="@issue" />-test96-segm[+PROFILE('SEG_SCORE','','')+]-sega[+PROFILE('SEG_STATE','','')+]-date[+CALC_DATE(0,'+0d','YYYYMMDDHHMISS')+]-vers02-link[+PROFILE('link_id','','')+]-paid[+PROFILE('profile_key','','')+]-dma[+PROFILE('ON_DMA_CODE','','')+]-wave{_WAVE_ID_}</xsl:attribute>
																				<img><xsl:attribute name="src">http://media.expedia.com/media/content/expus/graphics/mail/<xsl:value-of select="@graphic" /></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@imagename"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="width">150</xsl:attribute><xsl:attribute name="height">101</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:attribute name="align">left</xsl:attribute></img></a>
																				</xsl:for-each></td>	
																		</tr>
																		</table></td>
																</xsl:if>
																</tr>
																</table>
																</xsl:if></td>
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
							</table></td>
							<td width="260" valign="top" align="left" bgcolor="#f1f4f7">
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
															<td height="28" align="center" valign="middle" style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #ffffff; font-weight: bold;">Get 'em now: Great rates</td>
															<td width="10"></td>
														</tr>
														</table></td>
												</tr>
												<tr>
													<td align="left">
														<table width="256" cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td width="35" valign="top" bgcolor="#d7dce8"></td>
															<td width="186" valign="top" bgcolor="#d7dce8">
																<form method="GET" name="etaExpress" action="http://expediamail.com/p/EXPEDIA_US/dual_email_button_wizard/default.html">
																<input type="hidden" name="GOTO" value="PackageWiz" />
																<input type="hidden" name="emlcid" value="[+GET_LINK_CONST('OMNITURE_VAR')+]" />
																<input type="hidden" name="Airline"><xsl:attribute name="value"><xsl:value-of select="client/@code" /></xsl:attribute></input>
																<table width="186" align="center" cellpadding="0" cellspacing="10" border="0">
																<tr>
																	<td>
																		<table cellpadding="0" cellspacing="2" border="0">
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Departing from:<br /><input maxlength="75" name="FrAirport" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:160px" value="" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Depart Date:<br /><input maxlength="8" name="FromDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:100px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Destination:<br /><input maxlength="75" name="DestName" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:160px" value="" /></td>
																		</tr>
																		<tr>
																			<td align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Return Date:<br /><input maxlength="8" name="ToDate" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:100px" value="mm/dd/yy" /></td>
																		</tr>
																		<tr>
																			<td align="left" valign="top" type="NOWRAP">
																				<table width="100%" cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td width="60%" align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Adult(s):<br />
																						<select name="Numadult" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:50px;">
																						<option>1</option>
																						<option selected="selected">2</option>
																						<option>3</option>
																						<option>4</option>
																						<option>5</option>
																						<option>6</option></select>
																					</td>
																					<td width="40%" align="left" style="font-family: arial, helvetica, sans serif; font-size: 10px; color: #000000; line-height:20px;">Room(s):<br />
																						<select name="Numroom" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000; width:50px;">
																						<option>1</option>
																						<option>2</option>
																						<option>3</option>
																						<option>4</option>
																						<option>5</option>
																						<option>6</option></select>
																					</td>
																				</tr>
																				</table></td>
																		</tr>
																		<tr>
																			<td align="left">			
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td>
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr><td height="22"><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td><td height="22" bgcolor="#0b8f46" valign="middle"><input name="GOFlight" type="submit" value="Search Flight" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:85;" /></td><td height="22"><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td></tr>
																						</table></td>
																				</tr>
																				<tr>
																					<td align="center" height="5" style="font-family: arial, helvetica, sans serif; font-size: 11px; color: #000000;"></td>
																				</tr>
																				<tr>
																					<td align="left" height="22">
																						<table cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td height="22"><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_left.gif" /></td>
																							<td height="22" bgcolor="#0b8f46" valign="middle"><input name="GOPackage" type="submit" value="Search Flight + Hotel" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#0b8f46; border-color:#0b8f46; border: 0; height:22; width:115;" /></td><td height="22"><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/global_email_btn_01_right.gif" /></td>					
																						</tr>
																						</table></td>
																				</tr>
																				</table></td>
																</tr>
																</table></td>
																				</tr>
																				</table></form></td>
															<td width="35" valign="top" bgcolor="#d7dce8"></td>									
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
								<xsl:if test="Template/offerModule[@singleOffer='yes']">
								<xsl:if test="Template/offerModule/my:singleOffer">
								<xsl:for-each select="Template/offerModule/my:singleOffer">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top">
										<table width="258" cellpadding="1" cellspacing="0" border="0">
										<tr>
											<td width="258" bgcolor="#d7dce8">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>	
													<td width="100%" bgcolor="#ffffff">
														<table cellpadding="0" cellspacing="10" border="0">
														<tr>
															<td align="left">
																<xsl:if test="my:singleHeadline">
																<xsl:for-each select="my:singleHeadline">
																	<div style="font-family: arial, helvetica, sans serif; font-size: 14px; color: #336699; font-weight: bold;">
																<xsl:value-of select="."  disable-output-escaping="yes" /><br /></div>
																</xsl:for-each>
																</xsl:if>
															</td>
														</tr>
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
								</xsl:if></xsl:if>
								<xsl:if test="Template/offerModule[@offers='yes']">
								<xsl:for-each select="Template/offerModule">
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
														<table cellpadding="10" cellspacing="0" border="0" bgcolor="#7694bf">
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
																<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="count(../offer)> 2"><xsl:if test="position()mod 2 = 1"><xsl:attribute name="bgcolor">#fffaee</xsl:attribute></xsl:if></xsl:if>
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
																<table><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">5</xsl:attribute><xsl:attribute name="border">0</xsl:attribute><xsl:if test="count(../offer)> 2"><xsl:if test="position()mod 2 = 1"><xsl:attribute name="bgcolor">#fffaee</xsl:attribute></xsl:if></xsl:if>
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
								</xsl:for-each>
								</xsl:if>
								<xsl:if test="Template/offerModule[@show='yes']">
								<xsl:for-each select="Template/offerModule/bannerAd">
								<table width="258" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td align="left" width="258">
										<a><xsl:attribute name="href"><xsl:value-of select="@link"/>[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$imgMailPath"/><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@altText"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="width">258</xsl:attribute><xsl:attribute name="border">0</xsl:attribute></img></a></td>
								</tr>
								</table>
								</xsl:for-each>
								</xsl:if></td>
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
<td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">flights</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color:#000000; font-weight: bold; text-decoration: none;">hotels</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cars</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>vacation packages</nobr></a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">cruises</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;">activities</a></td><td style="font-size: 12px; color: #31339A; text-decoration: none;">|</td><td align="left" style="font-size: 12px; color: #31339A; text-decoration: none;"><a href="http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000; font-weight: bold; text-decoration: none;"><nobr>deals &amp; destinations</nobr></a></td>
					</tr>
			</table></td>
			<td width="170" bgcolor="#ffffff" align="left"><img src="http://www.expedia.com/eta/spaceit.gif" width="170" height="1" /></td>
		</tr>
		<tr>
			<td colspan="3" height="13" valign="top" bgcolor="#FFDF7B"></td>
		</tr>
		</table>
		<table><xsl:attribute name="width">100%</xsl:attribute><xsl:attribute name="cellpadding">0</xsl:attribute><xsl:attribute name="cellspacing">0</xsl:attribute><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute>
		<tr>
			<td><xsl:attribute name="valign">top</xsl:attribute><xsl:attribute name="align">left</xsl:attribute><xsl:attribute name="bgcolor">#<xsl:value-of select="Template/@color" /></xsl:attribute><xsl:attribute name="style">border: 25px solid #<xsl:value-of select="Template/@color" /></xsl:attribute>
				<br />
				<font face="arial, helvetica, sans serif" size="1" color="#666666" style="font-family: arial, helvetica, sans serif; font-size: 9px; line-height: 10px; font-weight: bold; color: #666666">
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
			&#169;2006 Expedia, Inc. All rights reserved.  Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
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
	<xsl:comment>***************** END <xsl:value-of select="@name"/> TEMPLATE *****************</xsl:comment> </td>
				</tr>
			</table></td>
	</tr>
</table>
	</xsl:for-each>
	</xsl:if>
</xsl:template>
</xsl:stylesheet>
