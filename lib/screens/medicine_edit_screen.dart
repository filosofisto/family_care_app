import 'dart:developer';

import 'package:family_care_app/components/confirm.dart';
import 'package:family_care_app/components/instant_message.dart';
import 'package:family_care_app/components/progress_indicator_circle.dart';
import 'package:family_care_app/exception/network_exception.dart';
import 'package:family_care_app/model/medicine.dart';
import 'package:family_care_app/services/medicine/medicine_edit_input_data.dart';
import 'package:family_care_app/services/medicine/medicine_edit_output_data.dart';
import 'package:family_care_app/services/medicine/medicine_new_input_data.dart';
import 'package:family_care_app/services/medicine/medicine_new_output_data.dart';
import 'package:family_care_app/services/medicine/medicine_service.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:flutter/material.dart';

class MedicineEdit extends StatefulWidget {
  const MedicineEdit(this.medicine);

  final Medicine medicine;

  @override
  _MedicineEditState createState() => _MedicineEditState();
}

class _MedicineEditState extends State<MedicineEdit> {
  final TextEditingController _nameController = TextEditingController();

  bool _processing = false;

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.medicine.name;
  }

  void _save(BuildContext context) async {
    setState(() {
      _processing = true;
    });

    try {
      final medicineService = MedicineService();
      final MedicineEditDataInput inputData = MedicineEditDataInput(
          id: widget.medicine.id,
          name: _nameController.text,
          userEmail: widget.medicine.userEmail);

      MedicineEditDataOutput outputData =
          await medicineService.update(inputData);

      InstantMessage.info(context, 'Medicine updated');

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

  void _confirmDelete(BuildContext context) {
    Confirm(question: 'Delete medicine?', onConfirm: () => _delete(context)).confirm(context);
  }

  void _delete(BuildContext context) async {
    setState(() {
      _processing = true;
    });

    try {
      final medicineService = MedicineService();
      await medicineService.remove(widget.medicine);

      InstantMessage.info(context, 'Medicine removed');

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
          "Edit Medicine",
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
                      primary: Colors.red,
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () => _confirmDelete(context),
                  child: const Text(
                    'Delete',
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
