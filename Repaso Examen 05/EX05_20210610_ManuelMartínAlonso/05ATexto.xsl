<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>
    <xsl:template match="/mysqldump">
        <xsl:value-of select="concat('CREATE DATABASE IF NOT EXISTS',' ',database/@name,';')"/>
<xsl:text>
            
</xsl:text>
<xsl:value-of select="concat('USE ',database/@name,';')"/><xsl:text>
</xsl:text>
<xsl:text>
</xsl:text>
        <xsl:for-each select="database/table_structure">
            <xsl:value-of select="concat('CREATE TABLE IF NOT EXISTS',' ',current()/@name,'(')"/><xsl:text>
</xsl:text>
<xsl:for-each select="field">
    <xsl:value-of select="concat(@Field,' ',@Type,' ')"/>
    <xsl:choose>
            <xsl:when test="following-sibling::field">
                <xsl:value-of select="concat(',')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(' );')"/>
<xsl:text>
</xsl:text>
            </xsl:otherwise>
    </xsl:choose>
    <text>
</text>
</xsl:for-each>
<xsl:text>
</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
