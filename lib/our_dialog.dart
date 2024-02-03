import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void GetDialog(BuildContext context, String title, Widget body){
  showDialog(context: context,
      builder:(context){
        return AlertDialog(
          title: Text("$title"),
          content: Container(
              constraints: BoxConstraints(
                  minWidth: 200,
                  maxWidth: 300,
                  maxHeight: 500,
                  minHeight: 250
              ),
              child: Center(child: body)),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("Close"))
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      } );
}