<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mei="http://www.music-encoding.org/ns/mei" exclude-result-prefixes="mei" version="2.0">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <h5 class="marenzio-modal">Music</h5>
        <xsl:for-each select="//mei:annot[@type='app-sources-used']">
            <xsl:apply-templates/>
        </xsl:for-each>
        <xsl:if test="count(//mei:annot[@type='app']) > 0">
        <table class="table app-table">
            <thead>
                <tr>
                    <th>Measures</th>
                    <th>Sources – Voices</th>
                    <th>Variants</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="//mei:annot[@type='app']">
                    <tr>
                        <xsl:variable name="part" select="ancestor::mei:mdiv[exists(@label)][1]/@label"></xsl:variable>
                        <xsl:if test="$part">
                            <xsl:attribute name="class"><xsl:value-of select="$part"/></xsl:attribute>
                        </xsl:if>
                        <td style="vertical-align:middle" class="measures">
                            <xsl:value-of select="substring-after(./@label,';')"/>
                        </td>
                        <td class="sources">
                            <a>
                                <xsl:attribute name="href">javascript:loadPageWithElement('<xsl:value-of select="./mei:list/@corresp" />' <xsl:if test="./mei:list/@type">, '<xsl:value-of select="./mei:list/@type" />'</xsl:if>);</xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="count(./mei:list/mei:li) > 1">
                                    <table class="app-table-table">
                                        <tr>
                                            <td>
                                                <div class="app-brace">
                                                    <xsl:for-each select="./mei:list/mei:li">
                                                    <!--<xsl:variable name="staves" select="./@staff"/>-->
                                                        <p>
                                                            <xsl:apply-templates select="text()|mei:rend"/>
                                                        </p>
                                                    </xsl:for-each>
                                                </div>
                                            </td>
                                            <td>
                                                <xsl:value-of select="substring-before(./@label,';')"/>
                                            </td>
                                        </tr>
                                    </table>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:for-each select="./mei:list/mei:li">
                                            <xsl:apply-templates select="text()|mei:rend"/>
                                        </xsl:for-each>
                                        <xsl:text> – </xsl:text>
                                        <xsl:value-of select="substring-before(./@label,';')"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </a>
                        </td>
                        <td style="vertical-align:middle">
                            <p>
                                <xsl:apply-templates select="./mei:p/text()|./mei:p/mei:rend"/>
                            </p>
                        </td> 
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
        </xsl:if>
        
        <div class="app-inline">
            <xsl:for-each select="//mei:annot[@type='app']">
                <div>
                    <xsl:attribute name="data-corresp"><xsl:value-of select="./mei:list/@corresp"/></xsl:attribute>
                    <xsl:if test="./mei:list/@type">
                        <xsl:attribute name="data-type"><xsl:value-of select="./mei:list/@type"/></xsl:attribute>    
                    </xsl:if>
                    <xsl:for-each select="./mei:list/mei:li">
                        <xsl:apply-templates select="text()|mei:rend"/> – 
                    </xsl:for-each>
                    <xsl:apply-templates select="./mei:p/text()|./mei:p/mei:rend"/>
                </div>
            </xsl:for-each>
        </div> 
        
        <h5 class="marenzio-modal">Text</h5>
        <table class="table app-table">
            <thead>
                <tr>
                    <th>Lines</th>
                    <th>Sources – Voices</th>
                    <th>Variants</th>
                </tr>
            </thead>
            <tbody>         
                <xsl:for-each select="//mei:annot[@type='app-text']">
                    <xsl:for-each select="./mei:annot">
                        <xsl:variable name="label" select="./@corresp"/>
                        <tr>
                            <xsl:variable name="part" select="ancestor::mei:mdiv[exists(@label)][1]/@label"></xsl:variable>
                            <xsl:if test="$part">
                                <xsl:attribute name="class"><xsl:value-of select="$part"/></xsl:attribute>
                            </xsl:if>
                            
                            <td style="vertical-align:middle" class="lines">
                                <xsl:value-of select="./@label"/>
                            </td>
                            <td class="sources">
                                <xsl:for-each select="./mei:list/mei:li">
                                    <!--<xsl:variable name="staves" select="./@staff"/>-->
                                    <p>
                                        <a>
                                            <xsl:attribute name="href">javascript:loadPageWithElement('<xsl:value-of select="./@corresp" />');</xsl:attribute>
                                            <!--<xsl:attribute name="href">javascript:loadPageWithElement('<xsl:value-of select="(//mei:staff[contains($staves, @n)]//mei:note//mei:verse[@label=$label])/@xml:id"/>');</xsl:attribute>-->
                                            <xsl:apply-templates select="text()|mei:rend"/>
                                        </a>
                                    </p>
                                </xsl:for-each>
                            </td>
                            <td style="vertical-align:middle">
                                <xsl:apply-templates select="./mei:p/text()|./mei:p/mei:rend"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
            </tbody>
        </table>
        
        <div class="app-inline-text">
            <xsl:for-each select="//mei:annot[@type='app-text']/mei:annot">
                <xsl:variable name="text" select="./mei:p/text()|./mei:p/mei:rend"/>
                <xsl:for-each select="./mei:list/mei:li">
                <div>
                    <xsl:attribute name="data-corresp"><xsl:value-of select="./@corresp"/></xsl:attribute>
                    <xsl:value-of select="$text"/> (<xsl:apply-templates select="text()|mei:rend"/>)
                </div>
                </xsl:for-each>
            </xsl:for-each>
        </div> 
        
    </xsl:template>

    <xsl:template match="@* | node()">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>
    
    <xsl:template match="mei:rend[@rend='sub']">
        <sub><xsl:value-of select="."/></sub>
    </xsl:template>
    
    <xsl:template match="mei:rend[@fontstyle='normal']">
        <span style="font-style:normal"><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="mei:rend[@fontstyle='italic']">
        <i><xsl:apply-templates select="@* | node()"/></i>
    </xsl:template>
    
    <xsl:template match="*/text()">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="mei:p">
        <p><xsl:value-of select="."/></p>
    </xsl:template>

</xsl:stylesheet>
