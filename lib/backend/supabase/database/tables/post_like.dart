import '../database.dart';

class PostLikeTable extends SupabaseTable<PostLikeRow> {
  @override
  String get tableName => 'post_like';

  @override
  PostLikeRow createRow(Map<String, dynamic> data) => PostLikeRow(data);
}

class PostLikeRow extends SupabaseDataRow {
  PostLikeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostLikeTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get utilisateurId => getField<String>('utilisateur_id');
  set utilisateurId(String? value) => setField<String>('utilisateur_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
