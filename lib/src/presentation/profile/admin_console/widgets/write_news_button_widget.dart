import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/presentation/common/debug_dialog.dart';

class WriteNewsButton extends StatelessWidget {
  const WriteNewsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // TODO: placeholder
        await showDialog<bool>(
          context: context,
          builder: (_) => const DebugDialog(
            content:
                'При тапе будет открываться окно добавления новости, но, возможно, функционал перенесется на экран новостей',
          ),
        );
      },
      child: ListTile(
        leading: const FaIcon(FontAwesomeIcons.pen, color: Colors.lightBlue,),
        title: Text(
          S.current.write_news_text,
        ),
      ),
    );
  }
}
