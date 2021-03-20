// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sports_complex_app/src/application/bottom_nav/bottom_navigation_bloc.dart'
    as _i3;
import 'package:sports_complex_app/src/application/coaches/watcher_bloc/coaches_watcher_bloc.dart'
    as _i9;
import 'package:sports_complex_app/src/application/coaches/watcher_bloc/i_coaches_watcher_bloc.dart'
    as _i8;
import 'package:sports_complex_app/src/application/core/i_form_bloc.dart'
    as _i31;
import 'package:sports_complex_app/src/application/halls/actor_bloc/halls_actor_bloc.dart'
    as _i34;
import 'package:sports_complex_app/src/application/halls/actor_bloc/i_hall_actor_bloc.dart'
    as _i33;
import 'package:sports_complex_app/src/application/halls/form_bloc/hall_form_bloc.dart'
    as _i32;
import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart'
    as _i29;
import 'package:sports_complex_app/src/application/halls/watcher_bloc/halls_watcher_bloc.dart'
    as _i13;
import 'package:sports_complex_app/src/application/halls/watcher_bloc/i_halls_watcher_bloc.dart'
    as _i12;
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart'
    as _i35;
import 'package:sports_complex_app/src/application/sign_in/sign_in_bloc.dart'
    as _i36;
import 'package:sports_complex_app/src/application/sign_up/i_sign_up_bloc.dart'
    as _i37;
import 'package:sports_complex_app/src/application/sign_up/sign_up_bloc.dart'
    as _i38;
import 'package:sports_complex_app/src/application/user/actor_bloc/i_user_actor_bloc.dart'
    as _i39;
import 'package:sports_complex_app/src/application/user/actor_bloc/user_actor_bloc.dart'
    as _i40;
import 'package:sports_complex_app/src/application/user/i_user_bloc.dart'
    as _i16;
import 'package:sports_complex_app/src/application/user/user_bloc.dart' as _i17;
import 'package:sports_complex_app/src/application/user/watcher_bloc/i_users_watcher_bloc.dart'
    as _i20;
import 'package:sports_complex_app/src/application/user/watcher_bloc/users_watcher_bloc.dart'
    as _i21;
import 'package:sports_complex_app/src/application/workouts/actor_bloc/i_workout_actor_bloc.dart'
    as _i41;
import 'package:sports_complex_app/src/application/workouts/actor_bloc/workout_actor_bloc.dart'
    as _i42;
import 'package:sports_complex_app/src/application/workouts/date_bloc/workouts_schedule_date_bloc.dart'
    as _i26;
import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart'
    as _i43;
import 'package:sports_complex_app/src/application/workouts/form_bloc/workout_form_bloc.dart'
    as _i45;
import 'package:sports_complex_app/src/application/workouts/watcher_bloc/i_workouts_watcher_bloc.dart'
    as _i24;
import 'package:sports_complex_app/src/application/workouts/watcher_bloc/workouts_watcher_bloc.dart'
    as _i25;
import 'package:sports_complex_app/src/domain/auth/i_auth.dart' as _i27;
import 'package:sports_complex_app/src/domain/coaches/i_coaches_firestore_watcher.dart'
    as _i6;
import 'package:sports_complex_app/src/domain/halls/hall.dart' as _i30;
import 'package:sports_complex_app/src/domain/halls/i_halls_firestore_crud_repository.dart'
    as _i10;
import 'package:sports_complex_app/src/domain/workouts/i_workouts_firestore_crud_repository.dart'
    as _i22;
import 'package:sports_complex_app/src/domain/workouts/workout.dart' as _i44;
import 'package:sports_complex_app/src/infrastructure/auth/auth_facade.dart'
    as _i28;
import 'package:sports_complex_app/src/infrastructure/coaches/coaches_firestore_watcher.dart'
    as _i7;
import 'package:sports_complex_app/src/infrastructure/core/injectables/firebase_injectables.dart'
    as _i46;
import 'package:sports_complex_app/src/infrastructure/halls/halls_firestore_crud_repository.dart'
    as _i11;
import 'package:sports_complex_app/src/infrastructure/user/i_user_repository.dart'
    as _i18;
import 'package:sports_complex_app/src/infrastructure/user/user_repository.dart'
    as _i19;
import 'package:sports_complex_app/src/infrastructure/workouts/workouts_firestore_crud_repository.dart'
    as _i23;
import 'package:sports_complex_app/src/presentation/router/i_sports_complex_router.dart'
    as _i14;
import 'package:sports_complex_app/src/presentation/router/sports_complex_router.dart'
    as _i15;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt $initGetIt(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final firebaseAuthInjectable = _$FirebaseAuthInjectable();
    final firebaseFirestoreInjectable = _$FirebaseFirestoreInjectable();
    gh.factory<_i3.BottomNavigationBloc>(() => _i3.BottomNavigationBloc(),
        registerFor: {_dev, _prod, _test});
    gh.lazySingleton<_i4.FirebaseAuth>(
        () => firebaseAuthInjectable.firebaseAuth,
        registerFor: {_dev, _prod, _test});
    gh.lazySingleton<_i5.FirebaseFirestore>(
        () => firebaseFirestoreInjectable.firebaseFirestore,
        registerFor: {_dev, _prod, _test});
    gh.lazySingleton<_i6.ICoachesFirestoreWatcher>(
        () => _i7.CoachesFirestoreWatcher(get<_i5.FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i8.ICoachesWatcherBloc>(
        () => _i9.CoachesWatcherBloc(get<_i6.ICoachesFirestoreWatcher>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i10.IHallsFirestoreCrudRepository>(
        () => _i11.HallsFirestoreCrudRepository(get<_i5.FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i12.IHallsWatcherBloc>(
        () => _i13.HallsWatcherBloc(get<_i10.IHallsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i14.ISportsComplexRouter>(
        () => _i15.SportsComplexRouter(),
        registerFor: {_dev, _prod, _test});
    gh.lazySingleton<_i16.IUserBloc>(() => _i17.UserBloc(),
        registerFor: {_dev, _prod, _test});
    gh.factory<_i18.IUserRepository>(
        () => _i19.UserRepository(get<_i5.FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i20.IUsersWatcherBloc>(
        () => _i21.UsersWatcherBloc(get<_i18.IUserRepository>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i22.IWorkoutsFirestoreCrudRepository>(
        () =>
            _i23.WorkoutsFirestoreCrudRepository(get<_i5.FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i24.IWorkoutsWatcherBloc>(
        () => _i25.WorkoutsWatcherBloc(
            get<_i22.IWorkoutsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.factory<_i26.WorkoutsScheduleDateBloc>(
        () => _i26.WorkoutsScheduleDateBloc(),
        registerFor: {_dev, _prod, _test});
    gh.factory<_i27.IAuth>(
        () => _i28.AuthFacade(
            get<_i4.FirebaseAuth>(), get<_i18.IUserRepository>()),
        registerFor: {_dev, _prod});
    gh.factoryParam<_i29.IHallFormBloc, _i30.Hall?, _i31.FormBlocPurpose?>(
        (hall, purpose) => _i32.HallFormBloc(
            get<_i10.IHallsFirestoreCrudRepository>(),
            hall: hall,
            purpose: purpose),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i33.IHallsActorBloc>(
        () => _i34.HallsActorBloc(get<_i10.IHallsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.factory<_i35.ISignInBloc>(() => _i36.SignInBloc(get<_i27.IAuth>()),
        registerFor: {_dev, _prod});
    gh.factory<_i37.ISignUpBloc>(() => _i38.SignUpBloc(get<_i27.IAuth>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i39.IUserActorBloc>(
        () => _i40.UserActorBloc(get<_i18.IUserRepository>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i41.IWorkoutActorBloc>(
        () =>
            _i42.WorkoutActorBloc(get<_i22.IWorkoutsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.factoryParam<_i43.IWorkoutFormBloc, _i44.Workout?,
            _i31.FormBlocPurpose?>(
        (workout, purpose) => _i45.WorkoutFormBloc(
            get<_i22.IWorkoutsFirestoreCrudRepository>(),
            workout: workout,
            purpose: purpose),
        registerFor: {_dev, _prod});
    return this;
  }
}

class _$FirebaseAuthInjectable extends _i46.FirebaseAuthInjectable {}

class _$FirebaseFirestoreInjectable extends _i46.FirebaseFirestoreInjectable {}
