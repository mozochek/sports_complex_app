// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sports_complex_app/src/application/bottom_nav/bottom_navigation_bloc.dart'
    as _i3;
import 'package:sports_complex_app/src/application/coaches/watcher_bloc/coaches_watcher_bloc.dart'
    as _i10;
import 'package:sports_complex_app/src/application/coaches/watcher_bloc/i_coaches_watcher_bloc.dart'
    as _i9;
import 'package:sports_complex_app/src/application/core/i_form_bloc.dart'
    as _i19;
import 'package:sports_complex_app/src/application/halls/actor_bloc/halls_actor_bloc.dart'
    as _i40;
import 'package:sports_complex_app/src/application/halls/actor_bloc/i_hall_actor_bloc.dart'
    as _i39;
import 'package:sports_complex_app/src/application/halls/form_bloc/hall_form_bloc.dart'
    as _i38;
import 'package:sports_complex_app/src/application/halls/form_bloc/i_hall_form_bloc.dart'
    as _i36;
import 'package:sports_complex_app/src/application/halls/watcher_bloc/halls_watcher_bloc.dart'
    as _i14;
import 'package:sports_complex_app/src/application/halls/watcher_bloc/i_halls_watcher_bloc.dart'
    as _i13;
import 'package:sports_complex_app/src/application/news/form_bloc/i_news_form_bloc.dart'
    as _i17;
import 'package:sports_complex_app/src/application/news/form_bloc/news_form_bloc.dart'
    as _i20;
import 'package:sports_complex_app/src/application/provided_services/watcher_bloc/i_provided_services_watcher_bloc.dart'
    as _i23;
import 'package:sports_complex_app/src/application/provided_services/watcher_bloc/provided_services_watcher_bloc.dart'
    as _i24;
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart'
    as _i41;
import 'package:sports_complex_app/src/application/sign_in/sign_in_bloc.dart'
    as _i42;
import 'package:sports_complex_app/src/application/sign_up/i_sign_up_bloc.dart'
    as _i43;
import 'package:sports_complex_app/src/application/sign_up/sign_up_bloc.dart'
    as _i44;
import 'package:sports_complex_app/src/application/theme/app_theme_bloc.dart'
    as _i57;
import 'package:sports_complex_app/src/application/user/actor_bloc/i_user_actor_bloc.dart'
    as _i45;
import 'package:sports_complex_app/src/application/user/actor_bloc/user_actor_bloc.dart'
    as _i46;
import 'package:sports_complex_app/src/application/user/edit_bloc/i_user_edit_bloc.dart'
    as _i49;
import 'package:sports_complex_app/src/application/user/edit_bloc/user_edit_bloc.dart'
    as _i51;
import 'package:sports_complex_app/src/application/user/i_user_bloc.dart'
    as _i47;
import 'package:sports_complex_app/src/application/user/user_bloc.dart' as _i48;
import 'package:sports_complex_app/src/application/user/watcher_bloc/i_users_watcher_bloc.dart'
    as _i27;
import 'package:sports_complex_app/src/application/user/watcher_bloc/users_watcher_bloc.dart'
    as _i28;
import 'package:sports_complex_app/src/application/workouts/actor_bloc/i_workout_actor_bloc.dart'
    as _i52;
import 'package:sports_complex_app/src/application/workouts/actor_bloc/workout_actor_bloc.dart'
    as _i53;
import 'package:sports_complex_app/src/application/workouts/date_bloc/workouts_schedule_date_bloc.dart'
    as _i33;
import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart'
    as _i54;
import 'package:sports_complex_app/src/application/workouts/form_bloc/workout_form_bloc.dart'
    as _i56;
import 'package:sports_complex_app/src/application/workouts/watcher_bloc/i_workouts_watcher_bloc.dart'
    as _i31;
import 'package:sports_complex_app/src/application/workouts/watcher_bloc/workouts_watcher_bloc.dart'
    as _i32;
import 'package:sports_complex_app/src/domain/auth/i_auth.dart' as _i34;
import 'package:sports_complex_app/src/domain/coaches/i_coaches_firestore_watcher.dart'
    as _i7;
import 'package:sports_complex_app/src/domain/halls/hall.dart' as _i37;
import 'package:sports_complex_app/src/domain/halls/i_halls_firestore_crud_repository.dart'
    as _i11;
import 'package:sports_complex_app/src/domain/news/i_news_firestore_crud_repository.dart'
    as _i15;
import 'package:sports_complex_app/src/domain/news/news.dart' as _i18;
import 'package:sports_complex_app/src/domain/provided_service/i_provided_services_repository.dart'
    as _i21;
import 'package:sports_complex_app/src/domain/user/personal_data.dart' as _i50;
import 'package:sports_complex_app/src/domain/workouts/i_workouts_firestore_crud_repository.dart'
    as _i29;
import 'package:sports_complex_app/src/domain/workouts/workout.dart' as _i55;
import 'package:sports_complex_app/src/infrastructure/auth/auth_facade.dart'
    as _i35;
import 'package:sports_complex_app/src/infrastructure/coaches/coaches_firestore_watcher.dart'
    as _i8;
import 'package:sports_complex_app/src/infrastructure/core/injectables/firebase_injectables.dart'
    as _i58;
import 'package:sports_complex_app/src/infrastructure/halls/halls_firestore_crud_repository.dart'
    as _i12;
import 'package:sports_complex_app/src/infrastructure/news/news_firestore_crud_repository.dart'
    as _i16;
import 'package:sports_complex_app/src/infrastructure/provided_service/provided_services_repository.dart'
    as _i22;
import 'package:sports_complex_app/src/infrastructure/user/i_user_repository.dart'
    as _i25;
import 'package:sports_complex_app/src/infrastructure/user/user_repository.dart'
    as _i26;
import 'package:sports_complex_app/src/infrastructure/workouts/workouts_firestore_crud_repository.dart'
    as _i30;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';

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
    final firebaseStorageInjectable = _$FirebaseStorageInjectable();
    gh.factory<_i3.BottomNavigationBloc>(() => _i3.BottomNavigationBloc(),
        registerFor: {_dev, _prod, _test});
    gh.lazySingleton<_i4.FirebaseAuth>(
        () => firebaseAuthInjectable.firebaseAuth,
        registerFor: {_dev, _prod, _test});
    gh.lazySingleton<_i5.FirebaseFirestore>(
        () => firebaseFirestoreInjectable.firebaseFirestore,
        registerFor: {_dev, _prod, _test});
    gh.lazySingleton<_i6.FirebaseStorage>(
        () => firebaseStorageInjectable.firebaseStorage,
        registerFor: {_dev, _prod, _test});
    gh.lazySingleton<_i7.ICoachesFirestoreWatcher>(
        () => _i8.CoachesFirestoreWatcher(get<_i5.FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i9.ICoachesWatcherBloc>(
        () => _i10.CoachesWatcherBloc(get<_i7.ICoachesFirestoreWatcher>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i11.IHallsFirestoreCrudRepository>(
        () => _i12.HallsFirestoreCrudRepository(get<_i5.FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i13.IHallsWatcherBloc>(
        () => _i14.HallsWatcherBloc(get<_i11.IHallsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i15.INewsFirestoreCrudRepository>(
        () => _i16.NewsFirestoreCrudRepository(get<_i5.FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.factoryParam<_i17.INewsFormBloc, _i18.News?, _i19.FormBlocPurpose?>(
        (news, purpose) => _i20.NewsFormBloc(
            get<_i15.INewsFirestoreCrudRepository>(),
            news: news,
            purpose: purpose),
        registerFor: {_dev, _prod});
    gh.factory<_i21.IProvidedServicesRepository>(
        () => _i22.ProvidedServicesRepository(),
        registerFor: {_dev, _test, _prod});
    gh.factory<_i23.IProvidedServicesWatcherBloc>(
        () => _i24.ProvidedServicesWatcherBloc(
            get<_i21.IProvidedServicesRepository>()),
        registerFor: {_dev, _test, _prod});
    gh.factory<_i25.IUserRepository>(
        () => _i26.UserRepository(get<_i5.FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i27.IUsersWatcherBloc>(
        () => _i28.UsersWatcherBloc(get<_i25.IUserRepository>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i29.IWorkoutsFirestoreCrudRepository>(
        () =>
            _i30.WorkoutsFirestoreCrudRepository(get<_i5.FirebaseFirestore>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i31.IWorkoutsWatcherBloc>(
        () => _i32.WorkoutsWatcherBloc(
            get<_i29.IWorkoutsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.factory<_i33.WorkoutsScheduleDateBloc>(
        () => _i33.WorkoutsScheduleDateBloc(),
        registerFor: {_dev, _prod, _test});
    gh.factory<_i34.IAuth>(
        () => _i35.AuthFacade(
            get<_i4.FirebaseAuth>(), get<_i25.IUserRepository>()),
        registerFor: {_dev, _prod});
    gh.factoryParam<_i36.IHallFormBloc, _i37.Hall?, _i19.FormBlocPurpose?>(
        (hall, purpose) => _i38.HallFormBloc(
            get<_i11.IHallsFirestoreCrudRepository>(),
            hall: hall,
            purpose: purpose),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i39.IHallsActorBloc>(
        () => _i40.HallsActorBloc(get<_i11.IHallsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.factory<_i41.ISignInBloc>(() => _i42.SignInBloc(get<_i34.IAuth>()),
        registerFor: {_dev, _prod});
    gh.factory<_i43.ISignUpBloc>(() => _i44.SignUpBloc(get<_i34.IAuth>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i45.IUserActorBloc>(
        () => _i46.UserActorBloc(get<_i25.IUserRepository>()),
        registerFor: {_dev, _prod});
    gh.lazySingleton<_i47.IUserBloc>(
        () => _i48.UserBloc(get<_i25.IUserRepository>()),
        registerFor: {_dev, _prod, _test});
    gh.factoryParam<_i49.IUserEditBloc, _i50.PersonalData?, dynamic>(
        (userPersonalData, _) =>
            _i51.UserEditBloc(get<_i25.IUserRepository>(), userPersonalData),
        registerFor: {_dev, _test, _prod});
    gh.lazySingleton<_i52.IWorkoutActorBloc>(
        () =>
            _i53.WorkoutActorBloc(get<_i29.IWorkoutsFirestoreCrudRepository>()),
        registerFor: {_dev, _prod});
    gh.factoryParam<_i54.IWorkoutFormBloc, _i55.Workout?,
            _i19.FormBlocPurpose?>(
        (workout, purpose) => _i56.WorkoutFormBloc(
            get<_i29.IWorkoutsFirestoreCrudRepository>(),
            workout: workout,
            purpose: purpose),
        registerFor: {_dev, _prod});
    gh.singleton<_i57.AppThemeBloc>(_i57.AppThemeBloc(),
        registerFor: {_dev, _test});
    return this;
  }
}

class _$FirebaseAuthInjectable extends _i58.FirebaseAuthInjectable {}

class _$FirebaseFirestoreInjectable extends _i58.FirebaseFirestoreInjectable {}

class _$FirebaseStorageInjectable extends _i58.FirebaseStorageInjectable {}
