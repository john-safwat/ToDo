extension DateExtentions on DateTime {
  DateTime DateOnly (DateTime dateTime){
    return DateTime(
      dateTime.year ,
      dateTime.month ,
      dateTime.day,
    );
  }
}