import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/domain/halls/hall.dart';

class HallListTile extends StatelessWidget {
  const HallListTile({
    @required this.hall,
    this.onTap,
    this.onLongPress,
    Key key,
  }) : super(key: key);

  final Hall hall;
  final Function() onTap;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: ListTile(
        title: Text(hall.name),
      ),
    );
  }
}
