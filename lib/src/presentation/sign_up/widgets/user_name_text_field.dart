import 'package:flutter/material.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    @required this.userNameStream,
    @required this.onChanged,
    Key key,
    this.initialValue,
  }) : super(key: key);

  final String initialValue;
  final Stream<String> userNameStream;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: userNameStream,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: initialValue,
          keyboardType: TextInputType.name,
          onChanged: onChanged,
          decoration: InputDecoration(
            // TODO: add localization
            labelText: 'Имя',
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
