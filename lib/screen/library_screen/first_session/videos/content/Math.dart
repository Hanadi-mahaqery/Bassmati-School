import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/Data/DbHelper.dart';
import 'package:school_app/add_student.dart';
import 'package:school_app/blocs/library_bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/LibraryModel.dart';
import 'package:school_app/our_dialog.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/exam_schedule/data/exam_data.dart';
import 'package:school_app/screen/library_screen/first_session/videos/data/Math_content_data.dart';

class MathContentScreen extends StatelessWidget {
  const MathContentScreen({Key? key});

  static const String routeName = 'MathContentScreen';

  @override
  Widget build(BuildContext context) {
    var _bloc = context.read<StudentBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Math'),
      ),
      body: BlocBuilder<StudentBloc, StudentState>(
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.currentState == StateTypes.loaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                var library = state.items[index];

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 4),
                  padding: EdgeInsets.all(kDefaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Divider(thickness: 1.0, height: kDefaultPadding),
                      Text(
                        library.content ?? '',
                        style: TextStyle(color: kTextBlackColor, fontSize: 26.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: kDefaultPadding / 4),
                      YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: library.link ?? '',
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
            );
          } else if (state.currentState == StateTypes.error) {
            return Center(
              child: Text("Error: ${state.error}"),
            );
          }
          // Handle other states here if needed
          return SizedBox();
        },
      ),
    );
  }
}
