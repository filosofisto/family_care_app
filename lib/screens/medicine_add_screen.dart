import 'dart:developer';

import 'package:family_care_app/components/instant_message.dart';
import 'package:family_care_app/components/progress_indicator_circle.dart';
import 'package:family_care_app/exception/network_exception.dart';
import 'package:family_care_app/services/medicine/medicine_new_input_data.dart';
import 'package:family_care_app/services/medicine/medicine_new_output_data.dart';
import 'package:family_care_app/services/medicine/medicine_service.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:flutter/material.dart';

class MedicineAdd extends StatefulWidget {
  const MedicineAdd({Key? key}) : super(key: key);

  @override
  _MedicineAddState createState() => _MedicineAddState();
}

class _MedicineAddState extends State<MedicineAdd> {
  final TextEditingController _nameController = TextEditingController();

  bool _processing = false;

  void _save(BuildContext context) async {
    setState(() {
      _processing = true;
    });

    try {
      final medicineService = MedicineService();
      final MedicineNewDataInput inputData =
          MedicineNewDataInput(name: _nameController.text);

      MedicineNewDataOutput outputData =
          await medicineService.create(inputData);

      InstantMessage.info(context, 'Medicine saved');

      Navigator.pop(context, true);
    } on NetworkException catch (e) {
      log(e.message);
      InstantMessage.error(context, e.message);
    } catch (e) {
      InstantMessage.error(context, e.toString());
    } finally {
      setState(() {
        _processing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Medicine",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kScaffoldBackgroundColor,
      ),
      backgroundColor: kScaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Visibility(
              visible: _processing,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProgressIndicatorCircle(text: 'Saving...'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(8))),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () => _save(context),
                  child: const Text(
                    'Save',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      primary: kButtonColor),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
