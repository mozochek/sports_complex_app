import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/domain/news/i_news_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/domain/news/news.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';

abstract class INewsFormBloc extends IFormBloc<News> {
  INewsFormBloc(
    INewsFirestoreCrudRepository repository,
    News? news,
    FormBlocPurpose? purpose,
  ) : super(
          repository: repository,
          obj: news,
          purpose: purpose,
        );

  Stream<String> get newsTitle;

  void changeNewsTitle(String? title);

  Stream<String> get newsBody;

  void changeNewsBody(String? body);

  void setAuthor(User author);

  void setTimestamp();
}
