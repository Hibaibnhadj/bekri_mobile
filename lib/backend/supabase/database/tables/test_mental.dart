import '../database.dart';

class TestMentalTable extends SupabaseTable<TestMentalRow> {
  @override
  String get tableName => 'test_mental';

  @override
  TestMentalRow createRow(Map<String, dynamic> data) => TestMentalRow(data);
}

class TestMentalRow extends SupabaseDataRow {
  TestMentalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TestMentalTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get titre => getField<String>('titre');
  set titre(String? value) => setField<String>('titre', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get typeTest => getField<String>('type_test');
  set typeTest(String? value) => setField<String>('type_test', value);

  String? get niveau => getField<String>('niveau');
  set niveau(String? value) => setField<String>('niveau', value);

  int? get duree => getField<int>('duree');
  set duree(int? value) => setField<int>('duree', value);
}
