<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 04.xsl
    Created on : 28 de abril de 2022, 11:33
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
               <title>04 XSLT Manuel Martín Alonso</title>
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
                <h1>Práctica 4 <br/> Información de garajes</h1>
                <xsl:apply-templates select="garaje/coches/coche"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="garaje/coches/coche">
        <xsl:if test="count(//reparacion[current()/matricula=matricula])&gt;0">
            <div class="centrado">
                <table>
                    <thead>
                        <tr>
                            <th>Matrícula</th>
                            <th>Reparaciones</th>
                        </tr>
                    </thead>   
                    <tbody>
                        <tr>
                            <td class="mat">
                                <xsl:value-of select="matricula"/>
                            </td>
                            <td>
                                <xsl:apply-templates select="//reparacion[current()/matricula=matricula]"/>
                                <!--Totales a pagar-->
                                <div class="totales">
                                    <div>
                                        Numero de reparaciones: <xsl:value-of select="count(//reparacion[current()/matricula=matricula])"/>
                                    </div>
                                    <div>
                                        Total Horas: <xsl:value-of select="sum(//reparacion[current()/matricula=matricula]/horas)"/>
                                    </div>
                                    <div>
                                        Total a pagar <xsl:value-of select="sum(//reparacion[current()/matricula=matricula]/horas)*12"/>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>      
                </table>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="//reparacion[current()/matricula=matricula]">
        <div>
            <p>
                <xsl:value-of select="current()/@codigo"/>
            </p>
            <ul>
                <li>
                    <xsl:value-of select="descripcion"/>
                </li>
                <li>
                    <xsl:value-of select="concat('Fecha de entrada: ',fecha_entrada)"/>
                </li>
                <li>
                    <xsl:value-of select="concat('Fecha de salida: ',fecha_salida)"/>
                </li>
                <li>
                    <xsl:value-of select="concat(horas,' horas')"/>
                </li>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:text xml:space="preserve">
            <xsl:comment>
                <xsl:value-of select="."/>
        </xsl:comment>
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>
