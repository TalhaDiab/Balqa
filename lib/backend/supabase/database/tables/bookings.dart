import '../database.dart';

class BookingsTable extends SupabaseTable<BookingsRow> {
  @override
  String get tableName => 'bookings';

  @override
  BookingsRow createRow(Map<String, dynamic> data) => BookingsRow(data);
}

class BookingsRow extends SupabaseDataRow {
  BookingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get seatsNum => getField<int>('seats_num');
  set seatsNum(int? value) => setField<int>('seats_num', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get payment => getField<String>('payment');
  set payment(String? value) => setField<String>('payment', value);

  String? get discountCode => getField<String>('discount_code');
  set discountCode(String? value) => setField<String>('discount_code', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get from => getField<String>('from');
  set from(String? value) => setField<String>('from', value);

  String? get to => getField<String>('to');
  set to(String? value) => setField<String>('to', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  String? get barcode => getField<String>('barcode');
  set barcode(String? value) => setField<String>('barcode', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get fromStation => getField<String>('fromStation');
  set fromStation(String? value) => setField<String>('fromStation', value);

  String? get toStation => getField<String>('toStation');
  set toStation(String? value) => setField<String>('toStation', value);

  String? get tripId => getField<String>('trip_id');
  set tripId(String? value) => setField<String>('trip_id', value);

  int? get tripPrice => getField<int>('tripPrice');
  set tripPrice(int? value) => setField<int>('tripPrice', value);

  String? get duration => getField<String>('duration');
  set duration(String? value) => setField<String>('duration', value);

  bool? get tracking => getField<bool>('tracking');
  set tracking(bool? value) => setField<bool>('tracking', value);

  int? get discount => getField<int>('discount');
  set discount(int? value) => setField<int>('discount', value);

  DateTime? get returnDate => getField<DateTime>('returnDate');
  set returnDate(DateTime? value) => setField<DateTime>('returnDate', value);

  int? get directions => getField<int>('directions');
  set directions(int? value) => setField<int>('directions', value);

  String? get toLocation => getField<String>('toLocation');
  set toLocation(String? value) => setField<String>('toLocation', value);

  String? get fromLocation => getField<String>('fromLocation');
  set fromLocation(String? value) => setField<String>('fromLocation', value);
}
