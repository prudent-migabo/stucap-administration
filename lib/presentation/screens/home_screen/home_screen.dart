import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/presentation/screens/home_screen/components/components.dart';
import 'package:stucap_admin/statics/statics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppThemeData.backgroundWhite,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: CustomHomeFilter(onPressed: (){}, text: 'L0',),),
                filterSeparator,
                Expanded(child: CustomHomeFilter(onPressed: (){}, text: 'L1',),),
                filterSeparator,
                Expanded(child: CustomHomeFilter(onPressed: (){}, text: 'L2',),),
                filterSeparator,
                Expanded(child: CustomHomeFilter(onPressed: (){}, text: 'L3',),),
                filterSeparator,
                Expanded(child: CustomHomeFilter(onPressed: (){}, text: 'M1',),),
                filterSeparator,
                Expanded(child: CustomHomeFilter(onPressed: (){}, text: 'M2',),),
              ],
            ),
            const SizedBox(height: 30,),
            RegisterStudentForm(),
          ],
        ),
      ),
    );
  }
}
