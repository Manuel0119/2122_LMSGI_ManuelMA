<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05AWeb.xsl
    Created on : 25 de mayo de 2022, 18:44
    Author     : manua
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>05 AWeb Manuel Martín Alonso</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>       
                <meta name="author" content="Manuel Martín Alonso"/>
                <meta name="application-name" content="Web de Base de Datos"/>
                <meta name="description" content="Realizar una web de una base de datos"/>
                <meta name="keywords" content="XSLT, CSS"/>
                <meta name="robots" content="index, follow"/>      
                <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" type="image/png" sizes="32x32" href="../../images/favicon.ico"/>
            </head>
            <body>
                <h1>Base de datos: <xsl:value-of select="mysqldump/database/@name"/></h1>
                <xsl:apply-templates select="mysqldump/database/table_data[@name='DEPART' or @name='EMPLE']"/>
                <footer>
                    <div>Realizado por: Manuel Martín Alonso</div>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="mysqldump/database/table_data[@name='DEPART' or @name='EMPLE']">
        <div>
            <h2>Tabla: <xsl:value-of select="@name"/></h2>
            <table>
                <thead>
                    <tr>
                        <xsl:for-each select="row[1]/field">
                            <th><xsl:value-of select="@name"/></th>
                        </xsl:for-each>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="row">
                        <tr>
                            <xsl:for-each select="field">
                                <td><xsl:value-of select="current()"/></td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>
