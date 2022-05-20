// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:lecture_app/ui/screens/home_screen/home_screen.dart' as _i2;
import 'package:lecture_app/ui/screens/player_screen/player_screen.dart' as _i3;
import 'package:lecture_app/ui/screens/splash_screen/splash_screen.dart' as _i1;

class LectureAppRouter extends _i4.RootStackRouter {
  LectureAppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeScreen.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    PlayerScreen.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PlayerScreenArgs>(
          orElse: () =>
              PlayerScreenArgs(lectureId: pathParams.getString('id')));
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.PlayerScreen(key: args.key, lectureId: args.lectureId));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i4.RouteConfig(SplashScreen.name, path: '/splash'),
        _i4.RouteConfig(HomeScreen.name, path: '/home'),
        _i4.RouteConfig(PlayerScreen.name, path: 'lectures/play/:id')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i4.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/splash');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i4.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/home');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i3.PlayerScreen]
class PlayerScreen extends _i4.PageRouteInfo<PlayerScreenArgs> {
  PlayerScreen({_i5.Key? key, required String lectureId})
      : super(PlayerScreen.name,
            path: 'lectures/play/:id',
            args: PlayerScreenArgs(key: key, lectureId: lectureId),
            rawPathParams: {'id': lectureId});

  static const String name = 'PlayerScreen';
}

class PlayerScreenArgs {
  const PlayerScreenArgs({this.key, required this.lectureId});

  final _i5.Key? key;

  final String lectureId;

  @override
  String toString() {
    return 'PlayerScreenArgs{key: $key, lectureId: $lectureId}';
  }
}
