<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/daw">
        <html>
            <head>
                <title>Ejercicio 2 Examen 2019-2020</title>
            </head>
            <body>
                <h1>1º DAW Curso 2018/2019</h1>
                <div>
                    <table>
                        <thead>
                            <tr>
                                <th>Expediente</th>
                                <th>Nombre y apellidos</th>
                                <th>Calificaciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="alumnos/alumno">
                                <tr>
                                    <td><xsl:value-of select="expediente"/></td>
                                    <td><xsl:value-of select="concat(nombre,' ',apellido1,' ',apellido2)"/></td>
                                    <td><xsl:apply-templates select="//boletin"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//boletin">
        <table>
            <thead>
                <tr>
                    <th>Módulo</th>
                    <th>1º Evaluación</th>
                    <th>2º Evaluación</th>
                    <th>3º Evaluación</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="document('modulos.xml')/modulos/modulo">
                    <tr>
                        <td>
                            <xsl:value-of select="nombre"/>  
                        </td>
                        <xsl:for-each select="//boletin/calificacion">
                            <td>
                                <xsl:value-of select="nota"/>
                            </td>
                        </xsl:for-each>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>
