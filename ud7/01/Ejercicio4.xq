<books>
    {for $a in doc("books.xml")/bookstore/book
    return if ($a/@category="children")
    then <child>{data($a/title)}</child>
    else <adult>{data($a/title)}</adult>
    }
</books>