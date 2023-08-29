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
            Builder(
              builder: (context) {
                final state = context
                    .select((HomeFilterLogicCubit logic) => logic.state.index);
                return Row(
                  children: [
                    Expanded(
                      child: CustomHomeFilter(
                        onPressed: () {
                          context.read<HomeFilterLogicCubit>().emitterIndex1();
                        },
                        text: 'L0',
                        color: state ==1 ? filterSelectedColor : null,
                      ),
                    ),
                    filterSeparator,
                    Expanded(
                      child: CustomHomeFilter(
                        onPressed: () {
                          context.read<HomeFilterLogicCubit>().emitterIndex2();
                        },
                        text: 'L1',
                        color: state ==2 ? filterSelectedColor : null,
                      ),
                    ),
                    filterSeparator,
                    Expanded(
                      child: CustomHomeFilter(
                        onPressed: () {
                          context.read<HomeFilterLogicCubit>().emitterIndex3();
                        },
                        text: 'L2',
                        color: state ==3 ? filterSelectedColor : null,
                      ),
                    ),
                    filterSeparator,
                    Expanded(
                      child: CustomHomeFilter(
                        onPressed: () {
                          context.read<HomeFilterLogicCubit>().emitterIndex4();
                        },
                        text: 'L3',
                        color: state ==4 ? filterSelectedColor : null,
                      ),
                    ),
                    filterSeparator,
                    Expanded(
                      child: CustomHomeFilter(
                        onPressed: () {
                          context.read<HomeFilterLogicCubit>().emitterIndex5();
                        },
                        text: 'M1',
                        color: state ==5 ? filterSelectedColor : null,
                      ),
                    ),
                    filterSeparator,
                    Expanded(
                      child: CustomHomeFilter(
                        onPressed: () {
                          context.read<HomeFilterLogicCubit>().emitterIndex6();
                        },
                        text: 'M2',
                        color: state ==6 ? filterSelectedColor : null,
                      ),
                    ),
                  ],
                );
              }
            ),
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
