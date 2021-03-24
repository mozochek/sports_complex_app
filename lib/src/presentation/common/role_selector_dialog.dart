import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/domain/user/role.dart';
import 'package:sports_complex_app/src/presentation/common/confirmation_dialog.dart';

class RoleSelectorDialog extends StatelessWidget {
  const RoleSelectorDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roles = [
      Role.admin,
      Role.coach,
      Role.user,
    ];

    return SimpleDialog(
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
      title: Material(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // TODO: add localization
          child: Text(
            'Выберите роль:',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      children: <Widget>[
        ListView.builder(
          itemCount: roles.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final role = roles[index];
            return GestureDetector(
              onTap: () async {
                final isRoleSelectConfirmed = await showDialog<bool>(
                  context: context,
                  builder: (_) => ConfirmationDialog(
                    title: 'Выбрать роль?',
                    content:
                        'Роль "${role.asReadableString}" будет присвоена выбранному пользователю.',
                    confirmButtonText: 'Выбрать',
                    refuseButtonText: 'Отмена',
                  ),
                );
                if (isRoleSelectConfirmed ?? false) {
                  Navigator.of(context).pop<Role>(role);
                }
              },
              child: RoleTile(role: role),
            );
          },
        )
      ],
    );
  }
}

class RoleTile extends StatelessWidget {
  const RoleTile({
    required this.role,
    Key? key,
  }) : super(key: key);

  final Role role;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: role.asIcon,
      title: Text(role.asReadableString),
    );
  }
}
