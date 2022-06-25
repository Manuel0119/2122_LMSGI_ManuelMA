<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : FmAXml2.xsl
    Created on : 6 de junio de 2022, 9:11
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
    <xsl:template match="lfm"><xsl:text>
</xsl:text>
        <xsl:element name="{name(topalbums)}">
            <xsl:attribute name="{name(topalbums/@artist)}">
                <xsl:value-of select="topalbums/@artist"/>
            </xsl:attribute>
            <xsl:for-each select="topalbums/album">
                <xsl:sort order="descending" select="playcount" data-type="number"/>
                    <xsl:element name="{name(.)}">
                        <xsl:element name="{name(name)}">
                            <xsl:value-of select="name"/>
                        </xsl:element>
                        <xsl:element name="{name(playcount)}">
                            <xsl:value-of select="playcount"/>
                        </xsl:element>
                        <xsl:element name="{name(url)}">
                            <xsl:value-of select="url"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>   
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
