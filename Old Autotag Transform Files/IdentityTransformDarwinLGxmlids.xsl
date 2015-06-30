<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

<xsl:template match="div[@type='canto']/lg">
  
        <lg xml:id="P{ancestor::div[@type='part']/@n}_C{ancestor::div[@type='canto']/@n}_lg{@n}"><xsl:apply-templates/></lg>
    
    </xsl:template>
    
   <!-- <xsl:template match="div[@type='part'][@n='2']/div[@type='canto']/lg">
        
        <lg n="{count(preceding-sibling::lg[ancestor::div[@type='part'][@n='2']][ancestor::div[@type='canto']/@n = ./ancestor::div[@type='canto']/@n])+1}"><xsl:apply-templates/></lg>
        
    </xsl:template>
    -->
    
  
</xsl:stylesheet>
