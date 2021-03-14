import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/bottom_nav/bottom_navigation_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/actor_bloc/i_workout_actor_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/date_bloc/workouts_schedule_date_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/watcher_bloc/i_workouts_watcher_bloc.dart';
import 'package:sports_complex_app/src/presentation/home/home_screen.dart';
import 'package:sports_complex_app/src/presentation/profile/profile_screen.dart';
import 'package:sports_complex_app/src/presentation/workouts/workouts_screen.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/generated/l10n.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    Key? key,
  }) : super(key: key);

  final _screens = <Widget>[
    const HomeScreen(),
    MultiProvider(
      providers: [
        Provider<IWorkoutsWatcherBloc>(
          create: (_) => getIt<IWorkoutsWatcherBloc>(),
        ),
        Provider<IWorkoutActorBloc>(
          create: (_) => getIt<IWorkoutActorBloc>(),
        ),
        Provider<WorkoutsScheduleDateBloc>(
          create: (_) => getIt<WorkoutsScheduleDateBloc>(),
          dispose: (_, bloc) async => bloc.dispose(),
        ),
      ],
      child: const WorkoutsScreen(),
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
          final index = snapshot.data ?? 0;
          return DefaultTabController(
            length: _screens.length,
            child: Scaffold(
              body: _screens[index],
              bottomNavigationBar: BottomNavigationBar(
                items: _navBarItems,
                onTap: bloc.changeSelectedIndex,
                currentIndex: index,
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
