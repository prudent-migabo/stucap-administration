import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';

//Name
Widget nameField({
  required TextEditingController controller,
  required String hintText,
  required String labelText,
  TextInputType? textInputType,
}) {
  return TextFormField(
    keyboardType: textInputType,
    controller: controller,
    validator: (val) => val!.isEmpty ? "Ce champ ne peut pas etre vide" : null,
    decoration: InputDecoration(
      hintText: hintText,
      labelText: labelText,
    ),
  );
}


Widget dropdownTextField ({
  required String hintText,
  required List listItems,
  required Function(Object? value) onChanged,
}){
  return DropdownButtonFormField(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 14,
        color: AppThemeData.textGrey,
      ),
    ),
    items: listItems.map((item)
    => DropdownMenuItem(
        value: item,
        child: Text(item, style: const TextStyle(fontSize: 13),))).toList(),
    onChanged: onChanged,
  );
}


Widget datePickerField({
  required TextEditingController controller,
  required VoidCallback onPressed,
  required String hintText,
  required Function(Object? value) onChanged,

}){
  return GestureDetector(
    onTap: onPressed,
    child: TextField(
      controller: controller,
      enabled: false,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      onChanged: onChanged,
    ),
  );
}