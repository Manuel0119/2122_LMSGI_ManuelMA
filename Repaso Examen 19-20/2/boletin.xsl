<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : boletin.xsl.xsl
    Created on : 2 de junio de 2022, 17:41
    Author     : Usuario
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="NumExpediente" select="0"/>
    <xsl:template match="daw">
        <html>
            <body>
                <div class="titulo">
                    <h1>
                        <xsl:value-of select="concat(@curso,'º',name(),' Curso 2018/2019')"/>
                    </h1>
                </div>
                <table id="tabla1">
                    <thead>
                        <tr>
                            <th>Expediente</th>
                            <th>Nombre y apellidos</th>
                            <th>Calificaciones</th>
                        </tr>
                    </thead>
                    <xsl:choose>
                        <xsl:when test="$NumExpediente=0">
                            <xsl:apply-templates select="alumnos/alumno"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="alumnos/alumno[$NumExpediente]"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </table>
                <footer>Ricardo Santiago Tomé</footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="alumnos/alumno">
        <tr>
            <xsl:element name="td">
                <xsl:attribute name="id">
                    <xsl:value-of select="expediente"/>
                </xsl:attribute>
                <xsl:value-of select="expediente"/>
            </xsl:element>
            <td>
                <xsl:value-of select="concat(nombre,' ',apellido1,' ',apellido2)"/>
            </td>
            <td>
                <table class="tabla2">
                    <thead>
                        <tr>
                            <th>Módulo</th>
                            <th>1ªEvaluación</th>
                            <th>2ªEvaluación</th>
                            <th>3ªEvaluación</th>
                        </tr>
                    </thead>
                    <xsl:apply-templates select="//boletin/calificacion[@expediente=//alumnos/alumno[expediente]/expediente]"/> 
                    <tfoot>
                        <tr>
                            <td class="aprobados">
                                Número de aprobados
                            </td>
                            <xsl:for-each select="//calificacion/@expediente[current()]">
                                <td>
                                    <!--<xsl:value-of select="count(daw/boletin/calificacion[@expediente=current()]/nota)"/>-->
                                    <xsl:value-of select="count(nota)"/>
                                </td>
                            </xsl:for-each>
                            <td>
                                
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//boletin/calificacion[@expediente=//alumnos/alumno[expediente]/expediente]">
        <tbody>
            <tr>
                <td>
                    <xsl:value-of select="document('modulos.xml')/modulos/modulo[sigla=current()/@sigla]/nombre"/>
                </td>
                <xsl:for-each select="nota">
                    <td>
                        <xsl:value-of select="current()"/>
                    </td>
                </xsl:for-each>
            </tr>
        </tbody>
    </xsl:template>

</xsl:stylesheet>
