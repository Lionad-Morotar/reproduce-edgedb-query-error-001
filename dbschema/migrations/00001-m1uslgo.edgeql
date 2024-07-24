CREATE MIGRATION m1uslgohphwx6qyftda44daaevcjbsbijgv5ha3or5ijwwfvlfypva
    ONTO initial
{
  CREATE TYPE default::FieldDataLong {
      CREATE PROPERTY long: std::str {
          CREATE CONSTRAINT std::max_len_value(512);
      };
  };
  CREATE TYPE default::FieldDataShort {
      CREATE PROPERTY short: std::str {
          CREATE CONSTRAINT std::max_len_value(256);
      };
  };
  CREATE TYPE default::FieldData {
      CREATE SINGLE LINK data: (default::FieldDataLong | default::FieldDataShort) {
          ON SOURCE DELETE DELETE TARGET IF ORPHAN;
          ON TARGET DELETE ALLOW;
      };
  };
};
