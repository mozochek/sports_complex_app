import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: Center(
        child: Text(S.current.home_text),
      ),
    );
  }
}
