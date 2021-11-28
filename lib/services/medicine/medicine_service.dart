import 'dart:convert';
import 'dart:developer';

import 'package:family_care_app/exception/ExceptionOutput.dart';
import 'package:family_care_app/exception/network_exception.dart';
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
}