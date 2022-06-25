<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
    <xsl:template match="daw">
<xsl:text>
</xsl:text>
    <daw curso="1">
        <xsl:for-each select="alumnos/alumno">
            <xsl:element name="{name(.)}">
                <xsl:attribute name="{name(expediente)}">
                   <xsl:value-of select="expediente"/>
                </xsl:attribute>
                <xsl:for-each select="../../boletin/calificacion/nota">
                    <xsl:element name="{name(.)}">
                        <xsl:attribute name="{name(@sigla)}">
                            <xsl:value-of select="@sigla"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </daw>
    </xsl:template>
</xsl:stylesheet>
