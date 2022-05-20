
import 'package:get_it/get_it.dart';
import 'package:lecture_app/routing/routes.gr.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocator() {

  getIt.registerSingleton<LectureAppRouter>(LectureAppRouter());

}