import 'package:family_care_app/components/icon_content.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {

  final IconData iconData;
  final String label;
  final GestureTapCallback? onTap;

  const DefaultButton({required this.iconData, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kButtonColor,
        ),
        child: IconContent(
          iconData: iconData,
          label: label,
        ),
      ),
    );
  }
}