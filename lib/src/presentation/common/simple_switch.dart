import 'package:flutter/material.dart';

class SimpleSwitch extends StatelessWidget {
  const SimpleSwitch({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(label),
        StreamBuilder<bool>(
          stream: valueStream,
          builder: (_, snapshot) {
            return Switch(
              value: snapshot.data ?? false,
              onChanged: onChanged,
            );
          },
        ),
      ],
    );
  }
}
