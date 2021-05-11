import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';
import 'package:sports_complex_app/src/domain/user/role.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/presentation/colors.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/widgets/admin_console_button.dart';
import 'package:sports_complex_app/src/presentation/profile/widgets/edit_profile_button.dart';
import 'package:sports_complex_app/src/presentation/profile/widgets/favorite_workouts_button.dart';
import 'package:sports_complex_app/src/presentation/profile/widgets/settings_button.dart';
import 'package:sports_complex_app/src/presentation/profile/widgets/sign_out_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = getIt<IUserBloc>();

    return StreamBuilder<User?>(
      stream: userBloc.currentUserStream,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final currentUser = snapshot.data!;
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
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
                      GestureDetector(
                        onTap: () async {
                          final picker = ImagePicker();
                          final file = await picker.getImage(
                            imageQuality: 100,
                            source: ImageSource.gallery,
                          );
                          if (file != null) {
                            await getIt<FirebaseStorage>()
                                .ref('user-pic-${currentUser.id}')
                                .putData(await file.readAsBytes());
                            debugPrint('Успешно добавлено');
                            return;
                          }
                          debugPrint('Добавление было отменено');
                        },
                        child: FutureBuilder<String>(
                          future: getIt<FirebaseStorage>()
                              .ref('user-pic-${currentUser.id}')
                              .getDownloadURL(),
                          builder: (_, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasData) {
                              return SizedBox(
                                width: 200.0,
                                height: 200.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(200.0),
                                  child: Image.network(
                                    snapshot.data!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(200.0),
                              child: Container(
                                width: 200.0,
                                height: 200.0,
                                color: AppColors.placeholderColor,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Column(
                        children: <Widget>[
                          const FavoriteWorkoutsButton(),
                          if (currentUser.role == Role.admin)
                            const AdminConsoleButton(),
                          const EditProfileButton(),
                          const SettingsButton(),
                          const SignOutButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: SafeArea(
            child: LoadingIndicator(),
          ),
        );
      },
    );
  }
}
