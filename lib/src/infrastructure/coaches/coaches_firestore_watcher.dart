import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/coaches/i_coaches_firestore_watcher.dart';
import 'package:sports_complex_app/src/domain/user/role.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/firebase_firestore_x.dart';

@LazySingleton(
  as: ICoachesFirestoreWatcher,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class CoachesFirestoreWatcher extends ICoachesFirestoreWatcher {
  CoachesFirestoreWatcher(FirebaseFirestore firestoreInstance)
      : super(firestoreInstance);

  @override
  Stream<List<Coach>> watchAll() => firestoreInstance.usersCollection
      .where('role', isEqualTo: Role.coach.asString)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Coach.fromUser(
                User.fromJson(doc.data()),
              ))
          .toList());
}
