<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
    <xsl:template match="mysqldump">
<xsl:text>
</xsl:text>
        <xsl:element name="{database/@name}">
            <xsl:for-each select="database/table_data">
                <xsl:element name="{@name}">
                    <xsl:for-each select="row">
                        <xsl:element name="{name(.)}">
                            <xsl:for-each select="field">
                                <xsl:element name="{current()/@name}">
                                    <xsl:value-of select="current()"/>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
