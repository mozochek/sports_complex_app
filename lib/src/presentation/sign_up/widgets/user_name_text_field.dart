import 'package:flutter/material.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    required this.userNameStream,
    required this.onChanged,
    this.initialName,
    Key? key,
  }) : super(key: key);

  final Stream<String> userNameStream;
  final Function(String) onChanged;
  final String? initialName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: userNameStream,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: initialName,
          keyboardType: TextInputType.name,
          onChanged: onChanged,
          decoration: InputDecoration(
            // TODO: add localization
            labelText: 'Имя',
            prefixIcon: const Icon(Icons.short_text),
            errorText: snapshot.error as String?,
          ),
        );
      },
    );
  }
}
