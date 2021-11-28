import 'dart:developer';

import 'package:family_care_app/components/central_error_message.dart';
import 'package:family_care_app/components/instant_message.dart';
import 'package:family_care_app/components/progress_indicator_circle.dart';
import 'package:family_care_app/exception/network_exception.dart';
import 'package:family_care_app/model/medicine.dart';
import 'package:family_care_app/services/medicine/medicine_output_data.dart';
import 'package:family_care_app/services/medicine/medicine_service.dart';
import 'package:family_care_app/ui/medicine_ui.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:flutter/material.dart';

class MedicineListScreen extends StatefulWidget {
  const MedicineListScreen({Key? key}) : super(key: key);

  @override
  _MedicineListScreenState createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {

  final MedicineService _medicineService = MedicineService();

  Future<MedicineOutputData> listMedicines() async {
    return _medicineService.list();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Medicines', style: TextStyle(color: Colors.black)),
        backgroundColor: kScaffoldBackgroundColor,
      ),
      body: FutureBuilder<MedicineOutputData>(
        future: listMedicines(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return ProgressIndicatorCircle(text: 'Loading My Medicines...');
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              List<Medicine> medicines = List.empty();

              if (snapshot.hasError) {
                if (snapshot.error! is NetworkException) {
                  NetworkException e = snapshot.error! as NetworkException;
                  return CentralErrorMessage(e.message);
                } else {
                  return CentralErrorMessage('Unknow error');
                }
              } else {
                medicines = snapshot.data != null
                    ? snapshot.data!.embedded.medicineTOList
                    : List.empty();
              }

              return ListView.builder(
                  itemBuilder: (context, index) => MedicineUI(medicines[index]),
                  itemCount: medicines.length);
          }

          return CentralErrorMessage('Unknow error');
        },
      ),
    );
  }
}
