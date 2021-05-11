import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sports_complex_app/src/domain/news/news.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/date_time_x.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference get coachesCollection => collection('coaches');

  DocumentReference coachDoc(Coach coach) => coachesCollection.doc(coach.id);

  CollectionReference get hallsCollection => collection('halls');

  DocumentReference hallDoc(Hall hall) => hallsCollection.doc(hall.id);

  CollectionReference get workoutsCollection => collection('workouts');

  CollectionReference workoutsScheduleCollection(DateTime date) =>
      workoutsCollection.doc(date.asFormattedString).collection('schedule');

  // TODO: !
  DocumentReference workoutDoc(Workout workout) =>
      workoutsCollection.doc(workout.date!.asFormattedString);

  CollectionReference get usersCollection => collection('users');

  DocumentReference userDoc(User user) =>
      usersCollection.doc(user.authData.email);

  CollectionReference get newsCollection => collection('news');

  DocumentReference newsDoc(News news) => newsCollection.doc(news.id);
}
