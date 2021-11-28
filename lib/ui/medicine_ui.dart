import 'dart:convert';

import 'package:family_care_app/model/medicine.dart';
import 'package:family_care_app/screens/medicine_edit_screen.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:flutter/material.dart';

class MedicineUI extends StatelessWidget {
  const MedicineUI(this.medicine, this.onTap);

  final Medicine medicine;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kScaffoldBackgroundColor,
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: getImage()
        ),
        title: Text(
          medicine.name,
          style: TextStyle(fontSize: 24.0),
        ),
        onTap: onTap,
      ),
    );
  }

  ImageProvider getImage() {
    return medicine.image != null
        ? Image.memory(base64Decode(medicine.image!), width: 90, height: 100,).image
        : Image.asset('images/no-image.png', width: 90, height: 100,).image;
  }
}
