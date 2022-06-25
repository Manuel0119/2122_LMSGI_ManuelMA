(:Numero de libros y el titulo:)
let $num_libros := count(//book),
 $titulo := (for $libro in doc('books')/bookstore/book
return <titulo>{$libro/title}</titulo>)
return <resultados>
{$titulo}
<total_libros>{$num_libros}</total_libros>
</resultados>