import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/statics/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressed, required this.text, this.backgroundColor, this.width}) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppThemeData.cornerRadiusCardButton),
            ),
        ),
        child: Text(text,
          style: TextStyle(
            color: AppThemeData.textWhite,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}