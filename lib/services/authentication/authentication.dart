import 'package:family_care_app/services/authentication/auth_input_data.dart';
import 'package:family_care_app/services/authentication/auth_output_data.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AuthenticationService {

  Future<AuthOutputData> authenticate(AuthInputData inputData) async {
    final response = await post(
        Uri.parse(kAuthUri),
        headers: <String, String> { 'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode(
            <String, String> { 'username': inputData.email, 'password': inputData.password }
        ));

    if (response.statusCode == kHTTPStatusOk) {
      return AuthOutputData.fromJson(json.decode(response.body));
    }

    throw Exception('Network failed to authentication');
  }
}
