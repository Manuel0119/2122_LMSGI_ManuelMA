(:Mostrar título, precio , precio con IVA (21%),  mostrando la siguiente salida:)

for $libro in /bookstore/book
let $precio_iva := ($libro/price * 1.21)
order by $precio_iva
return 
<libro>
  <titulo>{$libro/title/text()}</titulo>
  <precio>{$libro/price/text()} €</precio>
  <precio_iva>{$precio_iva}€</precio_iva>
</libro>