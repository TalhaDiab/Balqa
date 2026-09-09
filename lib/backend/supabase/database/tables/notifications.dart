import '../database.dart';

class NotificationsTable extends SupabaseTable<NotificationsRow> {
  @override
  String get tableName => 'notifications';

  @override
  NotificationsRow createRow(Map<String, dynamic> data) =>
      NotificationsRow(data);
}

class NotificationsRow extends SupabaseDataRow {
  NotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get body => getField<String>('body');
  set body(String? value) => setField<String>('body', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get screen => getField<String>('screen');
  set screen(String? value) => setField<String>('screen', value);

  int? get bookingId => getField<int>('booking_id');
  set bookingId(int? value) => setField<int>('booking_id', value);

  String? get service => getField<String>('service');
  set service(String? value) => setField<String>('service', value);
}
