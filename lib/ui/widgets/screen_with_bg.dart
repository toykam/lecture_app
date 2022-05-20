import 'package:flutter/material.dart';
import 'package:lecture_app/ui/styles/colors..dart';

class ScreenWithBackgroundColor extends StatelessWidget {
  const ScreenWithBackgroundColor({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: child
    );
  }
}
