import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

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
      elevation: 2.0,
      child: DatePicker(
        DateTime.now(),
        daysCount: 14,
        // TODO: check when null provided
        initialSelectedDate: initialSelectedDate ?? DateTime.now(),
        onDateChange: onDateChange,
        locale: 'ru_RU',
      ),
    );
  }
}
