import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sports_complex_app/src/domain/core/repositories/i_cud_repository.dart';

abstract class IFirebaseCudRepository<T> implements ICudRepository<T> {
  IFirebaseCudRepository(
    this.firestoreInstance,
  );

  final FirebaseFirestore firestoreInstance;
}
