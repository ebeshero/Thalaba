<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

<xsl:template match="div[@type='part'][@n='1']/div[@type='canto']/lg/l">
  

    <l n="{count(preceding::l[parent::lg[parent::div[@type='canto']]][ancestor::div[@type='part'][@n='1']][ancestor::div[@type='canto']/@n = current()/ancestor::div[@type='canto']/@n])+1}"><xsl:apply-templates/></l>
      <!--<l n="{count(preceding::l)+1}"><xsl:apply-templates/></l>-->
          

    </xsl:template>
    
    <xsl:template match="div[@type='part'][@n='2']/div[@type='canto']/lg/l">
        
        
        <l n="{count(preceding::l[parent::lg[parent::div[@type='canto']]][ancestor::div[@type='part'][@n='2']][ancestor::div[@type='canto']/@n = current()/ancestor::div[@type='canto']/@n])+1}"><xsl:apply-templates/></l>
      
    </xsl:template>
 
</xsl:stylesheet>
