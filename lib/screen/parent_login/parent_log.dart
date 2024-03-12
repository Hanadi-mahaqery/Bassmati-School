import 'package:flutter/material.dart';
import 'package:school_app/Data/DbHelper.dart';
import 'package:school_app/add_student.dart';
import 'package:school_app/models/StudentModel.dart';

class ParentLogin extends StatefulWidget {
  const ParentLogin({super.key});
  static String routName = 'ParentLogin';

  @override
  State<ParentLogin> createState() => _ParentLoginState();
}

class _ParentLoginState extends State<ParentLogin> {
  @override
  Widget build(BuildContext context) {
    var list =SQL_Helper().getAll("Students");
    var clr = Colors.white54;
    return Scaffold(
      appBar: AppBar(
        title: Text("add student"),

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

      body: Container(
        child: FutureBuilder(
          future: SQL_Helper().getAll("Students"),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else if (snapshot.connectionState == ConnectionState.done){
              var dt = snapshot.data;
              List<StudentModel> students=[];
              if(dt != null){
                dt.forEach((element) {
                  students.add(StudentModel.fromJson(element));
                });
              }

              return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.all(10),

                      color: clr,
                      child: ListTile(
                        //style: ListTileStyle.drawer,
                        title: Text("${students[index].name}"),
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
                        subtitle: Text("${students[index].age}"),
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

            }
            else{
              return Text("ERROR: ${snapshot.error.toString()}");
                }
            },


        ),
      ),
    );
  }
}
