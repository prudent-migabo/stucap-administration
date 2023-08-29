// Date picker method
import 'package:flutter/material.dart';

DateTime date = DateTime.now();

pickDate (BuildContext context) async{
  DateTime? newDate = await showDatePicker(
    context: context,
    initialDate: date,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );
  if (newDate == null) return;
  return newDate;
}