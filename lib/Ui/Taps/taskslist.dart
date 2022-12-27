import 'package:code/FireBase/Model.dart';
import 'package:code/FireBase/MyDataBase.dart';
import 'package:code/Ui/Taps/TaskWidget.dart';
import 'package:code/utils/extention.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Theme/MyTheme.dart';
import '../../provider/themeprovider.dart';

class Tasks_List_Tap extends StatefulWidget {
  @override
  State<Tasks_List_Tap> createState() => _Tasks_List_TapState();
}

class _Tasks_List_TapState extends State<Tasks_List_Tap> {
  Task task = Task(Date: DateTime.now().millisecondsSinceEpoch , Title: "Go To GYM" , Discription: "I Must Go To GYM" , id: '');

  DateTime date = DateTime.now().DateOnly(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var themes = Provider.of<themeprovider>(context);
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DatePicker(
              DateTime.now().DateOnly(DateTime.now()),
              height: 90,
              width: 60,
              selectionColor: themes.isdark() ? MyTheme.LightBlack : Colors.white,
              selectedTextColor: Theme.of(context).primaryColor,
              initialSelectedDate: DateTime.now().DateOnly(DateTime.now()),
              deactivatedColor: themes.isdark() ? MyTheme.LightBlack : Colors.white,
              dateTextStyle: TextStyle(
                color: themes.isdark() ? MyTheme.LightBlack : Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
              monthTextStyle: TextStyle(
                color: themes.isdark() ? MyTheme.LightBlack : Colors.white,
              ),
              dayTextStyle:TextStyle(
                color: themes.isdark() ? MyTheme.LightBlack : Colors.white,
              ),
              onDateChange: (selectedDate) {
                date = selectedDate;
                setState(() {

                });
              },
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: StreamBuilder(
              stream: MyDataBase.getTaskDataStream(date),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList();
                if (snapshot.hasError) {
                  return Center(child: Text("Loading Error"),);
                }else {
                  return ListView.builder(
                    itemBuilder: (context, index) => TaskWidget(task: tasks![index]),
                    itemCount: tasks!.length,
                  );
                }
              },
            ),
          )
        ],
      ),
    ) ;
  }
}
