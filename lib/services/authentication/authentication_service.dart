import 'dart:developer';

import 'package:family_care_app/exception/ExceptionOutput.dart';
import 'package:family_care_app/exception/authentication_exception.dart';
import 'package:family_care_app/exception/register_user_exception.dart';
import 'package:family_care_app/services/authentication/signin_input_data.dart';
import 'package:family_care_app/services/authentication/signin_output_data.dart';
import 'package:family_care_app/services/authentication/signup_input_data.dart';
import 'package:family_care_app/services/authentication/signup_output_data.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AuthenticationService {

  Future<SigninOutputData> authenticate(SigninInputData inputData) async {
    final response = await post(
        Uri.parse(kSigninUri),
        headers: <String, String> { 'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode(
            <String, String> { 'email': inputData.email, 'password': inputData.password }
        ));

    if (response.statusCode == kHTTPStatusOk) {
      return SigninOutputData.fromJson(json.decode(response.body));
    }

    throw AuthenticationException();
  }

  Future<SignupOutputData> registerUser(SignupInputData inputData) async {
    List<String> permissions = ['user'];

    final response = await post(
        Uri.parse(kSignupUri),
        headers: <String, String> { 'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode(
            <String, dynamic> {
              'name': inputData.name, 'password': inputData.password,
              'passwordConfirmation': inputData.passwordConfirmation,
              'email': inputData.email, 'permissions': permissions
            }
        ));

    if (response.statusCode == kHTTPStatusOk) {
      return SignupOutputData.fromJson(json.decode(response.body));
    }

    var exceptionOutput = ExceptionOutput.fromJson(json.decode(response.body));
    throw RegisterUserException(exceptionOutput.message);
  }
}
