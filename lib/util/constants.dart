import 'package:flutter/material.dart';

const kBaseUri          = 'http://10.0.2.2';
const kSigninUri        = '$kBaseUri:8081/auth/signin';
const kSignupUri        = '$kBaseUri:8081/auth/signup';
const kMedicineListUri  = '$kBaseUri:8082/medicine/list';
const kHTTPStatusOk = 200;
const kStorageKeyAuthOutput = 'AuthOutput';

const kActiveCardColor = Color(0xFF1D1E33);
const kBottomContainerColor = Color(0xFFEB1555);
const kInactiveCardColor = Color(0xFF111328);
const kActiveSliderColor = Colors.white;
const kThumbColor = Color(0xFFEB1555);
const kOverlayColor = Color(0x29EB1555);
const kInactiveSliderColor = Color(0xFF8D8E98);
const kBottomContainerHeight = 80.0;

// const kLabelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));
const kLabelTextStyle = TextStyle(fontSize: 18.0, color: Colors.black87);
const kNumberTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
const kLargeButtonTextStyle = TextStyle(
    fontSize: 24.0, fontWeight: FontWeight.bold);
const kTitleTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold);
const kResultTextStyle = TextStyle(
    color: Color(0xFF24D876), fontSize: 22.0, fontWeight: FontWeight.bold);
const kBMITextStyle = TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold);
const kBodyTextStyle = TextStyle(fontSize: 22.0);

const kMinHeight = 120.0;
const kMaxHeight = 220.0;
const kDefaultBottomContainerHeight = 80.0;
const kButtonColor = Color(0xFFA2B9EE);
const kScaffoldBackgroundColor = Color(0xFF9A9CEA);