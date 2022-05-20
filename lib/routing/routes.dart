import 'package:auto_route/annotations.dart';
import 'package:lecture_app/routing/route_names.dart';
import 'package:lecture_app/ui/screens/home_screen/home_screen.dart';
import 'package:lecture_app/ui/screens/player_screen/player_screen.dart';
import 'package:lecture_app/ui/screens/splash_screen/splash_screen.dart';


@AdaptiveAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: [
    AutoRoute(path: splashScreenRoute, page: SplashScreen, initial: true),
    AutoRoute(path: homeScreenRoute, page: HomeScreen),

    AutoRoute(path: playLectureScreenRoute, page: PlayerScreen),
  ]
)


class $LectureAppRouter {}