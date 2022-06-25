<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:apply-templates select="network"></xsl:apply-templates>
    </xsl:template> 
    <xsl:template match="network">
        network:
        version: <xsl:value-of select="version/text()"/>
        ethernets:
        <xsl:apply-templates select="interface"/>
    </xsl:template>
    <xsl:template match="interface">
        <xsl:value-of select="concat(ethernets,':')"/><xsl:text></xsl:text>
            dhcp4: <xsl:value-of select="dhcp4"/>  
            address: <xsl:value-of select="concat('[',address,'/',24,']')"/>  
            gateway: <xsl:value-of select="gateway"/>   
            nameservers: [<xsl:for-each select="nameservers/address"><xsl:value-of select="concat(current())"/><xsl:if test="position()!=last()">,</xsl:if></xsl:for-each>]<xsl:text>   
<xsl:text></xsl:text>                                                                                                                                                                 
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>
