import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/blocs/meeting_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:url_launcher/url_launcher.dart';

class InComeMeetingScreen extends StatelessWidget {
 final bool meetStatus;

  const InComeMeetingScreen({Key?key, required this.meetStatus});
  static String routeName = 'InComeMeetingScreen';

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<MeetingBloc>(context);

    // جلب البيانات عند تحميل الواجهة
     WidgetsBinding.instance.addPostFrameCallback((_) {
     _bloc.add(FetchMeetingItemsByStatues(meetStatues: meetStatus));
     });

    return Scaffold(
      appBar: AppBar(
        title: Text('Up Coming Meeting'),
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
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2,
                        vertical: kDefaultPadding / 2,
                      ),
                      padding: EdgeInsets.all(kDefaultPadding / 1),
                      decoration: BoxDecoration(
                        color: kOtherColor,
                        borderRadius: BorderRadius.circular(kDefaultPadding * 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: kDefaultPadding / 2),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Meeting Link: ',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                WidgetSpan(
                                  child: InkWell(
                                    onTap: () async {
                                      final url = meeting.meetLink ?? '';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        // لا يمكن فتح الرابط
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Cannot open the link')),
                                        );
                                      }
                                    },
                                    child: Text(
                                      meeting.meetLink ?? '',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                    ),
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
                                  text: 'Meeting Time: ',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                TextSpan(
                                  text: meeting.meetTime ?? '',
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
                    SizedBox(height: 5.0),
                  ],
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
