import 'package:flutter/material.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    required this.userNameStream,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final Stream<String> userNameStream;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: userNameStream,
      builder: (_, snapshot) {
        return TextFormField(
          keyboardType: TextInputType.name,
          onChanged: onChanged,
          decoration: InputDecoration(
            // TODO: add localization
            labelText: 'Имя',
            prefixIcon: const Icon(Icons.short_text),
            errorText: snapshot.error as String?,
            errorMaxLines: 2,
          ),
        );
      },
    );
  }
}
