import 'package:flutter/material.dart';
import 'package:school_app/Data/DbHelper.dart';
import 'package:school_app/models/LibraryModel.dart';
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

  @override
  Widget build(BuildContext context) {
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
                          color: Colors.grey
                      ),
                      prefixIcon: Icon(Icons.person)
                  ),
                  textDirection: TextDirection.rtl,
                  onChanged: (value){
                    if(value != null && value.length <=30){
                      print("====${value} ---- ${value.length}");
                      nameCounter = value.length;
                      setState(() {

                      });
                    }
                  },

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (nm){
                    if(nm != null && nm.length < 3){
                      return "Name must be more than 3 chars";
                    }
                    else if(nm != null && nm.length > 30){
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
                      //  hintText: "على الاقل 5 احرف",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      prefixIcon: Icon(Icons.person)
                  ),
                  textDirection: TextDirection.rtl,
                  onChanged: (value){
                    if(value != null && value.length <15){
                      print("====${value} ---- ${value.length}");
                      nameCounter = value.length;
                      setState(() {

                      });
                    }
                  },

                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  enabled: true,

                ),

                SizedBox(height: 15,),
                /*TextButton(

                    onPressed: ()async{

                      if(_formKey.currentState!.validate()){
                        var s1= StudentModel(Content: nameCtr.text, Link: int.parse(ageCtr.text));
                        var addRes = await SQL_Helper().insert("E_Library", s1.toJson());
                        if(addRes > 0){

                          Navigator.of(context).pop(addRes);
                        }
                        else{
                          GetDialog(context, "Error in Add", Icon(Icons.error));
                        }
                        print("===== addRes: ${addRes}");

                      }
                      else{
                        print("===== Form not valid");
                      }

                    },
                    child: Text("Send"))*/
              ],
            ),
          )),
    );
  }
}
