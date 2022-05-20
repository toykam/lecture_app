import 'package:flutter/material.dart';
import 'package:lecture_app/models/lecture_model.dart';
import 'package:lecture_app/models/lecturer_model.dart';
import 'package:lecture_app/ui/widgets/spacer.dart';

import '../styles/colors..dart';

class LecturerWidget extends StatelessWidget {
  const LecturerWidget({Key? key, required this.lecturer}) : super(key: key);

  final LecturerModel lecturer;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [

          BoxShadow(
            color: Colors.red,
            offset: Offset(0,4)
          )
        ]
      ),
      margin: const EdgeInsets.only(right: 20),
      width: 100, height: 100,
      child: Stack(
        children: [
          Positioned.fill(child: Image.network("http://designwizard.com/wp-content/uploads/2019/09/Design-Wizard-Album-Cover-1.jpg", height: 120, width: 120,)),
          Positioned(
            left: 0, right: 0, bottom: 0,
            child: Container(
              color: primaryColor.withOpacity(.95),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text("${lecturer.fullName}", style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w400, fontSize: 10
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
