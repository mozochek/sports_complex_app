// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:sports_complex_app/src/infrastructure/auth/auth_facade.dart';
import 'package:sports_complex_app/src/application/bottom_nav/bottom_navigation_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/application/coaches/form_bloc/coach_form_bloc.dart';
import 'package:sports_complex_app/src/application/coaches/actor_bloc/coaches_actor_bloc.dart';
import 'package:sports_complex_app/src/infrastructure/coaches/coaches_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/application/coaches/watcher_bloc/coaches_watcher_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_complex_app/src/infrastructure/core/injectables/firebase_injectables.dart';
import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/application/halls/form_bloc/hall_form_bloc.dart';
import 'package:sports_complex_app/src/application/halls/actor_bloc/halls_actor_bloc.dart';
import 'package:sports_complex_app/src/infrastructure/halls/halls_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/application/halls/watcher_bloc/halls_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/auth/i_auth.dart';
import 'package:sports_complex_app/src/application/coaches/form_bloc/i_coach_form_bloc.dart';
import 'package:sports_complex_app/src/application/coaches/actor_bloc/i_coaches_actor_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/i_coaches_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/application/coaches/watcher_bloc/i_coaches_watcher_bloc.dart';
import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart';
import 'package:sports_complex_app/src/application/halls/actor_bloc/i_hall_actor_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/i_halls_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/application/halls/watcher_bloc/i_halls_watcher_bloc.dart';
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart';
import 'package:sports_complex_app/src/application/sign_up/i_sign_up_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/i_workout_schedule_form_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/actor_bloc/i_workout_schedule_actor_bloc.dart';
import 'package:sports_complex_app/src/domain/workouts/i_workouts_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/watcher_bloc/i_workouts_schedule_watcher_bloc.dart';
import 'package:sports_complex_app/src/application/sign_in/sign_in_bloc.dart';
import 'package:sports_complex_app/src/application/sign_up/sign_up_bloc.dart';
import 'package:sports_complex_app/src/application/user/user_bloc.dart';
import 'package:sports_complex_app/src/infrastructure/user/user_repository.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/actor_bloc/workout_schedule_actor_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/workout_schedule_form_bloc.dart';
import 'package:sports_complex_app/src/infrastructure/workouts_schedule/workouts_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/date_bloc/workouts_schedule_date_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/watcher_bloc/workouts_schedule_watcher_bloc.dart';

/// Environment names
const _dev = 'dev';
const _prod = 'prod';
const _test = 'test';

/// adds generated dependencies
/// to the provided [GetIt] instance

extension GetItInjectableX on GetIt {
  GetIt $initGetIt({
    String environment,
    EnvironmentFilter environmentFilter,
  }) {
    final gh = GetItHelper(this, environment, environmentFilter);
    final firebaseAuthInjectable = _$FirebaseAuthInjectable();
    final firebaseFirestoreInjectable = _$FirebaseFirestoreInjectable();
    gh.factory<BottomNavigationBloc>(() => BottomNavigationBloc(),
        registerFor: {_dev, _prod, _test});
    gh.lazySingleton<FirebaseAuth>(() => firebaseAuthInjectable.firebaseAuth,
        registerFor: {_dev, _prod, _test});
    gh.lazySingleton<FirebaseFirestore>(
        () => firebaseFirestoreInjectable.firebaseFirestore,
        registerFor: {_dev, _prod, _test});
    gh.lazySingleton<ICoachesFirestoreCrudRepository>(
        () => CoachesFirestoreCrudRepository(get<FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<ICoachesWatcherBloc>(
        () => CoachesWatcherBloc(get<ICoachesFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<IHallsFirestoreCrudRepository>(
        () => HallsFirestoreCrudRepository(get<FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<IHallsWatcherBloc>(
        () => HallsWatcherBloc(get<IHallsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<IWorkoutsFirestoreCrudRepository>(
        () => WorkoutsFirestoreCrudRepository(get<FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<IWorkoutsScheduleWatcherBloc>(
        () => WorkoutsScheduleWatcherBloc(
            get<IWorkoutsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<UserBloc>(() => UserBloc(),
        registerFor: {_dev, _prod, _test});
    gh.factory<UserRepository>(() => UserRepository(get<FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.factory<IAuth>(
        () => AuthFacade(get<FirebaseAuth>(), get<UserRepository>()),
        registerFor: {_dev, _prod});
    gh.factoryParam<ICoachFormBloc, Coach, FormBlocPurpose>(
        (coach, purpose) => CoachFormBloc(
              get<ICoachesFirestoreCrudRepository>(),
              coach: coach,
              purpose: purpose,
            ),
        registerFor: {_dev, _prod});
    gh.lazySingleton<ICoachesActorBloc>(
        () => CoachesActorBloc(get<ICoachesFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.factoryParam<IHallFormBloc, Hall, FormBlocPurpose>(
        (hall, purpose) => HallFormBloc(
              get<IHallsFirestoreCrudRepository>(),
              hall: hall,
              purpose: purpose,
            ),
        registerFor: {_dev, _prod});
    gh.lazySingleton<IHallsActorBloc>(
        () => HallsActorBloc(get<IHallsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.factory<ISignInBloc>(() => SignInBloc(get<IAuth>()),
        registerFor: {_dev, _prod});
    gh.factory<ISignUpBloc>(() => SignUpBloc(get<IAuth>()),
        registerFor: {_dev, _prod});
    gh.factoryParam<IWorkoutFormBloc, Workout, FormBlocPurpose>(
        (workout, purpose) => WorkoutScheduleFormBloc(
              get<IWorkoutsFirestoreCrudRepository>(),
              workout: workout,
              purpose: purpose,
            ),
        registerFor: {_dev, _prod});
    gh.lazySingleton<IWorkoutScheduleActorBloc>(
        () => WorkoutScheduleActorBloc(get<IWorkoutsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});

    // Eager singletons must be registered in the right order
    gh.singleton<WorkoutsScheduleDateBloc>(WorkoutsScheduleDateBloc(),
        registerFor: {_dev, _prod, _test});
    return this;
  }
}

class _$FirebaseAuthInjectable extends FirebaseAuthInjectable {}

class _$FirebaseFirestoreInjectable extends FirebaseFirestoreInjectable {}
