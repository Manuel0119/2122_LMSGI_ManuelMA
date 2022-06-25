<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="formula1">
        <html>
            <head>
                <title>Manuel Martín Alonso</title>
                <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" type="image/png" sizes="32x32" href="images/favicon.ico"/>
            </head>
            <body>
                <h1>FÓRMULA 1</h1>
                <table>
                    <caption>CLASIFICACIÓN DE PILOTOS TEMPORADA <xsl:value-of select="@temporada"/> (<xsl:value-of select="clasificacion/@carrera"/> CARRERA) </caption>
                    <thead>
                        <tr>
                            <th>Posición</th>
                            <th colspan="2">Piloto</th>
                            <th>Escudería</th>
                            <th>Puntos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="clasificacion/clasificacionpilotos">
                            <xsl:sort order="ascending" data-type="number" select="@posicion"/>
                        </xsl:apply-templates>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="clasificacion/clasificacionpilotos">
        <tr>
            <td>
                <xsl:value-of select="concat(@posicion,'º')"/>
            </td>
            <td>
                <img src="{concat('images/',piloto/@pilotoId,'.PNG')}" alt="{piloto/@pilotoId}"></img>
            </td>
            <td>
                <div>
                    <a href="{piloto/@url}">
                        <xsl:value-of select="concat(piloto/nombre,' ',piloto/apellido)"/>
                    </a>
                </div>
                <div>
                    <xsl:value-of select="piloto/pais"/>
                </div>
            </td>
            <td>
                <div>
                    <a href="{constructor/@url}">
                        <xsl:value-of select="constructor/nombre"/>
                    </a>
                </div>
                <div>
                    <xsl:value-of select="constructor/pais"/>
                </div>
            </td>
            <td>
                <xsl:value-of select="@puntos"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
