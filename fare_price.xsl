<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
<xsl:import href="xslt_date/date.xsl" />

<!--xsl:function name="my:formatDate">
    <xsl:param name="departDate"/>
    <xsl:variable name="year" select="substring($departDate, 1, 4)"/>
	<xsl:variable name="month" select="substring($departDate, 5, 2)"/>
	<xsl:variable name="day" select="substring($departDate, 7, 2)"/>
    <xsl:choose>
      <xsl:when test="$departDate">
        <xsl:value-of select="concat($month,'/',$day,'/',$year)"/>
      </xsl:when>
    </xsl:choose>
  </xsl:function-->
 <xsl:template match="/">
	<table cellpadding="0" cellspacing="5" border="0">
		<xsl:for-each select="Import/Row">
		<xsl:if test="D_COUNT !=0">
			<tr>
				<td colspan="4">Origin: <xsl:value-of select="H_AIRPORT_CODE" /></td>
			</tr>
			<xsl:choose>
				<xsl:when test="D_COUNT &lt;= 5">
				<xsl:if test="D1_DESTINATION_CODE and D1_FARE_AMOUNT">
				<xsl:variable name="dyear" select="substring(D1_DEPARTURE_DATE, 1, 4)"/>
				<xsl:variable name="dmonth" select="substring(D1_DEPARTURE_DATE, 5, 2)"/>
				<xsl:variable name="dday" select="substring(D1_DEPARTURE_DATE, 7, 2)"/>				
				<xsl:variable name="ryear" select="substring(D1_RETURN_DATE, 1, 4)"/>
				<xsl:variable name="rmonth" select="substring(D1_RETURN_DATE, 5, 2)"/>
				<xsl:variable name="rday" select="substring(D1_RETURN_DATE, 7, 2)"/>
				<tr>
					<td><xsl:value-of select="D1_DESTINATION_CODE" /></td>
					<td><xsl:if test="D1_DEPARTURE_DATE"><xsl:value-of select="concat($dmonth,'/',$dday,'/',$dyear)" /></xsl:if></td>
					<td><xsl:if test="D1_RETURN_DATE"><xsl:value-of select="concat($rmonth,'/',$rday,'/',$ryear)" /></xsl:if></td>
					<td>$<xsl:value-of select="D1_FARE_AMOUNT" /></td>
				</tr>
				</xsl:if>
				<xsl:if test="D2_DESTINATION_CODE and D2_FARE_AMOUNT">
				<xsl:variable name="dyear" select="substring(D2_DEPARTURE_DATE, 1, 4)"/>
				<xsl:variable name="dmonth" select="substring(D2_DEPARTURE_DATE, 5, 2)"/>
				<xsl:variable name="dday" select="substring(D2_DEPARTURE_DATE, 7, 2)"/>
				<xsl:variable name="ryear" select="substring(D2_RETURN_DATE, 1, 4)"/>
				<xsl:variable name="rmonth" select="substring(D2_RETURN_DATE, 5, 2)"/>
				<xsl:variable name="rday" select="substring(D2_RETURN_DATE, 7, 2)"/>
				<tr>
					<td><xsl:value-of select="D2_DESTINATION_CODE" /></td>
					<td><xsl:if test="D2_DEPARTURE_DATE"><xsl:value-of select="concat($dmonth,'/',$dday,'/',$dyear)" /></xsl:if></td>
					<td><xsl:if test="D2_RETURN_DATE"><xsl:value-of select="concat($rmonth,'/',$rday,'/',$ryear)" /></xsl:if></td>
					<td>$<xsl:value-of select="D2_FARE_AMOUNT" /></td>
				</tr>
				</xsl:if>
				<xsl:if test="D3_DESTINATION_CODE and D3_FARE_AMOUNT">
				<xsl:variable name="dyear" select="substring(D3_DEPARTURE_DATE, 1, 4)"/>
				<xsl:variable name="dmonth" select="substring(D3_DEPARTURE_DATE, 5, 2)"/>
				<xsl:variable name="dday" select="substring(D3_DEPARTURE_DATE, 7, 2)"/>
				<xsl:variable name="ryear" select="substring(D3_RETURN_DATE, 1, 4)"/>
				<xsl:variable name="rmonth" select="substring(D3_RETURN_DATE, 5, 2)"/>
				<xsl:variable name="rday" select="substring(D3_RETURN_DATE, 7, 2)"/>
				<tr>
					<td><xsl:value-of select="D3_DESTINATION_CODE" /></td>
					<td><xsl:if test="D3_DEPARTURE_DATE"><xsl:value-of select="concat($dmonth,'/',$dday,'/',$dyear)" /></xsl:if></td>
					<td><xsl:if test="D3_RETURN_DATE"><xsl:value-of select="concat($rmonth,'/',$rday,'/',$ryear)" /></xsl:if></td>
					<td>$<xsl:value-of select="D3_FARE_AMOUNT" /></td>
				</tr>
				</xsl:if>
				<xsl:if test="D4_DESTINATION_CODE and D4_FARE_AMOUNT">
				<xsl:variable name="dyear" select="substring(D4_DEPARTURE_DATE, 1, 4)"/>
				<xsl:variable name="dmonth" select="substring(D4_DEPARTURE_DATE, 5, 2)"/>
				<xsl:variable name="dday" select="substring(D4_DEPARTURE_DATE, 7, 2)"/>
				<xsl:variable name="ryear" select="substring(D4_RETURN_DATE, 1, 4)"/>
				<xsl:variable name="rmonth" select="substring(D4_RETURN_DATE, 5, 2)"/>
				<xsl:variable name="rday" select="substring(D4_RETURN_DATE, 7, 2)"/>
				<tr>
					<td><xsl:value-of select="D4_DESTINATION_CODE" /></td>
					<td><xsl:if test="D4_DEPARTURE_DATE"><xsl:value-of select="concat($dmonth,'/',$dday,'/',$dyear)" /></xsl:if></td>
					<td><xsl:if test="D4_RETURN_DATE"><xsl:value-of select="concat($rmonth,'/',$rday,'/',$ryear)" /></xsl:if></td>
					<td>$<xsl:value-of select="D4_FARE_AMOUNT" /></td>
				</tr>
				</xsl:if>
				<xsl:if test="D5_DESTINATION_CODE and D5_FARE_AMOUNT">
				<xsl:variable name="dyear" select="substring(D5_DEPARTURE_DATE, 1, 4)"/>
				<xsl:variable name="dmonth" select="substring(D5_DEPARTURE_DATE, 5, 2)"/>
				<xsl:variable name="dday" select="substring(D5_DEPARTURE_DATE, 7, 2)"/>
				<xsl:variable name="ryear" select="substring(D5_RETURN_DATE, 1, 4)"/>
				<xsl:variable name="rmonth" select="substring(D5_RETURN_DATE, 5, 2)"/>
				<xsl:variable name="rday" select="substring(D5_RETURN_DATE, 7, 2)"/>
				<tr>
					<td><xsl:value-of select="D5_DESTINATION_CODE" /></td>
					<td><xsl:if test="D5_DEPARTURE_DATE"><xsl:value-of select="concat($dmonth,'/',$dday,'/',$dyear)" /></xsl:if></td>
					<td><xsl:if test="D5_RETURN_DATE"><xsl:value-of select="concat($rmonth,'/',$rday,'/',$ryear)" /></xsl:if></td>
					<td>$<xsl:value-of select="D5_FARE_AMOUNT" /></td>
				</tr>
				</xsl:if>
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			</xsl:if>
		</xsl:for-each>
	</table>
</xsl:template>
</xsl:stylesheet>
