import 'dart:convert';
import 'dart:developer';
import 'package:family_care_app/exception/ExceptionOutput.dart';
import 'package:family_care_app/exception/network_exception.dart';
import 'package:family_care_app/model/medicine.dart';
import 'package:family_care_app/services/medicine/medicine_edit_input_data.dart';
import 'package:family_care_app/services/medicine/medicine_edit_output_data.dart';
import 'package:family_care_app/services/medicine/medicine_new_input_data.dart';
import 'package:family_care_app/services/medicine/medicine_new_output_data.dart';
import 'package:family_care_app/services/medicine/medicine_output_data.dart';
import 'package:family_care_app/services/storage/storage_service.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:http/http.dart';

class MedicineService {

  Future<MedicineOutputData> list() async {
    final String token = await StorageService().token();

    final response = await get(
        Uri.parse(kMedicineListUri),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == kHTTPStatusOk) {
      return MedicineOutputData.fromJson(json.decode(response.body));
    }

    var exceptionOutput = ExceptionOutput.fromJson(json.decode(response.body));
    log(exceptionOutput.toString());
    throw NetworkException(exceptionOutput.message);
  }

  Future<MedicineNewDataOutput> create(MedicineNewDataInput inputData) async {
    final storageService = StorageService();
    final String token = await storageService.token();
    final String email = await storageService.email();

    final response = await post(
        Uri.parse(kMedicineCreateUri),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(
            <String, dynamic> {
              'name': inputData.name, 'userEmail': email, 'image': inputData.image
            }
        ));

    if (response.statusCode == kHTTPStatusCreated) {
      return MedicineNewDataOutput.fromJson(json.decode(response.body));
    }

    var exceptionOutput = ExceptionOutput.fromJson(json.decode(response.body));
    throw NetworkException(exceptionOutput.message);
  }

  Future<MedicineEditDataOutput> update(MedicineEditDataInput inputData) async {
    final storageService = StorageService();
    final String token = await storageService.token();
    final String email = await storageService.email();

    final response = await put(
        Uri.parse(kMedicineUpdateUri),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(
            <String, dynamic> {
              'id': inputData.id,
              'name': inputData.name,
              'userEmail': email,
              'image': inputData.image
            }
        ));

    if (response.statusCode == kHTTPStatusOk) {
      return MedicineEditDataOutput.fromJson(json.decode(response.body));
    }

    var exceptionOutput = ExceptionOutput.fromJson(json.decode(response.body));
    throw NetworkException(exceptionOutput.message);
  }

  Future<void> remove(Medicine medicine) async {
    final storageService = StorageService();
    final String token = await storageService.token();

    final response = await delete(
        Uri.parse('$kMedicineDeleteUri/${medicine.id}'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == kHTTPStatusOk) {
      return;
    }

    var exceptionOutput = ExceptionOutput.fromJson(json.decode(response.body));
    throw NetworkException(exceptionOutput.message);
  }
}