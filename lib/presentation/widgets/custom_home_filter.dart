import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';

import '../../statics/statics.dart';

class CustomHomeFilter extends StatelessWidget {
  const CustomHomeFilter({Key? key, required this.text, required this.onPressed, this.color}) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: color,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppThemeData.backgroundBlack,),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: bold,
            ),
          ),
        ),
      ),
    );
  }
}
