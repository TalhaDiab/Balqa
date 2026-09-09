import '../database.dart';

class NotesTable extends SupabaseTable<NotesRow> {
  @override
  String get tableName => 'notes';

  @override
  NotesRow createRow(Map<String, dynamic> data) => NotesRow(data);
}

class NotesRow extends SupabaseDataRow {
  NotesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotesTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get userID => getField<String>('userID');
  set userID(String? value) => setField<String>('userID', value);
}
