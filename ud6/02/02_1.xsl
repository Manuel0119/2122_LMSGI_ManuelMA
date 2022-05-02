<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl
    Created on : 4 de abril de 2022, 10:07
    Author     : Manuel Martín Alonso
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>02_1.xsl</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>       
                <meta name="author" content="Manuel Martín Alonso"/>
                <meta name="application-name" content="Web de libros más vendidos"/>
                <meta name="description" content="Diferentes libros clasificados por ventas"/>
                <meta name="keywords" content="HTML, CSS"/>
                <meta name="robots" content="index, follow"/>      
                 <link href="estilos/css.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" type="image/png" sizes="32x32" href="../../images/favicon.ico"/>
            </head>
            <body>
                <h1>Información de tickets</h1>
                <h2>Listado de tickets</h2>      
                <!--<xsl:apply-templates select="listatickets/ticket"/>-->
                <xsl:for-each select="listatickets/ticket">
                    <xsl:sort select="numero" data-type="number" order="descending"/>
                    <div class="nticket">
                        <p class="nticket2">
                            <xsl:value-of select="concat('Tickets ',numero)"/>
                        </p>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="product">Producto</th>
                                    <th class="product">Precio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--<xsl:apply-templates select="producto"/>-->
                                <xsl:for-each select="producto">
                                    <xsl:sort select="nombre" data-type="text" order="descending"/>
                                    <tr>
                                        <td class="nombre">
                                            <xsl:value-of select="nombre"/>
                                        </td>
                                        <td class="precio">
                                            <xsl:value-of select="precio"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Total:</th>
                                    <th>
                                        <xsl:value-of select="total"/>
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                        <div class="fecha">
                            <xsl:value-of select="concat('Fecha del ticket ',fecha)"/>
                        </div>
                    </div> 
                </xsl:for-each>
                <div class="foot1">
                    <xsl:apply-templates select="listatickets"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="listatickets">
        <div>
            <p class="foot2">
                <xsl:value-of select="concat('NÚMERO DE TICKETS: ',count(ticket))"/>
            </p>
        </div>
        <div>
            <p class="foot2">
                <xsl:value-of select="concat('TOTAL DE TICKETS: ',sum(//precio))"/>
            </p>
        </div>
    </xsl:template>
</xsl:stylesheet>
