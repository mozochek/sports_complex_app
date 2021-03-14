import 'package:flutter/material.dart';

import 'package:sports_complex_app/generated/l10n.dart';

/// Simple dialog for delete confirmation with customizable [title] and [content]
///
/// Return true if delete button was pressed, otherwise it will return false
class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        // TODO: old navigation
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(S.current.cancel_text.toUpperCase()),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(S.current.delete_text.toUpperCase()),
        ),
      ],
    );
  }
}
