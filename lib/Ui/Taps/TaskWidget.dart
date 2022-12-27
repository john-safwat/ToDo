import 'package:code/FireBase/Model.dart';
import 'package:code/FireBase/MyDataBase.dart';
import 'package:code/Theme/MyTheme.dart';
import 'package:code/Ui/Taps/edittaskscreen.dart';
import 'package:code/utils/Dialogs_utils_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../provider/themeprovider.dart';

class TaskWidget extends StatelessWidget {
  Task task ;
  TaskWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    var themes = Provider.of<themeprovider>(context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, EditTaskScreen.routeName , arguments: task);
      },
      child: Container(
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
                  DialogUtils.showMessage(
                    message: "Are You Sure You Want TO Delete This Task",
                    context: context,
                    posActiontitle: "Yes",
                    posAction: ()async{
                      DialogUtils.showDialogeMessage(Message: "Loading....", context: context);
                      await MyDataBase.DeleteTask(task);
                      DialogUtils.hideDialogMessage(context: context);
                      DialogUtils.showMessage(
                        message: "Task Deleted ",
                        context: context,
                        posActiontitle: "Ok",
                        posAction: (){}
                      );
                    },
                    nigActiontitle: "Cancle",
                  );
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
              color: themes.isdark() ? MyTheme.LightBlack : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 110,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:task.isdone? MyTheme.Green : Theme.of(context).primaryColor,
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
                        Text(task.Title , style: task.isdone ?Theme.of(context).textTheme.headline3:Theme.of(context).textTheme.headline2,),
                        Text(task.Discription , style: Theme.of(context).textTheme.headline4,),
                        Row(
                          children: [
                            Icon(Icons.access_time , size: 15, color: !themes.isdark() ? MyTheme.LightBlack : Colors.white, ),
                            Text(" ${DateFormat.yMd().format(DateTime.fromMillisecondsSinceEpoch(task.Date))}", style: Theme.of(context).textTheme.headline5,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                task.isdone ?
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text("Done!", style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 22),),
                ):
                ElevatedButton(
                    onPressed: ()async{
                      task.isdone = true;
                      DialogUtils.showDialogeMessage(Message: "Loading....", context: context);
                      await MyDataBase.UpdateTask(task);
                      DialogUtils.hideDialogMessage(context: context);
                      DialogUtils.showMessage(message: "Greate Work You Done This Task 🤩", context: context,
                        posActiontitle: "Lets Go",
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                    ),
                    child: Icon(Icons.done_rounded ,size: 30 ,)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
