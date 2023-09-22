import 'package:flutter/material.dart';
import 'package:stucap_admin/statics/statics.dart';

class CustomNoData extends StatelessWidget {
  const CustomNoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.emptyImage),
          Text(
            'Pas de données',
            style: TextStyle(
              fontWeight: bold,
              fontSize: 15,
            ),
          ),
        ],
      );
  }
}
