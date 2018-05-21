<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mei="http://www.music-encoding.org/ns/mei" exclude-result-prefixes="mei" version="1.0">

    <xsl:output method="xhtml" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="mei:front">
        <xsl:if test="true()">
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template match="mei:back">
        <xsl:if test="false()">
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="mei:front/mei:div/mei:head">
        <xsl:call-template name="h3"/>
    </xsl:template>
    
    <xsl:template match="mei:back/mei:div/mei:head">
        <xsl:call-template name="h3"/>
    </xsl:template>
    
    <xsl:template name="h3">
        <h3>
            <xsl:value-of select="."/>
        </h3>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="mei:front/mei:div/mei:div/mei:head"> 
        <xsl:call-template name="h4"/>
    </xsl:template>

    <xsl:template match="mei:back/mei:div/mei:div/mei:head"> 
        <xsl:call-template name="h4"/>
    </xsl:template>
    
    <xsl:template name="h4">
        <h4>
            <xsl:value-of select="."/>
        </h4>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="mei:div/mei:div/mei:div/mei:head">
        <h5>
            <xsl:value-of select="."/>
        </h5>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="mei:front//mei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="mei:back//mei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="mei:p/text()">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="mei:rend[@rend='italic']">
        <em>
            <xsl:value-of select="."/>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    <xsl:template match="mei:rend[@rend='bold']">
        <b>
            <xsl:value-of select="."/>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    
    <xsl:template match="mei:rend[@rend='sub']">
        <sub>
            <xsl:value-of select="."/>
            <xsl:apply-templates/>
        </sub>
    </xsl:template>

    <xsl:template match="@* | node()">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>
    
    <xsl:template match="mei:table">    
        <table>
            <xsl:attribute name="class"><xsl:value-of select="@label"/></xsl:attribute>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="mei:tr">    
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="mei:td">    
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="mei:td/text()">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="mei:lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="mei:meiHead"/>
    
    <xsl:template match="mei:body"/>
    
    <xsl:template match="//processing-instruction()" />

</xsl:stylesheet>
