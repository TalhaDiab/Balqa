import '../database.dart';

class TripsTable extends SupabaseTable<TripsRow> {
  @override
  String get tableName => 'trips';

  @override
  TripsRow createRow(Map<String, dynamic> data) => TripsRow(data);
}

class TripsRow extends SupabaseDataRow {
  TripsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TripsTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get from => getField<String>('from')!;
  set from(String value) => setField<String>('from', value);

  String get to => getField<String>('to')!;
  set to(String value) => setField<String>('to', value);

  List<String> get stations => getListField<String>('stations');
  set stations(List<String>? value) => setListField<String>('stations', value);

  String? get breakField => getField<String>('break');
  set breakField(String? value) => setField<String>('break', value);

  int? get breakTime => getField<int>('break_time');
  set breakTime(int? value) => setField<int>('break_time', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  int? get passengers => getField<int>('Passengers');
  set passengers(int? value) => setField<int>('Passengers', value);

  String? get vehicleType => getField<String>('Vehicle_type');
  set vehicleType(String? value) => setField<String>('Vehicle_type', value);

  String? get driverName => getField<String>('Driver_name');
  set driverName(String? value) => setField<String>('Driver_name', value);

  int? get driverPhone => getField<int>('Driver_phone');
  set driverPhone(int? value) => setField<int>('Driver_phone', value);

  String? get vehicleName => getField<String>('Vehicle_name');
  set vehicleName(String? value) => setField<String>('Vehicle_name', value);

  String? get vehicleModel => getField<String>('Vehicle_Model');
  set vehicleModel(String? value) => setField<String>('Vehicle_Model', value);

  int? get vehicleNum => getField<int>('Vehicle_num');
  set vehicleNum(int? value) => setField<int>('Vehicle_num', value);

  String? get vehicleColor => getField<String>('Vehicle_color');
  set vehicleColor(String? value) => setField<String>('Vehicle_color', value);

  DateTime? get vehicleCheck => getField<DateTime>('Vehicle_check');
  set vehicleCheck(DateTime? value) =>
      setField<DateTime>('Vehicle_check', value);

  String? get vehicleInTrip => getField<String>('Vehicle_inTrip');
  set vehicleInTrip(String? value) => setField<String>('Vehicle_inTrip', value);

  bool? get vehicleCheckup => getField<bool>('Vehicle_checkup');
  set vehicleCheckup(bool? value) => setField<bool>('Vehicle_checkup', value);

  String? get vehiclePhoto => getField<String>('Vehicle_photo');
  set vehiclePhoto(String? value) => setField<String>('Vehicle_photo', value);

  String? get driverPhoto => getField<String>('Driver_photo');
  set driverPhoto(String? value) => setField<String>('Driver_photo', value);

  DateTime? get time => getField<DateTime>('time');
  set time(DateTime? value) => setField<DateTime>('time', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get state => getField<String>('state');
  set state(String? value) => setField<String>('state', value);

  int? get bookedSeats => getField<int>('booked_Seats');
  set bookedSeats(int? value) => setField<int>('booked_Seats', value);

  String? get vehicleIcon => getField<String>('Vehicle_icon');
  set vehicleIcon(String? value) => setField<String>('Vehicle_icon', value);

  int get vehicleSeats => getField<int>('Vehicle_seats')!;
  set vehicleSeats(int value) => setField<int>('Vehicle_seats', value);

  String? get toImage => getField<String>('to_image');
  set toImage(String? value) => setField<String>('to_image', value);

  String? get froms => getField<String>('froms');
  set froms(String? value) => setField<String>('froms', value);

  String? get destination => getField<String>('destination');
  set destination(String? value) => setField<String>('destination', value);

  String? get up => getField<String>('up');
  set up(String? value) => setField<String>('up', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  bool get spi => getField<bool>('spi')!;
  set spi(bool value) => setField<bool>('spi', value);

  List<String> get fromStations => getListField<String>('from_stations');
  set fromStations(List<String>? value) =>
      setListField<String>('from_stations', value);

  List<String> get toStations => getListField<String>('to_stations');
  set toStations(List<String>? value) =>
      setListField<String>('to_stations', value);

  String? get toWelcome => getField<String>('toWelcome');
  set toWelcome(String? value) => setField<String>('toWelcome', value);

  int? get door => getField<int>('door');
  set door(int? value) => setField<int>('door', value);

  int? get todoor => getField<int>('todoor');
  set todoor(int? value) => setField<int>('todoor', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  double? get kmPrice => getField<double>('KmPrice');
  set kmPrice(double? value) => setField<double>('KmPrice', value);

  String? get fromLocatin => getField<String>('fromLocatin');
  set fromLocatin(String? value) => setField<String>('fromLocatin', value);

  String? get toLocation => getField<String>('toLocation');
  set toLocation(String? value) => setField<String>('toLocation', value);

  String? get welcome => getField<String>('welcome');
  set welcome(String? value) => setField<String>('welcome', value);

  int? get driverID => getField<int>('driverID');
  set driverID(int? value) => setField<int>('driverID', value);

  PostgresTime? get arrival => getField<PostgresTime>('arrival');
  set arrival(PostgresTime? value) => setField<PostgresTime>('arrival', value);

  String? get fromEn => getField<String>('fromEn');
  set fromEn(String? value) => setField<String>('fromEn', value);

  String? get toEn => getField<String>('toEn');
  set toEn(String? value) => setField<String>('toEn', value);

  List<String> get fromStationsEN => getListField<String>('fromStationsEN');
  set fromStationsEN(List<String>? value) =>
      setListField<String>('fromStationsEN', value);

  List<String> get toStationsEN => getListField<String>('toStationsEN');
  set toStationsEN(List<String>? value) =>
      setListField<String>('toStationsEN', value);

  String? get notesEn => getField<String>('notesEn');
  set notesEn(String? value) => setField<String>('notesEn', value);
}
