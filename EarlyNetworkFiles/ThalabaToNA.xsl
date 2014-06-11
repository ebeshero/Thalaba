<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="placeName rs"/>
    
    <xsl:template match="/">
                       
           
                 <xsl:apply-templates select="//body" mode="places"/>
                       
        <xsl:apply-templates select="//body" mode="metaplaces"/>
                       
                           
    </xsl:template>
   
  
    

    <xsl:template match="body" mode="places">
       
        <xsl:for-each select="//placeName">
          
         
            <xsl:choose>
                <xsl:when test="./@ref">
                    <xsl:apply-templates select="./@ref"/>
                    <xsl:text>&#x9;</xsl:text> <!--This should be a tab character-->
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select='.'/><xsl:text>&#x9;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            
                    <xsl:text>place</xsl:text>
            <xsl:text>               
            </xsl:text>
        </xsl:for-each>
        
        <xsl:for-each select="//rs[@type='place'][not (@subtype='language')]">
            <xsl:choose>
                <xsl:when test="./@ref">
                    <xsl:apply-templates select="./@ref"/>
                    <xsl:text>&#x9;</xsl:text> <!--This should be a tab character-->
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select='.'/><xsl:text>&#x9;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>place</xsl:text>
            <xsl:text>               
            </xsl:text>
        </xsl:for-each>
        
    </xsl:template>
    
    <xsl:template match="body" mode="metaplaces">
        
        <xsl:for-each select="//rs[@type='metaplace'][not(@subtype='simil')]">
            <xsl:choose>
            <xsl:when test="./@ref">
            <xsl:apply-templates select="./@ref"/>
                <xsl:text>&#x9;</xsl:text>
            </xsl:when>
           <xsl:otherwise>
               <xsl:apply-templates select='.'/><xsl:text>&#x9;</xsl:text>
           </xsl:otherwise>
            </xsl:choose>
             
            <xsl:text>metaplace</xsl:text>
            <xsl:text>   
            </xsl:text>
  
        </xsl:for-each>
    </xsl:template>
    

</xsl:stylesheet>
