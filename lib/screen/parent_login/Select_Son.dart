import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/ParentHomeScreen/ParentHomeScreen.dart';
import 'package:school_app/blocs/selectSon_bloc.dart'; // استيراد Bloc المناسب
import 'package:school_app/data_enum/state_types.dart'; // استيراد نوع الحالة

class SelectSon extends StatelessWidget {
  const SelectSon({super.key});
  static String routName = 'SelectSon';

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<SelectsonBloc>(context); // الحصول على Bloc

    // جلب البيانات عند تحميل الواجهة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(FetchStudentItemsByParentId(parentId: 2)); // استخدام معرف الأب المناسب هنا
    });

    return Scaffold(
      body: BlocBuilder<SelectsonBloc, SelectSonState>(
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.currentState == StateTypes.loaded) {
            return ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.0,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/boy.png',
                        height: 150.0,
                        width: 150.0,
                      ),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome in',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w200),
                              ),
                              Text('Bassmati School',
                                  style: Theme.of(context).textTheme.bodyMedium)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      Text(
                        'Select One of Your Kids',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultPadding * 3),
                        topRight: Radius.circular(kDefaultPadding * 3)),
                    color: kOtherColor,
                  ),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      var student = state.items[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SignType(
                            title: student.stuName ?? '',
                            icon: 'assets/icons/student.png',
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ParentHomeScreen(student: student),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state.currentState == StateTypes.error) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No Data Found'));
          }
        },
      ),
    );
  }
}

class SignType extends StatelessWidget {
  const SignType({super.key, required this.title, required this.icon, required this.onPress});
  final String title;
  final String icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding / 2),
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 11,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon, height: 40.0, width: 40.0, color: kOtherColor),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: kDefaultPadding / 3,
            ),
          ],
        ),
      ),
    );
  }
}