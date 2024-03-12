import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/Data/DbHelper.dart';
import 'package:school_app/add_student.dart';
import 'package:school_app/blocs/student_bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/StudentModel.dart';
import 'package:school_app/our_dialog.dart';

class Student extends StatefulWidget {
  const Student({super.key});
  static String routeName = 'Student';

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    var _bloc = context.read<StudentBloc>();
    var list =SQL_Helper().getAll("Students");
    var clr = Colors.white54;
    return Scaffold(
      appBar: AppBar(
        title: Text("students"),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          var res = await  showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Add Student"),
                  content: AddStudentPage(),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [



                    TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel")),
                  ],
                );
              });
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),

      body: BlocBuilder<StudentBloc, StudentState>(
        builder: (context,state){
          switch(state.currentState){
            case StateTypes.loading:{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Colors.blueAccent,),
                    SizedBox(height: 10,),
                    Text("Loading...", style: TextStyle(color: Colors.blueAccent),),
                  ],
                ),
              );
            }break;

            case StateTypes.loaded:{
              return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.all(10),

                      color: clr,
                      child: ListTile(
                        //style: ListTileStyle.drawer,
                        title: Text("${state.items[index].name}"),
                        leading: CircleAvatar(
                          radius: 50,
                          foregroundColor: Colors.purple,
                          backgroundColor: Colors.purple,
                          child: CircleAvatar(
                            //backgroundColor: Colors.red,

                            /*child: Image.asset(
                          "assets/images/11.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),*/
                            backgroundImage: AssetImage(
                                "assets/images/kid.jpg"
                            ),
                            backgroundColor: Colors.teal,
                            radius: 25,
                          ),
                        ),
                        trailing: Icon(Icons.settings),
                        subtitle: Text("${state.items[index].age}"),
                        onTap: (){
                          clr = clr==Colors.lightBlue?Colors.yellow:Colors.lightBlue;
                          setState(() {

                          });
                          //print("========= ${names[index]} pressed ==========");
                        },
                        onLongPress: (){

                          setState(() {
                            clr = Colors.purple;
                          });
                        },
                      ),
                    );
                  }
              );
            }break;

            case StateTypes.error:{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red,),
                    SizedBox(height: 10,),
                    Text("Error: ${state.error}", style: TextStyle(color: Colors.red),),
                  ],
                ),
              );
            }break;

            case StateTypes.submitting:{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Colors.blueAccent,),
                    SizedBox(height: 10,),
                    Text("Submitting...", style: TextStyle(color: Colors.blueAccent),),
                  ],
                ),
              );
            }break;

            case StateTypes.submitted:{
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                GetDialog(context, "Added Successfully", Icon(Icons.check_circle_outline, color: Colors.green,));
              });
              _bloc.add(LoadData());
              return SizedBox();
            }break;

            default: {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red,),
                    SizedBox(height: 10,),
                    Text("Error: Unknown Sate", style: TextStyle(color: Colors.red),),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
