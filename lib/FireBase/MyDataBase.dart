import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/FireBase/Model.dart';
import 'package:code/utils/Dialogs_utils_class.dart';
import 'package:flutter/cupertino.dart';

class MyDataBase {

  static CollectionReference<Task> getTaskCollection(){
    var ref = FirebaseFirestore.instance.collection("Tasks").withConverter(
        fromFirestore: (snapshot, options) => Task.fromFireStore(snapshot.data()!),
        toFirestore: (value, options) => value.toFireStore(),
    );
    return ref;
  }

  static Future<void> insertintodatabase(Task task)async{
    var ref = getTaskCollection();
    var doc = ref.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Stream<QuerySnapshot<Task>> getTaskDataStream(DateTime dateTime){
    return getTaskCollection().where('Date' , isEqualTo: dateTime.millisecondsSinceEpoch).snapshots();
  }

  static DeleteTask(Task task){
    var ref = getTaskCollection().doc(task.id);
    return ref.delete();
  }

  static UpdateTask(Task task){
    var ref = getTaskCollection().doc(task.id);
    return ref.update(task.toFireStore());
  }

}
