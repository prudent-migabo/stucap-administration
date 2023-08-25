import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';

Widget customDrawerListTile({required String title, VoidCallback? onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: ListTile(
      leading: const Icon(Icons.people),
      title: Text(title,
        style: TextStyle(fontSize: AppThemeData.lightTheme.textTheme.titleSmall!.fontSize),
      ),
    ),
  );
}

Widget customDrawerSettingsListTile({required String title, required Widget leading}) {
  return ListTile(
    leading: leading,
    title: Text(title,
      style: TextStyle(fontSize: AppThemeData.lightTheme.textTheme.titleSmall!.fontSize),
    ),
  );
}