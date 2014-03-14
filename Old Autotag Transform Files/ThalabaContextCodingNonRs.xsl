<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>
 
    <xsl:template match="/">
        <html>
            <head><title>Context Coding of Thalaba</title></head>
            <body>
                <table>
                  
                    <tr><th>Distinct Values of type attribute on the element "name"</th>
                    <th>Matching subtypes</th>
                    </tr>
                    
                        <xsl:apply-templates select="//div[@type='poem']" mode='name'/>
                    
                    
                </table>
                
                
                
                
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//div[@type='poem']" mode='name'>

        <xsl:for-each-group select="//name" group-by="distinct-values(//name/@type)">
            <tr>
    <td>
        <xsl:value-of select="current-grouping-key()"/>
    </td>
        
        
        <td>
            
          
         
                <xsl:for-each-group select="current-group()" group-by="distinct-values(@subtype)">
               
                    <xsl:value-of select="current-grouping-key()"/><xsl:text>, </xsl:text>
               
                </xsl:for-each-group>
            
            
            
        </td>

            </tr>
        </xsl:for-each-group>

            
</xsl:template>
    
 
    
</xsl:stylesheet>