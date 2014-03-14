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
       
        
        <ref style="inner" target="{@target}">
        
            <xsl:apply-templates select="//note//note[contains(@xml:id, current()/substring-after(@target,'#'))][starts-with(@xml:id, current()/substring-after(@target,'#'))][ends-with(@xml:id, current()/substring-after(@target,'#'))]"/>
       
        </ref>
 </xsl:template>
    
<!--<xsl:template match="note[@style]">
    </xsl:template>-->
    
    <!--EBB:I tried this stylesheet on a file of Southey's notes to his notes on Thalaba the Destroyer. The second layer of notes was embedded already inside the main notes, and not in a separate div. I had trouble moving the notes to their proper location without ALSO leaving them in place. If tried to snuff out the notes with the style attribute (which marked the embedded inner notes), I'd also prevent the notes from moving. I gave up and opted for overkill, and to delete the thirteen duplicates manually. *sigh* -->

</xsl:stylesheet>
