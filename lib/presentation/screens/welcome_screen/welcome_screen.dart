import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/presentation/screens/home_screen/components/home_screen_section.dart';

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

  bool isManagL0 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.backgroundGrey.withOpacity(0.4),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           Expanded(
              child: DrawerScreen(
                isL0: isL0,
                isL1: isL1,
                isL2: isL2,
                isL3: isL3,
                isM1: isM1,
                isM2: isM2,
                isManagL0: isManagL0,
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
                onManagL0Pressed: (){
                  setState(() {
                    isManagL0 = !isManagL0;
                  });
                },
              ),
          ),
          homeExpandedSpacer,
            Builder(
              builder: (context) {
                final state = context.select((DrawerCubit cubit) => cubit.state);
                return Expanded(
                  flex: 3,
                    child: state == 'L1' ? ListRegisteredStudentScreen() : state == 'MGL0' ? HomeScreenSection() : Container(),);
              }
            ),
                // child: isL0 ? ListRegisteredStudentScreen() : isManagL0? HomeScreen() :  Container()),
          // const Expanded(
          //   flex: 3,
          //     child: HomeScreen()),
        ],
      ),
    );
  }
}
// : isManagL0 ? const HomeScreen() : const ListRegisteredStudentScreen()