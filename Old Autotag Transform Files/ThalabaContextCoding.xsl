<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>
 
    <xsl:template match="/">
        <html>
            <head><title>Context Coding of Thalaba</title></head>
            <body>
                <table>
                  
                    <tr><th>Distinct Values of type attribute on rs</th>
                    <th>Matching subtypes</th>
                    </tr>
                    
                        <xsl:apply-templates select="/"/>
            <!--Yay! This stylesheet works. Use as a model for double for-each looping and note the use of variables. -->        
                    
                </table>
                
                
            </body>
        </html>
    </xsl:template>
 
           
                <xsl:template match="/">
                    <xsl:variable name="root" select="/"/>
          
                    <xsl:for-each select="distinct-values(//rs[@subtype]/@type)">
                        <xsl:variable name="current_t" select="."/>
                        <tr>
                            <td><b><xsl:value-of select="$current_t"/></b></td>
                        <xsl:for-each select="distinct-values($root//rs[@type=$current_t]/@subtype)">
                            <td>    <xsl:value-of select="."/> </td>
                        </xsl:for-each> 
                  
                        </tr>

                    </xsl:for-each>
              
            
</xsl:template>
    
 
    
</xsl:stylesheet>