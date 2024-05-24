import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/Data/Student_DbHelper.dart';
import 'package:school_app/EditStudentPage.dart';
import 'package:school_app/add_student.dart';
import 'package:school_app/blocs/student_bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/StudentModel.dart';
import 'package:school_app/our_dialog.dart';
import 'package:school_app/repositories/student_repository.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  static const String routeName = 'StudentScreen';

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  late StudentBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = StudentBloc(repository: StudentRepository());
    _bloc.add(LoadStudentData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add Student'),
              content: AddStudentPage(),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel'),
                ),
              ],
            ),
          );
          if (result != null && result is bool && result) {
            _bloc.add(LoadStudentData());
          }
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<StudentBloc, StudentState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.blueAccent),
                  SizedBox(height: 10),
                  Text(
                    'Loading...',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ],
              ),
            );
          } else if (state.currentState == StateTypes.loaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final student = state.items[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/kid.jpg"),
                  ),
                  title: Text(student.stuName ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(student.age ?? ''),
                      Text(student.stuEmail ?? ''),
                      Text(student.stuPhoneNo ?? ''),
                    ],
                  ),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditStudentPage(student: student, bloc: _bloc,),
                      ),
                    );
                    if (result == true) {
                      _bloc.add(LoadStudentData());
                    }
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      print(student.stuId);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm Delete'),
                            content: Text('Are you sure you want to delete this student?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  _bloc.add(Delete(studentId: student.stuId!)); // هنا تأكد من استخدام student.stuId
                                },
                                child: Text('Delete'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          } else if (state.currentState == StateTypes.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red),
                  SizedBox(height: 10),
                  Text(
                    'Error: ${state.error}',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            );
          } else if (state.currentState == StateTypes.submitting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.blueAccent),
                  SizedBox(height: 10),
                  Text(
                    'Submitting...',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ],
              ),
            );
          } else if (state.currentState == StateTypes.submitted) {
            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
              GetDialog(context, "Updated Successfully",

                  Icon(Icons.check_circle_outline, color: Colors.green));
            });
            return SizedBox();
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red),
                  SizedBox(height: 10),
                  Text(
                    'Error: Unknown State',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
