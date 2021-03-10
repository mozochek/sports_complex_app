import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/bottom_nav/bottom_navigation_bloc.dart';
import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart';
import 'package:sports_complex_app/src/application/user/user_bloc.dart';
import 'package:sports_complex_app/src/domain/user/user_state.dart';
import 'package:sports_complex_app/src/presentation/bottom_nav/bottom_navigation_widget.dart';
import 'package:sports_complex_app/injection.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // getIt<UserBloc>().userStateChanges.listen(
    //   (userState) async {
    //     debugPrint('ДОБАВЛЯЮ СЛУШАТЕЛСЯ В USERBLOC');
    //     if (userState == UserState.signedIn) {
    //       await Navigator.of(context).pushAndRemoveUntil<void>(
    //         MaterialPageRoute(
    //           builder: (_) => Provider<BottomNavigationBloc>(
    //             create: (_) => getIt<BottomNavigationBloc>(),
    //             dispose: (_, __) async => getIt<BottomNavigationBloc>().dispose(),
    //             child: BottomNavigation(),
    //           ),
    //         ),
    //         (_) => false,
    //       );
    //     }
    //   },
    // );

    final bloc = Provider.of<ISignInBloc>(context);

    return StreamBuilder<bool>(
      stream: bloc.isSignInAllowed,
      builder: (_, snapshot) {
        final isSignInAllowed = snapshot.data ?? false;
        return TextButton(
          // TODO: refactor navigation
          onPressed: isSignInAllowed
              ? () async {
                  final isSignedIn = await bloc.signIn();
                  if (isSignedIn) {
                    await Navigator.of(context).pushAndRemoveUntil<void>(
                      MaterialPageRoute(
                        builder: (_) => Provider<BottomNavigationBloc>(
                          create: (_) => getIt<BottomNavigationBloc>(),
                          dispose: (_, bloc) async => bloc.dispose(),
                          child: BottomNavigation(),
                        ),
                      ),
                      (_) => false,
                    );
                  }
                }
              : null,
          child: Text(
            S.current.sign_in_text,
          ),
        );
      },
    );
  }
}
