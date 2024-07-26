# Reproduce

1. run `edgedb ui`
2. run sql

```
with
  obj1 := (
    select default::SortableObjectDecimal[is CommonObject]
    filter .id = <uuid>$fromID and
      .db_status = <DBStatus>"_Normal"
  ),
  obj2 := (
    select default::SortableObjectDecimal[is CommonObject]
    filter .id = <uuid>$toID and
      .db_status = <DBStatus>"_Normal"
  ),
  temp1 := obj1.sort_decimal,
  temp2 := (
    update obj1 set {
      sort_decimal := obj2.sort_decimal
    }
  ),
  temp3 := (
    update obj2 set {
      sort_decimal := temp1
    }
  )
select {
  obj1,
  obj2
}
```

4. this sql cant work as expected too

```
with
  obj1 := (
    select default::SortableObjectDecimal[is default::CommonObject]
    filter .id = <uuid>$fromID and
      .db_status = <DBStatus>"_Normal"
  ),
  obj2 := (
    select default::SortableObjectDecimal[is default::CommonObject]
    filter .id = <uuid>$toID and
      .db_status = <DBStatus>"_Normal"
  ),
  sorts := [obj2.sort_decimal, obj1.sort_decimal],
  xs := (select {obj1, obj2}),
  ids := array_agg(xs.id)
select {
  (for x in xs union (
    with
      idx := find(ids, x.id)
    update x set {
      sort_decimal := sorts[idx]
    }
  ))
}
```
