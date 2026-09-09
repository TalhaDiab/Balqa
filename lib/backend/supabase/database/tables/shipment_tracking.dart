import '../database.dart';

class ShipmentTrackingTable extends SupabaseTable<ShipmentTrackingRow> {
  @override
  String get tableName => 'shipment_tracking';

  @override
  ShipmentTrackingRow createRow(Map<String, dynamic> data) =>
      ShipmentTrackingRow(data);
}

class ShipmentTrackingRow extends SupabaseDataRow {
  ShipmentTrackingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ShipmentTrackingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get shipmentId => getField<int>('shipment_id');
  set shipmentId(int? value) => setField<int>('shipment_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get driverId => getField<int>('driver_id');
  set driverId(int? value) => setField<int>('driver_id', value);

  String? get tripId => getField<String>('trip_id');
  set tripId(String? value) => setField<String>('trip_id', value);

  String? get ltlng => getField<String>('ltlng');
  set ltlng(String? value) => setField<String>('ltlng', value);

  int? get lastMileID => getField<int>('lastMileID');
  set lastMileID(int? value) => setField<int>('lastMileID', value);

  DateTime? get assignedAt => getField<DateTime>('assigned_at');
  set assignedAt(DateTime? value) => setField<DateTime>('assigned_at', value);

  DateTime? get pickedUpAt => getField<DateTime>('picked_up_at');
  set pickedUpAt(DateTime? value) => setField<DateTime>('picked_up_at', value);

  DateTime? get deliveredAt => getField<DateTime>('delivered_at');
  set deliveredAt(DateTime? value) => setField<DateTime>('delivered_at', value);

  bool? get picked => getField<bool>('picked');
  set picked(bool? value) => setField<bool>('picked', value);

  DateTime? get fromBranchat => getField<DateTime>('fromBranchat');
  set fromBranchat(DateTime? value) =>
      setField<DateTime>('fromBranchat', value);

  bool? get fromBranch => getField<bool>('fromBranch');
  set fromBranch(bool? value) => setField<bool>('fromBranch', value);

  bool? get inTrip => getField<bool>('inTrip');
  set inTrip(bool? value) => setField<bool>('inTrip', value);

  DateTime? get inTripAt => getField<DateTime>('inTripAt');
  set inTripAt(DateTime? value) => setField<DateTime>('inTripAt', value);

  bool? get toBranch => getField<bool>('toBranch');
  set toBranch(bool? value) => setField<bool>('toBranch', value);

  bool? get delivered => getField<bool>('delivered');
  set delivered(bool? value) => setField<bool>('delivered', value);

  DateTime? get deleveredAt => getField<DateTime>('deleveredAt');
  set deleveredAt(DateTime? value) => setField<DateTime>('deleveredAt', value);

  bool? get assigned => getField<bool>('assigned');
  set assigned(bool? value) => setField<bool>('assigned', value);

  String? get lastMileName => getField<String>('lastMileName');
  set lastMileName(String? value) => setField<String>('lastMileName', value);

  String? get assignedName => getField<String>('assignedName');
  set assignedName(String? value) => setField<String>('assignedName', value);

  String? get toBranchName => getField<String>('toBranchName');
  set toBranchName(String? value) => setField<String>('toBranchName', value);

  String? get fromBranchName => getField<String>('fromBranchName');
  set fromBranchName(String? value) =>
      setField<String>('fromBranchName', value);

  DateTime? get toBranchAt => getField<DateTime>('toBranchAt');
  set toBranchAt(DateTime? value) => setField<DateTime>('toBranchAt', value);

  bool? get assigning => getField<bool>('assigning');
  set assigning(bool? value) => setField<bool>('assigning', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);
}
