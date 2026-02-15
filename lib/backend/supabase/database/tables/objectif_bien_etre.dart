import '../database.dart';

class ObjectifBienEtreTable extends SupabaseTable<ObjectifBienEtreRow> {
  @override
  String get tableName => 'objectif_bien_etre';

  @override
  ObjectifBienEtreRow createRow(Map<String, dynamic> data) =>
      ObjectifBienEtreRow(data);
}

class ObjectifBienEtreRow extends SupabaseDataRow {
  ObjectifBienEtreRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ObjectifBienEtreTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get titre => getField<String>('titre');
  set titre(String? value) => setField<String>('titre', value);

  bool? get statut => getField<bool>('statut');
  set statut(bool? value) => setField<bool>('statut', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get utilisateurId => getField<String>('utilisateur_id');
  set utilisateurId(String? value) => setField<String>('utilisateur_id', value);
}
