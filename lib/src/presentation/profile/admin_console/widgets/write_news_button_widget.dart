import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sports_complex_app/generated/l10n.dart';
import 'package:sports_complex_app/src/application/news/form_bloc/news_form_bloc.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/news/news_form/news_form.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/news/news_form/news_form_inh_widget.dart';
import 'package:sports_complex_app/src/presentation/router/app_router.gr.dart';

class WriteNewsButton extends StatelessWidget {
  const WriteNewsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // TODO: placeholder
        await Navigator.push<void>(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => NewsFormInhWidget(
              newsFormBloc: NewsFormBloc.forCreating(),
              child: const NewsForm(),
            ),
          ),
        );
        // await context.router.push<void>(const NewsFormRoute());
      },
      child: ListTile(
        leading: const FaIcon(
          FontAwesomeIcons.newspaper,
          color: Colors.lightBlue,
        ),
        title: Text(
          S.current.write_news_text,
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
