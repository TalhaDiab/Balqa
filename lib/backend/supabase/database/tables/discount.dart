import '../database.dart';

class DiscountTable extends SupabaseTable<DiscountRow> {
  @override
  String get tableName => 'discount';

  @override
  DiscountRow createRow(Map<String, dynamic> data) => DiscountRow(data);
}

class DiscountRow extends SupabaseDataRow {
  DiscountRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DiscountTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  int? get value => getField<int>('value');
  set value(int? value) => setField<int>('value', value);

  int? get maxDiscount => getField<int>('max_discount');
  set maxDiscount(int? value) => setField<int>('max_discount', value);

  int? get minOrderAmount => getField<int>('min_order_amount');
  set minOrderAmount(int? value) => setField<int>('min_order_amount', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  int? get totalUsageLimit => getField<int>('total_usage_limit');
  set totalUsageLimit(int? value) => setField<int>('total_usage_limit', value);

  int? get usedCount => getField<int>('used_count');
  set usedCount(int? value) => setField<int>('used_count', value);

  int? get perUserLimit => getField<int>('per_user_limit');
  set perUserLimit(int? value) => setField<int>('per_user_limit', value);
}
