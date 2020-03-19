<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mei="http://www.music-encoding.org/ns/mei" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd mei" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>
                <xd:b>Created on:</xd:b> Sep 29, 2014</xd:p>
            <xd:p>
                <xd:b>Author:</xd:b> Laurent Pugin</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="no"/>
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="mei:lem/mei:verse[not(@label)]">
        <xsl:copy>
            <!-- create an attribute and fetch required data -->
            <xsl:attribute name="label">
                <xsl:variable name="staffN" select="saxon:evaluate('(ancestor::*//mei:staff[1]/@n)[last()]')"/>
                <xsl:variable name="pos" select="position()"/>
                <xsl:value-of select="(preceding::*//mei:staff[$pos > position()][@n=$staffN]//mei:lem/mei:verse/@label)[last()]"/>
            </xsl:attribute>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="mei:rdg/mei:verse[not(@label)]">
        <xsl:copy>
            <!-- create an attribute and fetch required data -->
            <xsl:attribute name="label">
                <xsl:variable name="staffN" select="saxon:evaluate('(ancestor::*//mei:staff[1]/@n)[last()]')"/>
                <xsl:variable name="pos" select="position()"/>
                <xsl:value-of select="(preceding::*//mei:staff[$pos > position()][@n=$staffN]//mei:rdg/mei:verse/@label)[last()]"/>
            </xsl:attribute>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>