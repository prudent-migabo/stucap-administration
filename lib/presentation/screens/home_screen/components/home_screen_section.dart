import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/screens/home_screen/components/components.dart';
import 'package:stucap_admin/utils/utils.dart';

import '../../../../statics/statics.dart';

class HomeScreenSection extends StatefulWidget {
  const HomeScreenSection({Key? key}) : super(key: key);

  @override
  State<HomeScreenSection> createState() => _HomeScreenSectionState();
}

class _HomeScreenSectionState extends State<HomeScreenSection> {
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          DataValues.homeRegisterStudentSectionTitle,
          style: TextStyle(
            fontWeight: bold,
            fontSize:
            AppThemeData.lightTheme.textTheme.titleLarge!.fontSize,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const RegisterStudentForm(),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DataValues.homeListStudentSectionTitle,
              style: TextStyle(
                fontWeight: bold,
                fontSize:
                AppThemeData.lightTheme.textTheme.titleLarge!.fontSize,
              ),
            ),
            PopupMenuButton<String>(
              padding: const EdgeInsets.all(0),
              itemBuilder: (context){
                return ListHelper.deadlineFilter.map((element) {
                  return PopupMenuItem(
                    value: element,
                    child: Text(element, style: const TextStyle(fontSize: 13),),
                  );
                }).toList();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 7.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(selectedValue),
                    const Icon(Icons.arrow_drop_down, size: 40,),
                  ],
                ),
              ),
              onSelected: (value){
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Builder(
          builder: (context) {
            final state = context.select((HomeListStudentsCubit cubit) => cubit.state);
            final index = context.select((HomeListStudentsCubit cubit) => cubit.state.index);
            final isClicked = context.select((HomeListStudentsCubit cubit) => cubit.state.isClicked);
            print('ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc ${state.index}, ${state.isClicked}');
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Expanded(
                  flex: 2,
                  child: HomeListStudentsSection(
                    // color: state.index == index  && state.isClicked == !isClicked? AppThemeData.backgroundGrey.withOpacity(0.4) : null,
                  ),
                ),
               // state.index == index  && state.isClicked == true? filterSeparator : const SizedBox(width: 0,),
                state.index == 1 ? const Expanded(child: HomeStudentDetailsSection()) : Container(),
              ],
            );
          }
        ),
      ],
    );
  }
}
