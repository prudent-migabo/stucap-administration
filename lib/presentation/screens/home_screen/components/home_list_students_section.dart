import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/statics/statics.dart';
import 'package:stucap_admin/utils/utils.dart';

class HomeListStudentsSection extends StatefulWidget {
   HomeListStudentsSection({Key? key, this.color}) : super(key: key);
  Color? color;

  @override
  State<HomeListStudentsSection> createState() => _HomeListStudentsSectionState();
}

class _HomeListStudentsSectionState extends State<HomeListStudentsSection> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index){
        return GestureDetector(
          onTap: (){
            infoPopup(
              context,
              title: DataValues.studentDetail,
              onPressed: (){
                Navigator.pop(context);
              },
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: BarcodeWidget(
                      barcode: Barcode.qrCode(
                        errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                      ),
                      data: 'Jh2ZHuD12lenzezXColp',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 25,),
                  CustomRowListTileDescription(
                    title: DataValues.firstNameHint,
                    description: 'Akilimali',
                  ),
                  homeListStudentSectionRowDetailsSpacer,
                  CustomRowListTileDescription(
                    title: DataValues.middleNameHint,
                    description: 'mushayuma',
                  ),
                  homeListStudentSectionRowDetailsSpacer,
                  CustomRowListTileDescription(
                    title: DataValues.lastNameHint,
                    description: 'Norbert',
                  ),
                  homeListStudentSectionRowDetailsSpacer,
                  CustomRowListTileDescription(
                    title: DataValues.sexHint,
                    description: 'M',
                  ),
                  homeListStudentSectionRowDetailsSpacer,
                  CustomRowListTileDescription(
                    title: DataValues.birthDayNameHint,
                    description: 'Le 16/09/1890',
                  ),
                  homeListStudentSectionRowDetailsSpacer,
                  CustomRowListTileDescription(
                    title: DataValues.promotionHint,
                    description: 'L0',
                  ),
                  homeListStudentSectionRowDetailsSpacer,
                  CustomRowListTileDescription(
                    title: DataValues.academicFeesHint,
                    description: '200\$',
                  ),
                  homeListStudentSectionRowDetailsSpacer,
                  CustomRowListTileDescription(
                    title: DataValues.addressHint,
                    description: 'Q.Himbi, Av de Goma',
                  ),
                ],
              ),
            );
          },
          child: Column(
            children: [
              customListTile(
                backgroundColor: widget.color,
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
                trailing: TextButton(onPressed: (){}, child: Text(DataValues.editText, style: TextStyle(
                  fontWeight: bold,
                  color: Theme.of(context).primaryColor,
                ),)),
              ),
              const CustomDivider(height: 2,),
            ],
          ),
        );
    });
  }
}
