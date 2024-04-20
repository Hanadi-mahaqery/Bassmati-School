import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/exam_schedule/data/exam_data.dart';
import 'package:school_app/screen/library_screen/first_session/videos/data/Math_content_data.dart';

class Math2ContentScreen extends StatelessWidget {
  const Math2ContentScreen({Key? key});

  static const String routeName = 'Math2ContentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(kDefaultPadding),
            topLeft: Radius.circular(kDefaultPadding),
          ),
        ),
        child: ListView.builder(
          itemCount: contentData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 4),
              padding: EdgeInsets.all(kDefaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(thickness: 1.0, height: kDefaultPadding),
                  Text(
                    contentData[index].lessonName,
                    style: TextStyle(color: kTextBlackColor, fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: kDefaultPadding / 4),
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: contentData[index].videoId,
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                    progressColors: ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
