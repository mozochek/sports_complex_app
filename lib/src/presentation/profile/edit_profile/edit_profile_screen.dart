import 'package:flutter/material.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/user/edit_bloc/i_user_edit_bloc.dart';
import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';
import 'package:sports_complex_app/src/presentation/sign_up/widgets/user_name_text_field.dart';
import 'package:sports_complex_app/src/presentation/sign_up/widgets/user_surname_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _currentUserBloc = getIt<IUserBloc>();
    final _editBloc = getIt<IUserEditBloc>(
        param1: _currentUserBloc.currentUser!.personalData);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактировать профиль'),
        actions: <Widget>[
          StreamBuilder<bool>(
            stream: _editBloc.isUpdatedDataCorrect,
            builder: (_, snapshot) {
              final isProfileDataValid = snapshot.data ?? false;
              return IconButton(
                icon: const Icon(Icons.check),
                onPressed: isProfileDataValid
                    ? () async {
                        final isSaved = await _editBloc
                            .updatePersonalData(_currentUserBloc.currentUser!);
                        if (isSaved) {
                          Navigator.of(context).pop();
                        }
                      }
                    : null,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: UserSurnameTextField(
                  initialSurname:
                      _currentUserBloc.currentUser!.personalData.surname,
                  userSurnameStream: _editBloc.userSurname,
                  onChanged: _editBloc.changeUserSurname,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: UserNameTextField(
                  initialName: _currentUserBloc.currentUser!.personalData.name,
                  userNameStream: _editBloc.userName,
                  onChanged: _editBloc.changeUserName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
