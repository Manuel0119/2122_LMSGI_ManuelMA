<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="solucion" select="'si'"/>
    <xsl:template match="/">
        <html lang="es">
            <head>
                <title>05 XSLT Manuel Martín Alonso</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>       
                <meta name="author" content="Manuel Martín Alonso"/>
                <meta name="application-name" content="Web de libros más vendidos"/>
                <meta name="description" content="Diferentes libros clasificados por ventas"/>
                <meta name="keywords" content="HTML, CSS"/>
                <meta name="robots" content="index, follow"/>      
                <link href="examen.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" type="image/png" sizes="32x32" href="../../images/favicon.ico"/>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="examen/datos/nombreCiclo"/>
                </h1>
                <h2>
                    <xsl:value-of select="examnen/datos/nombreModulo"/>
                </h2>
                <h3>
                    <xsl:value-of select="concat(examen/datos/fecha/dia,' de ',document('meses.xml')/meses/mes[@id=current()/examen/datos/fecha/mes] ,' de ',examen/datos/fecha/anyo)"/>
                </h3>
                <div id="contenedor">
                    <form action="/action_page.php" method="post" name="EXAMEN">
                        <xsl:for-each select="examen/preguntas/pregunta">
                            <fieldset>
                                <div id="contenido">
                                    <xsl:value-of select="concat(@id,' , ',enunciado)"/>
                                    <xsl:for-each select="respuestas/respuesta">
                                        <label style="display:block">
                                            <input type="radio" id="pregunta" name="pregunta">
                                                <xsl:attribute name="id">
                                                    <xsl:value-of select="concat('pregunta',../../@id,position())"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="name">
                                                    <xsl:value-of select="concat('pregunta',../../@id)"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="position()"/>
                                                </xsl:attribute> 
                                                <xsl:if test="$solucion!='no'">
                                                    <xsl:attribute name="disabled">
                                                        <xsl:value-of select="disabled"/>
                                                    </xsl:attribute>
                                                    <xsl:if test="@correcta='correcta'">
                                                        <xsl:attribute name="checked">
                                                            <xsl:value-of select="checked"/>
                                                        </xsl:attribute>
                                                    </xsl:if> 
                                                </xsl:if>
                                            </input>    
                                            <xsl:value-of select="current()"/>
                                        </label>
                                    </xsl:for-each>
                                </div>
                            </fieldset>
                        </xsl:for-each>
                        <xsl:if test="$solucion!='si'">
                            <div id="envio">
                                <input type="submit" id="enviar" name="envia1" value="Enviar formulario"/>
                                <input type="reset" id="borrar" name="borra1" value="Borrar formulario"/>
                            </div>
                        </xsl:if>
                    </form>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
