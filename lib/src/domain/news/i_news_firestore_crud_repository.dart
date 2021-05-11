import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_complex_app/src/domain/core/repositories/i_firebase_cud_repository.dart';
import 'package:sports_complex_app/src/domain/core/repositories/watcher_mixin.dart';
import 'package:sports_complex_app/src/domain/news/news.dart';

abstract class INewsFirestoreCrudRepository extends IFirebaseCudRepository<News>
    with WatcherMixin<News> {
  INewsFirestoreCrudRepository(FirebaseFirestore firebaseFirestore)
      : super(firebaseFirestore);
}
