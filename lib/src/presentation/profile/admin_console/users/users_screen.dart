import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sports_complex_app/injection.dart';

import 'package:sports_complex_app/src/application/user/actor_bloc/i_user_actor_bloc.dart';
import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';
import 'package:sports_complex_app/src/application/user/watcher_bloc/i_users_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/user/role.dart';
import 'package:sports_complex_app/src/presentation/common/list_is_empty_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/role_selector_dialog.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersWatcherBloc = Provider.of<IUsersWatcherBloc>(context);
    final currentUser = getIt<IUserBloc>().currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список пользователей'),
      ),
      body: StreamBuilder<List<User>>(
        stream: usersWatcherBloc.streamOfObjects,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              // TODO: !
              final users = snapshot.data!;
              if (users.isNotEmpty) {
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (_, index) {
                    final user = users[index];
                    return currentUser.authData.email == user.authData.email
                        ? Column(
                            children: <Widget>[
                              ListTile(
                                leading: user.role.asIcon,
                                title: Text(user.fullName),
                                subtitle: Text(user.authData.email),
                              ),
                              const Divider(height: 0.0),
                            ],
                          )
                        : Slidable(
                            actionPane: const SlidableScrollActionPane(),
                            secondaryActions: user.role == Role.admin
                                ? null
                                : <Widget>[
                                    IconSlideAction(
                                      icon: FontAwesomeIcons.edit,
                                      color: Colors.yellow,
                                      onTap: () async {
                                        final pickedRole =
                                            await showDialog<Role>(
                                          context: context,
                                          builder: (_) =>
                                              const RoleSelectorDialog(),
                                        );

                                        if (pickedRole != null) {
                                          await getIt<IUserActorBloc>().updateUserRole(
                                            user,
                                            pickedRole,
                                          );
                                        }
                                      },
                                    ),
                                    IconSlideAction(
                                      icon: FontAwesomeIcons.lock,
                                      color: Colors.red,
                                      // TODO: add user disabling
                                      onTap: () {},
                                    ),
                                  ],
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: user.role.asIcon,
                                  title: Text(user.fullName),
                                  subtitle: Text(user.authData.email),
                                ),
                                const Divider(height: 0.0),
                              ],
                            ),
                          );
                  },
                );
              } else {
                return const ListIsEmptyIndicator();
              }
            }
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
