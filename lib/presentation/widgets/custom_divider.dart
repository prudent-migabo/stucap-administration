import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key, this.paddingLeft, this.height}) : super(key: key);

  final double? paddingLeft;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: paddingLeft ?? 80),
            child: Divider(
              height: height ?? 2,
        thickness: 0.5,
      ),
    );
  }
}
