<libros>
{for $a in doc('books')//book
return <libro autores="{count($a/author)}">{$a/title/text()}</libro>}
</libros>