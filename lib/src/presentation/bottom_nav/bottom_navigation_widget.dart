import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sports_complex_app/injection.dart';

import 'package:sports_complex_app/src/application/bottom_nav/bottom_navigation_bloc.dart';
import 'package:sports_complex_app/src/presentation/home/home_screen.dart';
import 'package:sports_complex_app/src/presentation/profile/profile_screen.dart';
import 'package:sports_complex_app/src/presentation/workouts/workouts_screen.dart';
import 'package:sports_complex_app/generated/l10n.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    Key? key,
  }) : super(key: key);

  final _screens = const <Widget>[
    HomeScreen(),
    WorkoutsScreen(),
    ProfileScreen(),
  ];

  final _navBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      label: S.current.home_text,
      icon: const FaIcon(FontAwesomeIcons.home),
    ),
    BottomNavigationBarItem(
      label: S.current.schedule_text,
      icon: const FaIcon(FontAwesomeIcons.calendarWeek),
    ),
    BottomNavigationBarItem(
      label: S.current.profile_text,
      icon: const FaIcon(FontAwesomeIcons.userCircle),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<BottomNavigationBloc>();

    return StreamBuilder<int>(
      stream: bloc.selectedIndex,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final index = snapshot.data ?? 0;
          return DefaultTabController(
            length: _screens.length,
            child: Scaffold(
              body: PageTransitionSwitcher(
                transitionBuilder: (child, animation, secondaryAnimation) {
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: _screens[index],
              ),
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
