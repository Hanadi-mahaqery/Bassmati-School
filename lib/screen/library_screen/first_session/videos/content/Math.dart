import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:school_app/blocs/library_bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/constant.dart';

class MathContentScreen extends StatelessWidget {
  const MathContentScreen({Key? key}) : super(key: key);

  static const String routeName = 'MathContentScreen';

  @override
  Widget build(BuildContext context) {
    // Use BlocProvider.of to access the StudentBloc
    var _bloc = BlocProvider.of<LibraryBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Math'),
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
          // Handle other states here if needed
          return const SizedBox();
        },
      ),
    );
  }
}
