for $a in doc('books')/bookstore/book
where $a/price>30
order by $a/title/text()
return $a/title/text()