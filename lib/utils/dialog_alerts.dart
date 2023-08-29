import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';

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
