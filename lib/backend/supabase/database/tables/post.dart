import '../database.dart';

class PostTable extends SupabaseTable<PostRow> {
  @override
  String get tableName => 'post';

  @override
  PostRow createRow(Map<String, dynamic> data) => PostRow(data);
}

class PostRow extends SupabaseDataRow {
  PostRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get titre => getField<String>('titre');
  set titre(String? value) => setField<String>('titre', value);

  String? get contenu => getField<String>('contenu');
  set contenu(String? value) => setField<String>('contenu', value);

  String? get mediaUrl => getField<String>('media_url');
  set mediaUrl(String? value) => setField<String>('media_url', value);

  String? get categorie => getField<String>('categorie');
  set categorie(String? value) => setField<String>('categorie', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get deletedAt => getField<DateTime>('deleted_at');
  set deletedAt(DateTime? value) => setField<DateTime>('deleted_at', value);

  String? get utilisateurId => getField<String>('utilisateur_id');
  set utilisateurId(String? value) => setField<String>('utilisateur_id', value);
}
