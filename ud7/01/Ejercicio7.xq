<books>
{for $a at $b in doc('books')/bookstore/book
return <book>{concat($b,". ",$a/data(title))}</book>}
</books>