import '../database.dart';

class DriversTable extends SupabaseTable<DriversRow> {
  @override
  String get tableName => 'drivers';

  @override
  DriversRow createRow(Map<String, dynamic> data) => DriversRow(data);
}

class DriversRow extends SupabaseDataRow {
  DriversRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DriversTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get vehicle => getField<String>('vehicle');
  set vehicle(String? value) => setField<String>('vehicle', value);

  int? get vehicleSeats => getField<int>('vehicleSeats');
  set vehicleSeats(int? value) => setField<int>('vehicleSeats', value);

  String? get vehicleColor => getField<String>('vehicleColor');
  set vehicleColor(String? value) => setField<String>('vehicleColor', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get carImg => getField<String>('carImg');
  set carImg(String? value) => setField<String>('carImg', value);
}
