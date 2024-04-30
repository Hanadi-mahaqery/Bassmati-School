import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/Data/Student_DbHelper.dart';
import 'package:school_app/blocs/student_bloc.dart';
import 'package:school_app/models/StudentModel.dart';
import 'package:school_app/our_dialog.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({Key? key}) : super(key: key);

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  int maxNameCounter = 15;
  final _formKey = GlobalKey<FormState>();
  int nameCounter = 0;
  var nameCtr = TextEditingController();
  var ageCtr = TextEditingController();
  var emailCtr = TextEditingController();
  var phoneCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _bloc = context.read<StudentBloc>();
    return Container(
      height: 300,
      width: 300,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //=== name
              TextFormField(
                maxLength: 30,
                controller: nameCtr,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("اسم المستخدم"),
                  counter: Text("${nameCounter} of ${maxNameCounter}"),
                  hintText: "على الاقل 5 احرف",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                textDirection: TextDirection.rtl,
                onChanged: (value) {
                  if (value != null && value.length <= 30) {
                    nameCounter = value.length;
                    setState(() {});
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (nm) {
                  if (nm != null && nm.length < 3) {
                    return "Name must be more than 3 chars";
                  } else if (nm != null && nm.length > 30) {
                    return "Name must be less than 30 chars";
                  }
                },
                enabled: true,
              ),
              SizedBox(height: 15,),
              //=== age
              TextFormField(
                maxLength: 2,
                controller: ageCtr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Student Age"),
                  counter: Text("${nameCounter} of ${maxNameCounter}"),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                textDirection: TextDirection.rtl,
                onChanged: (value) {
                  if (value != null && value.length < 15) {
                    nameCounter = value.length;
                    setState(() {});
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                enabled: true,
              ),
              SizedBox(height: 15,),
              //=== email
              TextFormField(
                controller: emailCtr,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text("البريد الإلكتروني"),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 15,),
              //=== phone
              TextFormField(
                controller: phoneCtr,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  label: Text("رقم الهاتف"),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var s1 = StudentModel(
                      stuName: nameCtr.text,
                      age: ageCtr.text,
                      stuEmail: emailCtr.text,
                      stuPhoneNo: phoneCtr.text,
                    );
                    _bloc.add(Submit(s1));
                  }
                },
                child: Text('إرسال'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
