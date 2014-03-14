<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="ptr">
       
        
        <ref target="{@target}"> 
        
        
            <xsl:apply-templates select="//div[@type='notes']/note[contains(@xml:id, current()/substring-after(@target,'#'))][starts-with(@xml:id, current()/substring-after(@target,'#'))][ends-with(@xml:id, current()/substring-after(@target,'#'))]"/>
        </ref>
            
 </xsl:template>
    
    <xsl:template match="//div[@type='notes']">
    </xsl:template>

</xsl:stylesheet>
