import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/domain/workouts/i_workouts_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/firebase_firestore_x.dart';

@LazySingleton(
  as: IWorkoutsFirestoreCrudRepository,
  env: [Environment.dev, Environment.prod],
)
class WorkoutsFirestoreCrudRepository extends IWorkoutsFirestoreCrudRepository {
  WorkoutsFirestoreCrudRepository(FirebaseFirestore firestoreInstance)
      : super(firestoreInstance);

  @override
  Future<void> create(Workout obj) =>
      firestoreInstance
          .workoutsScheduleCollection(obj.date!)
          .doc(obj.id)
          .set(obj.toJson());

  @override
  Future<void> delete(Workout obj) =>
      firestoreInstance
          .workoutsScheduleCollection(obj.date!)
          .doc(obj.id)
         .delete();

  @override
  Future<void> update(Workout obj) =>
      firestoreInstance
          .workoutsScheduleCollection(obj.date!)
          .doc(obj.id)
          .update(obj.toJson());

  @override
  Stream<List<Workout>> watchAllByDate(DateTime date) => firestoreInstance
      .workoutsScheduleCollection(date)
      .orderBy('startTime')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Workout.fromFirestore(doc)).toList());
}
