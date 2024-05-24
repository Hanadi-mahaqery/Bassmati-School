import 'package:flutter/material.dart';
import 'package:school_app/models/StudentModel.dart';
import 'package:school_app/blocs/student_bloc.dart';

class EditStudentPage extends StatefulWidget {
  final StudentModel student;
  final StudentBloc bloc;
  static const String routeName = 'EditStudentPage';

  const EditStudentPage({Key? key, required this.student, required this.bloc}) : super(key: key);

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student.stuName);
    _ageController = TextEditingController(text: widget.student.age);
    _emailController = TextEditingController(text: widget.student.stuEmail);
    _phoneController = TextEditingController(text: widget.student.stuPhoneNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final updatedStudent = StudentModel(
                  stuId: widget.student.stuId, // تأكد من تمرير معرف الطالب
                  stuName: _nameController.text,
                  age: _ageController.text,
                  stuEmail: _emailController.text,
                  stuPhoneNo: _phoneController.text,
                );

                widget.bloc.add(Update(updatedStudent)); // استخدم bloc لإرسال حدث التحديث
                Navigator.pop(context, true); // العودة إلى الصفحة السابقة بعد التحديث
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
