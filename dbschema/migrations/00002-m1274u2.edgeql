CREATE MIGRATION m1274u2ctpa6ncrebwd3cm5oidbzypalufg7ll7lsml322bvmzojwa
    ONTO m1uslgohphwx6qyftda44daaevcjbsbijgv5ha3or5ijwwfvlfypva
{
  CREATE TYPE default::FieldDataInt16 {
      CREATE PROPERTY int16s: std::int16;
  };
  ALTER TYPE default::FieldData {
      ALTER LINK data {
          SET TYPE ((default::FieldDataShort | default::FieldDataLong) | default::FieldDataInt16) USING (.data);
      };
  };
};
