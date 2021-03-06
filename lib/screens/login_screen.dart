import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:family_care_app/components/instant_message.dart';
import 'package:family_care_app/components/progress_indicator_circle.dart';
import 'package:family_care_app/exception/authentication_exception.dart';
import 'package:family_care_app/services/authentication/authentication_service.dart';
import 'package:family_care_app/services/authentication/signin_input_data.dart';
import 'package:family_care_app/services/authentication/signin_output_data.dart';
import 'package:family_care_app/services/storage/storage_service.dart';
import 'package:family_care_app/util/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthenticationService _authenticationService = AuthenticationService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final StorageService _storageAuthOutputData =
      new StorageService();
  bool _processing = false;

  void _authenticate(BuildContext context) async {
    setState(() {
      _processing = true;
    });

    try {
      final SigninInputData inputData =
          SigninInputData(_emailController.text, _passwordController.text);

      SigninOutputData authOutputData =
          await _authenticationService.authenticate(inputData);

      InstantMessage.info(context, 'Welcome ${authOutputData.name}');

      _storageAuthOutputData.save(authOutputData);

      Navigator.pop(context, true);
    } on AuthenticationException catch(e) {
      log(e.message());
      InstantMessage.error(context, e.message());
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
            Visibility(
                visible: _processing,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProgressIndicatorCircle(text: 'Authenticating...'),
                )),
            // Visibility(visible: _errorMessage.isNotEmpty,child: Message(_errorMessage)),
            Visibility(
              visible: !_processing,
              child: Padding(
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
            ),
            Visibility(
              visible: !_processing,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: EdgeInsets.all(8))),
              ),
            ),
            Visibility(visible: !_processing, child: Divider()),
            Visibility(visible: !_processing,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () => _authenticate(context),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
