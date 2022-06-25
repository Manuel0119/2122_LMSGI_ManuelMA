for $a in doc('JoaquinSabina')//album
where contains($a/name,"Calle")
order by $a/playcount
return concat($a/name,';',$a/playcount)