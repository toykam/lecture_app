// @dart=2.9

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:lecture_app/routing/routes.gr.dart';
import 'package:lecture_app/service_locator.dart';
import 'package:lecture_app/ui/styles/colors..dart';

import 'audio_player_handler.dart';

AudioHandler audioHandler;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.toykam.lectures.lecture_app',
      androidNotificationChannelName: 'lecture_player',
      androidNotificationOngoing: true,
    ),
  );

  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    final router = getIt<LectureAppRouter>();
    return MaterialApp.router(
      title: 'Lecture',
      theme: ThemeData(
        backgroundColor: backgroundColor
      ),
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      routeInformationProvider: router.routeInfoProvider(),
    );
  }
}



