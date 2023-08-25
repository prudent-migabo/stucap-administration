import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';

import '../../../statics/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/WelcomeScreen';
   WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isL0 = false;
  bool isL1 = false;
  bool isL2 = false;
  bool isL3 = false;
  bool isM1 = false;
  bool isM2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.backgroundGrey,
      body: Row(
        children: [
           Expanded(
              child: DrawerScreen(
                onL0Pressed: (){
                  setState(() {
                    isL0 = !isL0;
                  });
                },
                onL1Pressed: (){
                  setState(() {
                    isL1 = true;
                  });
                },
              ),
          ),
          homeExpandedSpacer,
           isL0 ? const Expanded(
              child: ListRegisteredStudentScreen(),
          ) : Container(),
          const Expanded(
            flex: 3,
              child: HomeScreen()),
        ],
      ),
    );
  }
}
