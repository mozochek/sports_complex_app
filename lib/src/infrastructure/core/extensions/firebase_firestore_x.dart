import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sports_complex_app/src/infrastructure/core/extensions/date_time_x.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference get coachesCollection => collection('coaches');

  DocumentReference coachDoc(Coach coach) => coachesCollection.doc(coach.id);

  CollectionReference get hallsCollection => collection('halls');

  DocumentReference hallDoc(Hall hall) => hallsCollection.doc(hall.id);

  CollectionReference get workoutsCollection => collection('coachings');

  CollectionReference workoutsScheduleCollection(DateTime date) =>
      workoutsCollection.doc(date.asFormattedString).collection('schedule');

  DocumentReference workoutDoc(Workout workout) =>
      workoutsCollection.doc(workout.date.asFormattedString);
}