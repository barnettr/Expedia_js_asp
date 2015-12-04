<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xsl:output omit-xml-declaration="no" method="html" indent="yes"/>
	<xsl:template match="PriceModule">
	<table width="258" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td valign="top">
			<xsl:for-each select="row"><xsl:value-of select="translate(@location,' ','_')"></xsl:value-of><br/></xsl:for-each>								
		</td>
	</tr>
	</table> 
</xsl:template>
</xsl:stylesheet> 

