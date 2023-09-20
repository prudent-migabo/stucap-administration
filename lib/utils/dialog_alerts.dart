import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stucap_admin/config/theming.dart';

import '../statics/statics.dart';

void infoPopup(
  BuildContext context, {
  required Widget? content,
  required String title,
  VoidCallback? onPressed,
  Color? titleColor,
  Color? actionBtnColor,
}) {
  Widget okButton() {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          'OK',
          style: TextStyle(
            color: AppThemeData.primaryColor,
            fontSize: AppThemeData.lightTheme.textTheme.titleMedium!.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  AlertDialog alert = AlertDialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    title: Text(
      title,
      style: TextStyle(
        color: AppThemeData.primaryColor,
        fontSize: AppThemeData.lightTheme.textTheme.titleMedium!.fontSize,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: content,
    actions: [
      okButton(),
    ],
  );

  showDialog(
      barrierDismissible: true, context: context, builder: (context) => alert);
}


/// Method that throws an error dialog box for the entire app
void errorDialog(BuildContext context, {required String content}) {
  Widget okButton() {
    return TextButton(onPressed: () => Navigator.pop(context), child: Text(
      'OK',
      style: TextStyle(
        fontWeight: bold,
        color: AppThemeData.errorTextColor,
      ),
    ),);
  }


  AlertDialog alert = AlertDialog(
    title: Text(
      'Erreur',
      style: TextStyle(
        fontWeight: bold,
        color: AppThemeData.errorTextColor,
      ),
    ),
    content: Text(
      content,
    ),
    actions: [
      okButton(),
    ],
  );

  showDialog(
      barrierDismissible: false, context: context, builder: (context) => alert);
}


void successToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppThemeData.backgroundGreen,
      textColor: Colors.white,
      gravity: ToastGravity.TOP);
}