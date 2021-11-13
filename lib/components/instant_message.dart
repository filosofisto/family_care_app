import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstantMessage {

  static void error(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.exclamationTriangle,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              message,
              style: TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
      duration: const Duration(milliseconds: 4000),
      width: MediaQuery.of(context).size.width * 0.9,
      backgroundColor: Colors.redAccent,
      // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));
  }

  static void info(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.info,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              message,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
      duration: const Duration(milliseconds: 3000),
      width: MediaQuery.of(context).size.width * 0.9,
      backgroundColor: Colors.lightBlueAccent,
      // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));
  }

  static void infoIcon(BuildContext context, String message, Icon icon) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.info,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              message,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              width: 10,
            ),
            icon
          ],
        ),
      ),
      duration: const Duration(milliseconds: 3000),
      width: MediaQuery.of(context).size.width * 0.9,
      backgroundColor: Colors.lightBlueAccent,
      // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));
  }
}
