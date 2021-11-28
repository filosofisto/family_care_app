import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CentralErrorMessage extends StatelessWidget {
  const CentralErrorMessage(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.exclamationCircle,
              color: Colors.red,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              message,
              style: TextStyle(fontSize: 24, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
