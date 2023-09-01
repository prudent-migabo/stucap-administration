import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/presentation/screens/home_screen/components/components.dart';
import 'package:stucap_admin/statics/statics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filterSelectedColor = AppThemeData.backgroundGrey.withOpacity(0.5);
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppThemeData.backgroundWhite,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Builder(builder: (context) {
              final state = context
                  .select((HomeFilterLogicCubit logic) => logic.state.index);
              return state == 1
                  ? const HomeScreenSection()
                  : state == 2
                  ? const HomeScreenSection()
                  : state == 3
                  ? const HomeScreenSection()
                  : state == 4
                  ? const HomeScreenSection()
                  : state == 5
                  ? const HomeScreenSection()
                  : state == 6
                  ? const HomeScreenSection()
                  : const HomeScreenSection();
            }),
          ],
        ),
      ),
    );
  }
}
