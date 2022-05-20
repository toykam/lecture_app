

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:lecture_app/main.dart';
import 'package:lecture_app/models/lecture_model.dart';
import 'package:lecture_app/models/lecturer_model.dart';
import 'package:lecture_app/ui/styles/colors..dart';
import 'package:lecture_app/ui/widgets/lecture_widget.dart';
import 'package:lecture_app/ui/widgets/lecturer_widget.dart';
import 'package:lecture_app/ui/widgets/screen_with_bg.dart';
import 'package:lecture_app/ui/widgets/spacer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWithBackgroundColor(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(28, 40.61, 20, 20),
            child: Row(
              children: [
                Icon(Icons.menu, color: iconColor,),
                const Spacer(),
                Icon(Icons.search, color: iconColor,)
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ColumnSpace(10),
                        Container(
                          margin: const EdgeInsets.only(left: 28),
                          child: Text("Recently Played", style: TextStyle(
                              color: textColor, fontSize: 24, fontWeight: FontWeight.w700
                          ),),
                        ),
                        const ColumnSpace(20),
                        Container(
                          margin: const EdgeInsets.only(left: 28),
                          height: 200,
                          child: ListView.builder(
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (builder, index) {
                              return LectureWidget(lecture: LectureModel(
                                description: "",
                                title: "Kaaffara",
                                audioUrl: "http://melody4arab.com/music/lebnan/maher_zain/forgive_me/Assalamu_Alayka_melody4arab.com.mp3",
                                imageUrl: "http://designwizard.com/wp-content/uploads/2019/09/Design-Wizard-Album-Cover-1.jpg",
                                createdAt: "",
                                lectureId: "lecture-recent-$index",
                                seriesId: "lecture-series-$index",
                                tags: "Islamic,Knowledge,Repentance",
                                lecturer: LecturerModel(
                                  fullName: "Imam Yahya",
                                  imageUrl: "",
                                  lecturerId: "lecturer-10"
                                )
                              ));
                            },
                          ),
                        ),

                        const ColumnSpace(15),
                        Container(
                          margin: const EdgeInsets.only(left: 28),
                          child: Text("Recently Added", style: TextStyle(
                            color: textColor, fontSize: 24, fontWeight: FontWeight.w700
                          ),),
                        ),
                        const ColumnSpace(20),
                        Container(
                          margin: const EdgeInsets.only(left: 28),
                          height: 200,
                          child: ListView.builder(
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (builder, index) {
                              return LectureWidget(lecture: LectureModel(
                                  description: "",
                                  title: "Kaaffara",
                                  audioUrl: "http://melody4arab.com/music/lebnan/maher_zain/forgive_me/Assalamu_Alayka_melody4arab.com.mp3",
                                  imageUrl: "http://designwizard.com/wp-content/uploads/2019/09/Design-Wizard-Album-Cover-1.jpg",
                                  createdAt: "",
                                  lectureId: "lecture-added-$index",
                                  seriesId: "lecture-series-$index",
                                  tags: "Islamic,Knowledge,Repentance",
                                  lecturer: LecturerModel(
                                      fullName: "Imam Yahya",
                                      imageUrl: "",
                                      lecturerId: "lecturer-10"
                                  )
                              ));
                            },
                          ),
                        ),

                        const ColumnSpace(15),
                        Container(
                          margin: const EdgeInsets.only(left: 28),
                          child: Text("Lecturers", style: TextStyle(
                            color: textColor, fontSize: 24, fontWeight: FontWeight.w700
                          ),),
                        ),
                        const ColumnSpace(20),
                        Container(
                          margin: const EdgeInsets.only(left: 28),
                          height: 100,
                          child: ListView.builder(
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (builder, index) {
                              return LecturerWidget(
                                lecturer: LecturerModel(
                                  fullName: "Imam Yahya",
                                  imageUrl: "",
                                  lecturerId: "lecturer-10"
                                ),
                              );
                            },
                          ),
                        ),


                        const ColumnSpace(100),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0, left: 0, right: 0,
                  child: StreamBuilder<PlaybackState>(
                    stream: audioHandler.playbackState,
                    builder: (context, snapshot) {
                      final playing = snapshot.data?.playing ?? false;
                      final processingState = snapshot.data?.processingState ?? AudioProcessingState.idle;

                      return (processingState == AudioProcessingState.idle )? Container() : Container(
                        color: primaryColor,
                        child: Row(
                          children: [
                            Image.network('http://designwizard.com/wp-content/uploads/2019/09/Design-Wizard-Album-Cover-1.jpg', height: 60, width: 60,),
                            const RowSpace(11),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Kaffaara", style: TextStyle(
                                    color: textColor, fontSize: 18.17
                                  ),),
                                  const ColumnSpace(5.46),
                                  Text("Sheik Abayomi", style: TextStyle(
                                    color: textColor, fontSize: 10.42, fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.skip_previous_outlined, color: iconColor,),
                                const RowSpace(16.67),
                                if (playing) InkWell(
                                    onTap: () => audioHandler.pause(),
                                    child: Icon(Icons.pause_outlined, color: iconColor)
                                ) else InkWell(
                                    onTap: () => audioHandler.play(),
                                    child: Icon(Icons.play_arrow_outlined, color: iconColor)
                                ),
                                const RowSpace(16.67),
                                Icon(Icons.skip_next_outlined, color: iconColor,),
                              ],
                            ),

                            const RowSpace(28.13),
                          ],
                        ),
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
