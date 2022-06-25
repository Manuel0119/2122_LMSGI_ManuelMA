(:Imprimir el precio máximo mínimo de los libros , mostrando el siguiente resultado:)

let $max := max(/bookstore/book/price), 
    $min := min(/bookstore/book/price)
return
<resultado>
  <max>{$max}</max>
  <min>{$min}</min>
</resultado>





