<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : FmAWeb.xsl
    Created on : 6 de junio de 2022, 10:01
    Author     : Manuel Martín Alonso
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="lfm">
        <html>
            <head>
                <title>FmAWeb Manuel Martín Alonso</title>
                <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <h1>last.fm</h1>
                <h2><xsl:value-of select="topalbums/@artist"/></h2>
                <h3>Álbumes</h3>
                <div class="contenedor_grande">
                    <xsl:apply-templates select="topalbums/album"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="topalbums/album">
        <div class="contenedor">
            <xsl:if test="image/@size='large'">
                <img src='{image[@size="large"]}'/>
            </xsl:if>
            <a href="{name}">
                <xsl:value-of select="name"/>
            </a>
            <br></br>
            <xsl:value-of select="artist/name"/>
        </div>
    </xsl:template>
</xsl:stylesheet>
