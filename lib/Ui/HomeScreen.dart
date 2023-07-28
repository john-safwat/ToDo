import 'package:code/FireBase/MyDataBase.dart';
import 'package:code/Theme/MyTheme.dart';
import 'package:code/Ui/Taps/Settings_Tap.dart';
import 'package:code/Ui/Taps/taskslist.dart';
import 'package:code/provider/themeprovider.dart';
import 'package:code/utils/Dialogs_utils_class.dart';
import 'package:code/utils/extention.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../FireBase/Model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen' ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int Index = 0;
  DateTime date = DateTime.now().DateOnly(DateTime.now());
  List<Widget> taps = [Tasks_List_Tap(), Settings_Tap()];
  TextEditingController Title = TextEditingController();
  TextEditingController Details = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    var themes = Provider.of<themeprovider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).hintColor,
      appBar: AppBar(
        title: Text("  To Do List" ),
      ),
      body: Stack(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Column(
            children: [
              Expanded(child: taps[Index]),
            ],
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 8 , color: themes.isdark() ? MyTheme.LightBlack : Colors.white,),
          borderRadius: BorderRadius.circular(1000)
        ),
        child: FloatingActionButton(
          onPressed: (){
            showTaskModalButtomSheet(context , themes);
          },
          child:const Icon(Icons.add , color: Colors.white, size: 34,),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: themes.isdark() ? MyTheme.LightBlack : Colors.white,
        shape:const CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(

          currentIndex: Index,
          elevation: 0,
          onTap: (value) {
            Index = value;
            setState(() {});
          },
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
  Future<void> showTaskModalButtomSheet(BuildContext context , themeprovider themes){
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: themes.isdark()? MyTheme.DarkBlue : Colors.white,
        shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft:  Radius.circular(20)
        )),
        builder: (context) {
          return Container(
            height:  MediaQuery.of(context).size.height *0.7,
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Add Task" , style: Theme.of(context).textTheme.headline4!.copyWith(fontSize:24), textAlign: TextAlign.center,),
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
                    controller: Details,
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
                      prefixIcon: Icon(Icons.text_snippet_outlined , color: themes.isdark()?Colors.white : Colors.grey,) ,
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
                  GestureDetector(
                    child: Text("${DateFormat.yMd().format(date)}",style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.center,),
                    onTap: ()async{
                      ShowDatePicker();
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed:()async{
                      if(formkey.currentState!.validate()){
                        DialogUtils.showMessage(
                          message: "Are You Sure You Want to Add",
                          context: context,
                          posActiontitle: "Yes",
                          posAction: () async{
                            DialogUtils.showDialogeMessage(Message: "Loading....", context: context);
                            Task task = Task(id: "", Title: Title.text, Discription: Details.text, Date: date.millisecondsSinceEpoch);
                            await MyDataBase.insertintodatabase(task);
                            Title.text = '';
                            Details.text = '';
                            date = DateTime.now().DateOnly(DateTime.now());
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
                        const Icon(Icons.done_rounded , color: Colors.white,),
                        const SizedBox(width: 10,),
                        Text("Add" , style: Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
    );
  }
  Future<void> ShowDatePicker()async{
    var userselecteddate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (userselecteddate == null ) {
        return;
    }
    else {
      date = userselecteddate;
      setState(() {

      });
    }
  }
}
