import 'dart:developer';

import 'package:family_care_app/components/instant_message.dart';
import 'package:family_care_app/exception/register_user_exception.dart';
import 'package:family_care_app/services/authentication/authentication_service.dart';
import 'package:family_care_app/services/authentication/signin_input_data.dart';
import 'package:family_care_app/services/authentication/signin_output_data.dart';
import 'package:family_care_app/services/authentication/signup_input_data.dart';
import 'package:family_care_app/services/authentication/signup_output_data.dart';
import 'package:family_care_app/services/storage/storage_service.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:flutter/material.dart';

class NewUserScreen extends StatefulWidget {
  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  final AuthenticationService _authenticationService = AuthenticationService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final StorageService _storageAuthOutputData =
      new StorageService();
  bool _processing = false;

  void _registerUser(BuildContext context) async {
    setState(() {
      _processing = true;
    });

    try {
      // Register User
      final SignupInputData signupInputData = SignupInputData(
          _nameController.text,
          _passwordController.text,
          _passwordConfirmationController.text,
          _emailController.text,
          ["user"]);

      SignupOutputData signupOutputData =
          await _authenticationService.registerUser(signupInputData);

      // Login
      final SigninInputData signinInputData =
          SigninInputData(_emailController.text, _passwordController.text);

      SigninOutputData signinOutputData =
          await _authenticationService.authenticate(signinInputData);

      _storageAuthOutputData.save(signinOutputData);

      InstantMessage.info(context, 'Welcome ${signupOutputData.name}');

      Navigator.pop(context, true);
    } on RegisterUserException catch (e) {
      log(e.message);
      InstantMessage.error(context, e.message);
    } catch (e) {
      log(e.toString());
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
          "New User",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kScaffoldBackgroundColor,
      ),
      backgroundColor: kScaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Row(children: <Widget>[
              Column(
                children: [
                  Icon(
                    Icons.person_add_alt_1,
                    color: Colors.white,
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "New User",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ]),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: "Name",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(8))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(8))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(8))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                  controller: _passwordConfirmationController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
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
                  onPressed: () => _registerUser(context),
                  child: const Text(
                    'Add',
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
