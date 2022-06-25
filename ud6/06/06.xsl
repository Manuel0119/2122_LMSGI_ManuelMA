<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/consolas">
{
   "<xsl:value-of select="name()"/>":[
           <xsl:apply-templates select="consola"/>
   ]
}
    </xsl:template>
    <xsl:template match="consola">
      {
          <xsl:apply-templates select="*"/>
      }<xsl:if test="position()!=last()">,</xsl:if>
    </xsl:template>
    <xsl:template match="*">
        "<xsl:value-of select="name()"/>":"<xsl:value-of select="current()"/>"<xsl:if test="position()!=last()">,</xsl:if>
    </xsl:template>
</xsl:stylesheet>
