import 'package:code/FireBase/Model.dart';
import 'package:code/provider/themeprovider.dart';
import 'package:code/utils/extention.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../FireBase/MyDataBase.dart';
import '../../Theme/MyTheme.dart';
import '../../utils/Dialogs_utils_class.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName = 'Edit task Screen';

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  bool taskadded = false ;
  late Task task;
  TextEditingController Title = TextEditingController();
  TextEditingController Detalis = TextEditingController();
  DateTime date = DateTime.now().DateOnly(DateTime.now());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if(!taskadded){
      task = ModalRoute.of(context)?.settings.arguments as Task;
      Title.text = task.Title;
      Detalis.text = task.Discription;
      date = DateTime.fromMillisecondsSinceEpoch(task.Date);
      taskadded = true;
    }
    var themes = Provider.of<themeprovider>(context);
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text("To Do List"),
        elevation: 0,
        leading: BackButton(
            color: themes.isdark()?Colors.black : Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 100,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: mediaquery.height*0.75,
                  width: mediaquery.width*0.85,
                  decoration: BoxDecoration(
                    color: themes.isdark() ? MyTheme.LightBlack : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.2),
                        blurRadius: 20
                      ),
                    ],
                  ),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Text("Edit Task" , style: themes.isdark()? Theme.of(context).textTheme.headline1:Theme.of(context).textTheme.headline1?.copyWith(color: Colors.black),),
                        const SizedBox(height: 40,),
                        TextFormField(
                          controller: Title,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Invalid Task Lable";
                            }
                            return null;
                          },
                          style: Theme.of(context).textTheme.headline4,
                          decoration: InputDecoration(
                            contentPadding:const EdgeInsets.all(20),
                            prefixIcon: Icon(Icons.label , color: themes.isdark()?Colors.white : Colors.grey,) ,
                            label:Text('Task Lable' , style : Theme.of(context).textTheme.headline4 ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: !themes.isdark() ? MyTheme.LightBlack : Colors.white, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
                              borderRadius:const BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: MyTheme.Red, width: 2.0),
                              borderRadius:const BorderRadius.all(Radius.circular(5)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: MyTheme.Red, width: 2.0),
                              borderRadius:const BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        TextFormField(
                          controller: Detalis,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Invalid Task Lable";
                            }
                            return null;
                          },
                          style: Theme.of(context).textTheme.headline4,
                          decoration: InputDecoration(
                            contentPadding:const EdgeInsets.all(20),
                            prefixIcon: Icon(Icons.label , color: themes.isdark()?Colors.white : Colors.grey,) ,
                            label:Text('Task Details' , style : Theme.of(context).textTheme.headline4 ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: !themes.isdark() ? MyTheme.LightBlack : Colors.white, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
                              borderRadius:const BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: MyTheme.Red, width: 2.0),
                              borderRadius:const BorderRadius.all(Radius.circular(5)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: MyTheme.Red, width: 2.0),
                              borderRadius:const BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          children: [
                            Text("Pick Date" , style: Theme.of(context).textTheme.headline4!.copyWith(fontSize:24),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        InkWell(
                          child: Text("${DateFormat.yMd().format(date)}",style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.center,),
                          onTap: ()async{
                            ShowDatePicker(date);
                          },
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed:()async{
                            if(formkey.currentState!.validate()){
                              DialogUtils.showMessage(
                                message: "Are You Sure You Want to Edit Task",
                                context: context,
                                posActiontitle: "Yes",
                                posAction: () async{
                                  DialogUtils.showDialogeMessage(Message: "Loading....", context: context);
                                  task.Title = Title.text;
                                  task.Discription = Detalis.text;
                                  task.Date = date.millisecondsSinceEpoch;
                                  await MyDataBase.UpdateTask(task);
                                  DialogUtils.hideDialogMessage(context: context);
                                  Navigator.pop(context);
                                },
                                nigActiontitle: "No",
                              );
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.edit_rounded , color: Colors.white,),
                              const SizedBox(width: 10,),
                              Text("Edit" , style: Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> ShowDatePicker(DateTime dateTime)async{
    return showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((value) {
      setState(() {
        date = value!;
      });
    });
  }
}
