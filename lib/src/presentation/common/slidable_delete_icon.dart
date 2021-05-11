import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sports_complex_app/src/presentation/colors.dart';

class SlidableDeleteIcon extends StatelessWidget {
  const SlidableDeleteIcon({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconSlideAction(
      color: AppColors.red,
      icon: FontAwesomeIcons.trash,
      onTap: onTap,
    );
  }
}
