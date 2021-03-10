import 'package:flutter/material.dart';
import 'package:sports_complex_app/src/presentation/common/confirmation_dialog.dart';

class DebugDialog extends StatelessWidget {
  const DebugDialog({
    @required this.content,
    Key key,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: 'TODO:',
      content: '$content. Ты понял?',
      confirmButtonText: 'Ок',
      refuseButtonText: 'Отмена',
    );
  }
}
