import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sports_complex_app/src/domain/core/repositories/i_firebase_cud_repository.dart';
import 'package:sports_complex_app/src/domain/core/repositories/watcher_by_date_mixin.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';

abstract class IWorkoutsFirestoreCrudRepository
    extends IFirebaseCudRepository<Workout> with WatcherByDateMixin<Workout> {
  IWorkoutsFirestoreCrudRepository(FirebaseFirestore firestoreInstance)
      : super(firestoreInstance);
}
