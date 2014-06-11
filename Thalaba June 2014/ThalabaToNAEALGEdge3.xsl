<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="placeName rs"/>
    
    
  <!--ebb 30 March: I think I've repaired this so it's no longer generating duplicate nodes!~-->  
    <xsl:template match="/">
                       
          
                 <xsl:apply-templates select="//body" mode="places"/>
                       
             <xsl:apply-templates select="//body" mode="metaplaces"/>
 
        
                       
                           
    </xsl:template>
   
  
    
<!--Processes placeName-->
    <xsl:template match="body" mode="places">
       <xsl:variable name="place" select="//placeName"/>
            <xsl:for-each select="$place">
                <xsl:variable name="Node1Edge">
                <xsl:choose>
                    <xsl:when test="@ref">
                        <xsl:apply-templates select="@ref"/>
                        <xsl:text>&#x9;</xsl:text> <!--This should be a tab character-->
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select='normalize-space()'/><xsl:text>&#x9;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>          
                <xsl:text>place&#x9;</xsl:text>
                <xsl:choose><xsl:when test="ancestor::note">
                    <xsl:text>note</xsl:text>
                </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>main</xsl:text>
                    </xsl:otherwise></xsl:choose>
                    <xsl:text>&#x9;</xsl:text>
                <xsl:apply-templates select="ancestor::lg/@xml:id"/>
                <xsl:text>&#x9;</xsl:text>
                </xsl:variable> 
                
                <xsl:for-each select="ancestor::lg//placeName[not(. = current())] | ancestor::lg//rs[@type='place'][not (@subtype='language')][not(. = current())] | ancestor::lg//rs[@type='metaplace'][not(@subtype='simil')][not(. = current())]">
                    <xsl:value-of select="$Node1Edge"/>
                    
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
                   </xsl:choose>                                             <xsl:text>               
            </xsl:text>
                </xsl:for-each>
           
            <xsl:text>               
            </xsl:text>
                
            </xsl:for-each>
   <!--ebb: What follows is for other kinds of places and metaplaces.-->
        <!--Processes rs @ type="place"-->              
 <xsl:for-each select="//rs[@type='place'][not (@subtype='language')]">
     <xsl:variable name="NodeRSEdge">
            <xsl:choose>
                <xsl:when test="@ref">
                    <xsl:value-of select="normalize-space(@ref)"/>
                    <xsl:text>&#x9;</xsl:text> <!--This should be a tab character-->
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select='normalize-space()'/><xsl:text>&#x9;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
         <xsl:text>place&#x9;</xsl:text>
            <xsl:choose>
                <xsl:when test="ancestor::note">
                    <xsl:text>note</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>main</xsl:text>
                </xsl:otherwise></xsl:choose>
         <xsl:text>&#x9;</xsl:text>
            <xsl:choose>
                <xsl:when test=".[ancestor::lg]">
                    
                    <xsl:apply-templates select="./ancestor::lg/@xml:id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select=".//lg/@xml:id"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x9;</xsl:text>
     </xsl:variable>
     
     <xsl:for-each select="ancestor::lg//placeName[not(. = current())] | ancestor::lg//rs[@type='place'][not (@subtype='language')][not(. = current())] | ancestor::lg//rs[@type='metaplace'][not(@subtype='simil')][not(. = current())]">
         <xsl:value-of select="$NodeRSEdge"/>
         
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
       
        
    </xsl:template>

    <!--Processes rs @ type="metaplace"-->
<xsl:template match="body" mode="metaplaces">
        
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
    </xsl:template>
    

</xsl:stylesheet>
