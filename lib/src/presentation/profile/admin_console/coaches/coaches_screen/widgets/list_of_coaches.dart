import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/presentation/common/coach_list_tile_widget.dart';

class ListOfCoaches extends StatelessWidget {
  const ListOfCoaches({
    required this.coaches,
    Key? key,
  }) : super(key: key);

  final List<Coach> coaches;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coaches.length,
      itemBuilder: (_, index) {
        final coach = coaches[index];
        return CoachListTile(
          coach: coach,
        );
      },
    );
  }
}
