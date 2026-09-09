import '../database.dart';

class DiscountUsageTable extends SupabaseTable<DiscountUsageRow> {
  @override
  String get tableName => 'discount_usage';

  @override
  DiscountUsageRow createRow(Map<String, dynamic> data) =>
      DiscountUsageRow(data);
}

class DiscountUsageRow extends SupabaseDataRow {
  DiscountUsageRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DiscountUsageTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get discountCodeId => getField<int>('discount_code_id');
  set discountCodeId(int? value) => setField<int>('discount_code_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get bookingId => getField<int>('booking_id');
  set bookingId(int? value) => setField<int>('booking_id', value);

  DateTime? get usedAt => getField<DateTime>('used_at');
  set usedAt(DateTime? value) => setField<DateTime>('used_at', value);

  int? get usingCount => getField<int>('usingCount');
  set usingCount(int? value) => setField<int>('usingCount', value);
}
