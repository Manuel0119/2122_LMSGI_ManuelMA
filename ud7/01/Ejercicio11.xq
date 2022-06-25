<libros>
{for $a in doc('books')//book
let $b := $a/author
return <libro>{$a/title}{$b}</libro>}
</libros>