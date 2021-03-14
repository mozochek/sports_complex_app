import 'package:flutter/material.dart';

class UserSurnameTextField extends StatelessWidget {
  const UserSurnameTextField({
    required this.userSurnameStream,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final Stream<String> userSurnameStream;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: userSurnameStream,
      builder: (_, snapshot) {
        return TextFormField(
          keyboardType: TextInputType.name,
          onChanged: onChanged,
          decoration: InputDecoration(
            // TODO: add localization
            labelText: 'Фамилия',
            prefixIcon: const Icon(Icons.short_text),
            errorText: snapshot.error as String?,
            errorMaxLines: 2,
          ),
        );
      },
    );
  }
}
