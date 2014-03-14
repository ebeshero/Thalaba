<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="placeName rs"/>
    
    <xsl:template match="/">
      
Names of Places and Metaplaces  Text or Note?   Line-Group Id   Place or Metaplace Indicator
               
                 
           
                 <xsl:apply-templates select="//body" mode="places"/>
                       
        <xsl:apply-templates select="//body" mode="metaplaces"/>
                       
                           
    </xsl:template>
   
  
    

    <xsl:template match="body" mode="places">
       
        <xsl:for-each select="//placeName">
          
         
          
            <xsl:apply-templates select="."/><xsl:text> </xsl:text>
            <xsl:choose><xsl:when test="./ancestor::note">
                <xsl:text>note</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>main</xsl:text>
            </xsl:otherwise></xsl:choose>
            <xsl:text>  </xsl:text>
            <xsl:apply-templates select="./ancestor::lg/@xml:id"/>
            <xsl:text>  </xsl:text>
            
                    <xsl:text>=place</xsl:text>
            <xsl:text>
                
            </xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="body" mode="metaplaces">
        
        <xsl:for-each select="//rs[@type='metaplace'][not(@subtype='simil')]">
            <xsl:choose>
            <xsl:when test="./@ref">
            <xsl:apply-templates select="./@ref"/>
                <xsl:text>  </xsl:text>
            </xsl:when>
           <xsl:otherwise>
               <xsl:apply-templates select='.'/><xsl:text>  </xsl:text>
           </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose><xsl:when test="./ancestor::note">
                <xsl:text>note</xsl:text>
            </xsl:when>
                <xsl:otherwise>
                    <xsl:text>main</xsl:text>
                </xsl:otherwise></xsl:choose>
            <xsl:text>  </xsl:text>
            <xsl:choose>
                <xsl:when test=".[ancestor::lg]">
                
            <xsl:apply-templates select="./ancestor::lg/@xml:id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select=".//lg/@xml:id"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>  </xsl:text>
            
            <xsl:text>=metaplace</xsl:text>
            <xsl:text>
                
            </xsl:text>
  
        </xsl:for-each>
    </xsl:template>
    

</xsl:stylesheet>
