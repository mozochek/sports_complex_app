import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';

class NoScheduleIndicator extends StatelessWidget {
  const NoScheduleIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          S.current.no_schedule_for_this_date_text),
    );
  }
}