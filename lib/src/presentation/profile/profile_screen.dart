import 'package:flutter/material.dart';
import 'package:sports_complex_app/injection.dart';

import 'package:sports_complex_app/src/application/user/user_bloc.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/profile/widgets/admin_console_button_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/widgets/favorite_workouts_button_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/widgets/settings_button_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/widgets/sign_out_button_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = getIt<UserBloc>().currentUser;

    return ScaffoldWrapper(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 25.0),
            // TODO: remove placeholder
            Text(
              currentUser.fullName,
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
            const SizedBox(height: 25.0),
            // TODO: remove placeholder
            const CircleAvatar(
              radius: 100.0,
              child: Placeholder(),
            ),
            const SizedBox(height: 25.0),
            Column(
              children: const <Widget>[
                FavoriteWorkoutsButton(),
                AdminConsoleButton(),
                SettingsButton(),
                SignOutButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
