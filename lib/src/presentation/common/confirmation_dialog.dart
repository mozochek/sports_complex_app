import 'package:flutter/material.dart';

/// Simple dialog for any confirmation
///
/// Return true if confirmation button was pressed, otherwise it will return false
class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    @required this.title,
    @required this.content,
    @required this.confirmButtonText,
    @required this.refuseButtonText,
    Key key,
  }) : super(key: key);

  final String title;
  final String content;
  final String confirmButtonText;
  final String refuseButtonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(refuseButtonText.toUpperCase()),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(confirmButtonText.toUpperCase()),
        ),
      ],
    );
  }
}
