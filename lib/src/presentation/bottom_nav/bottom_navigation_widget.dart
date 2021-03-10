import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/bottom_nav/bottom_navigation_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/actor_bloc/i_workout_schedule_actor_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/date_bloc/workouts_schedule_date_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/watcher_bloc/i_workouts_schedule_watcher_bloc.dart';
import 'package:sports_complex_app/src/presentation/home/home_screen.dart';
import 'package:sports_complex_app/src/presentation/profile/profile_screen.dart';
import 'package:sports_complex_app/src/presentation/workouts_schedule/workouts_schedule_screen.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/generated/l10n.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    Key key,
  }) : super(key: key);

  final _screens = <Widget>[
    const HomeScreen(),
    MultiProvider(
      providers: [
        Provider(
          create: (_) => getIt<IWorkoutsScheduleWatcherBloc>(),
        ),
        Provider(
          create: (_) => getIt<IWorkoutScheduleActorBloc>(),
        ),
        Provider<WorkoutsScheduleDateBloc>(
          create: (_) => getIt<WorkoutsScheduleDateBloc>(),
          dispose: (_, bloc) async => bloc.dispose(),
        ),
      ],
      child: const WorkoutsScheduleScreen(),
    ),
    const ProfileScreen(),
  ];

  final _navBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      label: S.current.home_text,
      icon: const Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: S.current.schedule_text,
      icon: const Icon(Icons.date_range),
    ),
    BottomNavigationBarItem(
      label: S.current.profile_text,
      icon: const Icon(Icons.account_circle),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BottomNavigationBloc>(context);

    return StreamBuilder<int>(
      stream: bloc.selectedIndex,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return DefaultTabController(
            length: _screens.length,
            child: Scaffold(
              body: _screens[snapshot.data],
              bottomNavigationBar: BottomNavigationBar(
                items: _navBarItems,
                onTap: bloc.changeSelectedIndex,
                currentIndex: snapshot.data,
                type: BottomNavigationBarType.fixed,
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
