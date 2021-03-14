import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.passwordStream,
    required this.onChanged,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  final String? initialValue;
  final Stream<String> passwordStream;
  final Function(String) onChanged;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.passwordStream,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          autocorrect: false,
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: S.current.password_text,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            ),
            errorText: snapshot.error as String?,
            errorMaxLines: 2,
          ),
        );
      },
    );
  }
}
