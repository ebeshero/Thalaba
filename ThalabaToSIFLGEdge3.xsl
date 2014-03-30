<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="placeName rs"/>
    
    <xsl:template match="/">
                       
           
                 <xsl:apply-templates select="//body" mode="places"/>
                       
      <!--  <xsl:apply-templates select="//body" mode="metaplaces"/>-->
 
        <!--ebb: I'll rewrite the "metaplaces" portion of the XSLT when I get the "places" to work.-->
                       
                           
    </xsl:template>
   
  
    

    <xsl:template match="body" mode="places">
       <xsl:variable name="place" select="//placeName"/>
        <xsl:variable name="relPlace" select="$place/ancestor::lg//placeName"/>
        
     
         
            <xsl:for-each select="$place">
                <xsl:variable name="Node1Edge">
                <xsl:choose>
                    <xsl:when test="@ref">
                        <xsl:apply-templates select="@ref"/>
                        <xsl:text>&#x9;</xsl:text> <!--This should be a tab character-->
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select='.'/><xsl:text>&#x9;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>          
                
                <xsl:choose><xsl:when test="ancestor::note">
                    <xsl:text>note: </xsl:text>
                </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>main: </xsl:text>
                    </xsl:otherwise></xsl:choose>
                <xsl:apply-templates select="ancestor::lg/@xml:id"/>
                <xsl:text>&#x9;</xsl:text>
                </xsl:variable> 
                
                <xsl:for-each select="ancestor::lg//placeName">
                    <xsl:value-of select="$Node1Edge"/>
                    
                    <xsl:choose>
                        <xsl:when test="@ref">
                            <xsl:value-of select="@ref"/><!--ebb: here’s where I’m generating duplicates to the original node. -->
                            <xsl:text>&#x9;</xsl:text> <!--This should be a tab character-->
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select='.'/><!--ebb: And here, of course, too, I’m generating duplicates to the original node. --><xsl:text>&#x9;</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>    
                    <xsl:text>               
            </xsl:text>
                                 
                
                </xsl:for-each>
           
            <xsl:text>               
            </xsl:text>
                
            </xsl:for-each>
   
        <!--ebb: Problem with generating duplicates:  I’ve been trying to eliminate the duplicates with predicate expressions in the commented lines above, but I’m not getting results.  Here’s what I think *should* work but isn’t:

<xsl:value-of select="./@ref[not(current())]"/>
And
<xsl:value-of select='.[not(current())]'/>
But this doesn't work. I come out with a list of first nodes and edges as before, but empty second notes in the output file.
-->

<!--ebb: The rest of the stylesheet is commented out for now because it outputs info according to an earlier stage of this project. I will be revising it once I get the above to work.-->

        
      <!--  <xsl:for-each select="//rs[@type='place'][not (@subtype='language')]">
            <xsl:choose>
                <xsl:when test="./@ref">
                    <xsl:apply-templates select="./@ref"/>
                    <xsl:text>&#x9;</xsl:text> <!-\-This should be a tab character-\->
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select='.'/><xsl:text>&#x9;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="./ancestor::note">
                    <xsl:text>note: </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>main: </xsl:text>
                </xsl:otherwise></xsl:choose>
            
            <xsl:choose>
                <xsl:when test=".[ancestor::lg]">
                    
                    <xsl:apply-templates select="./ancestor::lg/@xml:id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select=".//lg/@xml:id"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x9;</xsl:text>
         
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
            
            <xsl:choose><xsl:when test="./ancestor::note">
                <xsl:text>note: </xsl:text>
            </xsl:when>
                <xsl:otherwise>
                    <xsl:text>main: </xsl:text>
                </xsl:otherwise></xsl:choose>
          
            <xsl:choose>
                <xsl:when test=".[ancestor::lg]">
                
            <xsl:apply-templates select="./ancestor::lg/@xml:id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select=".//lg/@xml:id"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#x9;</xsl:text>
            <xsl:text>               
            </xsl:text>
        </xsl:for-each>-->
    </xsl:template>
    

</xsl:stylesheet>
