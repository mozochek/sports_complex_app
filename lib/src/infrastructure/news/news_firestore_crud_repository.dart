import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/domain/news/i_news_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/domain/news/news.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/firebase_firestore_x.dart';

@LazySingleton(
  as: INewsFirestoreCrudRepository,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class NewsFirestoreCrudRepository extends INewsFirestoreCrudRepository {
  NewsFirestoreCrudRepository(FirebaseFirestore firebaseFirestore)
      : super(firebaseFirestore);

  @override
  Future<void> create(News obj) =>
      firestoreInstance.newsDoc(obj).set(obj.toJson());

  @override
  Future<void> delete(News obj) => firestoreInstance.newsDoc(obj).delete();

  @override
  Future<void> update(News obj, {News? initObj}) =>
      firestoreInstance.newsDoc(obj).update(obj.toJson());

  @override
  Stream<List<News>> watchAll() => firestoreInstance.newsCollection
      .orderBy('timestamp')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => News.fromFirestore(doc)).toList());
}
