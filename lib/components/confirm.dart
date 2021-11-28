import 'package:flutter/material.dart';

class Confirm {

  const Confirm({
    required this.question,
    this.yesText = 'Ok',
    this.noText = 'Cancel',
    required this.onConfirm});

  final String question;
  final String yesText;
  final String noText;
  final VoidCallback onConfirm;

  confirm(BuildContext context) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: Text(noText),
      onPressed:  () => Navigator.pop(context),
    );

    Widget continueButton = ElevatedButton(
      child: Text(yesText),
      onPressed: () {
        Navigator.pop(context);
        onConfirm.call();
      }
    );  // set up the AlertDialog

    AlertDialog alert = AlertDialog(
      title: Text("Confirm"),
      content: Text(question),
      actions: [
        continueButton,
        cancelButton,
      ],
    );  // show the dialog

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
