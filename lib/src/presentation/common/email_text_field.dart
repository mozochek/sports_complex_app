import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    @required this.emailStream,
    @required this.onChanged,
    this.initialValue,
    Key key,
  }) : super(key: key);

  final String initialValue;
  final Stream<String> emailStream;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: emailStream,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: initialValue,
          keyboardType: TextInputType.emailAddress,
          onChanged: onChanged,
          autocorrect: false,
          decoration: InputDecoration(
            labelText: S.current.email_text,
            prefixIcon: const Icon(Icons.email),
            // TODO: pass error via error object
            errorText: snapshot.error as String,
            errorMaxLines: 2,
          ),
        );
      },
    );
  }
}
