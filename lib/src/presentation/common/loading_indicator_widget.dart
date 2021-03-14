import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(S.current.loading_data_text),
          const SizedBox(height: 15.0),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}