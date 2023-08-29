import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/statics/statics.dart';
import 'package:stucap_admin/utils/utils.dart';

class RegisterStudentForm extends StatefulWidget {
  const RegisterStudentForm({Key? key}) : super(key: key);

  @override
  State<RegisterStudentForm> createState() => _RegisterStudentFormState();
}

class _RegisterStudentFormState extends State<RegisterStudentForm> {

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _promotion = TextEditingController();
  final TextEditingController _academicFees = TextEditingController();
  final TextEditingController _bithDayController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String sexValue = '';
  String birthDayValue = '';
  DateTime _date1 = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: nameField(controller: _firstName, hintText: DataValues.firstNameHint, labelText: DataValues.firstNameHint),),
            filterSeparator,
            Expanded(child: nameField(controller: _middleName, hintText: DataValues.middleNameHint, labelText: DataValues.middleNameHint),),
            filterSeparator,
            Expanded(child: nameField(controller: _lastName, hintText: DataValues.lastNameHint, labelText: DataValues.lastNameHint),),
            filterSeparator,
            Expanded(child:
                dropdownTextField(
                    hintText: DataValues.sexHint,
                    listItems: ListHelper.sex,
                    onChanged: (value){
                      setState(() {
                        sexValue = value.toString();
                      });
                    }),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child:  datePickerField(
                controller: _bithDayController,
                   hintText: DataValues.birthDayNameHint,
                  onPressed: () async{
                    final pick = await pickDate(context);
                    setState(() {
                      _date1 = pick;
                      _bithDayController.text = "${_date1.day}/${_date1.month}/${_date1.year}";
                    });
                  },
                  onChanged: (value){},
              ),
            ),
            filterSeparator,
            Expanded(child: nameField(controller: _promotion, hintText: DataValues.promotionHint, labelText: DataValues.promotionHint),),
            filterSeparator,
            Expanded(child: nameField(controller: _academicFees, hintText: DataValues.academicFeesHint, labelText: DataValues.academicFeesHint),),
            filterSeparator,
            Expanded(child: nameField(controller: _addressController, hintText: DataValues.addressHint, labelText: DataValues.addressHint),
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: CustomButton(onPressed: (){}, text: DataValues.buttonRegisterAndGenerateQRCode)),
            Expanded(
              child: BarcodeWidget(
                barcode: Barcode.qrCode(
                  errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                ),
                data: 'Jh2ZHuD12lenzezXColp',
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
