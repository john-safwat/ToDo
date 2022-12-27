class Task {
  String id;
  String Title;
  String Discription;
  int Date;
  bool isdone ;

  Task ({
    required this.id,
    required this.Title ,
    required this.Discription ,
    required this.Date ,
    this.isdone = false
  });

  Task.fromFireStore(Map<String , dynamic> data):this(
    id: data['id'],
    Title: data['Title'],
    Discription: data['Discription'] ,
    Date: data['Date'],
    isdone: data['isdone'],
  );

  Map<String,dynamic>toFireStore(){
    return{
      'id' :id,
      'Title':Title,
      'Discription':Discription,
      'Date':Date,
      'isdone':isdone
    };
  }
}