<html>
  <head>
                <title>05 XQUERY Manuel Martín Alonso</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>       
                <meta name="author" content="Manuel Martín Alonso"/>
                <meta name="application-name" content="Web de libros más vendidos"/>
                <meta name="description" content="Diferentes libros clasificados por ventas"/>
                <meta name="keywords" content="HTML, CSS"/>
                <meta name="robots" content="index, follow"/>      
                <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" type="image/png" sizes="32x32" href="../../images/favicon.ico"/>
            </head>
            <body>
               <h1>Análisis de datos</h1>
                {for $a in doc("base")//database/table_data
                return <h2>{concat("La tabla ",data($a/@name)," tiene ",count($a/row)," filas.")}</h2>
                }
            </body>
</html>