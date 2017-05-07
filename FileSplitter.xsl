<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml"/>
    <!--2017-05-07 ebb: XSLT stylesheet designed to produce from a single (very long) TEI file, 12 separately output TEI files for each of the 12 books, divided into two volume directories, as collections of files reflecting the volume divisions of the 1801 edition.-->
    <xsl:template match="/">
       
        <xsl:for-each select="//div[@type='book']">
            <xsl:result-document method="xml" href="{parent::div/@xml:id}/{@xml:id}.xml">
            <TEI>
       <teiHeader>
         <fileDesc>
           <titleStmt>
               <xsl:apply-templates select="ancestor::TEI/teiHeader//titleStmt/title"/><xsl:text>, Volume </xsl:text><xsl:value-of select="substring-after(parent::div/@xml:id, '_')"/><xsl:text>: Book </xsl:text><xsl:value-of select="substring-after(@xml:id, '_')"/>
            
           </titleStmt>  
             
         </fileDesc>  
           
       </teiHeader>
            <text>
               <front>
                  <head><bibl>
                      <xsl:copy-of select="ancestor::TEI//text//front/head//title"/>
                      <title level="a"><xsl:text>, Volume </xsl:text><xsl:value-of select="substring-after(parent::div/@xml:id, '_')"/><xsl:text>: Book </xsl:text><xsl:value-of select="substring-after(@xml:id, '_')"/></title><xsl:text> (</xsl:text><xsl:copy-of select="date"/><xsl:text>) by </xsl:text>
                      <xsl:copy-of select="ancestor::TEI//text//front/head//author"/>  
                  </bibl></head>
               </front>
          <body>
             

          </body>
                    
            </text>
        </TEI>
            </xsl:result-document>    
        </xsl:for-each>
    </xsl:template>
  
    
</xsl:stylesheet>