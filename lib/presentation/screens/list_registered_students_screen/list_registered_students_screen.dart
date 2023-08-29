import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/statics/statics.dart';
import 'package:stucap_admin/utils/utils.dart';

class ListRegisteredStudentScreen extends StatelessWidget {
  const ListRegisteredStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      color: AppThemeData.secondaryColor,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
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
              ),
            );
          }),
    );
  }
}
