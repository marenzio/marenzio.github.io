<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mei="http://www.music-encoding.org/ns/mei" exclude-result-prefixes="mei" version="1.0">

    <xsl:output method="html" indent="yes"/>
    <xsl:template match="mei:front">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="mei:div/mei:head">
        <h3 class="page-header">
            <xsl:value-of select="."/>
        </h3>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="mei:div/mei:div/mei:head">    
        <h4 class="page-header">
            <xsl:value-of select="."/>
        </h4>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="mei:div/mei:div/mei:div/mei:head">
        <h5 class="page-header">
            <xsl:value-of select="."/>
        </h5>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="mei:front//mei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="mei:front//mei:p/text()|@*">
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

</xsl:stylesheet>
