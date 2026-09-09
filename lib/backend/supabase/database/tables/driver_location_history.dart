import '../database.dart';

class DriverLocationHistoryTable
    extends SupabaseTable<DriverLocationHistoryRow> {
  @override
  String get tableName => 'driver_location_history';

  @override
  DriverLocationHistoryRow createRow(Map<String, dynamic> data) =>
      DriverLocationHistoryRow(data);
}

class DriverLocationHistoryRow extends SupabaseDataRow {
  DriverLocationHistoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DriverLocationHistoryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get tripid => getField<String>('tripid');
  set tripid(String? value) => setField<String>('tripid', value);

  int? get driverid => getField<int>('driverid');
  set driverid(int? value) => setField<int>('driverid', value);

  String? get ltlng => getField<String>('ltlng');
  set ltlng(String? value) => setField<String>('ltlng', value);

  double? get heading => getField<double>('heading');
  set heading(double? value) => setField<double>('heading', value);

  double? get speed => getField<double>('speed');
  set speed(double? value) => setField<double>('speed', value);

  double? get accuracy => getField<double>('accuracy');
  set accuracy(double? value) => setField<double>('accuracy', value);

  bool? get ismoc => getField<bool>('ismoc');
  set ismoc(bool? value) => setField<bool>('ismoc', value);

  int? get battery => getField<int>('battery');
  set battery(int? value) => setField<int>('battery', value);
}
