<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml"/>
   <!-- <xsl:strip-space elements="*"/>-->
    
    
  <!--ebb: 10 Aug 2014: Rewriting this stylesheet, which used to output node-edge-node text for Cytoscape. Now rewriting to collect distinct place and metaplace names in an xml placeography.-->
    <xsl:template match="/">
        
      
            <TEI xmlns="http://www.tei-c.org/ns/1.0">
                
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title>Report of Elements, Attributes, and Context Code</title>
                            <sponsor>
                                <orgName>Mary Russell Mitford Society: Digital Mitford Project</orgName>
                            </sponsor>
                            <sponsor>University of Pittsburgh at Greensburg</sponsor>
                            <principal>Elisa Beshero-Bondar</principal>
                            <respStmt>
                                <resp>XSLT to prepare this report written by</resp>
                                <persName ref="#ebb">Elisa Beshero-Bondar</persName>
                            </respStmt>
                        </titleStmt>
                        
                        <publicationStmt>
                            <authority>Digital Mitford: The Mary Russell Mitford Archive</authority>
                            <pubPlace>Greensburg, PA, USA</pubPlace>
                            <date>2014</date>
                            <availability>
                                <licence>Distributed under a Creative Commons Attribution-ShareAlike 3.0
                                    Unported License</licence>
                            </availability>
                            
                        </publicationStmt>
                        
                        <sourceDesc>
                            <p>TEI XML files coded in the Digital Mitford Archive.</p>
                        </sourceDesc>
                    </fileDesc>
                </teiHeader>
                <text>
                    <body>           
          <listPlace type="geog">
                 <xsl:apply-templates select="//body" mode="places"/>
          </listPlace>
                        
                        <!--<listPlace type="meta">
             <xsl:apply-templates select="//body" mode="metaplaces"/>
                        </listPlace>-->
                    </body>
                </text>
            </TEI>
        </xsl:template>        
    
   
        <xsl:template match="body" mode="places">  
<!--Collects placeName and rs[@type='place'] -->
    
            <xsl:variable name="place" select="distinct-values(.//placeName[not(@ref)] | .//placeName[@ref]/@ref | .//rs[@type='place']/@ref)"/>
            <xsl:for-each select="$place">
                
                <place>
                    <placeName><xsl:value-of select="."/></placeName>
                    
                </place>
            </xsl:for-each>
        </xsl:template>
    
                
                
                
      <!--ebb: 10 Aug 2014: Rewritten old stylesheet to here-->          
                
                
    <!--Processes rs @ type="metaplace"-->
<!--<xsl:template match="body" mode="metaplaces">
        
        <xsl:for-each select="//rs[@type='metaplace'][not(@subtype='simil')]">
            <xsl:variable name="MetaNodeEdge">
            <xsl:choose>
            <xsl:when test="@ref">
            <xsl:value-of select="normalize-space(@ref)"/>
                <xsl:text>&#x9;</xsl:text>
            </xsl:when>
           <xsl:otherwise>
               <xsl:value-of select='normalize-space()'/><xsl:text>&#x9;</xsl:text>
           </xsl:otherwise>
            </xsl:choose>
                <xsl:text>metaplace&#x9;</xsl:text>
            <xsl:choose><xsl:when test="ancestor::note">
                <xsl:text>note</xsl:text>
            </xsl:when>
                <xsl:otherwise>
                    <xsl:text>main</xsl:text>
                </xsl:otherwise></xsl:choose>
                <xsl:text>&#x9;</xsl:text>
            <xsl:choose>
                <xsl:when test=".[ancestor::lg]">
                
            <xsl:apply-templates select="ancestor::lg/@xml:id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select=".//lg/@xml:id"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x9;</xsl:text>
            </xsl:variable>
            
            <xsl:for-each select="ancestor::lg//placeName[not(. = current())] | ancestor::lg//rs[@type='place'][not (@subtype='language')][not(. = current())] | ancestor::lg//rs[@type='metaplace'][not(@subtype='simil')][not(. = current())]">
                <xsl:value-of select="$MetaNodeEdge"/>
                
                <xsl:choose>
                    <xsl:when test="@ref">
                        <xsl:value-of select="normalize-space(@ref)"/>
                        <xsl:text>&#x9;</xsl:text> 
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select='normalize-space()'/><xsl:text>&#x9;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose> 
                    <xsl:when test="@type='place'">
                        <xsl:text>place&#x9;</xsl:text>
                    </xsl:when>
                    <xsl:when test="@type='metaplace'"><xsl:text>metaplace&#x9;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise><xsl:text>place&#x9;</xsl:text></xsl:otherwise>
                </xsl:choose>
                <xsl:text>               
            </xsl:text>
            </xsl:for-each>
            <xsl:text>               
            </xsl:text>
           
        </xsl:for-each>
    </xsl:template>-->
    
  
</xsl:stylesheet>
