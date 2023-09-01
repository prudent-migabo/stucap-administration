import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';

Widget customListTile({required String title, Widget? subtitle, Widget? leading, Color? backgroundColor, Widget? trailing}){
  return Container(
    color: backgroundColor,
    child: ListTile(
      leading: leading ?? const CircleAvatar(
        radius: 20,
        backgroundColor: AppThemeData.cardGrey,
        child:  Icon(Icons.person, color: AppThemeData.iconPrimary,),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 13,
        ),
      ),
      subtitle: subtitle,
      trailing: trailing,
    ),
  );
}