import '../database.dart';

class GovernoratesTable extends SupabaseTable<GovernoratesRow> {
  @override
  String get tableName => 'governorates';

  @override
  GovernoratesRow createRow(Map<String, dynamic> data) => GovernoratesRow(data);
}

class GovernoratesRow extends SupabaseDataRow {
  GovernoratesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GovernoratesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get nameEn => getField<String>('nameEn');
  set nameEn(String? value) => setField<String>('nameEn', value);
}
