<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml"/>
    <!--2017-05-07 ebb: XSLT stylesheet designed to produce from a single (very long) TEI file, 12 separately output TEI files for each of the 12 books, divided into two volume directories, as collections of files reflecting the volume divisions of the 1801 edition.-->
    <xsl:template match="/">
       
        <xsl:for-each select="//div[@type='book']">
            <xsl:result-document method="xml" href="Thalaba_Collection/{parent::div/@xml:id}/{@xml:id}.xml" indent="yes">
                <xsl:processing-instruction name="xml-model">href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:processing-instruction>
                <xsl:processing-instruction name="xml-model">href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
                <xsl:processing-instruction name="xml-model">href="../../SchematronThalaba.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
            <TEI>
       <teiHeader>
         <fileDesc>
           <titleStmt>
               <title><xsl:apply-templates select="ancestor::TEI/teiHeader//titleStmt/title"/><xsl:text>, Volume </xsl:text><xsl:value-of select="substring-after(parent::div/@xml:id, '_')"/><xsl:text>: Book </xsl:text><xsl:value-of select="substring-after(@xml:id, '_')"/></title>
               <xsl:copy-of select="ancestor::TEI/teiHeader//titleStmt/author"/>
               <xsl:copy-of select="ancestor::TEI/teiHeader//titleStmt/editor"/>
               <xsl:copy-of select="ancestor::TEI/teiHeader//titleStmt/sponsor"/>
               <xsl:copy-of select="ancestor::TEI/teiHeader//titleStmt/principal"/>
               <xsl:copy-of select="ancestor::TEI/teiHeader//titleStmt/respStmt"/>
           </titleStmt>  
             <xsl:copy-of select="ancestor::TEI/teiHeader//editionStmt"/>
             <xsl:copy-of select="ancestor::TEI/teiHeader//publicationStmt"/>
             <xsl:copy-of select="ancestor::TEI/teiHeader//sourceDesc"/>
         </fileDesc>  
           <xsl:copy-of select="ancestor::TEI/teiHeader//encodingDesc"/>
           <xsl:copy-of select="ancestor::TEI/teiHeader//revisionDesc"/>
       </teiHeader>
            <text>
               <front>
                  <head><bibl>
                      <xsl:copy-of select="ancestor::TEI//text//front/head//title"/>
                      <title level="a"><xsl:text>, Volume </xsl:text><xsl:value-of select="substring-after(parent::div/@xml:id, '_')"/><xsl:text>: Book </xsl:text><xsl:value-of select="substring-after(@xml:id, '_')"/></title><xsl:text> (</xsl:text><xsl:copy-of select="ancestor::TEI//text//front/head//date"/><xsl:text>) by </xsl:text>
                      <xsl:copy-of select="ancestor::TEI//text//front/head//author"/>  
                  </bibl></head>
               </front>
          <body>
             <xsl:copy-of select="current()"/>

          </body>
                    
            </text>
        </TEI>
            </xsl:result-document>    
        </xsl:for-each>
    </xsl:template>
  
    
</xsl:stylesheet>