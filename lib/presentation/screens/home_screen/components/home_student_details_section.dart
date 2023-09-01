import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/statics/statics.dart';

class HomeStudentDetailsSection extends StatelessWidget {
  const HomeStudentDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BarcodeWidget(
          barcode: Barcode.qrCode(
            errorCorrectLevel: BarcodeQRCorrectionLevel.high,
          ),
          data: 'Jh2ZHuD12lenzezXColp',
          width: 150,
          height: 150,
        ),
        const SizedBox(height: 15,),
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
        const SizedBox(height: 20,),
        CustomButton(
          onPressed: (){},
          text: DataValues.editText,
        ),
      ],
    );
  }
}
