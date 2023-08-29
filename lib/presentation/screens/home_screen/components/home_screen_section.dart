import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/screens/home_screen/components/components.dart';

import '../../../../statics/statics.dart';

class HomeScreenSection extends StatelessWidget {
  const HomeScreenSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
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
        Text(
          DataValues.homeListStudentSectionTitle,
          style: TextStyle(
            fontWeight: bold,
            fontSize:
            AppThemeData.lightTheme.textTheme.titleLarge!.fontSize,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: HomeListStudentsSection(),
            ),
            filterSeparator,
            const Expanded(child: HomeStudentDetailsSection()),
          ],
        ),
      ],
    );
  }
}
