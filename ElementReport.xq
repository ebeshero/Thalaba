for $elementSet in //*
let $name := $elementSet/name()
group by $name
return ($name || ' (' || count($elementSet) || ')')