import '../database.dart';

class BookingsDuplicateTable extends SupabaseTable<BookingsDuplicateRow> {
  @override
  String get tableName => 'bookings_duplicate';

  @override
  BookingsDuplicateRow createRow(Map<String, dynamic> data) =>
      BookingsDuplicateRow(data);
}

class BookingsDuplicateRow extends SupabaseDataRow {
  BookingsDuplicateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingsDuplicateTable();

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

  List<String> get names => getListField<String>('names');
  set names(List<String>? value) => setListField<String>('names', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get from => getField<String>('from');
  set from(String? value) => setField<String>('from', value);

  String? get to => getField<String>('to');
  set to(String? value) => setField<String>('to', value);

  int? get balqaID => getField<int>('balqa_ID');
  set balqaID(int? value) => setField<int>('balqa_ID', value);

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

  int? get tripPrice => getField<int>('tripPrice');
  set tripPrice(int? value) => setField<int>('tripPrice', value);

  String? get fromStation => getField<String>('fromStation');
  set fromStation(String? value) => setField<String>('fromStation', value);

  String? get toStation => getField<String>('toStation');
  set toStation(String? value) => setField<String>('toStation', value);

  String? get distance => getField<String>('distance');
  set distance(String? value) => setField<String>('distance', value);

  int? get directions => getField<int>('directions');
  set directions(int? value) => setField<int>('directions', value);
}
