for $a in doc('books')//book
where count($a/author)>2
return $a/title/text()