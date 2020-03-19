<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mei="http://www.music-encoding.org/ns/mei" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd mei" version="2.0">
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

    <xsl:template match="mei:verse">
        <xsl:choose>
            <xsl:when test="(./@n='1')">
                <xsl:element name="app" namespace="http://www.music-encoding.org/ns/mei">
                    <xsl:element name="lem" namespace="http://www.music-encoding.org/ns/mei">
                        <xsl:element name="verse" namespace="http://www.music-encoding.org/ns/mei">
                            <xsl:attribute name="n" select="1"></xsl:attribute>
                            <xsl:apply-templates/>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="rdg" namespace="http://www.music-encoding.org/ns/mei">
                        <xsl:attribute name="source" select="1590-20"></xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="(./following-sibling::mei:verse)">
                                <xsl:element name="verse" namespace="http://www.music-encoding.org/ns/mei">
                                    <xsl:attribute name="n" select="1"></xsl:attribute>
                                    <xsl:copy-of select="./following-sibling::node()/node()"></xsl:copy-of>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="(./preceding-sibling::mei:verse)">
                                <xsl:element name="verse" namespace="http://www.music-encoding.org/ns/mei">
                                    <xsl:attribute name="n" select="1"></xsl:attribute>
                                    <xsl:copy-of select="./preceding-sibling::node()/node()"></xsl:copy-of>
                                </xsl:element>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:element>              
                </xsl:element>
            </xsl:when>
            <xsl:when test="(./@n='2') and not(./preceding-sibling::mei:verse) and not(./following-sibling::mei:verse)">
                <xsl:element name="app" namespace="http://www.music-encoding.org/ns/mei">
                    <xsl:element name="lem" namespace="http://www.music-encoding.org/ns/mei"/>
                    <xsl:element name="rdg" namespace="http://www.music-encoding.org/ns/mei">
                        <xsl:attribute name="source" select="1590-20"></xsl:attribute>
                        <xsl:element name="verse" namespace="http://www.music-encoding.org/ns/mei">
                            <xsl:attribute name="n" select="1"></xsl:attribute>
                            <xsl:apply-templates/>
                        </xsl:element>
                    </xsl:element>             
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>