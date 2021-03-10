import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';

class ListIsEmptyIndicator extends StatelessWidget {
  const ListIsEmptyIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S.current.list_is_empty_text),
    );
  }
}