<table>
<thead>
  <tr>
    <th>Titulo</th>
    <th>Autor</th>
  </tr>
</thead>
<tbody>
 {for $a in doc('books')//title
 return <tr><td>{$a/text()}</td><td>{$a/../author/text()}</td></tr>}
</tbody>
</table>