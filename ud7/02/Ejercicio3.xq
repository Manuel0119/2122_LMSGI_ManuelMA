(:Mostrar el título y el número de autores por libro:)

for $a in doc('books')/bookstore/book
return
<libros>
  <libro>
    <titulo>{$a/title/text()}</titulo>
    <numautores>{count($a/author)}</numautores>
  </libro>
</libros>