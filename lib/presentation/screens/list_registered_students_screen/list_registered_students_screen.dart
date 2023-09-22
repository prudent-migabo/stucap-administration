import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/data/data.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/statics/statics.dart';
import 'package:stucap_admin/utils/utils.dart';

class ListRegisteredStudentScreen extends StatelessWidget {
  const ListRegisteredStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (context) {
            final drawerState = context.select((DrawerCubit cubit) =>
            cubit.state);
            return BlocBuilder<StudentCubit, StudentState>(
              builder: (context, state) {
                List<StudentModel> list = state.students.where((element) {
                  String value = drawerState == 'L0' ? 'L0' : drawerState == 'L1'
                      ? 'L1'
                      : drawerState == 'L2' ? 'L2' : drawerState == 'L3'
                      ? 'L3'
                      : drawerState == 'M1' ? 'M1' : drawerState == 'M2'
                      ? 'M2'
                      : 'L0';
                  return element.promotion == value;
                }).where((element) {
                  return element.inscriptionStatus == true;
                }).toList();
                return list.isEmpty ? const CustomNoData() : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      StudentModel studentModel = list[index];
                      return GestureDetector(
                        onTap: () {
                          infoPopup(
                            context,
                            title: DataValues.studentDetail,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: BarcodeWidget(
                                    barcode: Barcode.qrCode(
                                      errorCorrectLevel: BarcodeQRCorrectionLevel
                                          .high,
                                    ),
                                    data: studentModel.studentID!,
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                const SizedBox(height: 25,),
                                CustomRowListTileDescription(
                                  title: DataValues.firstNameHint,
                                  description: studentModel.firstName!,
                                ),
                                homeListStudentSectionRowDetailsSpacer,
                                CustomRowListTileDescription(
                                  title: DataValues.middleNameHint,
                                  description: studentModel.middleName!,
                                ),
                                homeListStudentSectionRowDetailsSpacer,
                                CustomRowListTileDescription(
                                  title: DataValues.lastNameHint,
                                  description: studentModel.lastName!,
                                ),
                                homeListStudentSectionRowDetailsSpacer,
                                CustomRowListTileDescription(
                                  title: DataValues.sexHint,
                                  description: studentModel.sex!,
                                ),
                                homeListStudentSectionRowDetailsSpacer,
                                CustomRowListTileDescription(
                                  title: DataValues.birthDayNameHint,
                                  description: 'Le ${studentModel.birthDay}',
                                ),
                                homeListStudentSectionRowDetailsSpacer,
                                CustomRowListTileDescription(
                                  title: DataValues.promotionHint,
                                  description: studentModel.promotion!,
                                ),
                                homeListStudentSectionRowDetailsSpacer,
                                CustomRowListTileDescription(
                                  title: DataValues.academicFeesHint,
                                  description: '${studentModel.academicFees
                                      .toString()}${studentModel.devise}',
                                ),
                                homeListStudentSectionRowDetailsSpacer,
                                CustomRowListTileDescription(
                                  title: DataValues.addressHint,
                                  description: studentModel.address!,
                                ),
                              ],
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            customListTile(
                              title: '${studentModel.firstName} ${studentModel
                                  .middleName} ${studentModel.lastName}',
                              subtitle: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(child: Text(
                                    'FA : ${studentModel.academicFees
                                        .toString()}${studentModel.devise}',
                                    style: TextStyle(
                                        fontSize: homeListStudentSectionSubtitleFontSize),),),
                                  Expanded(child: Text(
                                      'Promotion : ${studentModel.promotion}',
                                      style: TextStyle(
                                          fontSize: homeListStudentSectionSubtitleFontSize)),),
                                  Expanded(child: Text(
                                      'Sexe : ${studentModel.sex}',
                                      style: TextStyle(
                                          fontSize: homeListStudentSectionSubtitleFontSize)),),
                                  Expanded(child: Text(
                                      'Adresse : ${studentModel.address}',
                                      style: TextStyle(
                                          fontSize: homeListStudentSectionSubtitleFontSize)),),
                                ],
                              ),
                              trailing: TextButton(onPressed: () {},
                                  child: Text(
                                    DataValues.editText, style: TextStyle(
                                    fontWeight: bold,
                                    color: Theme
                                        .of(context)
                                        .primaryColor,
                                  ),)),
                            ),
                            const CustomDivider(height: 2,),
                          ],
                        ),
                      );
                    });
              },
            );
          }
      ),
    );
  }
}
