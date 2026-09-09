import '../database.dart';

class DiscountCodesTable extends SupabaseTable<DiscountCodesRow> {
  @override
  String get tableName => 'discount_codes';

  @override
  DiscountCodesRow createRow(Map<String, dynamic> data) =>
      DiscountCodesRow(data);
}

class DiscountCodesRow extends SupabaseDataRow {
  DiscountCodesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DiscountCodesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  String? get discountType => getField<String>('discount_type');
  set discountType(String? value) => setField<String>('discount_type', value);

  int? get discountValue => getField<int>('discount_value');
  set discountValue(int? value) => setField<int>('discount_value', value);

  int? get maxDiscount => getField<int>('max_discount');
  set maxDiscount(int? value) => setField<int>('max_discount', value);

  int? get usageLimit => getField<int>('usage_limit');
  set usageLimit(int? value) => setField<int>('usage_limit', value);

  int? get usedCount => getField<int>('used_count');
  set usedCount(int? value) => setField<int>('used_count', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  String? get applicableTo => getField<String>('applicable_to');
  set applicableTo(String? value) => setField<String>('applicable_to', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  String? get assignedUserId => getField<String>('assigned_user_id');
  set assignedUserId(String? value) =>
      setField<String>('assigned_user_id', value);

  String? get refCode => getField<String>('ref_code');
  set refCode(String? value) => setField<String>('ref_code', value);

  int? get limitPerUser => getField<int>('limitPerUser');
  set limitPerUser(int? value) => setField<int>('limitPerUser', value);
}
