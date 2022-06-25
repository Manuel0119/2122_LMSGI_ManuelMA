<table>
<tbody>
 {for $a in doc('books')/bookstore/book
 return <tr><th>{$a/title/text()}</th></tr>} 
</tbody>
</table>