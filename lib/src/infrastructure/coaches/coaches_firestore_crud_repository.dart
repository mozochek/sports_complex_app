import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/coaches/i_coaches_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/firebase_firestore_x.dart';

@LazySingleton(
  as: ICoachesFirestoreCrudRepository,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class CoachesFirestoreCrudRepository extends ICoachesFirestoreCrudRepository {
  CoachesFirestoreCrudRepository(FirebaseFirestore firestoreInstance)
      : super(firestoreInstance);

  @override
  Future<void> create(Coach obj) =>
      firestoreInstance.coachDoc(obj).set(obj.toJson());

  @override
  Future<void> delete(Coach obj) => firestoreInstance.coachDoc(obj).delete();

  @override
  Future<void> update(Coach obj) =>
      firestoreInstance.coachDoc(obj).update(obj.toJson());

  @override
  Stream<List<Coach>> watchAll() => firestoreInstance.coachesCollection
      .orderBy('surname')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Coach.fromFirestore(doc)).toList());
}
