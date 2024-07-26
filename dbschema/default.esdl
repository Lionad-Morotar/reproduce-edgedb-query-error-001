module default {

  scalar type DBStatus extending enum<_Normal, _Disabled>;

  abstract type CommonObject {
    required db_status: DBStatus {
      default:= <DBStatus>"_Normal";
    }
  }

  abstract type SortableObjectDecimal {
    property sort_decimal: decimal {
      # delegated constraint exclusive;
      default := 0;
    }
  }

  type A extending CommonObject, SortableObjectDecimal {
    property a: int16;
  }

}
