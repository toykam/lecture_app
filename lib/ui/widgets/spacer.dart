import 'package:flutter/cupertino.dart';

class ColumnSpace extends StatelessWidget {
  const ColumnSpace(this.height, {Key? key}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height,);
  }
}

class RowSpace extends StatelessWidget {
  const RowSpace(this.width, {Key? key}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}