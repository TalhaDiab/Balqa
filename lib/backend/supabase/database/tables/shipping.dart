import '../database.dart';

class ShippingTable extends SupabaseTable<ShippingRow> {
  @override
  String get tableName => 'shipping';

  @override
  ShippingRow createRow(Map<String, dynamic> data) => ShippingRow(data);
}

class ShippingRow extends SupabaseDataRow {
  ShippingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ShippingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get from => getField<String>('from');
  set from(String? value) => setField<String>('from', value);

  String? get to => getField<String>('to');
  set to(String? value) => setField<String>('to', value);

  int? get withField => getField<int>('with');
  set withField(int? value) => setField<int>('with', value);

  int? get employee => getField<int>('employee');
  set employee(int? value) => setField<int>('employee', value);

  String get contains => getField<String>('contains')!;
  set contains(String value) => setField<String>('contains', value);

  String? get weight => getField<String>('Weight');
  set weight(String? value) => setField<String>('Weight', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  bool? get payment => getField<bool>('payment');
  set payment(bool? value) => setField<bool>('payment', value);

  int? get payAmount => getField<int>('payAmount');
  set payAmount(int? value) => setField<int>('payAmount', value);

  String? get station => getField<String>('station');
  set station(String? value) => setField<String>('station', value);

  bool? get immediate => getField<bool>('Immediate');
  set immediate(bool? value) => setField<bool>('Immediate', value);

  int? get trackingNumber => getField<int>('tracking_number');
  set trackingNumber(int? value) => setField<int>('tracking_number', value);

  PostgresTime? get deliveredAt => getField<PostgresTime>('deliveredAt');
  set deliveredAt(PostgresTime? value) =>
      setField<PostgresTime>('deliveredAt', value);

  String? get senderNotes => getField<String>('senderNotes');
  set senderNotes(String? value) => setField<String>('senderNotes', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get recipientNotes => getField<String>('recipientNotes');
  set recipientNotes(String? value) =>
      setField<String>('recipientNotes', value);

  String? get size => getField<String>('size');
  set size(String? value) => setField<String>('size', value);

  bool? get fragile => getField<bool>('fragile');
  set fragile(bool? value) => setField<bool>('fragile', value);

  bool? get paymentStatus => getField<bool>('paymentStatus');
  set paymentStatus(bool? value) => setField<bool>('paymentStatus', value);

  bool? get isReturned => getField<bool>('isReturned');
  set isReturned(bool? value) => setField<bool>('isReturned', value);

  String? get payBy => getField<String>('payBy');
  set payBy(String? value) => setField<String>('payBy', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  String? get senderPhone => getField<String>('senderPhone');
  set senderPhone(String? value) => setField<String>('senderPhone', value);

  String? get recipientPhone => getField<String>('recipientPhone');
  set recipientPhone(String? value) =>
      setField<String>('recipientPhone', value);

  List<String> get sizes => getListField<String>('sizes');
  set sizes(List<String>? value) => setListField<String>('sizes', value);

  List<int> get prices => getListField<int>('prices');
  set prices(List<int>? value) => setListField<int>('prices', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  String? get payCode => getField<String>('payCode');
  set payCode(String? value) => setField<String>('payCode', value);

  String? get fromLocation => getField<String>('fromLocation');
  set fromLocation(String? value) => setField<String>('fromLocation', value);

  String? get toLocation => getField<String>('toLocation');
  set toLocation(String? value) => setField<String>('toLocation', value);

  String? get barcode => getField<String>('barcode');
  set barcode(String? value) => setField<String>('barcode', value);

  double? get commision => getField<double>('commision');
  set commision(double? value) => setField<double>('commision', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  String? get latlng => getField<String>('latlng');
  set latlng(String? value) => setField<String>('latlng', value);

  String? get recipientName => getField<String>('recipient_name');
  set recipientName(String? value) => setField<String>('recipient_name', value);

  String get sender => getField<String>('sender')!;
  set sender(String value) => setField<String>('sender', value);

  int? get qty => getField<int>('qty');
  set qty(int? value) => setField<int>('qty', value);

  bool get otlob => getField<bool>('otlob')!;
  set otlob(bool value) => setField<bool>('otlob', value);

  String? get otlobLink => getField<String>('otlob_link');
  set otlobLink(String? value) => setField<String>('otlob_link', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  DateTime? get deliveryDate => getField<DateTime>('deliveryDate');
  set deliveryDate(DateTime? value) =>
      setField<DateTime>('deliveryDate', value);

  bool? get tracking => getField<bool>('tracking');
  set tracking(bool? value) => setField<bool>('tracking', value);

  String? get recipientID => getField<String>('recipientID');
  set recipientID(String? value) => setField<String>('recipientID', value);

  String? get discountCode => getField<String>('discount_code');
  set discountCode(String? value) => setField<String>('discount_code', value);
}
