import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/application/news/form_bloc/i_news_form_bloc.dart';

class NewsTitleTextField extends StatelessWidget {
  const NewsTitleTextField({
    required this.formBloc,
    Key? key,
  }) : super(key: key);

  final INewsFormBloc formBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: formBloc.newsTitle,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: formBloc.obj?.title,
          keyboardType: TextInputType.name,
          onChanged: formBloc.changeNewsTitle,
          maxLength: 100,
          decoration: InputDecoration(
            labelText: 'Заголовок',
            prefixIcon: const Icon(Icons.short_text),
            errorText: snapshot.error as String?,
          ),
        );
      },
    );
  }
}