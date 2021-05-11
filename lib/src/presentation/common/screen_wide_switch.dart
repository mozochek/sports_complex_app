import 'package:flutter/material.dart';

class ScreenWideSwitch extends StatelessWidget {
  const ScreenWideSwitch({
    required this.label,
    required this.valueStream,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final String label;
  final Stream<bool> valueStream;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(label),
      trailing: StreamBuilder<bool>(
        stream: valueStream,
        builder: (_, snapshot) {
          return Switch(
            value: snapshot.data ?? false,
            onChanged: onChanged,
          );
        },
      ),
    );
  }
}
