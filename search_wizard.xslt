<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
													<td align="left"><xsl:comment>***************** END <xsl:value-of select="@name"/> BODY_CONTENT_MODULE *****************</xsl:comment>
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
																			<td height="10"></td>
																		</tr>
																		<tr>
																			<td align="center" height="28">
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/ETM_CS_button_left.gif" /></td>
																					<td height="28" bgcolor="#d7dce8">
																						<table height="28" cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td width="100%"><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/ETM_CS_button_top.gif" width="100%" height="5" /></td>
																						</tr>
																						<tr>
																							<td bgcolor="#459b44"><input name="GOPackage" type="submit" value="Search Flight + Hotel" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#459b44; border-color:#459b44; border: 0; height:16; width:125;" /></td>
																						</tr>
																						<tr>
																							<td valign="top" width="100%"><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/ETM_CS_button_bottom.gif" width="100%" height="7" /></td>
																						</tr>
																						</table></td>
																					<td><input name="GOPackage" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/ETM_CS_button_right.gif" height="27" /></td>
																				</tr>
																				</table></td>
																		</tr>
																		<tr><td align="center" height="5" style="font-family: arial, helvetica, sans serif; font-size: 12px; color: #000000;"><b>or</b></td></tr>
																		<tr>
																			<td align="center" height="28">
																				<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/ETM_CS_button_left.gif"  height="28" /></td>
																					<td height="28" bgcolor="#d7dce8">
																						<table height="28" width="100%" cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td width="100%"><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/ETM_CS_button_top.gif" width="100%" height="5" /></td>
																						</tr>
																						<tr>
																							<td bgcolor="#459b44"><input name="GOFlight" type="submit" value="Search Flight" style="cursor: hand; color:#ffffff; font-weight:bold; font-size:11px; font-family:arial, helvetica, sans serif; background-color:#459b44; border-color:#459b44; border: 0; height:16; width:92;" /></td>
																						</tr>
																						<tr>
																							<td valign="top" width="100%"><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/ETM_CS_button_bottom.gif" width="100%" height="7" /></td>
																						</tr>
																						</table></td>
																					<td><input name="GOFlight" type="image" src="http://media.expedia.com/media/content/expus/graphics/mail/ETM_CS_button_right.gif"  height="27" /></td>
																				</tr>
																				</table></td>
																		</tr>
																		</table><xsl:comment>*****************START <xsl:value-of select="@name"/> BOTTOM MODULE*****************</xsl:comment></td>
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
								</table>
</xsl:stylesheet> 