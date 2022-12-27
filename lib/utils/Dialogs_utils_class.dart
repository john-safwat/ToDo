import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DialogUtils{
  static void showDialogeMessage({required String Message ,required BuildContext context , bool isdeismessable = false}){
    showDialog(context: context, builder: (buildContext){
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 10,),
            Text(Message),
          ],
        ),
      );
    },
    barrierDismissible: isdeismessable,
    );
  }

  static void hideDialogMessage ({required BuildContext context}){Navigator.pop(context);}

  static void showMessage ({required String message , required BuildContext context , bool isdeismessable = false ,
    String? posActiontitle , VoidCallback? posAction, String? nigActiontitle , VoidCallback? nigAction}) {
    showDialog(context: context, builder: (context) {
      List<Widget> actions_list = [] ;
      if(posActiontitle != null){
        actions_list.add(TextButton (
            onPressed: (){
              Navigator.pop(context);
              if (posAction !=  null) {
                posAction();
              }
            },
            child: Text(posActiontitle)
          )
        );
      }
      if(nigActiontitle != null){
        actions_list.add(TextButton (
            onPressed: (){
              Navigator.pop(context);
              if (nigAction != null) {
                nigAction();
              }
            },
            child: Text(nigActiontitle)
        )
        );
      }
        return AlertDialog(
          content: Text(message),
          actions: actions_list,
        );
      },
      barrierDismissible: isdeismessable,
    );
  }

  static DateTime DateOnly(DateTime dateTime) {
    print('date = ${dateTime.toString()}');
    return DateTime(
      dateTime.year ,
      dateTime.month ,
      dateTime.day,
    );
  }
}