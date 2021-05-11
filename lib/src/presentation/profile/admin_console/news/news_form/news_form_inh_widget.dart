import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/application/news/form_bloc/i_news_form_bloc.dart';

class NewsFormInhWidget extends InheritedWidget {
  const NewsFormInhWidget({
    required this.newsFormBloc,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final INewsFormBloc newsFormBloc;

  @override
  bool updateShouldNotify(NewsFormInhWidget oldWidget) {
    return oldWidget != this;
  }

  static NewsFormInhWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NewsFormInhWidget>();
  }

  Future<void> dispose() async {
    await newsFormBloc.dispose();
  }
}
