<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mei="http://www.music-encoding.org/ns/mei" exclude-result-prefixes="mei" version="1.0">

    <xsl:output method="html" indent="yes"/>
    <xsl:template match="mei:sourceDesc">
        <xsl:for-each select="mei:source">
            <h5 class="marenzio-modal">
                <xsl:value-of select="@label"/>
            </h5>
            <div class="marenzio-modal">
                <p>
                    <strong>
                        <xsl:value-of select="./mei:editionStmt/mei:edition/text()"/>
                    </strong>
                </p>
                <ul>
                    <xsl:for-each select="mei:itemList/mei:item">
                        <li>
                            <xsl:value-of select="./mei:physLoc/mei:identifier/text()"/>
                            <em> — <xsl:value-of select="./mei:notesStmt/mei:annot/text()"/></em>
                        </li>
                    </xsl:for-each>
                </ul>
                <p>
                    <strong>
                        <xsl:value-of select="./mei:physDesc/mei:titlePage/mei:p/text()"/>
                    </strong>
                </p>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="@* | node()">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>

</xsl:stylesheet>
