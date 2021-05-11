import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/domain/halls/i_halls_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/firebase_firestore_x.dart';

@LazySingleton(
  as: IHallsFirestoreCrudRepository,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class HallsFirestoreCrudRepository extends IHallsFirestoreCrudRepository {
  HallsFirestoreCrudRepository(FirebaseFirestore firebaseFirestore)
      : super(firebaseFirestore);

  @override
  Future<void> create(Hall obj) =>
      firestoreInstance.hallDoc(obj).set(obj.toJson());

  @override
  Future<void> delete(Hall obj) => firestoreInstance.hallDoc(obj).delete();

  @override
  Future<void> update(Hall obj, {Hall? initObj}) =>
      firestoreInstance.hallDoc(obj).update(obj.toJson());

  @override
  Stream<List<Hall>> watchAll() => firestoreInstance.hallsCollection
      .orderBy('name')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Hall.fromFirestore(doc)).toList());
}
