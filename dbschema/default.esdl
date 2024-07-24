module default {

  type FieldDataShort {
    property short -> str {
      constraint max_len_value(256);
    }
  }
  type FieldDataLong {
    property long -> str {
      constraint max_len_value(512);
    }
  }
  type FieldDataInt16 {
    property int16s -> int16;
  }

  type FieldData {
    single link data -> FieldDataShort | FieldDataLong | FieldDataInt16 {
      on source delete delete target if orphan;
      on target delete allow;
    };
  }

}
