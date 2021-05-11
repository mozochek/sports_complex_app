import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sports_complex_app/src/presentation/profile/edit_profile/edit_profile_screen.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // TODO: navigation
        await Navigator.push<void>(
          context,
          MaterialPageRoute(
            builder: (_) => const EditProfileScreen(),
          ),
        );
      },
      child: const ListTile(
        leading: FaIcon(FontAwesomeIcons.edit),
        title: Text('Редактировать профиль'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
