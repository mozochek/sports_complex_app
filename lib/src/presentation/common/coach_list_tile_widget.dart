import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/domain/coaches/coach.dart';

class CoachListTile extends StatelessWidget {
  const CoachListTile({
    required this.coach,
    this.onTap,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  final Coach coach;
  final Function()? onTap;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: ListTile(
        title: Text(coach.fullName),
        leading: const Icon(Icons.account_circle),
      ),
    );
  }
}
