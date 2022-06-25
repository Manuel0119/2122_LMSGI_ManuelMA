(:Mostrar cuantos libros hay:)
for $a in doc('books')/bookstore
return count($a/book)
