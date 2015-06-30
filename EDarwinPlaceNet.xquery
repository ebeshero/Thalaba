declare default element namespace "http://www.tei-c.org/ns/1.0";
declare namespace elisa='http://elisa.org';

declare function elisa:place-string($place as element()) as xs:string {
  $place/(@ref/normalize-space(.),normalize-space(.))[1]
};

let $places := //(placeName|rs[@type=('place','metaplace') and not(@subtype='language')])

return string-join(
for $place in $places
let $kin := ($place/ancestor::lg//(placeName|rs[@type=('place','metaplace')] except $place))

return
$kin/
string-join(
  (elisa:place-string($place),
   ($place[@type='metaplace']/'metaplace','place')[1], ($place[@ana]/@ana, 'no-ana')[1],
   ($place/ancestor::div[@type='footnotes']/'note','main')[1],
   ancestor::lg/@xml:id,
   elisa:place-string(.),
   (.[@type='metaplace']/'metaplace','place')[1], (.[@ana]/@ana, 'no-ana')[1]
   ),
'&#x9;')

,'&#xA;')