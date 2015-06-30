<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

<xsl:template match="div[@type='part'][@n='1']/div[@type='canto']">
       <!-- <l n="{count(preceding::l[ancestor::div[@type='canto'] = ./ancestor::div[@type='canto']])+1}">
            <xsl:apply-templates/>
        </l>-->
        <div type="canto" n="{count(preceding::div[@type='canto'])+1}"><xsl:apply-templates/></div>
    
    </xsl:template>
    
    <xsl:template match="div[@type='part'][@n='2']/div[@type='canto']">
        
        <div type="canto" n="{count(preceding::div[@type='canto'][ancestor::div[@type='part'][@n='2']])+1}"><xsl:apply-templates/></div>
        
    </xsl:template>
    
    
  
</xsl:stylesheet>
