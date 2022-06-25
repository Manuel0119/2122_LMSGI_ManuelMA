<html>
    <head>
        <title>Ejercicio 5 Manuel Martín Alonso</title>
        <link href="css/05.css" rel="text/css"/>
    </head>
    <body>
        <h1>Bookstore</h1>
       <table style="border: green 5px double">
          <thead>
            <tr>
              <th>Titulo</th>
              <th>Categoría</th>
            </tr>
          </thead>
          <tbody>
           {for $a in doc('books')//book
            return <tr><td>{$a/title/text()}</td><td>{$a/data(@category)}</td></tr>}
            <ul>
           {for $a in doc('books')//book
            return <li class="{data($a//@category)}">{$a/title/text()}</li>}
          </ul>
          </tbody>
      </table>
    </body>
</html>