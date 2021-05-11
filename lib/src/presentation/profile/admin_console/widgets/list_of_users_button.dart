import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sports_complex_app/src/presentation/colors.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/users/users_screen.dart';

class ListOfUsersButton extends StatelessWidget {
  const ListOfUsersButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // TODO: old navigation
        await Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (_) => const UsersScreen(),
          ),
        );
      },
      child: const ListTile(
        leading: FaIcon(
          FontAwesomeIcons.userFriends,
          color: AppColors.green,
        ),
        title: Text('Список пользователей'),
        trailing: Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
