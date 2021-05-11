import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex_app/src/presentation/colors.dart';

class WorkoutsDatePickerLine extends StatelessWidget {
  const WorkoutsDatePickerLine({
    required this.onDateChange,
    this.initialSelectedDate,
    Key? key,
  }) : super(key: key);

  final DateTime? initialSelectedDate;
  final Function(DateTime) onDateChange;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 8.0,
      child: DatePicker(
        DateTime.now(),
        daysCount: 14,
        initialSelectedDate: initialSelectedDate ?? DateTime.now(),
        onDateChange: onDateChange,
        monthTextStyle: Theme.of(context).textTheme.caption!,
        dayTextStyle: Theme.of(context).textTheme.caption!,
        dateTextStyle: Theme.of(context).textTheme.headline6!,
        selectionColor: AppColors.secondaryRed,
        locale: 'ru_RU',
      ),
    );
  }
}
