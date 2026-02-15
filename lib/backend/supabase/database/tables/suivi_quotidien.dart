import '../database.dart';

class SuiviQuotidienTable extends SupabaseTable<SuiviQuotidienRow> {
  @override
  String get tableName => 'suivi_quotidien';

  @override
  SuiviQuotidienRow createRow(Map<String, dynamic> data) =>
      SuiviQuotidienRow(data);
}

class SuiviQuotidienRow extends SupabaseDataRow {
  SuiviQuotidienRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SuiviQuotidienTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get commentaire => getField<String>('commentaire');
  set commentaire(String? value) => setField<String>('commentaire', value);

  String? get utilisateurId => getField<String>('utilisateur_id');
  set utilisateurId(String? value) => setField<String>('utilisateur_id', value);
}
