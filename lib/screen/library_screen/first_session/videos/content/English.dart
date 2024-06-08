import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/exam_schedule/data/exam_data.dart';
import 'package:school_app/screen/library_screen/first_session/videos/data/English_content_data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../blocs/library_bloc.dart';
import '../../../../../data_enum/state_types.dart';



class EnglishContentScreen extends StatelessWidget {
  final int subjectId;
  final String subjectName;

  const EnglishContentScreen({Key? key, required this.subjectId, required this.subjectName}) : super(key: key);

  static const String routeName = 'EnglishContentScreen';

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<LibraryBloc>(context);

    // جلب الفيديوهات بناءً على subjectId
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(FetchLibraryItemsBySubjectId(subjectId: subjectId));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
      ),
      body: BlocBuilder<LibraryBloc, LibraryState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.currentState == StateTypes.loaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                var library = state.items[index];

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 4),
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Divider(thickness: 1.0, height: kDefaultPadding),
                      Text(
                        library.content ?? '',
                        style: const TextStyle(color: kTextBlackColor, fontSize: 26.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: library.link ?? '',
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressColors: const ProgressBarColors(
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
          return const SizedBox();
        },
      ),
    );
  }
}
/*class EnglishContentScreen extends StatelessWidget {
  const EnglishContentScreen({super.key});
  static const String routeName ='EnglishContentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kOtherColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(kDefaultPadding),
                topLeft: Radius.circular(kDefaultPadding)
            )
        ),
        child: ListView.builder(
            itemCount: examSchedule.length,
            itemBuilder: (context,index){
              return Container(


                margin: EdgeInsets.only(left: kDefaultPadding/2,
                    right: kDefaultPadding/2),
                padding: EdgeInsets.all(kDefaultPadding /2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: kDefaultPadding,
                      child: Divider(
                        thickness: 1.0,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(contentData[index].lessonName,
                              style: TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold
                              ),),

                            Text(contentData[index].link,
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w300,
                              ),),
                          ],
                        ),

                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}*/
