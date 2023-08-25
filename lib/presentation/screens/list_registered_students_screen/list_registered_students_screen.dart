import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';

class ListRegisteredStudentScreen extends StatelessWidget {
  const ListRegisteredStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemeData.secondaryColor,
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Column(
              children: [
                customListTile(
                  title: 'Amini serubagisha',
                  subtitle: const Text(
                    'FA: 300\$',
                    style: TextStyle(
                        fontSize: 13,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Divider(
                    thickness: 0.3,
                    color: AppThemeData.backgroundGrey,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
