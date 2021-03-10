import 'package:flutter/material.dart';

class UserSurnameTextField extends StatelessWidget {
  const UserSurnameTextField({
    @required this.userSurnameStream,
    @required this.onChanged,
    Key key,
    this.initialValue,
  }) : super(key: key);

  final String initialValue;
  final Stream<String> userSurnameStream;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: userSurnameStream,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: initialValue,
          keyboardType: TextInputType.name,
          onChanged: onChanged,
          decoration: InputDecoration(
            // TODO: add localization
            labelText: 'Фамилия',
            prefixIcon: const Icon(Icons.short_text),
            // TODO: pass error via error object
            errorText: snapshot.error as String,
            errorMaxLines: 2,
          ),
        );
      },
    );
  }
}
