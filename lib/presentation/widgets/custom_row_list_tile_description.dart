import 'package:flutter/material.dart';

import '../../statics/statics.dart';

class CustomRowListTileDescription extends StatelessWidget {
  const CustomRowListTileDescription({Key? key, required this.title, required this.description, this.fontSize, this.flex}) : super(key: key);

  final String title;
  final String description;
  final double? fontSize;
  final int? flex;
  // final Widget? status;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: flex ?? 2,
          child: Text(title, style: TextStyle(fontSize: fontSize ?? 13),),),
        Expanded(child: Text(description, style: TextStyle(fontWeight: bold, fontSize: fontSize ?? 13),),),
      ],
    );
  }
}
