<?xml version="1.0"  encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes">
	<xsl:output method="html" version="1.0" indent="yes"/>
<xsl:key name="rows" match="PROROW" use="name" />
<xsl:template match="PROROW">
  <b><xsl:value-of select="name" /></b>
  <ul>
    <xsl:for-each select="key('rows', name)">
      <li>
        <a href="projects_results.xml?project={id}">
          <xsl:value-of select="project_name" />
        </a>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>
</xsl:stylesheet>
