import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/application/news/form_bloc/i_news_form_bloc.dart';
import 'package:sports_complex_app/src/domain/news/i_news_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/domain/news/news.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';

@Injectable(
  as: INewsFormBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class NewsFormBloc extends INewsFormBloc with NewsFormValidator {
  NewsFormBloc(
    INewsFirestoreCrudRepository repository, {
    @factoryParam News? news,
    @factoryParam FormBlocPurpose? purpose,
  }) : super(repository, news, purpose);

  factory NewsFormBloc.forCreating() => getIt<INewsFormBloc>(
        param1: News.empty(),
        param2: FormBlocPurpose.creating,
      ) as NewsFormBloc;

  factory NewsFormBloc.forEditing(News news) => getIt<INewsFormBloc>(
        param1: news.clone(),
        param2: FormBlocPurpose.editing,
      ) as NewsFormBloc
        ..changeNewsTitle(news.title)
        ..changeNewsBody(news.body);

  final _newsTitle = BehaviorSubject<String>();
  final _newsBody = BehaviorSubject<String>();
  final _isValid = BehaviorSubject<bool>()..add(false);

  @override
  Stream<String> get newsTitle => _newsTitle.stream.transform(_validateTitle);

  StreamTransformer<String, String> get _validateTitle =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (rawTitle, sink) {
          final title = rawTitle.trim();
          obj!.title = title;
          sink.add(title);
          if (!isNewsTitleCorrect(title)) {
            // TODO: add localization
            sink.addError('Введите заголовок новости');
          }
        },
      );

  @override
  void changeNewsTitle(String? title) => _newsTitle.sink.add(title ?? '');

  @override
  Stream<String> get newsBody => _newsBody.stream.transform(_validateBody);

  StreamTransformer<String, String> get _validateBody =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (rawBody, sink) {
          final body = rawBody.trim();
          obj!.body = body;
          sink.add(body);
          if (!isNewsTitleCorrect(body)) {
            // TODO: add localization
            sink.addError('Заполните поле');
          }
        },
      );

  @override
  void changeNewsBody(String? body) => _newsBody.sink.add(body ?? '');

  @override
  void setAuthor(User author) => obj!.author = author;

  @override
  void setTimestamp() => obj!.timeStamp = DateTime.now();

  @override
  bool get isObjValid => _isValid.value ?? false;

  @override
  Stream<bool> get isObjValidStream => Rx.combineLatest2<String, String, bool>(
        newsTitle,
        newsBody,
        (a, b) {
          final isValid = isNewsTitleCorrect(a) && isNewsBodyCorrect(b);
          _isValid.sink.add(isValid);
          return _isValid.value ?? false;
        },
      );

  @override
  Future<void> dispose() async {
    await _newsTitle.close();
    await _newsBody.close();
    await _isValid.close();
  }
}

mixin NewsFormValidator {
  bool isNewsTitleCorrect(String title) => title.isNotEmpty;

  bool isNewsBodyCorrect(String body) => body.isNotEmpty;
}
