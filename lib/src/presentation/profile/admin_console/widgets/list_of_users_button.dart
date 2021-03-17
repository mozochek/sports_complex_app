import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/user/watcher_bloc/i_users_watcher_bloc.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/users/users_screen.dart';

class ListOfUsersButton extends StatelessWidget {
  const ListOfUsersButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (_) => Provider<IUsersWatcherBloc>(
              create: (_) => getIt<IUsersWatcherBloc>(),
              child: const UsersScreen(),
            ),
          ),
        );
      },
      child: const ListTile(
        leading: FaIcon(
          FontAwesomeIcons.userFriends,
          color: Colors.green,
        ),
        title: Text('Список пользователей'),
      ),
    );
  }
}
