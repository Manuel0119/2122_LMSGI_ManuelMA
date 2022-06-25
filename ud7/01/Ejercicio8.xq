<html>
<head>
  <title>Ejercicio 8 Manuel Martín Alonso</title>
</head>
<body>
  <h1>Listado de prácticas</h1>
  {for $a in (1 to 7),$b in(1 to 3)
return 
<div>
  <a href="{concat($a,"/",$b,".html")}">{concat("Tema ",$a," Ejercicio",$b)}</a>
</div>}
</body>
</html>