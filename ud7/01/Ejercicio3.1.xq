let $a := doc('books')/bookstore/book[price>30]
return <li>{$a/title/text()}</li>
