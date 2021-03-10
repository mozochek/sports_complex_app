import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/core/repositories/i_firebase_cud_repository.dart';
import 'package:sports_complex_app/src/domain/core/repositories/watcher_mixin.dart';

abstract class ICoachesFirestoreCrudRepository
    extends IFirebaseCudRepository<Coach> with WatcherMixin<Coach> {
  ICoachesFirestoreCrudRepository(FirebaseFirestore firestoreInstance)
      : super(firestoreInstance);
}
