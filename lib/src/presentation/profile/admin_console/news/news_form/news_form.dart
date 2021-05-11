import 'package:flutter/material.dart';
import 'package:sports_complex_app/injection.dart';

import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/application/news/form_bloc/i_news_form_bloc.dart';
import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/news/news_form/news_form_inh_widget.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/news/news_form/widgets/news_body_text_field.dart';
import 'package:sports_complex_app/src/presentation/profile/admin_console/news/news_form/widgets/news_title_text_field.dart';

class NewsForm extends StatefulWidget {
  const NewsForm({
    Key? key,
  }) : super(key: key);

  @override
  _NewsFormState createState() => _NewsFormState();
}

class _NewsFormState extends State<NewsForm> {
  NewsFormInhWidget? _inheritedWidget;
  INewsFormBloc? _formBloc;

  @override
  void didChangeDependencies() {
    _inheritedWidget ??= NewsFormInhWidget.of(context);
    _formBloc ??= _inheritedWidget!.newsFormBloc;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _formBloc!.purpose == FormBlocPurpose.creating
            ? const Text('Написать новость')
            : const Text('Редактировать новость'),
        actions: <Widget>[
          StreamBuilder<bool>(
            stream: _formBloc!.isObjValidStream,
            builder: (_, snapshot) {
              final isHallValid = snapshot.data ?? false;
              return IconButton(
                icon: const Icon(Icons.check),
                onPressed: isHallValid
                    ? () async {
                        _formBloc!
                          ..setAuthor(getIt<IUserBloc>().currentUser!)
                          ..setTimestamp();
                        final isSaved = await _formBloc!.saveObj();
                        if (isSaved) {
                          Navigator.of(context).pop();
                        }
                      }
                    : null,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                NewsTitleTextField(
                  formBloc: _formBloc!,
                ),
                NewsBodyTextField(
                  formBloc: _formBloc!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: !
    _inheritedWidget!.dispose();
    super.dispose();
  }
}
