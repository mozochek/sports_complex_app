import 'package:flutter/material.dart';

class UserSurnameTextField extends StatelessWidget {
  const UserSurnameTextField({
    required this.userSurnameStream,
    required this.onChanged,
    this.initialSurname,
    Key? key,
  }) : super(key: key);

  final Stream<String> userSurnameStream;
  final Function(String) onChanged;
  final String? initialSurname;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: userSurnameStream,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: initialSurname,
          keyboardType: TextInputType.name,
          onChanged: onChanged,
          decoration: InputDecoration(
            // TODO: add localization
            labelText: 'Фамилия',
            prefixIcon: const Icon(Icons.short_text),
            errorText: snapshot.error as String?,
          ),
        );
      },
    );
  }
}
