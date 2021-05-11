import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseFirestoreInjectable {
  @LazySingleton(
    env: [
      Environment.dev,
      Environment.prod,
      Environment.test,
    ],
  )
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
}

@module
abstract class FirebaseAuthInjectable {
  @LazySingleton(
    env: [
      Environment.dev,
      Environment.prod,
      Environment.test,
    ],
  )
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}

@module
abstract class FirebaseStorageInjectable {
  @LazySingleton(
    env: [
      Environment.dev,
      Environment.prod,
      Environment.test,
    ],
  )
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;
}