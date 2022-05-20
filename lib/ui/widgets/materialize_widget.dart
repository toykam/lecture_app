import 'package:flutter/material.dart';

class MaterializeWidget extends StatelessWidget {
  const MaterializeWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: child,
    );
  }
}
