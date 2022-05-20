import 'package:audio_service/audio_service.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lecture_app/main.dart';
import 'package:lecture_app/routing/routes.gr.dart';
import 'package:lecture_app/service_locator.dart';
import 'package:lecture_app/ui/styles/colors..dart';
import 'package:lecture_app/ui/widgets/screen_with_bg.dart';
import 'package:lecture_app/ui/widgets/spacer.dart';
import 'package:seekbar/seekbar.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key, @PathParam('id') required this.lectureId}) : super(key: key);

  final String lectureId;

  @override
  Widget build(BuildContext context) {
    return ScreenWithBackgroundColor(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(28, 40.61, 0, 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () => getIt<LectureAppRouter>().pop(),
                  child: Icon(Icons.arrow_back, color: iconColor,)
                ),
                Expanded(
                  child: Text("Playing Now: $lectureId", style: TextStyle(
                    color: textColor, fontSize: 20, fontWeight: FontWeight.w500
                  ), textAlign: TextAlign.center,),
                ),
                Icon(Icons.search, color: backgroundColor,)
              ],
            ),
          ),
          const ColumnSpace(42),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Hero(
                tag: lectureId,
                child: Image.network("http://designwizard.com/wp-content/uploads/2019/09/Design-Wizard-Album-Cover-1.jpg", height: 261,))),
          ),
          const ColumnSpace(28),
          Column(
            children: [
              Text("Believer", style: TextStyle(
                color: textColor, fontSize: 24, fontWeight: FontWeight.w500
              ),),
              const ColumnSpace(5),
              Text("Imagine Dragon", style: TextStyle(
                  color: const Color(0xFFA5C0FF).withOpacity(.70), fontSize: 16, fontWeight: FontWeight.w200
              ),)
            ],
          ),
          Flexible(
            child: ColumnSpace(MediaQuery.of(context).size.height),
          ),
          StreamBuilder<Duration>(
            stream: AudioService.position,
            builder: (context, snapshot) {
              print("Duration2: ${snapshot.data?.inSeconds}");
              final second = snapshot.data!.inSeconds;
              final hour = second / 60 * 60;
              final minute = second / 60;

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${hour > 0 ? "$hour:" : ""}$minute:$second", style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w200, color: Color(0xFFA5C0FF)
                    ),),
                    Text("04:50", style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w200, color: Color(0xFFA5C0FF)
                    ),),
                  ],
                ),
              );
            }
          ),

          const ColumnSpace(26.94),

          StreamBuilder<Duration>(
            stream: AudioService.position,
            builder: (context, snapshot) {
              // print("Duration: ${snapshot.data}");
              final minute = snapshot.data!.inMinutes;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SeekBar(
                  value: 0.1,
                  barColor: const Color(0xFFFFFFFF).withOpacity(.31),
                  secondProgressColor: const Color(0xFFA5C0FF).withOpacity(.31),
                  secondValue: 0.3,
                  progressColor: Colors.white,
                  progressWidth: 4,
                )
              );
            }
          ),
          const ColumnSpace(70),

          StreamBuilder<PlaybackState>(
            stream: audioHandler.playbackState,
            builder: (context, snapshot) {
              final playing = snapshot.data?.playing ?? false;
              final processingState = snapshot.data?.processingState ?? AudioProcessingState.idle;

              if (processingState == AudioProcessingState.idle) {
                return const CircularProgressIndicator.adaptive();
              } else {
                return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.skip_previous_outlined, color: iconColor, size: 40,),
                  const RowSpace(37.6),
                  if (playing) InkWell(
                    onTap: () => audioHandler.pause(),
                    child: Icon(Icons.pause_outlined, color: iconColor, size: 40,)
                  ) else InkWell(
                    onTap: () => audioHandler.play(),
                    child: Icon(Icons.play_arrow_outlined, color: iconColor, size: 40,)
                  ),
                  const RowSpace(37.6),
                  Icon(Icons.skip_next_outlined, color: iconColor, size: 40,),
                ],
              );
              }
            }
          ),

          const ColumnSpace(46.86)
        ],
      ),
    );
  }
}
