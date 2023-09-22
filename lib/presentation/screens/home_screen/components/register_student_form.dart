import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
import 'package:stucap_admin/data/data.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/statics/statics.dart';
import 'package:stucap_admin/utils/utils.dart';

class RegisterStudentForm extends StatefulWidget {
   RegisterStudentForm({Key? key, this.avatar}) : super(key: key);

   String? avatar;

  @override
  State<RegisterStudentForm> createState() => _RegisterStudentFormState();
}

class _RegisterStudentFormState extends State<RegisterStudentForm> {
  final _formKey = GlobalKey<FormState>();
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
  String devise = '';
  String promotion = '';

  onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<StudentCubit>().createStudent(StudentModel(
      avatar: '',
      firstName: _firstName.text.trim(),
      lastName: _lastName.text.trim(),
      middleName: _middleName.text.trim(),
      promotion: promotion,
      academicFees: double.parse(_academicFees.text.trim()),
      birthDay: _bithDayController.text.trim(),
      inscriptionStatus: true,
      presenceStatus: false,
      sex: sexValue,
      devise: devise,
      address: _addressController.text.trim(),
    ));
  }

  onClear() {
    _firstName.clear();
    _academicFees.clear();
    _lastName.clear();
    _middleName.clear();
    _addressController.clear();
    _bithDayController.clear();
    setState(() {
      widget.avatar = '';
      sexValue = '';
      devise = '';
    });
  }

  @override
  void initState() {
    context.read<StudentCubit>().initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentCubit, StudentState>(
      listener: (context, state) {
        if (state.studentStatus == StudentStatus.submitted) {
          onClear();
        } else if (state.studentStatus == StudentStatus.error) {
          errorDialog(context, content: state.error);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: nameField(
                      controller: _firstName,
                      hintText: DataValues.firstNameHint,
                      labelText: DataValues.firstNameHint),
                ),
                filterSeparator,
                Expanded(
                  child: nameField(
                      controller: _middleName,
                      hintText: DataValues.middleNameHint,
                      labelText: DataValues.middleNameHint),
                ),
                filterSeparator,
                Expanded(
                  child: nameField(
                      controller: _lastName,
                      hintText: DataValues.lastNameHint,
                      labelText: DataValues.lastNameHint),
                ),
                filterSeparator,
                Expanded(
                  child: dropdownTextField(
                      hintText: DataValues.sexHint,
                      listItems: ListHelper.sex,
                      onChanged: (value) {
                        setState(() {
                          sexValue = value.toString();
                        });
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: datePickerField(
                    controller: _bithDayController,
                    hintText: DataValues.birthDayNameHint,
                    onPressed: () async {
                      final pick = await pickDate(context);
                      setState(() {
                        _date1 = pick;
                        _bithDayController.text =
                        "${_date1.day}/${_date1.month}/${_date1.year}";
                      });
                    },
                    onChanged: (value) {
                      _bithDayController.text = value.toString();
                    },
                  ),
                ),
                filterSeparator,
                Expanded(
                  child: dropdownTextField(
                      hintText: 'Promotion',
                      listItems: ListHelper.promotion,
                      onChanged: (value) {
                        setState(() {
                          promotion = value.toString();
                        });
                      }),
                ),
                filterSeparator,
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: nameField(
                          controller: _academicFees,
                          hintText: DataValues.academicFeesHint,
                          labelText: DataValues.academicFeesHint),),
                      const SizedBox(width: 2,),
                      Expanded(
                        child: dropdownTextField(
                            hintText: "Devise",
                            listItems: ListHelper.devise,
                            onChanged: (value) {
                              setState(() {
                                devise = value.toString();
                              });
                            }),),
                    ],
                  ),
                ),
                filterSeparator,
                Expanded(
                  child: nameField(
                      controller: _addressController,
                      hintText: DataValues.addressHint,
                      labelText: DataValues.addressHint),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 3,
                child: BlocBuilder<StudentCubit, StudentState>(
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: state.studentStatus == StudentStatus.submitting
                          ? () {}
                          : onSubmit,
                      text: state.studentStatus == StudentStatus.submitting
                          ? 'Patientez...'
                          : DataValues.buttonRegisterAndGenerateQRCode,
                    );
                  },
                )),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<StudentCubit, StudentState>(
              builder: (context, state) {
                return state.studentID == '' ? Container() : BarcodeWidget(
                  barcode: Barcode.qrCode(
                    errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                  ),
                  data: state.studentID,
                  width: 150,
                  height: 150,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
