<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mei="http://www.music-encoding.org/ns/mei" exclude-result-prefixes="mei" version="2.0">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <h5 class="marenzio-modal">Music</h5>
        <table class="table">
            <thead>
                <tr>
                    <th>Sources</th>
                    <th>Comment</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="//mei:annot[@label='app']">
                    <tr>
                        <td>
                            <a>
                                <xsl:attribute name="href">javascript:loadPageWithElement('<xsl:value-of select="./@plist" />');</xsl:attribute>
                                <xsl:value-of select="./@source"/>
                            </a>
                        </td>
                        <td>
                           <xsl:value-of select="./text()"/>
                        </td> 
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
        
        <div class="app-inline">
            <xsl:for-each select="//mei:annot[@label='app']">
                <div>
                    <xsl:attribute name="class"><xsl:value-of select="./@plist"/></xsl:attribute>
                    <xsl:value-of select="./@source"/> – <xsl:value-of select="./text()"/>
                </div>
            </xsl:for-each>
        </div> 
        
        <h5 class="marenzio-modal">Text</h5>
        <table class="table">
            <thead>
                <tr>
                    <th>Lines</th>
                    <th>Sources – Voices</th>
                    <th>Variants</th>
                </tr>
            </thead>
            <tbody>         
                <xsl:for-each select="//mei:annot[@label='app-text']">
                    <xsl:for-each select="./mei:annot">
                        <xsl:variable name="label" select="./@corresp"/>
                        <tr>
                            <td style="vertical-align:middle">
                                <xsl:value-of select="./@label"/>
                            </td>
                            <td>
                                <xsl:for-each select="./mei:annot">
                                    <!--<xsl:variable name="staves" select="./@staff"/>-->
                                    <p>
                                        <a>
                                            <xsl:attribute name="href">javascript:loadPageWithElement('<xsl:value-of select="./@plist" />');</xsl:attribute>
                                            <!--<xsl:attribute name="href">javascript:loadPageWithElement('<xsl:value-of select="(//mei:staff[contains($staves, @n)]//mei:note//mei:verse[@label=$label])/@xml:id"/>');</xsl:attribute>-->
                                            <xsl:value-of select="./text()"/>
                                        </a>
                                    </p>
                                </xsl:for-each>
                            </td>
                            <td style="vertical-align:middle">
                                <xsl:value-of select="./mei:list/mei:li/text()"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
            </tbody>
        </table>
        
    </xsl:template>

    <xsl:template match="@* | node()">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>

</xsl:stylesheet>
