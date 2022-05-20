import 'package:flutter/material.dart';
import 'package:lecture_app/routing/route_names.dart';
import 'package:lecture_app/routing/routes.gr.dart';
import 'package:lecture_app/service_locator.dart';
import 'package:lecture_app/ui/styles/colors..dart';
import 'package:lecture_app/ui/widgets/spacer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void navigateToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    getIt<LectureAppRouter>().replaceNamed(homeScreenRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    navigateToHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RichText(
              text: TextSpan(
                  children: [
                    const TextSpan(text: "A", style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w700, color: Colors.red
                    ),),
                    TextSpan(text: "cademy ", style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w700, color: textColor
                    ),),
                    const TextSpan(text: "L", style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w700, color: Colors.red
                    ),),
                    TextSpan(text: "ecture", style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w700, color: textColor
                    ),),
                  ]
              ),
            ),
          ),
          const ColumnSpace(20),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text("please wait...", style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w200, fontStyle: FontStyle.italic,
              color: textColor
            ),),
          )
        ],
      ),
    );
  }
}
