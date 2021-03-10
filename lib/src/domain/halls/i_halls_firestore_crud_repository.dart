import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sports_complex_app/src/domain/core/repositories/i_firebase_cud_repository.dart';
import 'package:sports_complex_app/src/domain/core/repositories/watcher_mixin.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';

abstract class IHallsFirestoreCrudRepository
    extends IFirebaseCudRepository<Hall> with WatcherMixin<Hall> {
  IHallsFirestoreCrudRepository(FirebaseFirestore firebaseFirestore)
      : super(firebaseFirestore);
}
