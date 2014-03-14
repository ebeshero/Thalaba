<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
   <pattern>
       <rule context="//tei:name">
           <assert test="@type=('divin','elemental','myth', 'zomb')">Acceptable values of the @type attribute for name are 'divin,' 'elemental,' or 'myth'.</assert>
       </rule>
   </pattern> 
    <pattern>
        <rule context="//tei:rs">
            <assert test="@type=('art','religion','script','building', 'bibl', 'person', 'earthworks', 'miracle', 'cosmopolitan', 'wealth', 'metaplace', 'husbandry', 'hunt', 'place', 'science', 'imp', 'image', 'devastation', 'song', 'dream', 'machine', 'myth', 'liberty', 'powerspeak')">Unacceptable (or missing) @type value for element rs!</assert>
        </rule>
    </pattern> 
    <pattern>
        <rule context="//tei:rs[@type='art']">
            <assert test="@subtype=('paint','arch','sculpt', 'illus', 'gem', 'fiber')">Unacceptable @subtype value (or missing @subtype value) for rs[@type="art"]!</assert>
        </rule>
    </pattern> 
    <pattern>
        <rule context="//tei:rs[@type='powerspeak'][@subtype]">
            <assert test="@subtype=('immun','control')">Unacceptable @subtype value for rs[@type="powerspeak"]!</assert>
        </rule>
    </pattern> 
    <pattern>
        <rule context="//tei:rs[@type='religion']">
            <assert test="@subtype=('Judaism','Islam','Christian', 'Cathol','eastOrth','autocrat', 'idol', 'mixed', 'dual')">Unacceptable @subtype value (or missing @subtype value) for rs[@type="religion"]!</assert>
        </rule>
    </pattern> 
<pattern>
        <rule context="//tei:rs[@type='script']">
            <assert test="@subtype=('print','nature','eng', 'book', 'ms', 'holy')">Unacceptable @subtype value (or missing @subtype value) for rs[@type="script"]! </assert>
        </rule>
    </pattern> 
    
    <pattern>
        <rule context="//tei:rs[@type='building']">
            <assert test="@subtype=('temple','palace','monument', 'fort', 'house', 'tower', 'prison', 'wall', 'commerce', 'tent')">Unacceptable @subtype value (or missing @subtype value) for rs[@type="building"]! </assert>
        </rule>
    </pattern> 
    <pattern>
        <rule context="//tei:rs[@type='earthworks']">
            <assert test="@subtype=('garden','mine','lumber', 'well', 'irrig', 'grave', 'farm')">Unacceptable @subtype value (or missing @subtype value) for rs[@type="earthworks"]! </assert>
        </rule>
    </pattern> 
    <pattern>
        <rule context="//tei:rs[@type='metaplace']">
            <assert test="@subtype=('garden','barrier', 'simil', 'divin', 'under', 'celest', 'passage', 'remote')">Unacceptable @subtype value (or missing @subtype value) for rs[@type="metaplace"]! </assert>
        </rule>
    </pattern> 
    <pattern>
        <rule context="//tei:rs[@type='husbandry']">
            <assert test="@subtype=('worm','mammal', 'avian')">Unacceptable @subtype value (or missing @subtype value) for rs[@type="husbandry"]! </assert>
        </rule>
    </pattern> 
    <pattern>
        <rule context="//tei:rs[@type='science']">
            <assert test="@subtype=('botany','astro', 'math', 'phys', 'chem', 'electric', 'engin', 'orac', 'diag', 'shapeshift')">Unacceptable @subtype value (or missing @subtype value) for rs[@type="science"]! </assert>
        </rule>
    </pattern> 
    <pattern>
        <rule context="//tei:rs[@type='imp'][@subtype]">
            <assert test="@subtype=('botany', 'invade', 'occ', 'slave', 'sacrifice')">Unacceptable @subtype value for rs[@type="imp"]! </assert>
        </rule>
    </pattern> 
    <pattern>
        <rule context="//tei:rs[@type='image']">
            <assert test="@subtype=('human', 'god', 'nature')">Unacceptable @subtype value (or missing @subtype value) for rs[@type="image"]! </assert>
        </rule>
    </pattern>
    
</schema>