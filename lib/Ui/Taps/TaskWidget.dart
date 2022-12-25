import 'package:code/FireBase/Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class TaskWidget extends StatelessWidget {
  Task task ;
  TaskWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Slidable(
        key : const ValueKey(1),
        startActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 2,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20) ,bottomLeft: Radius.circular(20)),
              onPressed: (BuildContext) async {

              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding:const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 110,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                width: 5,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(task.Title , style: Theme.of(context).textTheme.headline2,),
                      Text(task.Discription , style: Theme.of(context).textTheme.headline4,),
                      Row(
                        children: [
                          Icon(Icons.access_time , size: 15,),
                          Text("${DateFormat.yMd().format(DateTime.fromMillisecondsSinceEpoch(task.Date))}", style: Theme.of(context).textTheme.headline5,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                  ),
                  child: Icon(Icons.done_rounded)
              )
            ],
          ),
        ),
      ),
    );
  }
}
