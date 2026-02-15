import '../database.dart';

class ParticipationEvenementTable
    extends SupabaseTable<ParticipationEvenementRow> {
  @override
  String get tableName => 'participation_evenement';

  @override
  ParticipationEvenementRow createRow(Map<String, dynamic> data) =>
      ParticipationEvenementRow(data);
}

class ParticipationEvenementRow extends SupabaseDataRow {
  ParticipationEvenementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ParticipationEvenementTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get dateInscription => getField<DateTime>('date_inscription');
  set dateInscription(DateTime? value) =>
      setField<DateTime>('date_inscription', value);

  String? get statut => getField<String>('statut');
  set statut(String? value) => setField<String>('statut', value);

  String? get evenementId => getField<String>('evenement_id');
  set evenementId(String? value) => setField<String>('evenement_id', value);

  String? get utilisateurId => getField<String>('utilisateur_id');
  set utilisateurId(String? value) => setField<String>('utilisateur_id', value);
}
