import '../database.dart';

class CommentaireTable extends SupabaseTable<CommentaireRow> {
  @override
  String get tableName => 'commentaire';

  @override
  CommentaireRow createRow(Map<String, dynamic> data) => CommentaireRow(data);
}

class CommentaireRow extends SupabaseDataRow {
  CommentaireRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentaireTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get contenu => getField<String>('contenu');
  set contenu(String? value) => setField<String>('contenu', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get deletedAt => getField<DateTime>('deleted_at');
  set deletedAt(DateTime? value) => setField<DateTime>('deleted_at', value);

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get utilisateurId => getField<String>('utilisateur_id');
  set utilisateurId(String? value) => setField<String>('utilisateur_id', value);
}
