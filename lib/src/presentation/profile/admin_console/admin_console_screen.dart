import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/widgets/list_of_coaches_button_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/widgets/list_of_halls_button_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/widgets/list_of_users_button.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/widgets/write_news_button_widget.dart';

class AdminConsoleScreen extends StatelessWidget {
  const AdminConsoleScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: Text(
          S.current.admin_console_text,
        ),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            WriteNewsButton(),
            ListOfCoachesButton(),
            ListOfHallsButton(),
            ListOfUsersButton(),
          ],
        ),
      ),
    );
  }
}
