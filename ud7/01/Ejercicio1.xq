for $a in doc('books')/bookstore/book
order by $a/title/text()
return $a/title/text()