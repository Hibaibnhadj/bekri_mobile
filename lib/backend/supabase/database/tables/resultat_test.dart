import '../database.dart';

class ResultatTestTable extends SupabaseTable<ResultatTestRow> {
  @override
  String get tableName => 'resultat_test';

  @override
  ResultatTestRow createRow(Map<String, dynamic> data) => ResultatTestRow(data);
}

class ResultatTestRow extends SupabaseDataRow {
  ResultatTestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResultatTestTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get score => getField<int>('score');
  set score(int? value) => setField<int>('score', value);

  String? get interpretation => getField<String>('interpretation');
  set interpretation(String? value) =>
      setField<String>('interpretation', value);

  DateTime? get datePassage => getField<DateTime>('date_passage');
  set datePassage(DateTime? value) => setField<DateTime>('date_passage', value);

  String? get utilisateurId => getField<String>('utilisateur_id');
  set utilisateurId(String? value) => setField<String>('utilisateur_id', value);

  String? get testMentalId => getField<String>('test_mental_id');
  set testMentalId(String? value) => setField<String>('test_mental_id', value);
}
