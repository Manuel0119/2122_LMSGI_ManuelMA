(:Mostrar los libros escritos en años que terminan en 3:)

for $a in doc('books')/bookstore/book
where ends-with($a/year,"3")
return $a