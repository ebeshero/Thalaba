<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml"/>
    <!--2017-05-07 ebb: XSLT stylesheet designed to generate the frontmatter and table of contents for Southey's Thalaba, conceived as a collection of files. -->
    <xsl:template match="/">
        <TEI>
       <xsl:copy-of select="//teiHeader"/>
            <text>
               <front>
                   <xsl:copy-of select="//text/front/head"/>
                   <xsl:copy-of select="//text/front/epigraph"/>
               </front>
          <body>
              <div type="toc">
                  <list>
                      <xsl:apply-templates select="//body//div[@type='volume']"/>
                  </list>
              </div>
              <xsl:copy-of select="//text/front/div[@type='preface']"/>

          </body>
                    
            </text>
        </TEI>
    </xsl:template>
    <xsl:template match="div[@type='volume']">
        <item><xsl:apply-templates select="head"/>
            <list><xsl:apply-templates select="div[@type='book']"/></list>
        </item>
    </xsl:template>
    <xsl:template match="div[@type='book']">
        <item><ref target="{parent::div/@xml:id}/{@xml:id}.xml"><xsl:apply-templates select="head"/></ref></item>
    </xsl:template>
    
</xsl:stylesheet>