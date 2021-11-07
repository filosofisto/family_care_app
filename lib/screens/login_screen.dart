import 'dart:developer';

import 'package:family_care_app/services/authentication/auth_input_data.dart';
import 'package:family_care_app/services/authentication/auth_output_data.dart';
import 'package:family_care_app/services/authentication/authentication.dart';
import 'package:family_care_app/services/storage/storage_auth_out_data.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthenticationService _authenticationService = AuthenticationService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final StorageAuthOutputData _storageAuthOutputData = new StorageAuthOutputData();

  void _authenticate() async {
    try {
      final AuthInputData inputData =
          AuthInputData(_emailController.text, _passwordController.text);
      // TODO: Validation mecanism

      AuthOutputData authOutputData =
          await _authenticationService.authenticate(inputData);

      _storageAuthOutputData.save(authOutputData);

      Navigator.pop(context);
    } catch (e) {
      log(e.toString());
      // TODO: Show exception into a dialog or in other place
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kScaffoldBackgroundColor,
      ),
      backgroundColor: kScaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email, color: Colors.white),
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(8))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.password, color: Colors.white,),
                      hintText: "Password",
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
                  onPressed: () => _authenticate(),
                  child: const Text(
                    'Ok',
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
            )
          ],
        ),
      ),
    );
  }
}
