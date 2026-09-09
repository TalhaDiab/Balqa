import '../database.dart';

class BranchesTable extends SupabaseTable<BranchesRow> {
  @override
  String get tableName => 'branches';

  @override
  BranchesRow createRow(Map<String, dynamic> data) => BranchesRow(data);
}

class BranchesRow extends SupabaseDataRow {
  BranchesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BranchesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  List<String> get name => getListField<String>('name');
  set name(List<String>? value) => setListField<String>('name', value);

  int? get governorate => getField<int>('governorate');
  set governorate(int? value) => setField<int>('governorate', value);

  String? get governorateAr => getField<String>('governorateAr');
  set governorateAr(String? value) => setField<String>('governorateAr', value);

  String? get governorateEn => getField<String>('governorateEn');
  set governorateEn(String? value) => setField<String>('governorateEn', value);

  List<String> get nameEn => getListField<String>('nameEn');
  set nameEn(List<String>? value) => setListField<String>('nameEn', value);
}
