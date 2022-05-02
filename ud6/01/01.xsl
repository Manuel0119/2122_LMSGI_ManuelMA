<?xml version="1.0" encoding="UTF-8"?>
<!--Author: Manuel Martín Alonso
    Descripcion: Información de vecinos-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/edificio">
        <html>
            <head>
                <title>01.xsl</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>       
                <meta name="author" content="Manuel Martín Alonso"/>
                <meta name="application-name" content="Web de libros más vendidos"/>
                <meta name="description" content="Diferentes libros clasificados por ventas"/>
                <meta name="keywords" content="HTML, CSS"/>
                <meta name="robots" content="index, follow"/>      
                <link href="css/estilos.css"  rel="stylesheet" type="text/css"/>
                <link rel="icon" type="image/png" sizes="32x32" href="../../images/favicon.ico"/>
            </head>
            <body>
                <h1>Información de las viviendas</h1>
                <xsl:apply-templates select="vivienda"/>
                <div class="vivienda1">
                    Número de viviendas <xsl:value-of select='count(//vivienda)'/>
                </div>
                <div class="ntotal">
                    Número total de vecinos <xsl:value-of select='count(//nombre)'/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="vivienda">
        <div class="total">
            <p>
                <xsl:value-of select="concat('Piso:',piso,' Puerta:',puerta)"/>
            </p>
            <ol>
                <xsl:apply-templates select="vecinos/nombre"/>
            </ol>
        </div>
    </xsl:template>
    <xsl:template match='vecinos/nombre'>
        <li>
            <xsl:value-of select="current()/text()"/>
        </li>
    </xsl:template>
</xsl:stylesheet>


