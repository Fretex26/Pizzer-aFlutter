import 'package:flutter/material.dart';
import '../components/custom_button.dart';

void showAlert(context, String alertText) {
  var alerDialog = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    backgroundColor: const Color.fromARGB(255, 255, 223, 184),
    title: Text(alertText),
    actions: [
      CustomButton(
        text: 'Ok',
        action:  () {
          Navigator.pop(context);
        },
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (context) => alerDialog,
  );
}