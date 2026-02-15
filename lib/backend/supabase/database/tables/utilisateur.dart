import '../database.dart';

class UtilisateurTable extends SupabaseTable<UtilisateurRow> {
  @override
  String get tableName => 'utilisateur';

  @override
  UtilisateurRow createRow(Map<String, dynamic> data) => UtilisateurRow(data);
}

class UtilisateurRow extends SupabaseDataRow {
  UtilisateurRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UtilisateurTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get nom => getField<String>('nom');
  set nom(String? value) => setField<String>('nom', value);

  String? get prenom => getField<String>('prenom');
  set prenom(String? value) => setField<String>('prenom', value);

  String? get telephone => getField<String>('telephone');
  set telephone(String? value) => setField<String>('telephone', value);

  DateTime? get dateNaissance => getField<DateTime>('date_naissance');
  set dateNaissance(DateTime? value) =>
      setField<DateTime>('date_naissance', value);

  String? get pays => getField<String>('pays');
  set pays(String? value) => setField<String>('pays', value);

  String? get avatar => getField<String>('avatar');
  set avatar(String? value) => setField<String>('avatar', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get statut => getField<String>('statut');
  set statut(String? value) => setField<String>('statut', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
