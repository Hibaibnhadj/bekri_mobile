import '../database.dart';

class EvenementTable extends SupabaseTable<EvenementRow> {
  @override
  String get tableName => 'evenement';

  @override
  EvenementRow createRow(Map<String, dynamic> data) => EvenementRow(data);
}

class EvenementRow extends SupabaseDataRow {
  EvenementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EvenementTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get titre => getField<String>('titre');
  set titre(String? value) => setField<String>('titre', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get dateDebut => getField<DateTime>('date_debut');
  set dateDebut(DateTime? value) => setField<DateTime>('date_debut', value);

  DateTime? get dateFin => getField<DateTime>('date_fin');
  set dateFin(DateTime? value) => setField<DateTime>('date_fin', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  int? get capaciteMax => getField<int>('capacite_max');
  set capaciteMax(int? value) => setField<int>('capacite_max', value);

  String? get statut => getField<String>('statut');
  set statut(String? value) => setField<String>('statut', value);

  String? get lienSession => getField<String>('lien_session');
  set lienSession(String? value) => setField<String>('lien_session', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get coachId => getField<String>('coach_id');
  set coachId(String? value) => setField<String>('coach_id', value);
}
