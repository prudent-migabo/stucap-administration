import 'package:flutter/material.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/statics/statics.dart';

class HomeListStudentsSection extends StatelessWidget {
  const HomeListStudentsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index){
        return Column(
          children: [
            customListTile(
              title: 'Akilimali matumike',
              subtitle: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Text('FA : 300\$', style: TextStyle(fontSize: homeListStudentSectionSubtitleFontSize),),),
                  Expanded(child: Text('Promotion : L0', style: TextStyle(fontSize: homeListStudentSectionSubtitleFontSize)),),
                  Expanded(child: Text('Sexe : M', style: TextStyle(fontSize: homeListStudentSectionSubtitleFontSize)),),
                  Expanded(child: Text('Adresse : Q.Himbi, Av de Goma', style: TextStyle(fontSize: homeListStudentSectionSubtitleFontSize)),),
                ],
              ),
            ),
            const CustomDivider(height: 0,),
          ],
        );
    });
  }
}
