import 'package:flutter/material.dart';
import 'package:lecture_app/main.dart';
import 'package:lecture_app/models/lecture_model.dart';
import 'package:lecture_app/routing/route_names.dart';
import 'package:lecture_app/service_locator.dart';
import 'package:lecture_app/ui/widgets/materialize_widget.dart';
import 'package:lecture_app/ui/widgets/spacer.dart';
import '../../routing/routes.gr.dart';

import '../styles/colors..dart';

class LectureWidget extends StatelessWidget {
  const LectureWidget({Key? key, required this.lecture}) : super(key: key);

  final LectureModel lecture;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        audioHandler.prepareFromUri(Uri.parse(lecture.audioUrl!));
        getIt<LectureAppRouter>().pushNamed(playLectureScreenRoute.replaceAll(":id", lecture.lectureId!));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        // width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120, width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFC4C4C4)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: lecture.lectureId!,
                  child: Image.network("http://designwizard.com/wp-content/uploads/2019/09/Design-Wizard-Album-Cover-1.jpg")))
            ),
            const ColumnSpace(10),
            Hero(
              tag: lecture.title!.toLowerCase().replaceAll(' ', '-')+lecture.lectureId!,
              child: MaterializeWidget(
                child: Text("${lecture.title}", style: TextStyle(
                  fontSize: 16, color: textColor, fontWeight: FontWeight.w500
                ),),
              ),
            ),
            const ColumnSpace(5.39),
            Text(lecture.lecturer!.fullName!, style: TextStyle(
              fontSize: 10, color: textColor, fontWeight: FontWeight.w400
            ),),
          ],
        ),
      ),
    );
  }
}
