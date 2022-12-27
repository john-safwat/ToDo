import 'package:code/FireBase/Model.dart';
import 'package:code/FireBase/MyDataBase.dart';
import 'package:code/Ui/Taps/TaskWidget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class Tasks_List_Tap extends StatelessWidget {
  Task task = Task(Date: DateTime.now().millisecondsSinceEpoch , Title: "Go To GYM" , Discription: "I Must Go To GYM" , id: '');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: DatePicker(
              DateTime.now(),
              height: 90,
              width: 60,
              selectionColor: Colors.white,
              selectedTextColor: Theme.of(context).primaryColor,
              initialSelectedDate: DateTime.now(),
              deactivatedColor: Colors.white,
              dateTextStyle:const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
              monthTextStyle:const TextStyle(
                color: Colors.white,
              ),
              dayTextStyle:const TextStyle(
                color: Colors.white,
              ),
              onDateChange: (selectedDate) {

              },
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: StreamBuilder(
              stream: MyDataBase.getTaskDataStream(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
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
