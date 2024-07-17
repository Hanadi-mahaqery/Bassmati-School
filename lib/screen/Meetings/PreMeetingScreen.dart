import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/blocs/meeting_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:url_launcher/url_launcher.dart';

class PreMeetingScreen extends StatelessWidget {
  final bool meetStatus;

  const PreMeetingScreen({Key? key, required this.meetStatus});
  static String routeName = 'PreMeetingScreen';

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<MeetingBloc>(context);

    // جلب البيانات عند تحميل الواجهة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(FetchMeetingItemsByStatues(meetStatues: meetStatus));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Meetings'),
      ),
      body: BlocBuilder<MeetingBloc, MeetingState>(
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.currentState == StateTypes.loaded) {
            if (state.items.isEmpty) {
              return Center(child: Text("No meetings found for the selected status."));
            }
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                var meeting = state.items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Topics: ',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                              TextSpan(
                                text: meeting.topics ?? '',
                                style: TextStyle(
                                  color: kTextBlackColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: kDefaultPadding / 2),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Decisions: ',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                              TextSpan(
                                text: meeting.decisions ?? '',
                                style: TextStyle(
                                  color: kTextBlackColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state.currentState == StateTypes.error) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No Meetings Found'));
          }
        },
      ),
    );
  }
}