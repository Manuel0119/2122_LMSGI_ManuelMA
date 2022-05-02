<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 21 de abril de 2022, 10:37
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" version="html"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
        </xsl:text>
        <xsl:apply-templates select="comment()"/>
<xsl:text>
</xsl:text>
        <html>
            <head>
                <title>03 XSLT Manuel Martín Alonso</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>       
                <meta name="author" content="Manuel Martín Alonso"/>
                <meta name="application-name" content="Web de libros más vendidos"/>
                <meta name="description" content="Diferentes libros clasificados por ventas"/>
                <meta name="keywords" content="HTML, CSS"/>
                <meta name="robots" content="index, follow"/>      
                <link href="estilos.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" type="image/png" sizes="32x32" href="../../images/favicon.ico"/>
            </head>
            <body>
                <h1>Información de películas</h1>
                <div class="contenedor">
                    <xsl:for-each select="peliculas/pelicula">
                        <xsl:sort select="publico" datatype="text" order="ascending"/>
                        <xsl:sort select="valoracion/@puntos" datatype="number" order="ascending"/>
                        <xsl:sort select="nombre" datatype="text" order="ascending"/>
                        <div class="contenedor_peq">
                            <div class="titulo">
                                <xsl:value-of select="nombre"/>
                            </div>
                            <div>
                                <xsl:choose>
                                    <xsl:when test="valoracion/@puntos=1 or valoracion/@puntos=2">
                                        <p>Puntuación:<span class="bajo">Bajo</span></p>
                                    </xsl:when>
                                    <xsl:when test="valoracion/@puntos=3 or valoracion/@puntos=4">
                                        <p>Puntuación:<span class="medio">Medio</span></p>
                                    </xsl:when>
                                    <xsl:when test="valoracion/@puntos=5">
                                        <p>Puntuación:<span class="alto">Alto</span></p>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p>Puntuación:<span id="sin_cal">Sin calificar</span></p>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </div>
                            <div>
                                <xsl:value-of select="concat('Dirigido a: ',publico)"/>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
                <footer>
                    <p>
                        <xsl:value-of select="concat('Numero total de peliculas:',count(//pelicula))"/>
                    </p>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:text xml:space="preserve">
            <xsl:comment>
                <xsl:value-of select="."/>
        </xsl:comment>
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>
