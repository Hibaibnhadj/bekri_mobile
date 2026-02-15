import '../database.dart';

class QuestionTable extends SupabaseTable<QuestionRow> {
  @override
  String get tableName => 'question';

  @override
  QuestionRow createRow(Map<String, dynamic> data) => QuestionRow(data);
}

class QuestionRow extends SupabaseDataRow {
  QuestionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuestionTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get contenu => getField<String>('contenu');
  set contenu(String? value) => setField<String>('contenu', value);

  String? get choixA => getField<String>('choix_a');
  set choixA(String? value) => setField<String>('choix_a', value);

  String? get choixB => getField<String>('choix_b');
  set choixB(String? value) => setField<String>('choix_b', value);

  String? get choixC => getField<String>('choix_c');
  set choixC(String? value) => setField<String>('choix_c', value);

  String? get bonneReponse => getField<String>('bonne_reponse');
  set bonneReponse(String? value) => setField<String>('bonne_reponse', value);

  String? get testMentalId => getField<String>('test_mental_id');
  set testMentalId(String? value) => setField<String>('test_mental_id', value);
}
