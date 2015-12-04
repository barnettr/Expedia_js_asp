<?xml version="1.0"  encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:my="http://www.w3.org/2001/XMLSchema">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>
<xsl:template match="email">
 <html>
<head>
<title>Expedia.com</title>
<meta content="NOINDEX" name="ROBOTS" />
<meta name="subject">
	<xsl:if test="subjectText">
		<xsl:for-each select="subjectText">
			<xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
		</xsl:for-each>
	</xsl:if>
</meta>
</head>
<xsl:variable name="imgCommon">http://media.expedia.com/media/content/shared/graphics/common/mail/</xsl:variable>
<xsl:variable name="imgPath">http://media.expedia.com/media/content/shared/images/</xsl:variable>
<xsl:variable name="imgMailPath">http://media.expedia.com/media/content/shared/graphics/mail/</xsl:variable>
<xsl:variable name="iconPath">http://media.expedia.com/media/content/expus/graphics/mail/</xsl:variable>
<xsl:variable name="iconsPath">http://media.expedia.com/media/content/expus/graphics/icons/</xsl:variable>
<xsl:variable name="issueID" select="ID/@issue" />
<xsl:variable name="offersLink" select="takeMe/@link" />

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
					<td width="598" height="6" valign="top"><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/top_blue_line.gif" width="598" height="6" alt="" /></td>
				</tr>
			</table>
			<table width="598" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="380" height="50" valign="top" rowspan="2" bgcolor="#FFFFFF">
						<a><xsl:attribute name="href">http://www.expedia.com?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/top_left_logo.gif" alt="Expedia.com" width="380" height="50" border="0" /></a></td>
					<td width="204" height="44" valign="top" bgcolor="#FFF8DE" align="right">
<!-- DATE STARTS -->
						<font face="arial, helvetica, sans serif" size="2" color="#000000">
						<b>Just Released From Expedia.com</b>
						</font><br />
						<font face="arial, helvetica, sans serif" size="1" color="#000000">
[-
ECHO(MODULE('CM_DATE_STAMP'));
-]
<!-- DATE ENDS -->
</font></td>
					<td width="14" height="44" valign="top" bgcolor="#FFF8DE">
<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/top_right_of_headline.gif" width="14" height="44" alt="" /></td>
				</tr>
				<tr>
					<td width="218" height="6" valign="top" bgcolor="#FFFFFF" colspan="2">
<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/below_headline.gif" width="218" height="6" alt="" /></td>
				</tr>
			</table>
			<table width="598" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="598" valign="top" bgcolor="#FFFFFF">
						<table border="0" cellpadding="0" cellspacing="0" width="284" align="right">
                        <tr>
                            <td><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/spacer.gif" alt="" name="undefined_2" width="62" height="1" border="0" /></td>
                            <td><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/spacer.gif" alt="" name="undefined_2" width="46" height="1" border="0" /></td>
                            <td><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/spacer.gif" alt="" name="undefined_2" width="40" height="1" border="0" /></td>
                            <td><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/spacer.gif" alt="" name="undefined_2" width="37" height="1" border="0" /></td>
                            <td><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/spacer.gif" alt="" name="undefined_2" width="38" height="1" border="0" /></td>
                            <td><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/spacer.gif" alt="" name="undefined_2" width="61" height="1" border="0" /></td>
                            <td><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/spacer.gif" alt="" name="undefined_2" width="1" height="1" border="0" /></td>
                        </tr>
                        <xsl:comment>*****************START CM_CONTENT_BODY*****************</xsl:comment> 
                        <xsl:if test="navTabs">
						<xsl:for-each select="navTabs">
						
                        <tr>
							<td><a><xsl:attribute name="href">http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>
							<xsl:choose>
								<xsl:when test="Flights[@state='on']">
									<img name="travel_icons_r1_c1" src="http://media.expedia.com/media/content/expus/graphics/icons/flt_45x45.jpg" width="45" height="45" border="0" alt="Flights" />
								</xsl:when>
								<xsl:when test="Flights[@state='off']">
									<img name="travel_icons_r1_c1" src="http://media.expedia.com/media/content/expus/graphics/icons/flt_62x45.jpg" width="62" height="45" border="0" alt="Flights" />
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose></a></td>
                            <td><a><xsl:attribute name="href">http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:choose>
								<xsl:when test="Hotels[@state='on']">
									<img name="travel_icons_r1_c2" src="http://media.expedia.com/media/content/expus/graphics/icons/htl_47x45.jpg" width="47" height="45" border="0" alt="Hotels" />
								</xsl:when>
								<xsl:when test="Hotels[@state='off']">
									<img name="travel_icons_r1_c2" src="http://media.expedia.com/media/content/expus/graphics/icons/htl_46x45.jpg" width="46" height="45" border="0" alt="Hotels" />
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose></a></td>
                            <td><a><xsl:attribute name="href">http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:choose>
								<xsl:when test="Cars[@state='on']">
									<img name="travel_icons_r1_c3" src="http://media.expedia.com/media/content/expus/graphics/icons/cars_48x45.jpg" width="48" height="45" border="0" alt="Cars" />
								</xsl:when>
								<xsl:when test="Cars[@state='off']">
									<img name="travel_icons_r1_c3" src="http://media.expedia.com/media/content/expus/graphics/icons/cars_40x45.jpg" width="40" height="45" border="0" alt="Cars" />
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose></a></td>
                            <td><a><xsl:attribute name="href">http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:choose>
								<xsl:when test="VacaPack[@state='on']">
									<img name="travel_icons_r1_c4" src="http://media.expedia.com/media/content/expus/graphics/icons/pkg_48x45.jpg" width="48" height="45" border="0" alt="Vacation Packages" />
								</xsl:when>
								<xsl:when test="VacaPack[@state='off']">
									<img name="travel_icons_r1_c4" src="http://media.expedia.com/media/content/expus/graphics/icons/pkg_37x45.jpg" width="37" height="45" border="0" alt="Vacation Packages" />
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose></a></td>
                            <td><a><xsl:attribute name="href">http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:choose>
								<xsl:when test="Cruises[@state='on']">
									<img name="travel_icons_r1_c5" src="http://media.expedia.com/media/content/expus/graphics/icons/crs_45x45.jpg" width="45" height="45" border="0" alt="Cruises" />
								</xsl:when>
								<xsl:when test="Cruises[@state='off']">
									<img name="travel_icons_r1_c5" src="http://media.expedia.com/media/content/expus/graphics/icons/crs_38x45.jpg" width="38" height="45" border="0" alt="Cruises" />
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose></a></td>
                            <td><a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:choose>
								<xsl:when test="Activities[@state='on']">
									<img name="travel_icons_r1_c6" src="http://media.expedia.com/media/content/expus/graphics/icons/tshop_38x45.jpg" width="38" height="44" border="0" alt="Activities" />
								</xsl:when>
								<xsl:when test="Activities[@state='off']">
									<img name="travel_icons_r1_c6" src="http://media.expedia.com/media/content/expus/graphics/icons/tshop_48x44.jpg" width="48" height="44" border="0" alt="Activities" />
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose></a></td>
                            <td><img src="http://media.expedia.com/media/content/expus/graphics/mail/spacer.gif" alt="" name="undefined_2" width="10" height="8" border="0" /></td> 			
                        </tr> 
						</xsl:for-each>
						</xsl:if>                   
                        </table></td>
				</tr>
			</table>
			<table width="598" cellpadding="0" cellspacing="0" border="0" id="main_body">
				<tr>
					<td width="18" valign="top" bgcolor="#FFFFFF">
						<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/left_of_main.gif" width="18" alt="" /></td>
					<td width="264" valign="top" bgcolor="#FFFFFF">
					<!-- MAIN HEADLINE STARTS -->
							<font face="arial, helvetica, sans serif" size="4" color="#336699">
							<xsl:if test="header">
								<xsl:for-each select="header">
									<b><xsl:value-of select="."  disable-output-escaping="yes" /></b><br />
								</xsl:for-each>
							</xsl:if>				
							</font>
					<!-- MAIN HEADLINE ENDS -->
					<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_text_buffer.gif" width="1" height="10" alt="" /><br/>
					<!-- SUB HEADLINE STARTS -->
							<font face="arial, helvetica, sans serif" size="3" color="#CC0000">
							<xsl:if test="subHeader">
								<xsl:for-each select="subHeader">
									<b><xsl:value-of select="." disable-output-escaping="yes" /></b><br />
								</xsl:for-each>
							</xsl:if>
							</font>
					<!-- SUB HEADLINE ENDS -->
						<br />
						<font face="arial, helvetica, sans serif" size="2" color="#000000">
						Dear [+PROFILE('F_NAME','Expedia Traveler','PropCap')+],<br /><br />
						</font>
					<!-- WELCOME MESSAGE STARTS -->
						<font face="arial, helvetica, sans serif" size="2" color="#000000">
						<xsl:if test="para">
						<xsl:for-each select="para"><xsl:value-of select="."  disable-output-escaping="yes" /><br /><br />
						</xsl:for-each>
						</xsl:if>
						<br />
						</font>
					<!-- WELCOME MESSAGE ENDS -->	
					<!-- PARTNER LOGO -->
					<xsl:if test="icon">
						<xsl:for-each select="icon">
						<img><xsl:attribute name="src"><xsl:value-of select="$iconPath"/><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="alt"><xsl:value-of select="@name"  disable-output-escaping="yes" /></xsl:attribute> <xsl:attribute name="align">center</xsl:attribute> </img>	
					</xsl:for-each>
					</xsl:if>
					<!-- PARTNER LOGO -->
						<br /><br />
						<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/yellow_line.gif" width="158" alt="" />
					<!-- CTA BUTTON STARTS -->
					<xsl:if test="takeMe">
					<xsl:for-each select="takeMe">
						<a><xsl:attribute name="href"><xsl:value-of select="@link" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute>			
						<img src="http://media.expedia.com/media/content/expus/graphics/mail/cm_book_now_btn.gif" height="32" width="98" border="0" alt="Book now!" /></a>
					</xsl:for-each>
					</xsl:if>
					<!-- CTA BUTTON ENDS --><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/yellow_line_right.gif" width="8" alt="" /></td>
					<td width="18" valign="top" bgcolor="#FFFFFF">
<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/left_of_main.gif" width="18" alt="" /></td>
					<td width="284" valign="top" bgcolor="#FFFFFF">
					<xsl:if test="offersModule">
					<xsl:for-each select="offersModule">
						<table width="284" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td colspan="3" width="284" valign="top" bgcolor="#FFFFFF">
							<!-- OFFER MODULE IMAGE STARTS -->
							<a><xsl:attribute name="href"><xsl:value-of select="$offersLink" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$iconPath"/><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="width">284</xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
							<!-- OFFER MODULE IMAGE ENDS -->	
						</tr>
						<tr>
							<td width="2" valign="top" bgcolor="#336699">
								<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_blue_border.gif" width="2" alt="" /></td>
							<td width="280" height="125" valign="top" bgcolor="#FFFFFF">
								<table width="280" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td valign="top" bgcolor="#FFFFFF" colspan="3" align="center">
										<br />
										<!-- OFFER MODULE HEADLINE STARTS -->
										<font face="arial, helvetica, sans serif" size="3" color="#336699">
											<xsl:if test="headline">
											<xsl:for-each select="headline">
												<b><xsl:value-of select="."  disable-output-escaping="yes" /></b><br />
											</xsl:for-each>
											</xsl:if>
										</font>
										<!-- OFFER MODULE HEADLINE ENDS -->		
									</td>
								</tr>
								<tr>
									<td valign="top" bgcolor="#FFFFFF">
										<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_buffer.gif" width="16" alt="" /></td>
									<td valign="top" bgcolor="#FFFFFF">
										<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_buffer_top_bottom.gif" height="16" alt="" />
										<table width="254" cellpadding="0" cellspacing="0" border="0">
										<xsl:choose>
										<xsl:when test="@offerImages='yes'">
										<xsl:if test="offer">
										<xsl:for-each select="offer">
										<xsl:choose>
											<xsl:when test="@image='none'">
											<tr>
											<td colspan="3" align="left" width="254" class="feature" bgcolor="#FFFFFF">
												<font face="arial, helvetica, sans serif" size="2">
												<b><a style="color:#336699;"><xsl:attribute name="href"><xsl:value-of select="$offersLink" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:value-of select="@title" disable-output-escaping="yes" /></a></b></font><br />
												<xsl:if test="textLine">
												<xsl:for-each select="textLine">
													<xsl:choose>
														<xsl:when test="@type='bold'">
															<font face="arial, helvetica, sans serif" size="2" color="#000000"><b><xsl:value-of select="." disable-output-escaping="yes" /></b></font>
															<br />
														</xsl:when>
														<xsl:when test="@type='italic'">
															<font face="arial, helvetica, sans serif" size="2" color="#000000"><i><xsl:value-of select="." disable-output-escaping="yes" /></i></font>
															<br />
														</xsl:when>
														<xsl:when test="@type='bullet'">
															<table  cellpadding="0" cellspacing="0" border="0"><tr>
																<td valign="top" width="15" bgcolor="#FFFFFF">
																<img src="http://media.expedia.com/media/content/expus/graphics/mail/cm_bullet1.gif" width="15" height="20" /></td><td> <font face="arial, helvetica, sans serif" size="2" color="#000000"><xsl:value-of select="."  disable-output-escaping="yes" /></font></td></tr>
																<tr><td height="5"></td></tr>		
																</table>
														</xsl:when>
														<xsl:otherwise>
															<font face="arial, helvetica, sans serif" size="2" color="#000000"><xsl:value-of select="." disable-output-escaping="yes" /></font>
															<br />	
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
												</xsl:if>
												<br /></td>
											</tr>
											</xsl:when>
											<xsl:otherwise>
											<tr>
										<!-- OFFER IMAGE 1 STARTS -->
											<td valign="top" width="71" height="71" bgcolor="#FFFFFF">
												<a><xsl:attribute name="href"><xsl:value-of select="$offersLink" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="$iconPath"/><xsl:value-of select="@image"/></xsl:attribute> <xsl:attribute name="border">0</xsl:attribute></img></a></td>
										<!-- OFFER IMAGE 1 ENDS -->
											<td valign="top" width="11" height="71" bgcolor="#FFFFFF">
												<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_text_buffer.gif" width="11" height="71" alt="" /></td>
											<td valign="middle" width="177" height="71" class="feature" bgcolor="#FFFFFF">
												<font face="arial, helvetica, sans serif" size="2">
												<b><a style="color:#336699;"><xsl:attribute name="href"><xsl:value-of select="$offersLink" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:value-of select="@title"  disable-output-escaping="yes" /></a></b></font><br />
												<font face="arial, helvetica, sans serif" size="2" color="#000000">
												<xsl:if test="textLine">
												<xsl:for-each select="textLine">
													<xsl:choose>
														<xsl:when test="@type='bold'">
															<b><xsl:value-of select="." disable-output-escaping="yes" /></b>
															<br />
														</xsl:when>
														<xsl:when test="@type='italic'">
															<i><xsl:value-of select="."  disable-output-escaping="yes" /></i>
															<br />
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="." disable-output-escaping="yes" />
															<br />	
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
												</xsl:if>
												</font></td>
										</tr>
										<tr>
											<td colspan="3" valign="top" height="10" bgcolor="#FFFFFF">
												<img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_buffer_top_bottom.gif" alt="" width="1" height="10" /></td>
										</tr>
											</xsl:otherwise>
										</xsl:choose>
										</xsl:for-each>
										</xsl:if>
										</xsl:when>
										<xsl:when test="@offerImages='no'">
										<xsl:if test="offer">
										<xsl:for-each select="offer">
										<tr>
											<td valign="middle" width="254" class="feature" bgcolor="#FFFFFF">
												<font face="arial, helvetica, sans serif" size="2">
												<b><a style="color:#336699;"><xsl:attribute name="href"><xsl:value-of select="$offersLink" />[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><xsl:value-of select="@title" disable-output-escaping="yes" /></a></b></font><br />
												<xsl:if test="textLine">
												<xsl:for-each select="textLine">
													<xsl:choose>
														<xsl:when test="@type='bold'">
															<font face="arial, helvetica, sans serif" size="2" color="#000000"><b><xsl:value-of select="." disable-output-escaping="yes" /></b></font>
															<br />
														</xsl:when>
														<xsl:when test="@type='italic'">
															<font face="arial, helvetica, sans serif" size="2" color="#000000"><i><xsl:value-of select="." disable-output-escaping="yes" /></i></font>
															<br />
														</xsl:when>
														<xsl:when test="@type='bullet'">
															<table  cellpadding="0" cellspacing="0" border="0"><tr>
																<td valign="top" width="15" bgcolor="#FFFFFF">
																<img src="http://media.expedia.com/media/content/expus/graphics/mail/cm_bullet1.gif" width="15" height="20" /></td><td> <font face="arial, helvetica, sans serif" size="2" color="#000000"><xsl:value-of select="."  disable-output-escaping="yes" /></font></td></tr>
																<tr><td height="5"></td></tr>		
																</table>
															
														</xsl:when>
														<xsl:otherwise>
															<font face="arial, helvetica, sans serif" size="2" color="#000000"><xsl:value-of select="." disable-output-escaping="yes" /></font>
															<br />	
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
												</xsl:if>
												<br /></td>
										</tr>
										</xsl:for-each>
										</xsl:if>
										</xsl:when>
										<xsl:otherwise></xsl:otherwise>
										</xsl:choose>
										</table></td>
											<td valign="top" bgcolor="#FFFFFF"><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_buffer.gif" width="10" alt="" /></td>
										</tr>
										</table></td>
											<td width="2" valign="top" bgcolor="#336699"><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_blue_border.gif" width="2" alt="" /></td>
										</tr>
										<tr>
											<td width="284" colspan="3" valign="top" bgcolor="#FFFFFF"><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/feature_bottom.gif" width="284" alt="" /></td>
							</tr>
							</table>
						</xsl:for-each>
						</xsl:if></td>
							<td width="13" valign="top" bgcolor="#FFFFFF"><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/right_of_main.gif" width="13" alt="" /></td>
						</tr>
						<tr>
							<td width="598" valign="top" colspan="5" bgcolor="#FFFFFF"><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/spacer.gif" alt="" width="598" height="1" border="0" /></td>
						</tr><xsl:comment>*****************END CM_CONTENT_BODY*****************</xsl:comment>					
						<tr>
							<td valign="top" colspan="3" bgcolor="#FFFFFF"><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/yellow_curve.gif" width="300" alt=""/></td>
							<td colspan="2" width="298" valign="top" bgcolor="#FFFFFF"><img src="http://media.expedia.com/media/content/shared/graphics/common/mail/spacer.gif" alt="" name="" width="298" height="1" border="0"/></td>
						</tr>
			</table>
			<table width="598" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="598" height="28" align="center" class="bottom_links" bgcolor="#3D6E9E">
<a><xsl:attribute name="href">http://www.expedia.com/daily/flights/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><font face="arial, helvetica, sans serif" size="2" color="#FFFFFF"><b>flights</b></font></a>&#160;&#160;&#160;&#160;<a><xsl:attribute name="href">http://www.expedia.com/daily/hotels/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><font face="arial, helvetica, sans serif" size="2" color="#FFFFFF"><b>hotels</b></font></a>&#160;&#160;&#160;&#160;<a><xsl:attribute name="href">http://www.expedia.com/daily/cars/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><font face="arial, helvetica, sans serif" size="2" color="#FFFFFF"><b>cars</b></font></a>&#160;&#160;&#160;&#160;<a><xsl:attribute name="href">http://www.expedia.com/daily/packages/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><font face="arial, helvetica, sans serif" size="2" color="#FFFFFF"><b>vacation packages</b></font></a>&#160;&#160;&#160;&#160;<a><xsl:attribute name="href">http://www.expedia.com/daily/cruise/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><font face="arial, helvetica, sans serif" size="2" color="#FFFFFF"><b>cruises</b></font></a>&#160;&#160;&#160;&#160;<a><xsl:attribute name="href">http://www.expedia.com/daily/activities/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><font face="arial, helvetica, sans serif" size="2" color="#FFFFFF"><b>activities</b></font></a>&#160;&#160;&#160;&#160;<a><xsl:attribute name="href">http://www.expedia.com/daily/deals/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><font face="arial, helvetica, sans serif" size="2" color="#FFFFFF"><b>deals &amp; destinations</b></font></a></td>
				</tr>
			</table>
			<table width="598" cellpadding="0" cellspacing="0" border="0">
			<tr>
					<td width="299" valign="top" bgcolor="#A3C2E0"></td>
					<td width="299" valign="top" bgcolor="#A3C2E0" style="border: 10px solid #A3C2E0;" ><br /><br /> 
					<font face="arial" size="1" color="#666666">
			<xsl:comment>*****************BEGIN CM_T&amp;C******************</xsl:comment>
			<xsl:if test="offersModule/specialRules/@action='yes'">
			TERMS AND CONDITIONS<br /><br />
					<xsl:for-each select="offersModule/specialRules">
						<xsl:value-of select="." disable-output-escaping="yes" /><br /><br />										
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="offersModule/specialRules/@action='no'"></xsl:if>	
				<xsl:comment>*****************END CM_T&amp;C******************</xsl:comment>
	UNSUBSCRIBE
	<br />
	<br /> 
	If you do not wish to receive future e-mail advertisements from Expedia, Inc., please <a><xsl:attribute name="href">http://expediamail.com/PUBLISH(sub_mgmt_page)&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><font color="#666666">click here</font></a>. Please do not reply to this e-mail as we are not able to respond to messages sent to this e-mail address. If you've experienced any difficulty in being removed from an Expedia e-mail list, <a><xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><font color="#666666">click here</font></a> for personalized help. 
	<br />
	<br />
	CONTACT US
	<br />
	<br /> 
	To contact Expedia, Inc. or send feedback, please <a><xsl:attribute name="href">https://www.expedia.com/pub/agent.dll?qscr=fbak&amp;[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><font color="#666666">click here</font></a> or contact us via postal mail at: Expedia, Inc., Attn: PCC Team, 3150 139th Avenue SE, Bellevue, WA  98005. For additional assistance, visit the Expedia.com <a><xsl:attribute name="href">http://www.expedia.com/daily/service/default.asp?[+GET_LINK_CONST('OMNITURE_VAR')+]</xsl:attribute><font color="#666666">Customer Support Center</font></a>. 
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
	Hotel, vacation package, and cruise prices on the Expedia Website are constantly updated. Please refer to the site for the most current pricing. Vacation package prices shown are for one adult, economy class, based on double occupancy, and vary by dates, availability, and departure city. Additional taxes, fees, and charges may apply. Airfare is subject to, without limitation: (1) Sept. 11 Security Fee of $2.50 for each flight segment originating at a U.S. airport, up to $5 per one way or $10 per roundtrip; (2) up to $18 per roundtrip in local airport charges; (3)Federal Excise Tax of $3.20 per U.S. domestic flight segment; (4) a Travel Facilities Tax of up to $14.00 per roundtrip for domestic flights beginning or ending in Alaska or Hawaii; and (5) for international and Puerto Rico/U.S. Virgin Islands destinations, government taxes and fees of up to $200 per roundtrip, depending on routing and destination (may vary slightly depending on currency exchange rates at time of booking). A segment is defined as a takeoff and a landing.  
	<br />
	<br />
	CST #2029030-40
	<br />
	<br />
	&#169;2006 Expedia, Inc. All rights reserved.  Expedia, Expedia.com and the Airplane logo are registered trademarks of Expedia, Inc. in the U.S. and/or other countries. Other product and company names mentioned herein may be trademarks of their respective owners.
	<br />
	<xsl:if test="ID">
	<xsl:for-each select="ID">
	[+ "(EMID: CM_C_02_<xsl:value-of select="@issue" />)(MD: " . VAR(TODAY) . ")(EPID: $p->{'profile_key'})(BIID: $p->{'mailing_id'}_$p->{'_WAVE_ID_'})" +]
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
</xsl:template>
</xsl:stylesheet>
