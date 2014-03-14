<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xhtml" indent="yes"/>
    
    <xsl:template match="/">
       <html>
           <head><title>Output File for Network Analysis</title></head>
           <body>
               <table>
                   <tr>
                       <th>Names of Places and Metaplaces</th>
                       <th>Text or Note?</th>
                       <th>Line-Group Id</th>
                       <th>Place or Metaplace Indicator</th>
                   </tr>
                 
           
                 <xsl:apply-templates select="//body"/>
                       
                   
                       
                       
               </table>
           </body>
       </html>           
    </xsl:template>
   
  
    

    <xsl:template match="body">
       
        <xsl:for-each select="//placeName">
        <tr>
            
        <td>
            <xsl:apply-templates select="."/>
        </td>
        </tr>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
