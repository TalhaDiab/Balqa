import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  bool? get now => getField<bool>('now');
  set now(bool? value) => setField<bool>('now', value);

  List<String> get notes => getListField<String>('notes');
  set notes(List<String>? value) => setListField<String>('notes', value);

  List<String> get advices => getListField<String>('advices');
  set advices(List<String>? value) => setListField<String>('advices', value);

  List<String> get gifts => getListField<String>('gifts');
  set gifts(List<String>? value) => setListField<String>('gifts', value);

  List<String> get codes => getListField<String>('codes');
  set codes(List<String>? value) => setListField<String>('codes', value);

  List<int> get shipping => getListField<int>('shipping');
  set shipping(List<int>? value) => setListField<int>('shipping', value);

  bool? get shNow => getField<bool>('sh_now');
  set shNow(bool? value) => setField<bool>('sh_now', value);

  List<PostgresTime> get sos => getListField<PostgresTime>('sos');
  set sos(List<PostgresTime>? value) =>
      setListField<PostgresTime>('sos', value);

  bool? get hasSos => getField<bool>('has_sos');
  set hasSos(bool? value) => setField<bool>('has_sos', value);

  bool? get hasShipping => getField<bool>('has_shipping');
  set hasShipping(bool? value) => setField<bool>('has_shipping', value);

  List<int> get booked => getListField<int>('booked');
  set booked(List<int>? value) => setListField<int>('booked', value);

  List<int> get history => getListField<int>('history');
  set history(List<int>? value) => setListField<int>('history', value);

  List<int> get mys => getListField<int>('mys');
  set mys(List<int>? value) => setListField<int>('mys', value);

  String? get password => getField<String>('password');
  set password(String? value) => setField<String>('password', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  int? get shipments => getField<int>('shipments');
  set shipments(int? value) => setField<int>('shipments', value);

  int? get trips => getField<int>('trips');
  set trips(int? value) => setField<int>('trips', value);
}
