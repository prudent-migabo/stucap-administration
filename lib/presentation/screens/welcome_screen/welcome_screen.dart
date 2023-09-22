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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.backgroundGrey.withOpacity(0.4),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: DrawerScreen(),
          ),
          homeExpandedSpacer,
          Builder(builder: (context) {
            final state = context.select((DrawerCubit cubit) => cubit.state);
            return Expanded(
              flex: 3,
              child: state == 'L0'
                  ? const ListRegisteredStudentScreen()
                  : state == 'L1'
                  ? const ListRegisteredStudentScreen()
                  : state == 'L2'
                  ? const ListRegisteredStudentScreen()
                  : state == 'L3'
                  ? const ListRegisteredStudentScreen()
                  : state == 'M1'
                  ? const ListRegisteredStudentScreen()
                  : state == 'M2'
                  ? const ListRegisteredStudentScreen()
                  : state == 'MGL0'
                  ? const HomeScreenSection()
                  : state == 'MGL1'
                  ? const HomeScreenSection()
                  : state == 'MGL2'
                  ? const HomeScreenSection()
                  : state == 'MGL3'
                  ? const HomeScreenSection()
                  : state == 'MGM1'
                  ? const HomeScreenSection()
                  : state == 'MGM2'
                  ? const HomeScreenSection()
                      : Container(),
            );
          }),
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
